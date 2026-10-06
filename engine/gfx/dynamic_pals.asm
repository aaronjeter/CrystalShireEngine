ClearSavedObjPals::
	ldh a, [rSVBK]
	push af
	ld a, BANK(wUsedObjectPals)
	ldh [rSVBK], a

	xor a
	ld [wUsedObjectPals], a
	ld hl, wUsedObjectPals
	ld bc, wNeededPalIndex - wUsedObjectPals
	ld a, -1
	rst ByteFill

	pop af
	ldh [rSVBK], a
	ret

DisableDynPalUpdates::
	push hl
	ld hl, wPalFlags
	set DISABLE_DYN_PAL_F, [hl]
	pop hl
	ret

EnableDynPalUpdatesNoApply::
	push hl
	ld hl, wPalFlags
	set NO_DYN_PAL_APPLY_F, [hl]
	res DISABLE_DYN_PAL_F, [hl]
	pop hl
	jr CheckForUsedObjPals

EnableDynPalUpdates::
	push hl
	ld hl, wPalFlags
	res DISABLE_DYN_PAL_F, [hl]
	pop hl
	; fallthrough to manually run CheckForUsedObjPals

CheckForUsedObjPals::
	push hl
	push de
	push bc
	push af

	ldh a, [rSVBK]
	push af
	ld a, BANK(wUsedObjectPals)
	ldh [rSVBK], a

	ld hl, wPalFlags
	bit DISABLE_DYN_PAL_F, [hl]
	jr nz, .done

	; reset all wUsedObjectPals bits, except the overworld weather slot
	call IsWeatherPalReserved
	ld a, 0
	jr z, .no_weather
	ld a, 1 << PAL_OW_WEATHER
.no_weather
	ld [wUsedObjectPals], a

	; Scan for active objects first and mark those pals still in use.
	ld hl, wPalFlags
	set SCAN_OBJECTS_FIRST_F, [hl]
	call ScanObjectStructPals

	; Scan for active objects that still need pals loaded
	ld hl, wPalFlags
	res SCAN_OBJECTS_FIRST_F, [hl]
	call ScanObjectStructPals

	call LoadWeatherPal

	; If this flag was set, it's time to reset it
	ld hl, wPalFlags
	res NO_DYN_PAL_APPLY_F, [hl]
.done
	pop af
	ldh [rSVBK], a
	jmp PopAFBCDEHL

ScanObjectStructPals:
	ld de, wObjectStructs
	ld b, NUM_OBJECT_STRUCTS

.loop
	; Check if the object has a sprite
	ld hl, OBJECT_SPRITE
	add hl, de
	ld a, [hl]
	and a
	jr z, .skip

	; Look up the object's requested color palette
	ld hl, OBJECT_PAL_INDEX
	add hl, de
	ld a, [hl]
	ld [wNeededPalIndex], a

	; Mark the palette in use and/or load the palette
	call MarkUsedPal
	; Then load the return into OBJECT_PALETTE, which corresponds
	; to OBJ 0 - OBJ 7
	jr nc, .skip
	and PALETTE_MASK
	ld c, a
	ld hl, OBJECT_PALETTE
	add hl, de
	ld a, [hl]
	and ~PALETTE_MASK
	or c
	ld [hl], a

.skip
	dec b
	ret z

	ld hl, OBJECT_LENGTH
	add hl, de
	ld d, h
	ld e, l
	jr .loop

MarkUsedPal:
	push hl
	push de
	push bc

	; Check if pal is already loaded
	lb bc, 8, 0
	ld hl, wLoadedObjPal0
.loaded_loop
	cp [hl]
	jr nz, .next_loaded
	; an object can't share the overworld weather slot
	push af
	ld a, c
	cp PAL_OW_WEATHER
	jr nz, .use_loaded
	call IsWeatherPalReserved
	jr z, .use_loaded
	pop af
	jr .next_loaded
.use_loaded
	pop af
	jr .mark_in_use
.next_loaded
	inc hl
	inc c
	dec b
	jr nz, .loaded_loop

	; If this is the first pass, we do not want to
	; load any pals yet, just mark the still active pals
	ld hl, wPalFlags
	bit SCAN_OBJECTS_FIRST_F, [hl]
	scf
	ccf
	jr nz, .done

	ld b, a
	push bc

	; Pal is not already loaded, find a empty pal slot
	ld a, [wUsedObjectPals]
	inc a
	jr nz, .some_available
	ld b, 7
	jr .unset_bit_found
.some_available
	dec a
	ld b, -1
.bit_check_loop
	inc b
	rrca
	jr c, .bit_check_loop
.unset_bit_found
	ld a, b
	pop bc

	; Save and remember what pal is loaded where
	ld c, a
	ld a, b
	ld b, 0
	ld hl, wLoadedObjPal0
	add hl, bc
	ld [hl], a

	; Copy the needed pal
	push bc
	ld a, c
	ld bc, 1 palettes
	ld hl, wOBPals1
	rst AddNTimes
	ld d, h
	ld e, l
	call CopySpritePal
	pop bc

	; Set the corresponding bit in wUsedObjectPals
	; A set bit corresponds to a used pal slot
.mark_in_use
	push bc
	ld hl, wUsedObjectPals
	inc c
	ld a, 1
.used_loop
	dec c
	jr z, .found_used
	rla
	jr .used_loop
.found_used
	or [hl]
	ld [hl], a
	pop bc
	ld a, c

	scf
.done
	jmp PopBCDEHL

IsWeatherPalReserved:
; Return nz while overworld weather particles may be on screen
; (they always use object palette slot PAL_OW_WEATHER).
	ld a, [wCurWeather]
	and a
	ret nz
	ld a, [wOverworldWeatherCooldown]
	and a
	ret

LoadWeatherPal:
; Load the active weather's palette into slot PAL_OW_WEATHER.
	ld a, [wOverworldWeatherCooldown]
	and a
	ld a, [wPrevWeather]
	jr nz, .got_weather
	ld a, [wCurWeather]
.got_weather
	and a
	ret z
	ld c, a
	ld b, 0
	ld hl, WeatherPalettes - 1
	add hl, bc
	ld a, BANK(WeatherPalettes)
	call GetFarByte
	ld hl, wLoadedObjPal0 + PAL_OW_WEATHER
	cp [hl]
	ret z
	ld [hl], a
	ld [wNeededPalIndex], a
	ld de, wOBPals1 palette PAL_OW_WEATHER
	jmp CopySpritePal
