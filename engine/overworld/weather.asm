; Overworld weather: rain, snow and sandstorm particles drawn with OAM sprites.
; Adapted from Pokemon Polished Crystal (engine/overworld/weather.asm by vulcandth;
; weather sprites by SourApple).
;
; Map objects fill OAM from the start (hUsedSpriteIndex). Weather particles use the
; free slots after them, taken from the end of OAM, so NPCs always keep sprite
; priority. _UpdateSprites leaves weather particles alone when it hides unused slots.
; A slot is a weather particle if its tile is WEATHER_TILE_1/2 and its attributes
; are exactly PAL_OW_WEATHER (no other OAM entry uses those tiles).

DoOverworldWeather::
; Called once per frame from HandleMap.
	push hl
	push de
	push bc

	ld a, [wCurWeather]
	ld b, a
	ld a, [wOverworldWeatherCooldown]
	or b
	jr z, .done ; no weather and nothing left falling

	ld hl, wWeatherFlags
	bit OW_WEATHER_DISABLED_F, [hl]
	jr nz, .done

	; run weather at 30fps (every other frame)
	ld a, [wOverworldWeatherTimer]
	and 1
	jr z, .done

	; make sure the weather palette is loaded (palettes get rebuilt by many things)
	call EnsureWeatherPal

	ld a, [wOverworldWeatherCooldown]
	and a
	jr nz, .on_cooldown

	ld a, [wCurWeather]
	ld hl, .SpawnAndFall
	call JumpTable
	jr .done

.on_cooldown
	; the previous weather's particles finish falling, but no new ones spawn
	dec a
	ld [wOverworldWeatherCooldown], a
	jr z, .cooldown_over
	ld a, [wPrevWeather]
	ld hl, .FallOnly
	call JumpTable
	jr .done

.cooldown_over
	call ClearWeatherSprites
	xor a
	ld [wPrevWeather], a
	call LoadWeatherGraphics
	call EnsureWeatherPal

.done
	ld hl, wOverworldWeatherTimer
	inc [hl]
	pop bc
	pop de
	pop hl
	ret

.SpawnAndFall:
	table_width 2
	dw DoNothing
	dw DoOverworldRain
	dw DoOverworldSnow
	dw DoOverworldSandstorm
	dw DoOverworldSnow ; ash falls like snow
	assert_table_length NUM_OW_WEATHERS + 1

.FallOnly:
	table_width 2
	dw DoNothing
	dw DoRainFall
	dw DoSnowFall
	dw DoSandFall
	dw DoSnowFall ; ash
	assert_table_length NUM_OW_WEATHERS + 1

GetActiveWeather:
; a = the weather whose particles are on screen (the previous weather during the cooldown)
	ld a, [wOverworldWeatherCooldown]
	and a
	ld a, [wPrevWeather]
	ret nz
	ld a, [wCurWeather]
	ret

EnsureWeatherPal:
; If the weather palette isn't in its slot, rebuild the object palettes.
; CheckForUsedObjPals moves any NPC off the weather slot and then loads it.
	call GetActiveWeather
	and a
	ret z
	ld c, a
	ld b, 0
	ld hl, WeatherPalettes - 1
	add hl, bc
	ld a, [wLoadedObjPal0 + PAL_OW_WEATHER]
	cp [hl]
	ret z
	farjp CheckForUsedObjPals

WeatherPalettes::
	table_width 1
	db PAL_OW_RAIN
	db PAL_OW_SNOW
	db PAL_OW_SAND
	db PAL_OW_ASH
	assert_table_length NUM_OW_WEATHERS

; Map setup ----------------------------------------------------------------

SetCurrentWeather::
; Map setup command: pick this map's weather from OverworldWeatherMaps.
	call GetMapWeather
	ld b, a
	ld a, [wCurWeather]
	cp b
	ret z ; same weather continues across the map change

	and a
	jr z, .start_now
	; Another weather was falling (e.g. walking from a rainy route to a dry one):
	; let its particles finish before switching.
	ld [wPrevWeather], a
	ld a, b
	ld [wCurWeather], a
	ld a, OW_WEATHER_COOLDOWN
	ld [wOverworldWeatherCooldown], a
	ret

.start_now
	ld a, b
	ld [wCurWeather], a
	xor a
	ld [wOverworldWeatherCooldown], a
	ld [wPrevWeather], a
	call LoadWeatherGraphics
	farjp CheckForUsedObjPals ; reserve and load the weather palette

GetMapWeather:
; a = weather for the current map (OW_WEATHER_NONE if not listed)
	ld a, [wMapGroup]
	ld d, a
	ld a, [wMapNumber]
	ld e, a
	ld hl, OverworldWeatherMaps
.loop
	ld a, [hli]
	cp -1
	jr z, .none
	cp d
	jr nz, .next
	ld a, [hl]
	cp e
	jr nz, .next
	inc hl
	ld a, [hl]
	bit OW_WEATHER_ZONE_F, a
	ret z ; fixed weather
	and ~(1 << OW_WEATHER_ZONE_F)
	jr GetZoneWeather
.next
	inc hl
	inc hl
	jr .loop
.none
	xor a ; OW_WEATHER_NONE
	ret

GetZoneWeather:
; a = weather for zone a in the current in-game hour (OW_WEATHER_NONE if dry).
; The roll is a hash of (day, hour, zone), so it stays the same for the whole
; hour, is the same for every map in the zone, and different zones roll separately.
; The pattern repeats every 256 in-game hours (about 10.7 days).
	ld e, a
; a = (day * 24 + hour) mod 256
	ld a, [wCurDay]
	ld b, a
	add a
	add b ; * 3
	add a
	add a
	add a ; * 24
	ld b, a
	ldh a, [hHours]
	add b
; Pearson hash: a = T[T[slot] xor zone]
	call .Hash
	xor e
	call .Hash
	ld b, a
; zone entry: weather, chance
	ld a, e
	add a
	add LOW(OverworldWeatherZones)
	ld l, a
	adc HIGH(OverworldWeatherZones)
	sub l
	ld h, a
	ld a, [hli]
	ld c, a
	ld a, b
	cp [hl]
	ld a, c
	ret c ; hash < chance: this zone has weather this hour
	xor a ; OW_WEATHER_NONE
	ret

.Hash:
	add LOW(WeatherHashTable)
	ld l, a
	adc HIGH(WeatherHashTable)
	sub l
	ld h, a
	ld a, [hl]
	ret

ClearWeather::
; Map setup command: remove all particles and stop any cooldown.
; (Warps and reloads start the new map's weather fresh.)
	call ClearWeatherSprites
	xor a
	ld [wCurWeather], a
	ld [wPrevWeather], a
	ld [wOverworldWeatherCooldown], a
	ret

ClearWeatherSprites::
; Hide every weather particle in OAM.
	push hl
	push bc
	ld hl, wShadowOAM
	ld b, NUM_SPRITE_OAM_STRUCTS
.loop
	call IsWeatherSprite
	jr nz, .next
	ld [hl], OAM_YCOORD_HIDDEN
.next
	ld a, l
	add SPRITEOAMSTRUCT_LENGTH
	ld l, a
	dec b
	jr nz, .loop
	pop bc
	pop hl
	ret

PauseWeather::
; Textbox opened: stop updating and hide the particles.
	ld hl, wWeatherFlags
	set OW_WEATHER_DISABLED_F, [hl]
	jr ClearWeatherSprites

ResumeWeather::
	ld hl, wWeatherFlags
	res OW_WEATHER_DISABLED_F, [hl]
	ret

LoadWeatherGraphics::
; Load the active weather's tiles into WEATHER_TILE_1/2 (VRAM bank 0).
	call GetActiveWeather
	and a
	ret z
	push hl
	push de
	push bc
	ld c, a
	ld b, 0
	ld hl, WeatherGraphics - 3
	add hl, bc
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld c, [hl]
	ld b, BANK(@)
	ld hl, vTiles0 tile WEATHER_TILE_1
	ldh a, [rVBK]
	push af
	xor a
	ldh [rVBK], a
	call Get2bpp
	pop af
	ldh [rVBK], a
	pop bc
	pop de
	pop hl
	ret

MACRO weather_gfx
	dw \1 ; gfx pointer (this bank)
	db \2 ; tile count
ENDM

WeatherGraphics:
	table_width 3
	weather_gfx RainGFX, 2
	weather_gfx SnowGFX, 1
	weather_gfx SandGFX, 1
	weather_gfx SnowGFX, 1 ; ash (snowflake shape for now; gray palette)
	assert_table_length NUM_OW_WEATHERS

RainGFX: INCBIN "gfx/overworld/rain_splash.2bpp"
SnowGFX: INCBIN "gfx/overworld/snow.2bpp"
SandGFX: INCBIN "gfx/overworld/sand.2bpp"

; OAM helpers ---------------------------------------------------------------

IsWeatherSprite:
; hl = OAM entry (page-aligned wShadowOAM, so l & 3 == 0).
; Return z if it's a visible weather particle. Preserves hl.
	ld a, [hl]
	and a
	jr z, .no
	cp OAM_YCOORD_HIDDEN
	jr nc, .no
	inc l
	inc l
	ld a, [hli]
	cp WEATHER_TILE_1
	jr z, .tile_ok
	cp WEATHER_TILE_2
	jr nz, .no_back3
.tile_ok
	ld a, [hld]
	dec l
	dec l
	cp PAL_OW_WEATHER
	ret
.no_back3
	dec l
	dec l
	dec l
.no
	or 1 ; nz
	ret

ScanForEmptyOAM:
; Find a free OAM slot after the map objects, searching from the end.
; Return its address in hl, or carry if there is none.
	ldh a, [hUsedSpriteIndex]
	ld c, a
	ld hl, wShadowOAM + (NUM_SPRITE_OAM_STRUCTS - 1) * SPRITEOAMSTRUCT_LENGTH
.loop
	ld a, l
	cp c
	jr c, .none ; reached the map objects
	ld a, [hl]
	and a
	ret z ; y = 0: free (and carry is clear)
	cp OAM_YCOORD_HIDDEN
	jr c, .used
	and a ; hidden (y >= OAM_YCOORD_HIDDEN): free, clear carry
	ret
.used
	ld a, l
	sub SPRITEOAMSTRUCT_LENGTH
	ld l, a
	jr nc, .loop
.none
	scf
	ret

SetWeatherParticle:
; hl = OAM entry with y and x already written (hl points at the tile byte).
; a = tile
	ld [hli], a
	ld [hl], PAL_OW_WEATHER
	ret

GetPlayerStepY:
; a = wPlayerStepVectorY, or 0 while a screen shake is moving the camera
	ld a, [wWeatherFlags]
	bit OW_WEATHER_IGNORE_PLAYER_Y_F, a
	ld a, 0
	ret nz
	ld a, [wPlayerStepVectorY]
	ret

IsEvenSpriteIndex:
; e = low byte of the OAM entry; a = 1 for every other slot (varies particle speed)
	ld a, e
	rra
	rra
	and 1
	ret

Despawn:
; de = OAM entry
	ld h, d
	ld l, e
	ld a, OAM_YCOORD_HIDDEN
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ret

ForEachWeatherSprite:
; Call hl for every weather particle, with de = its OAM entry.
	ld de, wShadowOAM
	ld b, NUM_SPRITE_OAM_STRUCTS
.loop
	push hl
	push bc
	ld h, d
	ld l, e
	call IsWeatherSprite
	pop bc
	pop hl
	jr nz, .next
	push hl
	push bc
	push de
	call _hl_
	pop de
	pop bc
	pop hl
.next
	ld a, e
	add SPRITEOAMSTRUCT_LENGTH
	ld e, a
	dec b
	jr nz, .loop
	ret

; Rain ----------------------------------------------------------------------

DoOverworldRain:
rept 3
	call ScanForEmptyOAM
	call nc, SpawnRainDrop
endr
	; fallthrough
DoRainFall:
	ld hl, .Update
	call ForEachWeatherSprite

	; rain splashes stay on screen for ~4 weather ticks
	ld a, [wOverworldWeatherTimer]
	and %1110
	ret nz
	ld hl, .HideSplash
	jr ForEachWeatherSprite

.HideSplash:
	ld hl, SPRITEOAMSTRUCT_TILE_ID
	add hl, de
	ld a, [hl]
	cp RAINSPLASH_TILE
	ret nz
	jr Despawn

.Update:
	ld hl, SPRITEOAMSTRUCT_TILE_ID
	add hl, de
	ld a, [hl]
	cp RAINSPLASH_TILE
	jr z, .update_splash

	; raindrops have a 5% chance of splashing
	call Random
	cp 5 percent
	jr nc, .fall
	ld [hl], RAINSPLASH_TILE
	ret

.fall
	; y += fall speed - 4 * player's y step (so drops stay put in the world)
	call GetPlayerStepY
	add a
	add a
	ld c, a
	ld a, [de]
	sub c
	ld c, a
	call IsEvenSpriteIndex
	add a
	add c
	add 8 ; minimum fall speed
	cp OAM_YCOORD_HIDDEN
	jr nc, Despawn
	ld [de], a

	; x -= wind - 4 * player's x step
	ld a, [wPlayerStepVectorX]
	add a
	add a
	ld c, a
	ld h, d
	ld l, e
	inc l
	ld a, [hl]
	sub c
	ld c, a
	call IsEvenSpriteIndex
	add a
	ld b, a
	ld a, c
	sub b
	jp c, Despawn
	sub 4 ; minimum leftward drift
	jp c, Despawn
	ld [hl], a
	ret

.update_splash
	; splashes only move with the camera
	call GetPlayerStepY
	add a
	ld c, a
	ld a, [de]
	sub c
	cp OAM_YCOORD_HIDDEN
	jp nc, Despawn
	ld [de], a
	ld a, [wPlayerStepVectorX]
	add a
	ld c, a
	ld h, d
	ld l, e
	inc l
	ld a, [hl]
	sub c
	ld [hl], a
	ret

SpawnRainDrop:
; hl = free OAM entry
	; 50%: enter from the top, otherwise from the right edge
	call Random
	and 1
	jr z, .from_right
	ld [hl], 1 ; y (just above the screen)
	inc l
	ld a, SCREEN_WIDTH_PX + 7
	call RandomRange
	add TILE_WIDTH
	ld [hli], a
	jr .finish
.from_right
	ld a, OAM_YCOORD_HIDDEN - 1
	call RandomRange
	inc a
	ld [hli], a
	ld [hl], SCREEN_WIDTH_PX + TILE_WIDTH
	inc l
.finish
	ld a, RAINDROP_TILE
	jp SetWeatherParticle

; Snow ----------------------------------------------------------------------

DoOverworldSnow:
rept 2
	call ScanForEmptyOAM
	call nc, SpawnSnowFlake
endr
	; fallthrough
DoSnowFall:
	ld hl, .Update
	jp ForEachWeatherSprite

.Update:
	; occasionally melt
	call Random
	cp 1 percent
	jr nc, .ok
	call Random
	cp 10 percent
	jp c, Despawn
.ok
	call GetPlayerStepY
	add a
	ld c, a
	ld a, [de]
	sub c
	ld c, a
	call IsEvenSpriteIndex
	add c
	add 2 ; minimum fall speed
	cp OAM_YCOORD_HIDDEN
	jp nc, Despawn
	ld [de], a

	; drift: 50% chance to wiggle left 1, minus 2 * player's x step
	ld a, [wPlayerStepVectorX]
	add a
	ld c, a
	call Random
	and 1
	jr nz, .no_wiggle
	inc c
.no_wiggle
	ld h, d
	ld l, e
	inc l
	ld a, [hl]
	sub c ; c is negative while walking left, so ignore the carry
	jp z, Despawn ; reached the left edge
	cp SCREEN_WIDTH_PX + 2 * TILE_WIDTH
	jp nc, Despawn ; off the right edge, or wrapped past the left edge
	ld [hl], a
	ret

SpawnSnowFlake:
; hl = free OAM entry
	; 40% chance to spawn this tick
	call Random
	cp 40 percent
	ret nc
	; 25% from the right edge, otherwise from the top
	call Random
	and %11
	jr z, .from_right
	ld [hl], 1
	inc l
	ld a, SCREEN_WIDTH_PX + 7
	call RandomRange
	add TILE_WIDTH
	ld [hli], a
	jr .finish
.from_right
	ld a, OAM_YCOORD_HIDDEN - 1
	call RandomRange
	inc a
	ld [hli], a
	ld [hl], SCREEN_WIDTH_PX + TILE_WIDTH
	inc l
.finish
	ld a, SNOWFLAKE_TILE
	jmp SetWeatherParticle

; Sandstorm -----------------------------------------------------------------

DoOverworldSandstorm:
rept 3
	call ScanForEmptyOAM
	call nc, SpawnSandDrop
endr
	; fallthrough
DoSandFall:
	ld hl, .Update
	jmp ForEachWeatherSprite

.Update:
	; sand grains have a 5% chance to vanish
	call Random
	cp 5 percent
	jmp c, Despawn

	; sand blows up and to the left
	call GetPlayerStepY
	add a
	add a
	ld c, a
	ld a, [de]
	sub c
	ld c, a
	call IsEvenSpriteIndex
	add a
	add c
	sub 4 ; minimum rise speed
	jmp c, Despawn
	cp OAM_YCOORD_HIDDEN
	jmp nc, Despawn
	and a
	jmp z, Despawn
	ld [de], a

	ld a, [wPlayerStepVectorX]
	add a
	add a
	ld c, a
	ld h, d
	ld l, e
	inc l
	ld a, [hl]
	sub c
	ld c, a
	call IsEvenSpriteIndex
	add a
	ld b, a
	ld a, c
	sub b
	jmp c, Despawn
	sub 12 ; minimum leftward speed
	jmp c, Despawn
	ld [hl], a
	ret

SpawnSandDrop:
; hl = free OAM entry
	; 50%: enter from the bottom, otherwise from the right edge
	call Random
	and 1
	jr z, .from_right
	ld [hl], SCREEN_HEIGHT_PX + TILE_WIDTH
	inc l
	ld a, SCREEN_WIDTH_PX + 7
	call RandomRange
	add TILE_WIDTH
	ld [hli], a
	jr .finish
.from_right
	ld a, OAM_YCOORD_HIDDEN - 1
	call RandomRange
	inc a
	ld [hli], a
	ld [hl], SCREEN_WIDTH_PX + TILE_WIDTH
	inc l
.finish
	ld a, SANDSTORM_TILE
	jmp SetWeatherParticle

; Weather tint ----------------------------------------------------------------
; Maps with overworld weather use darker/tinted colors (rain: gray overcast,
; snow: cool gray-blue, sandstorm: dusty yellow). Each color channel c (0-31)
; becomes min(31, (c * mult + 8) / 16 + add), using the row for the current
; weather and time of day. The rain rows approximate Polished Crystal's
; hand-drawn overcast palettes.

ApplyWeatherTint::
; Tint c palettes starting at hl (in the wBGPals1/wOBPals1 WRAM bank)
; for the current map's weather. Does nothing if the map has no weather.
	push af
	push bc
	push de
	push hl
	ldh a, [rSVBK]
	push af

	ld a, BANK(wCurWeather)
	ldh [rSVBK], a
	ld a, [wCurWeather]
	and a
	jr z, .done
	; de = WeatherTints + ((weather - 1) * NUM_DAYTIMES + time of day) * 6
	dec a
	add a
	add a ; * NUM_DAYTIMES
	ld b, a
	ld a, [wTimeOfDayPal]
	maskbits NUM_DAYTIMES
	add b
	ld e, a
	add a
	add e ; * 3
	add a ; * 6
	ld e, a
	ld d, 0
	push hl
	ld hl, WeatherTints
	add hl, de
	ld d, h
	ld e, l
	pop hl

	ld a, BANK(wBGPals1)
	ldh [rSVBK], a
	; 4 colors per palette
	ld a, c
	add a
	add a
	ld c, a
.color_loop
	push bc
	push de
	ld a, [hli]
	ld b, a ; b = low byte: gggrrrrr
	ld c, [hl] ; c = high byte: 0bbbbbgg
	dec hl
	push hl

	; red
	ld a, b
	and %11111
	call TintChannel
	ld l, a

	; green
	ld a, c
	and %11
	add a
	add a
	add a
	ld h, a
	ld a, b
	swap a
	rrca
	and %111
	or h
	call TintChannel
	ld h, a

	; blue
	ld a, c
	rrca
	rrca
	and %11111
	call TintChannel

	; repack: high = blue << 2 | green >> 3, low = green << 5 | red
	add a
	add a
	ld c, a
	ld a, h
	rrca
	rrca
	rrca
	and %11
	or c
	ld c, a
	ld a, h
	and %111
	swap a
	add a
	or l
	ld b, a

	pop hl
	ld a, b
	ld [hli], a
	ld a, c
	ld [hli], a
	pop de
	pop bc
	dec c
	jr nz, .color_loop

.done
	pop af
	ldh [rSVBK], a
	pop hl
	pop de
	pop bc
	pop af
	ret

TintChannel:
; a = channel (0-31); [de] = multiplier (in 16ths), [de + 1] = add.
; Returns the tinted channel in a and advances de by 2. Preserves bc and hl.
	push hl
	push bc
	ld c, a
	ld b, 0
	ld hl, 8 ; round to nearest
	ld a, [de]
	inc de
.multiply
	and a
	jr z, .multiplied
	add hl, bc
	dec a
	jr .multiply
.multiplied
	; a = hl / 16 (hl <= 31 * 16 + 8)
	ld a, l
	srl h
	rra
	srl h
	rra
	srl h
	rra
	srl h
	rra
	ld c, a
	ld a, [de]
	inc de
	add c
	cp 32
	jr c, .ok
	ld a, 31
.ok
	pop bc
	pop hl
	ret

MACRO weather_tint
; red, green, blue: multiplier (16ths), add
	db \1, \2, \3, \4, \5, \6
ENDM

WeatherTints:
	table_width 6
; rain (gray overcast)
	weather_tint  9, 2, 10, 1,  8, 4 ; morn
	weather_tint 10, 2, 10, 1,  9, 3 ; day
	weather_tint 10, 1, 10, 1,  9, 1 ; nite
	weather_tint  8, 2, 11, 0,  9, 3 ; eve
; snow (cool gray-blue, lighter than rain)
	weather_tint 12, 2, 12, 3, 12, 6 ; morn
	weather_tint 12, 2, 12, 3, 12, 6 ; day
	weather_tint 11, 1, 11, 1, 11, 3 ; nite
	weather_tint 12, 2, 12, 2, 12, 4 ; eve
; sandstorm (dusty yellow haze)
	weather_tint 11, 7, 10, 5,  8, 1 ; morn
	weather_tint 11, 7, 10, 5,  8, 1 ; day
	weather_tint 10, 3,  9, 2,  8, 0 ; nite
	weather_tint 11, 6, 10, 4,  8, 1 ; eve
; ash (muted gray haze)
	weather_tint 11, 3, 11, 3, 10, 3 ; morn
	weather_tint 11, 3, 11, 3, 10, 3 ; day
	weather_tint 10, 1, 10, 1, 10, 1 ; nite
	weather_tint 11, 3, 10, 3,  9, 2 ; eve
	assert_table_length NUM_OW_WEATHERS * NUM_DAYTIMES


; Border fade -------------------------------------------------------------------
; Walking across a map connection between maps with different weather tints
; fades the displayed palettes (wBGPals2/wOBPals2) toward the new ones
; (wBGPals1/wOBPals1) over WEATHER_FADE_STEPS steps, one step per frame,
; alternating BG and object palettes, while the player keeps moving.

RecordMapPalsWeather::
; Called at the start of LoadMapPals: palettes are being rebuilt for the current
; weather, so any border fade is over. Remember the previous tint.
	push af
	ldh a, [rSVBK]
	push af
	ld a, BANK(wCurWeather)
	ldh [rSVBK], a
	xor a
	ld [wWeatherFadeSteps], a
	ld a, [wPalTintWeather]
	ld [wPrevPalTintWeather], a
	ld a, [wCurWeather]
	ld [wPalTintWeather], a
	pop af
	ldh [rSVBK], a
	pop af
	ret

MapConnWeatherFade::
; Map setup command for connections (replaces ApplyMapPalettes there).
; Same tint as the previous map: apply the new palettes immediately, as before.
; Different tint: fade into them.
	ld a, [wPrevPalTintWeather]
	ld b, a
	ld a, [wPalTintWeather]
	cp b
	jr nz, .fade
	farjp _UpdateTimePals

.fade
	; BG: the displayed palettes are still the previous map's, so fade from them.
	; Objects: LoadMapPals reset them, so rebuild each loaded object palette with
	; the previous map's tint as the starting colors.
	ld a, [wCurWeather]
	push af
	ld a, b
	ld [wCurWeather], a
	ld a, [wPalFlags]
	push af
	ld hl, wPalFlags
	set NO_DYN_PAL_APPLY_F, [hl]

	ld de, wOBPals2
	ld hl, wLoadedObjPal0
	ld c, 8
.loop
	ld a, [hli]
	cp -1 ; no palette loaded in this slot
	jr z, .next
	ld [wNeededPalIndex], a
	push hl
	push de
	push bc
	farcall CopySpritePal
	pop bc
	pop de
	pop hl
.next
	ld a, e
	add 1 palettes
	ld e, a
	adc d
	sub e
	ld d, a
	dec c
	jr nz, .loop

	pop af
	ld [wPalFlags], a
	pop af
	ld [wCurWeather], a

	; remember the starting colors
	ldh a, [rSVBK]
	push af
	ld a, BANK(wBGPals2)
	ldh [rSVBK], a
	ld hl, wBGPals2
	ld de, wWeatherFadeStartPals
	ld bc, 16 palettes
	rst CopyBytes
	pop af
	ldh [rSVBK], a

	ld a, WEATHER_FADE_STEPS
	ld [wWeatherFadeSteps], a
	xor a
	ld [wWeatherFadeFrame], a
	ld a, TRUE
	ldh [hCGBPalUpdate], a
	ret

WeatherFadeStep::
; Called every frame from HandleMap: displayed = start + (target - start) * progress.
; Each step is spread over 4 frames: BG palettes 0-3, BG 4-7, objects 0-3, objects 4-7.
	ld a, [wWeatherFadeSteps]
	and a
	ret z
	push hl
	push de
	push bc
	ld b, a ; steps left (WEATHER_FADE_STEPS .. 1)

	ld a, [wWeatherFadeFrame]
	ld c, a
	inc a
	and %11
	ld [wWeatherFadeFrame], a
	; hl = wBGPals2 + quarter * 4 palettes (wOBPals2 follows wBGPals2)
	ld a, c
	swap a
	add a ; * 4 palettes (32 bytes)
	add LOW(wBGPals2)
	ld l, a
	adc HIGH(wBGPals2)
	sub l
	ld h, a
	ld a, c
	cp %11 ; last quarter of the step?
	push af
	ldh a, [rSVBK]
	push af
	ld a, BANK(wBGPals2)
	ldh [rSVBK], a

	ld a, b
	dec a
	jp z, .last_step
	; progress = WeatherFadeProgress[WEATHER_FADE_STEPS - steps left]
	push hl
	ld a, WEATHER_FADE_STEPS
	sub b
	ld c, a
	ld b, 0
	ld hl, WeatherFadeProgress
	add hl, bc
	ld a, [hl]
	ldh [hWeatherFadeProgress], a
	pop hl

	ld c, 4 * NUM_PAL_COLORS
.color_loop
	push bc
	push hl
	ld bc, wWeatherFadeStartPals - wBGPals2
	add hl, bc
	ld a, [hli]
	ld e, a ; start low:  gggrrrrr
	ld d, [hl] ; start high: 0bbbbbgg
	pop hl
	push hl
	ld bc, wBGPals1 - wBGPals2
	add hl, bc
	ld a, [hli]
	ld c, a ; target low
	ld b, [hl] ; target high
	; colors that don't change between the two maps need no work
	cp e
	jr nz, .lerp
	ld a, b
	cp d
	jr z, .store
.lerp

	; red
	ld a, c
	and %11111
	ld l, a
	ld a, e
	and %11111
	call LerpChannel
	push af

	; green
	ld a, b
	and %11
	add a
	add a
	add a
	ld l, a
	ld a, c
	swap a
	rrca
	and %111
	or l
	ld l, a
	ld a, d
	and %11
	add a
	add a
	add a
	ld h, a
	ld a, e
	swap a
	rrca
	and %111
	or h
	call LerpChannel
	push af

	; blue
	ld a, b
	rrca
	rrca
	and %11111
	ld l, a
	ld a, d
	rrca
	rrca
	and %11111
	call LerpChannel

	; repack
	add a
	add a
	ld d, a
	pop af ; green
	ld e, a
	rrca
	rrca
	rrca
	and %11
	or d
	ld d, a
	ld a, e
	and %111
	swap a
	add a
	ld e, a
	pop af ; red
	or e
	ld e, a

.store
	pop hl
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	pop bc
	dec c
	jr nz, .color_loop
	jr .stepped

.last_step
	; land exactly on the target palettes
	ld d, h
	ld e, l
	ld bc, wBGPals1 - wBGPals2
	add hl, bc
	ld bc, 4 palettes
	rst CopyBytes

.stepped
	pop af
	ldh [rSVBK], a
	ld a, TRUE
	ldh [hCGBPalUpdate], a
	pop af
	jr nz, .done ; the rest of this step happens in the next frames
	ld hl, wWeatherFadeSteps
	dec [hl]
.done
	pop bc
	pop de
	pop hl
	ret

WeatherFadeProgress:
; progress (out of 256) after each step but the last
for k, 1, WEATHER_FADE_STEPS
	db k * 256 / WEATHER_FADE_STEPS
endr

LerpChannel:
; a = start channel, l = target channel (0-31), hWeatherFadeProgress = p.
; Returns a = start + round((target - start) * p / 256). Clobbers h, l.
	cp l
	ret z
	ld h, a
	jr c, .up
	sub l
	call .Scale
	ld l, a
	ld a, h
	sub l
	ret
.up
	ld a, l
	sub h
	call .Scale
	add h
	ret

.Scale:
; a = (a * p + 128) / 256. Preserves bc, de, hl.
	push hl
	push de
	push bc
	ld c, a
	ldh a, [hWeatherFadeProgress]
	ld e, a
	ld d, 0
	ld hl, 128
.bits
	srl c
	jr nc, .no_add
	add hl, de
.no_add
	sla e
	rl d
	ld a, c
	and a
	jr nz, .bits
	ld a, h
	pop bc
	pop de
	pop hl
	ret

SetWeatherFadePalette::
; A palette was (re)loaded in the target buffer at hl during a border fade:
; show it right away and make it the fade's starting colors too, so later
; steps don't pull it back. hl = palette in wBGPals1 or wOBPals1.
	push hl
	push de
	push bc
	ldh a, [rSVBK]
	push af
	ld a, BANK(wBGPals1)
	ldh [rSVBK], a
	push hl
	ld bc, wBGPals2 - wBGPals1
	add hl, bc
	ld d, h
	ld e, l
	pop hl
	push hl
	ld bc, 1 palettes
	rst CopyBytes ; displayed
	pop hl
	push hl
	ld bc, wWeatherFadeStartPals - wBGPals1
	add hl, bc
	ld d, h
	ld e, l
	pop hl
	ld bc, 1 palettes
	rst CopyBytes ; fade start
	pop af
	ldh [rSVBK], a
	ld a, TRUE
	ldh [hCGBPalUpdate], a
	pop bc
	pop de
	pop hl
	ret

INCLUDE "data/maps/ow_weather.asm"
