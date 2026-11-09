; Talking to the following Pokémon: an emote, its cry and one line picked
; from its status, HP, the weather, the map, the time of day and its
; happiness. The first talk each day gives +1 happiness; while the day's item
; is unclaimed, a talk can find one.

DEF FOLLOWER_NO_EMOTE EQU -1
DEF FOLLOWER_ITEM_CHANCE EQU 25 percent

; Kept between the callasms of _FollowerScript.
DEF wFollowerTalkText EQUS "wStringBuffer3"        ; dw: the line to print
DEF wFollowerTalkGotItem EQUS "(wStringBuffer3 + 2)" ; db: TRUE if an item was found
DEF wFollowerTalkCond EQUS "(wStringBuffer3 + 3)"    ; db: the condition of the chosen group
DEF wFollowerTalkTypes EQUS "(wStringBuffer3 + 4)"   ; 2 db: the Pokémon's types

; Conditions that can have type variants (wFollowerTalkCond)
DEF FOLLOWER_COND_NONE EQU 0
; 1-4: OW_WEATHER_* (rain, snow, sandstorm, ash)
DEF FOLLOWER_COND_ENV EQU $10 ; + wEnvironment
	const_def $20
	const FOLLOWER_COND_ICY_CAVE
	const FOLLOWER_COND_DARK_CAVE
	const FOLLOWER_COND_WOODS
	const FOLLOWER_COND_TOWER
	const FOLLOWER_COND_RUINS
	const FOLLOWER_COND_SEA
	const FOLLOWER_COND_JUNGLE
	const FOLLOWER_COND_POKECENTER
	const FOLLOWER_COND_GAME_CORNER
DEF FOLLOWER_COND_TIME EQU $30 ; + wTimeOfDay

MACRO follower_line
; emote (or FOLLOWER_NO_EMOTE), text
	db \1
	dw \2
ENDM

_FollowerScript::
	faceplayer
	callasm FollowerTalk
	ifequal FOLLOWER_NO_EMOTE, .no_emote
	loademote EMOTE_FROM_MEM
	applymovementlasttalked .ShowEmote
	pause 20
	applymovementlasttalked .HideEmote
	callasm FollowerTalkResumeFollow
	faceplayer
.no_emote
	callasm FollowerTalkCry
	opentext
	callasm FollowerTalkPrintLine
	iffalse .done
	farwritetext _ReceivedItemText
	waitsfx
	specialsound
	waitbutton
	itemnotify
	closetext
	end

.done
	waitbutton
	closetext
	end

.ShowEmote:
	show_emote
	step_sleep 1
	step_end

.HideEmote:
	hide_emote
	step_sleep 1
	step_end

FollowerTalkResumeFollow:
; The emote's movement gave the Pokémon its default movement back.
	farjp StartPokemonFollower

FollowerTalkCry:
	farcall GetFollowerPartyMon
	ret c
	jmp PlayMonCry

FollowerTalkPrintLine:
; Prints the chosen line; wScriptVar = TRUE if an item was found.
	ld a, [wFollowerTalkGotItem]
	ld [wScriptVar], a
	ld hl, wFollowerTalkText
	ld a, [hli]
	ld h, [hl]
	ld l, a
	or h
	ret z
	ld b, BANK(@)
	jmp MapTextbox

FollowerTalk:
; Output: wScriptVar = emote (FOLLOWER_NO_EMOTE for none), wFollowerTalkText,
; wFollowerTalkGotItem, wStringBuffer1 = nickname, wStringBuffer4 = item name.
	xor a
	ld [wFollowerTalkGotItem], a
	ld [wFollowerTalkCond], a
	ld [wFollowerTalkText], a
	ld [wFollowerTalkText + 1], a
	ld a, FOLLOWER_NO_EMOTE
	ld [wScriptVar], a
	farcall GetFollowerPartyMon
	ret c
	push hl
	ld [wCurSpecies], a
	call GetBaseData
	ld a, [wBaseType1]
	ld [wFollowerTalkTypes], a
	ld a, [wBaseType2]
	ld [wFollowerTalkTypes + 1], a

; +1 happiness on the first talk of the day
	ld hl, wSwarmFlags
	bit SWARMFLAGS_FOLLOWER_TALKED_F, [hl]
	jr nz, .talked_today
	set SWARMFLAGS_FOLLOWER_TALKED_F, [hl]
	pop hl
	push hl
	ld bc, MON_HAPPINESS
	add hl, bc
	ld a, [hl]
	inc a
	jr z, .talked_today
	ld [hl], a
.talked_today

	pop hl
	push hl
	call FollowerPickLine
	ld a, [hli]
	ld [wScriptVar], a
	ld a, [hli]
	ld [wFollowerTalkText], a
	ld a, [hl]
	ld [wFollowerTalkText + 1], a

; nickname into wStringBuffer1
	pop de
	ld hl, wPartyMon1
	ld c, 0
.index_loop
	ld a, l
	cp e
	jr nz, .next
	ld a, h
	cp d
	jr z, .got_index
.next
	push bc
	ld bc, PARTYMON_STRUCT_LENGTH
	add hl, bc
	pop bc
	inc c
	jr .index_loop

.got_index
	ld a, c
	ld hl, wPartyMonNicknames
	jmp GetNickname

FollowerPickLine:
; hl = party struct. Returns hl = a follower_line entry.
	push hl
	call FollowerTryFindItem
	pop de
	ret c

; status
	ld hl, MON_STATUS
	add hl, de
	ld b, [hl]
	ld hl, FollowerLine_Sleep
	ld a, b
	and SLP_MASK
	ret nz
	ld hl, FollowerLine_Poison
	bit PSN, b
	ret nz
	ld hl, FollowerLine_Burn
	bit BRN, b
	ret nz
	ld hl, FollowerLine_Freeze
	bit FRZ, b
	ret nz
	ld hl, FollowerLine_Paralysis
	bit PAR, b
	ret nz

; HP: below 1/4 always, below 1/2 half the time
	ld hl, MON_HP
	add hl, de
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld c, a ; bc = HP
	ld a, [hli]
	ld l, [hl]
	ld h, a ; hl = max HP
	sla c
	rl b
	push bc ; HP * 2
	sla c
	rl b
	ld a, c
	sub l
	ld a, b
	sbc h
	pop bc
	jr nc, .not_exhausted
	ld hl, FollowerLine_Exhausted
	ret

.not_exhausted
	ld a, c
	sub l
	ld a, b
	sbc h
	jr nc, .weather
	call Random
	rrca
	jr nc, .weather
	ld hl, FollowerLine_WornOut
	ret

.weather
; half the time a weather line
	ld a, [wCurWeather]
	and a
	jr z, .roll
	cp NUM_OW_WEATHERS + 1
	jr nc, .roll
	ld b, a
	call Random
	rrca
	jr nc, .roll
	ld a, b
	ld [wFollowerTalkCond], a
	dec a
	ld hl, FollowerWeatherGroups
	jp .PickFromGroupTable

.roll
; 1/3 place, 1/3 time of day, 1/3 happiness
	ld a, 3
	call RandomRange
	and a
	jr z, .place
	dec a
	jr z, .time

.happiness
	ld hl, MON_HAPPINESS
	add hl, de
	ld a, [hl]
	ld hl, FollowerLines_Happiness200
	cp 200
	jp nc, FollowerPickFromGroup
	ld hl, FollowerLines_Happiness150
	cp 150
	jp nc, FollowerPickFromGroup
	ld hl, FollowerLines_Happiness100
	cp 100
	jp nc, FollowerPickFromGroup
	ld hl, FollowerLines_Happiness50
	cp 50
	jp nc, FollowerPickFromGroup
	ld hl, FollowerLines_Happiness0
	jr FollowerPickFromGroup

.place
; a landmark's lines (outdoors, caves and dungeons only), else a theme's
; lines, 2/3 of the time; else the map type's lines
	ld a, [wEnvironment]
	cp INDOOR
	jr z, .theme
	cp ENVIRONMENT_5
	jr z, .theme
	cp GATE
	jr z, .theme
	call FollowerFindLandmarkGroup
	jr nc, .theme
	call .TwoInThree
	jr nz, FollowerPickFromGroup ; no type variants
.theme
	call FollowerFindThemeGroup
	jr nc, .env
	call .TwoInThree
	jr nz, .GotGroup
.env
	ld a, [wEnvironment]
	ld b, a
	dec a
	cp NUM_ENVIRONMENTS
	jr nc, .happiness
	ld c, a
	ld a, b
	add FOLLOWER_COND_ENV
	ld [wFollowerTalkCond], a
	ld a, c
	ld hl, FollowerPlaceGroups
	jr .PickFromGroupTable

.TwoInThree:
; nz 2/3 of the time; keeps hl
	ld a, 3
	call RandomRange
	and a
	ret

.time
; sky lines only outdoors and without weather
	ld hl, FollowerTimeGroupsIndoors
	ld a, [wCurWeather]
	and a
	jr nz, .got_time_table
	ld a, [wEnvironment]
	cp TOWN
	jr z, .outdoors
	cp ROUTE
	jr nz, .got_time_table
.outdoors
	ld hl, FollowerTimeGroupsOutdoors
.got_time_table
	ld a, [wTimeOfDay]
	and %11
	ld b, a
	add FOLLOWER_COND_TIME
	ld [wFollowerTalkCond], a
	ld a, b

.PickFromGroupTable:
; a = index into the table of group pointers at hl (0 = none: happiness)
	add a
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	or h
	jp z, .happiness
.GotGroup:
; hl = a group; half the time a type variant of wFollowerTalkCond instead
	call Random
	rrca
	jr nc, FollowerPickFromGroup
	push hl
	call FollowerFindTypeLine
	pop de
	ret c
	ld h, d
	ld l, e
	; fallthrough

FollowerPickFromGroup:
; hl = a group (count, then follower_line entries). Returns hl = an entry.
	ld a, [hli]
	call RandomRange
	ld c, a
	ld b, 0
	add hl, bc
	add hl, bc
	add hl, bc
	ret

FollowerFindLandmarkGroup:
; Returns carry and hl = the group of the current landmark, if it has one.
	ld a, [wMapGroup]
	ld b, a
	ld a, [wMapNumber]
	ld c, a
	call GetWorldMapLocation
	ld b, a
	ld hl, FollowerLandmarkGroups
.loop
	ld a, [hli]
	cp -1
	ret z ; nc
	cp b
	jr z, .found
	inc hl
	inc hl
	jr .loop

.found
	ld a, [hli]
	ld h, [hl]
	ld l, a
	scf
	ret

FollowerFindThemeGroup:
; Returns carry, hl = the group of the map's theme (tileset and
; environment) and wFollowerTalkCond = its condition, if it has one.
	ld a, [wMapTileset]
	ld b, a
	ld a, [wEnvironment]
	ld c, a
	ld hl, FollowerThemes
.loop
	ld a, [hli]
	cp -1
	ret z ; nc
	cp b
	jr nz, .next
	ld a, [hl]
	cp c
	jr z, .found
.next
	inc hl
	inc hl
	inc hl
	inc hl
	jr .loop

.found
	inc hl
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ld a, [hl]
	ld [wFollowerTalkCond], a
	ld h, b
	ld l, c
	scf
	ret

FollowerFindTypeLine:
; Returns carry and hl = a follower_line for wFollowerTalkCond and one of the
; Pokémon's types, if there is one.
	ld a, [wFollowerTalkCond]
	and a
	ret z ; nc
	ld b, a
	ld hl, FollowerTypeLines
.loop
	ld a, [hli]
	cp -1
	ret z ; nc
	cp b
	jr nz, .next
	ld a, [wFollowerTalkTypes]
	cp [hl]
	jr z, .found
	ld a, [wFollowerTalkTypes + 1]
	cp [hl]
	jr z, .found
.next
	inc hl
	inc hl
	inc hl
	inc hl
	jr .loop

.found
	inc hl
	scf
	ret

FollowerTryFindItem:
; While the day's item is unclaimed, a chance to find one.
; Returns carry and hl = the line to show if something was found.
	ld hl, wSwarmFlags
	bit SWARMFLAGS_FOLLOWER_ITEM_F, [hl]
	jr nz, .none
	call Random
	cp FOLLOWER_ITEM_CHANCE
	jr nc, .none

	call Random
	ld hl, FollowerItems_Common
	cp 70 percent
	jr c, .pick
	ld hl, FollowerItems_Uncommon
	cp 95 percent
	jr c, .pick
	ld hl, FollowerItems_Rare
.pick
	ld a, [hli]
	call RandomRange
	add a
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call GetItemIDFromIndex
	ld [wCurItem], a
	ld a, 1
	ld [wItemQuantityChange], a
	ld hl, wNumItems
	call ReceiveItem
	ld hl, FollowerLine_PackFull
	jr nc, .found ; the item stays unclaimed for the day

	ld hl, wSwarmFlags
	set SWARMFLAGS_FOLLOWER_ITEM_F, [hl]
	ld a, TRUE
	ld [wFollowerTalkGotItem], a
	ld a, [wCurItem]
	ld [wNamedObjectIndex], a
	call GetItemName
	ld hl, wStringBuffer4
	ld de, wStringBuffer1
	call CopyName2
	ld hl, FollowerLine_HoldingItem
.found
	scf
	ret

.none
	and a
	ret

FollowerItems_Common:
	db 8
	dw ORAN_BERRY, PECHA_BERRY, CHERI_BERRY, CHESTO_BERRY
	dw RAWST_BERRY, ASPEAR_BERRY, POTION, POKE_BALL

FollowerItems_Uncommon:
	db 9
	dw SITRUS_BERRY, LEPPA_BERRY, LUM_BERRY, SUPER_POTION, GREAT_BALL
	dw ETHER, TINYMUSHROOM, PEARL, STARDUST

FollowerItems_Rare:
	db 5
	dw NUGGET, STAR_PIECE, BIG_PEARL, RARE_CANDY, PP_UP

; Single lines
FollowerLine_Poison:     follower_line EMOTE_SAD, FollowerText_Poison
FollowerLine_Burn:       follower_line EMOTE_SAD, FollowerText_Burn
FollowerLine_Paralysis:  follower_line EMOTE_BOLT, FollowerText_Paralysis
FollowerLine_Sleep:      follower_line EMOTE_SLEEP, FollowerText_Sleep
FollowerLine_Freeze:     follower_line EMOTE_SHOCK, FollowerText_Freeze
FollowerLine_Exhausted:  follower_line EMOTE_SAD, FollowerText_Exhausted
FollowerLine_WornOut:    follower_line FOLLOWER_NO_EMOTE, FollowerText_WornOut
FollowerLine_HoldingItem: follower_line EMOTE_SHOCK, FollowerText_HoldingItem
FollowerLine_PackFull:   follower_line EMOTE_SAD, FollowerText_PackFull

FollowerWeatherGroups:
; indexed by OW_WEATHER_* - 1
	dw FollowerLines_Rain
	dw FollowerLines_Snow
	dw FollowerLines_Sandstorm
	dw FollowerLines_Ash
	assert (@ - FollowerWeatherGroups) / 2 == NUM_OW_WEATHERS

FollowerPlaceGroups:
; indexed by wEnvironment - 1
	dw FollowerLines_Town    ; TOWN
	dw FollowerLines_Route   ; ROUTE
	dw FollowerLines_Indoor  ; INDOOR
	dw FollowerLines_Cave    ; CAVE
	dw FollowerLines_Indoor  ; ENVIRONMENT_5
	dw FollowerLines_Gate    ; GATE
	dw FollowerLines_Dungeon ; DUNGEON
	assert (@ - FollowerPlaceGroups) / 2 == NUM_ENVIRONMENTS

FollowerTimeGroupsOutdoors:
; indexed by wTimeOfDay
	dw FollowerLines_MorningOutdoors ; MORN_F
	dw FollowerLines_Day             ; DAY_F
	dw FollowerLines_NightOutdoors   ; NITE_F
	dw FollowerLines_Evening         ; EVE_F

FollowerTimeGroupsIndoors:
	dw FollowerLines_Morning ; MORN_F
	dw 0                     ; DAY_F
	dw FollowerLines_Night   ; NITE_F
	dw 0                     ; EVE_F

FollowerLines_Rain:
	db 2
	follower_line EMOTE_HAPPY, FollowerText_Rain1
	follower_line FOLLOWER_NO_EMOTE, FollowerText_Rain2

FollowerLines_Snow:
	db 2
	follower_line EMOTE_HAPPY, FollowerText_Snow1
	follower_line EMOTE_SAD, FollowerText_Snow2

FollowerLines_Sandstorm:
	db 2
	follower_line FOLLOWER_NO_EMOTE, FollowerText_Sandstorm1
	follower_line EMOTE_SHOCK, FollowerText_Sandstorm2

FollowerLines_Ash:
	db 2
	follower_line FOLLOWER_NO_EMOTE, FollowerText_Ash1
	follower_line EMOTE_QUESTION, FollowerText_Ash2

FollowerLines_Town:
	db 3
	follower_line FOLLOWER_NO_EMOTE, FollowerText_Town1
	follower_line FOLLOWER_NO_EMOTE, FollowerText_Town2
	follower_line EMOTE_HAPPY, FollowerText_Town3

FollowerLines_Route:
	db 3
	follower_line FOLLOWER_NO_EMOTE, FollowerText_Route1
	follower_line EMOTE_HAPPY, FollowerText_Route2
	follower_line EMOTE_HAPPY, FollowerText_Route3

FollowerLines_Cave:
	db 3
	follower_line FOLLOWER_NO_EMOTE, FollowerText_Cave1
	follower_line EMOTE_QUESTION, FollowerText_Cave2
	follower_line EMOTE_SHOCK, FollowerText_Cave3

FollowerLines_Indoor:
	db 2
	follower_line FOLLOWER_NO_EMOTE, FollowerText_Indoor1
	follower_line EMOTE_HAPPY, FollowerText_Indoor2

FollowerLines_Gate:
	db 1
	follower_line FOLLOWER_NO_EMOTE, FollowerText_Gate

FollowerLines_Dungeon:
	db 2
	follower_line FOLLOWER_NO_EMOTE, FollowerText_Dungeon1
	follower_line EMOTE_QUESTION, FollowerText_Dungeon2

FollowerLines_Morning:
	db 1
	follower_line EMOTE_SLEEP, FollowerText_Morning1

FollowerLines_MorningOutdoors:
	db 2
	follower_line EMOTE_SLEEP, FollowerText_Morning1
	follower_line EMOTE_HAPPY, FollowerText_Morning2

FollowerLines_Day:
	db 1
	follower_line EMOTE_HAPPY, FollowerText_Day

FollowerLines_Evening:
	db 1
	follower_line FOLLOWER_NO_EMOTE, FollowerText_Evening

FollowerLines_Night:
	db 1
	follower_line EMOTE_SLEEP, FollowerText_Night2

FollowerLines_NightOutdoors:
	db 2
	follower_line FOLLOWER_NO_EMOTE, FollowerText_Night1
	follower_line EMOTE_SLEEP, FollowerText_Night2

FollowerLines_Happiness200:
	db 3
	follower_line EMOTE_HEART, FollowerText_Happiness200_1
	follower_line EMOTE_HEART, FollowerText_Happiness200_2
	follower_line EMOTE_HEART, FollowerText_Happiness200_3

FollowerLines_Happiness150:
	db 3
	follower_line EMOTE_HAPPY, FollowerText_Happiness150_1
	follower_line EMOTE_HAPPY, FollowerText_Happiness150_2
	follower_line EMOTE_HAPPY, FollowerText_Happiness150_3

FollowerLines_Happiness100:
	db 2
	follower_line FOLLOWER_NO_EMOTE, FollowerText_Happiness100_1
	follower_line FOLLOWER_NO_EMOTE, FollowerText_Happiness100_2

FollowerLines_Happiness50:
	db 2
	follower_line FOLLOWER_NO_EMOTE, FollowerText_Happiness50_1
	follower_line FOLLOWER_NO_EMOTE, FollowerText_Happiness50_2

FollowerLines_Happiness0:
	db 2
	follower_line EMOTE_SAD, FollowerText_Happiness0_1
	follower_line EMOTE_SAD, FollowerText_Happiness0_2

FollowerLandmarkGroups:
; landmark, group (outdoor, cave and dungeon maps only)
	dbw LANDMARK_LAKE_OF_RAGE, FollowerLines_LakeOfRage
	dbw LANDMARK_TIN_TOWER, FollowerLines_TinTower
	dbw LANDMARK_BURNED_TOWER, FollowerLines_BurnedTower
	dbw LANDMARK_SLOWPOKE_WELL, FollowerLines_SlowpokeWell
	dbw LANDMARK_DRAGONS_DEN, FollowerLines_DragonsDen
	dbw LANDMARK_WHIRL_ISLANDS, FollowerLines_WhirlIslands
	dbw LANDMARK_MT_MOON, FollowerLines_MtMoon
	dbw LANDMARK_POWER_PLANT, FollowerLines_PowerPlant
	dbw LANDMARK_SILVER_CAVE, FollowerLines_SilverCave
	dbw LANDMARK_NATIONAL_PARK, FollowerLines_NationalPark
	dbw LANDMARK_FIERY_PATH, FollowerLines_FieryPath
	dbw LANDMARK_LAVARIDGE_DESERT, FollowerLines_Desert
	dbw LANDMARK_METEOR_FALLS, FollowerLines_MeteorFalls
	dbw LANDMARK_MT_PYRE, FollowerLines_MtPyre
	dbw LANDMARK_SOOTOPOLIS, FollowerLines_Sootopolis
	db -1

FollowerThemes:
; tileset, environment, group, condition
	db TILESET_ICE_PATH, CAVE
	dw FollowerLines_IcyCave
	db FOLLOWER_COND_ICY_CAVE
	db TILESET_DARK_CAVE, CAVE
	dw FollowerLines_DarkCave
	db FOLLOWER_COND_DARK_CAVE
	db TILESET_FOREST, CAVE
	dw FollowerLines_Woods
	db FOLLOWER_COND_WOODS
	db TILESET_TOWER, DUNGEON
	dw FollowerLines_Tower
	db FOLLOWER_COND_TOWER
	db TILESET_RUINS_OF_ALPH, DUNGEON
	dw FollowerLines_Ruins
	db FOLLOWER_COND_RUINS
	db TILESET_HOENN_OCEAN, ROUTE
	dw FollowerLines_Sea
	db FOLLOWER_COND_SEA
	db TILESET_HOENN_OCEAN, TOWN
	dw FollowerLines_Sea
	db FOLLOWER_COND_SEA
	db TILESET_HOENN_JUNGLE, ROUTE
	dw FollowerLines_Jungle
	db FOLLOWER_COND_JUNGLE
	db TILESET_POKECENTER, INDOOR
	dw FollowerLines_Pokecenter
	db FOLLOWER_COND_POKECENTER
	db TILESET_GAME_CORNER, INDOOR
	dw FollowerLines_GameCorner
	db FOLLOWER_COND_GAME_CORNER
	db -1

FollowerTypeLines:
; condition, type, then a follower_line
	db OW_WEATHER_RAIN, FIRE
	follower_line EMOTE_SAD, FollowerText_RainFire
	db OW_WEATHER_RAIN, WATER
	follower_line EMOTE_HAPPY, FollowerText_RainWater
	db OW_WEATHER_RAIN, GRASS
	follower_line EMOTE_HAPPY, FollowerText_RainGrass
	db OW_WEATHER_RAIN, ELECTRIC
	follower_line EMOTE_BOLT, FollowerText_RainElectric
	db OW_WEATHER_RAIN, STEEL
	follower_line EMOTE_QUESTION, FollowerText_RainSteel
	db OW_WEATHER_SNOW, ICE
	follower_line EMOTE_HEART, FollowerText_SnowIce
	db OW_WEATHER_SNOW, FIRE
	follower_line EMOTE_HAPPY, FollowerText_SnowFire
	db OW_WEATHER_SNOW, GRASS
	follower_line EMOTE_SAD, FollowerText_SnowGrass
	db OW_WEATHER_SANDSTORM, GROUND
	follower_line EMOTE_HAPPY, FollowerText_SandTough
	db OW_WEATHER_SANDSTORM, ROCK
	follower_line EMOTE_HAPPY, FollowerText_SandTough
	db OW_WEATHER_SANDSTORM, STEEL
	follower_line EMOTE_HAPPY, FollowerText_SandTough
	db OW_WEATHER_SANDSTORM, WATER
	follower_line EMOTE_SAD, FollowerText_SandWater
	db FOLLOWER_COND_TIME + DAY_F, GRASS
	follower_line EMOTE_HAPPY, FollowerText_DayGrass
	db FOLLOWER_COND_TIME + DAY_F, FIRE
	follower_line EMOTE_HAPPY, FollowerText_DayFire
	db FOLLOWER_COND_TIME + NITE_F, GHOST
	follower_line FOLLOWER_NO_EMOTE, FollowerText_NightGhost
	db FOLLOWER_COND_TIME + NITE_F, DARK
	follower_line FOLLOWER_NO_EMOTE, FollowerText_NightDark
	db FOLLOWER_COND_TIME + NITE_F, FAIRY
	follower_line EMOTE_HAPPY, FollowerText_NightFairy
	db FOLLOWER_COND_TIME + NITE_F, BUG
	follower_line EMOTE_QUESTION, FollowerText_NightBug
	db FOLLOWER_COND_ENV + ROUTE, FLYING
	follower_line EMOTE_HAPPY, FollowerText_RouteFlying
	db FOLLOWER_COND_ENV + ROUTE, FIGHTING
	follower_line FOLLOWER_NO_EMOTE, FollowerText_RouteFighting
	db FOLLOWER_COND_ENV + ROUTE, NORMAL
	follower_line EMOTE_QUESTION, FollowerText_RouteNormal
	db FOLLOWER_COND_ENV + ROUTE, DRAGON
	follower_line FOLLOWER_NO_EMOTE, FollowerText_RouteDragon
	db FOLLOWER_COND_ENV + CAVE, ROCK
	follower_line EMOTE_QUESTION, FollowerText_CaveRock
	db FOLLOWER_COND_ENV + CAVE, GROUND
	follower_line EMOTE_HAPPY, FollowerText_CaveGround
	db FOLLOWER_COND_ENV + CAVE, FLYING
	follower_line EMOTE_SAD, FollowerText_CaveFlying
	db FOLLOWER_COND_ENV + CAVE, POISON
	follower_line EMOTE_HAPPY, FollowerText_CavePoison
	db FOLLOWER_COND_WOODS, BUG
	follower_line EMOTE_HAPPY, FollowerText_WoodsBug
	db FOLLOWER_COND_WOODS, GRASS
	follower_line EMOTE_HAPPY, FollowerText_WoodsGrass
	db FOLLOWER_COND_ICY_CAVE, ICE
	follower_line EMOTE_HEART, FollowerText_IcyIce
	db FOLLOWER_COND_ICY_CAVE, FIRE
	follower_line FOLLOWER_NO_EMOTE, FollowerText_IcyFire
	db FOLLOWER_COND_SEA, WATER
	follower_line EMOTE_HAPPY, FollowerText_SeaWater
	db FOLLOWER_COND_TOWER, GHOST
	follower_line EMOTE_QUESTION, FollowerText_TowerGhost
	db FOLLOWER_COND_RUINS, PSYCHIC_TYPE
	follower_line EMOTE_QUESTION, FollowerText_RuinsPsychic
	db -1

FollowerLines_IcyCave:
	db 3
	follower_line EMOTE_SHOCK, FollowerText_IcyCave1
	follower_line FOLLOWER_NO_EMOTE, FollowerText_IcyCave2
	follower_line EMOTE_SAD, FollowerText_IcyCave3

FollowerLines_DarkCave:
	db 2
	follower_line FOLLOWER_NO_EMOTE, FollowerText_DarkCave1
	follower_line EMOTE_QUESTION, FollowerText_DarkCave2

FollowerLines_Woods:
	db 3
	follower_line FOLLOWER_NO_EMOTE, FollowerText_Woods1
	follower_line EMOTE_QUESTION, FollowerText_Woods2
	follower_line EMOTE_HAPPY, FollowerText_Woods3

FollowerLines_Tower:
	db 2
	follower_line FOLLOWER_NO_EMOTE, FollowerText_Tower1
	follower_line FOLLOWER_NO_EMOTE, FollowerText_Tower2

FollowerLines_Ruins:
	db 2
	follower_line EMOTE_QUESTION, FollowerText_Ruins1
	follower_line EMOTE_SHOCK, FollowerText_Ruins2

FollowerLines_Sea:
	db 2
	follower_line EMOTE_HAPPY, FollowerText_Sea1
	follower_line FOLLOWER_NO_EMOTE, FollowerText_Sea2

FollowerLines_Jungle:
	db 2
	follower_line FOLLOWER_NO_EMOTE, FollowerText_Jungle1
	follower_line FOLLOWER_NO_EMOTE, FollowerText_Jungle2

FollowerLines_Pokecenter:
	db 2
	follower_line EMOTE_HAPPY, FollowerText_Pokecenter1
	follower_line EMOTE_QUESTION, FollowerText_Pokecenter2

FollowerLines_GameCorner:
	db 2
	follower_line EMOTE_SHOCK, FollowerText_GameCorner1
	follower_line EMOTE_SAD, FollowerText_GameCorner2

FollowerLines_LakeOfRage:
	db 2
	follower_line FOLLOWER_NO_EMOTE, FollowerText_LakeOfRage1
	follower_line EMOTE_QUESTION, FollowerText_LakeOfRage2

FollowerLines_TinTower:
	db 1
	follower_line EMOTE_QUESTION, FollowerText_TinTower1

FollowerLines_BurnedTower:
	db 2
	follower_line FOLLOWER_NO_EMOTE, FollowerText_BurnedTower1
	follower_line EMOTE_QUESTION, FollowerText_BurnedTower2

FollowerLines_SlowpokeWell:
	db 1
	follower_line EMOTE_SLEEP, FollowerText_SlowpokeWell1

FollowerLines_DragonsDen:
	db 1
	follower_line EMOTE_SHOCK, FollowerText_DragonsDen1

FollowerLines_WhirlIslands:
	db 1
	follower_line EMOTE_QUESTION, FollowerText_WhirlIslands1

FollowerLines_MtMoon:
	db 2
	follower_line EMOTE_HAPPY, FollowerText_MtMoon1
	follower_line EMOTE_QUESTION, FollowerText_MtMoon2

FollowerLines_PowerPlant:
	db 1
	follower_line FOLLOWER_NO_EMOTE, FollowerText_PowerPlant1

FollowerLines_SilverCave:
	db 1
	follower_line EMOTE_QUESTION, FollowerText_SilverCave1

FollowerLines_NationalPark:
	db 1
	follower_line EMOTE_HAPPY, FollowerText_NationalPark1

FollowerLines_FieryPath:
	db 1
	follower_line EMOTE_SHOCK, FollowerText_FieryPath1

FollowerLines_Desert:
	db 1
	follower_line FOLLOWER_NO_EMOTE, FollowerText_Desert1

FollowerLines_MeteorFalls:
	db 1
	follower_line FOLLOWER_NO_EMOTE, FollowerText_MeteorFalls1

FollowerLines_MtPyre:
	db 2
	follower_line FOLLOWER_NO_EMOTE, FollowerText_MtPyre1
	follower_line EMOTE_SAD, FollowerText_MtPyre2

FollowerLines_Sootopolis:
	db 1
	follower_line EMOTE_HAPPY, FollowerText_Sootopolis1

; Texts. wStringBuffer1 holds the nickname (up to 10 characters), so the
; first line has room for 8 more.

MACRO follower_text_mon
; "<nickname>\1" on the first line
	text_ram wStringBuffer1
	text \1
ENDM

FollowerText_Poison:
	follower_text_mon " is"
	line "shivering…"
	cont "It looks poisoned."
	done

FollowerText_Burn:
	follower_text_mon " is"
	line "wincing from its"
	cont "burn."
	done

FollowerText_Paralysis:
	follower_text_mon "'s body"
	line "is twitching. It's"
	cont "paralyzed!"
	done

FollowerText_Sleep:
	follower_text_mon " is"
	line "dozing off on its"
	cont "feet. Zzz…"
	done

FollowerText_Freeze:
	follower_text_mon " is"
	line "frozen stiff!"
	done

FollowerText_Exhausted:
	follower_text_mon " is"
	line "exhausted. It can"
	cont "barely stand…"
	done

FollowerText_WornOut:
	follower_text_mon " looks"
	line "a little worn out."
	done

FollowerText_HoldingItem:
	follower_text_mon " is"
	line "holding something!"
	prompt

FollowerText_PackFull:
	follower_text_mon " wanted"
	line "to give you an"
	cont "item, but your"
	cont "Pack is full."
	done

FollowerText_Rain1:
	follower_text_mon " is"
	line "splashing in the"
	cont "puddles!"
	done

FollowerText_Rain2:
	follower_text_mon " shakes"
	line "the rain off its"
	cont "body."
	done

FollowerText_Snow1:
	follower_text_mon " is"
	line "trying to catch"
	cont "snowflakes!"
	done

FollowerText_Snow2:
	follower_text_mon " is"
	line "shivering in the"
	cont "cold."
	done

FollowerText_Sandstorm1:
	follower_text_mon " is"
	line "squinting through"
	cont "the sandstorm."
	done

FollowerText_Sandstorm2:
	text "Achoo! @"
	text_ram wStringBuffer1
	text_start
	line "sneezed from the"
	cont "sand!"
	done

FollowerText_Ash1:
	follower_text_mon " is"
	line "covered in gray"
	cont "ash."
	done

FollowerText_Ash2:
	follower_text_mon " is"
	line "sniffing the"
	cont "falling ash."
	done

FollowerText_Town1:
	follower_text_mon " is"
	line "looking at the"
	cont "houses."
	done

FollowerText_Town2:
	follower_text_mon " is"
	line "watching people"
	cont "go by."
	done

FollowerText_Town3:
	follower_text_mon " seems"
	line "to like this town."
	done

FollowerText_Route1:
	follower_text_mon " is"
	line "sniffing the"
	cont "grass."
	done

FollowerText_Route2:
	follower_text_mon " wants"
	line "to run around!"
	done

FollowerText_Route3:
	follower_text_mon " is"
	line "enjoying the fresh"
	cont "air."
	done

FollowerText_Cave1:
	follower_text_mon " is"
	line "peering into the"
	cont "darkness."
	done

FollowerText_Cave2:
	follower_text_mon " is"
	line "listening to the"
	cont "echoes."
	done

FollowerText_Cave3:
	follower_text_mon " jumped"
	line "at a falling drop"
	cont "of water!"
	done

FollowerText_Indoor1:
	follower_text_mon " is"
	line "looking around the"
	cont "room."
	done

FollowerText_Indoor2:
	follower_text_mon " seems"
	line "relaxed indoors."
	done

FollowerText_Gate:
	follower_text_mon " is"
	line "waiting patiently."
	done

FollowerText_Dungeon1:
	follower_text_mon " is"
	line "on its guard."
	done

FollowerText_Dungeon2:
	follower_text_mon " senses"
	line "something nearby…"
	done

FollowerText_Morning1:
	follower_text_mon " yawns."
	line "It's still early!"
	done

FollowerText_Morning2:
	follower_text_mon " is"
	line "stretching in the"
	cont "morning sun."
	done

FollowerText_Day:
	follower_text_mon " is"
	line "basking in the"
	cont "sunshine."
	done

FollowerText_Evening:
	follower_text_mon " is"
	line "watching the"
	cont "sunset."
	done

FollowerText_Night1:
	follower_text_mon " is"
	line "looking up at the"
	cont "stars."
	done

FollowerText_Night2:
	follower_text_mon " is"
	line "getting sleepy…"
	done

FollowerText_Happiness200_1:
	follower_text_mon " is"
	line "snuggling up to"
	cont "you!"
	done

FollowerText_Happiness200_2:
	follower_text_mon " gives"
	line "you a big smile!"
	done

FollowerText_Happiness200_3:
	follower_text_mon " is"
	line "happy to be with"
	cont "you!"
	done

FollowerText_Happiness150_1:
	follower_text_mon " is in"
	line "a good mood."
	done

FollowerText_Happiness150_2:
	follower_text_mon " is"
	line "humming happily."
	done

FollowerText_Happiness150_3:
	follower_text_mon " looks"
	line "at you cheerfully."
	done

FollowerText_Happiness100_1:
	follower_text_mon " is"
	line "looking at you."
	done

FollowerText_Happiness100_2:
	follower_text_mon " is"
	line "walking along with"
	cont "you."
	done

FollowerText_Happiness50_1:
	follower_text_mon " seems"
	line "a little distant…"
	done

FollowerText_Happiness50_2:
	follower_text_mon " looks"
	line "away from you."
	done

FollowerText_Happiness0_1:
	follower_text_mon " won't"
	line "look at you."
	done

FollowerText_Happiness0_2:
	follower_text_mon " is"
	line "ignoring you…"
	done

FollowerText_RainFire:
	follower_text_mon " is"
	line "hiding from the"
	cont "rain…"
	done

FollowerText_RainWater:
	follower_text_mon " is"
	line "dancing in the"
	cont "rain!"
	done

FollowerText_RainGrass:
	follower_text_mon " is"
	line "drinking in the"
	cont "rain."
	done

FollowerText_RainElectric:
	follower_text_mon "'s body"
	line "is crackling with"
	cont "static!"
	done

FollowerText_RainSteel:
	follower_text_mon " looks"
	line "worried about"
	cont "rusting…"
	done

FollowerText_SnowIce:
	follower_text_mon " is"
	line "loving the snow!"
	done

FollowerText_SnowFire:
	follower_text_mon " is"
	line "melting the"
	cont "snowflakes!"
	done

FollowerText_SnowGrass:
	follower_text_mon " is"
	line "wilting in the"
	cont "cold…"
	done

FollowerText_SandTough:
	follower_text_mon " isn't"
	line "bothered by the"
	cont "sand at all."
	done

FollowerText_SandWater:
	follower_text_mon " is"
	line "parched by the"
	cont "dry sand…"
	done

FollowerText_DayGrass:
	follower_text_mon " is"
	line "soaking up the"
	cont "sunlight!"
	done

FollowerText_DayFire:
	follower_text_mon " is"
	line "glowing in the"
	cont "warm sun!"
	done

FollowerText_NightGhost:
	follower_text_mon " is"
	line "grinning in the"
	cont "dark…"
	done

FollowerText_NightDark:
	follower_text_mon "'s eyes"
	line "are glinting in"
	cont "the dark."
	done

FollowerText_NightFairy:
	follower_text_mon " is"
	line "twinkling softly."
	done

FollowerText_NightBug:
	follower_text_mon " is"
	line "drawn to a nearby"
	cont "light."
	done

FollowerText_RouteFlying:
	follower_text_mon " wants"
	line "to fly up into the"
	cont "sky!"
	done

FollowerText_RouteFighting:
	follower_text_mon " is"
	line "practicing its"
	cont "punches!"
	done

FollowerText_RouteNormal:
	follower_text_mon " is"
	line "sniffing around"
	cont "curiously."
	done

FollowerText_RouteDragon:
	follower_text_mon " is"
	line "gazing proudly at"
	cont "the horizon."
	done

FollowerText_CaveRock:
	follower_text_mon " is"
	line "nibbling on a"
	cont "rock…"
	done

FollowerText_CaveGround:
	follower_text_mon " is"
	line "digging at the"
	cont "ground."
	done

FollowerText_CaveFlying:
	follower_text_mon " is"
	line "uneasy under the"
	cont "low ceiling."
	done

FollowerText_CavePoison:
	follower_text_mon " seems"
	line "to like the damp"
	cont "air."
	done

FollowerText_WoodsBug:
	follower_text_mon " is"
	line "buzzing around the"
	cont "leaves!"
	done

FollowerText_WoodsGrass:
	follower_text_mon " seems"
	line "at home among the"
	cont "trees."
	done

FollowerText_IcyIce:
	follower_text_mon " is"
	line "sliding happily on"
	cont "the ice!"
	done

FollowerText_IcyFire:
	follower_text_mon " is"
	line "warming up the"
	cont "chilly air."
	done

FollowerText_SeaWater:
	follower_text_mon " wants"
	line "to go for a swim!"
	done

FollowerText_TowerGhost:
	follower_text_mon " seems"
	line "to know this"
	cont "place…"
	done

FollowerText_RuinsPsychic:
	follower_text_mon " is"
	line "staring at the"
	cont "ancient walls…"
	done

FollowerText_IcyCave1:
	follower_text_mon " is"
	line "slipping on the"
	cont "ice!"
	done

FollowerText_IcyCave2:
	follower_text_mon " is"
	line "puffing little"
	cont "clouds of breath."
	done

FollowerText_IcyCave3:
	follower_text_mon " is"
	line "shivering in the"
	cont "chilly air."
	done

FollowerText_DarkCave1:
	follower_text_mon " is"
	line "staying close to"
	cont "you."
	done

FollowerText_DarkCave2:
	follower_text_mon " is"
	line "squinting in the"
	cont "darkness."
	done

FollowerText_Woods1:
	follower_text_mon " is"
	line "listening to the"
	cont "rustling leaves."
	done

FollowerText_Woods2:
	follower_text_mon " is"
	line "sniffing a"
	cont "mushroom."
	done

FollowerText_Woods3:
	follower_text_mon " is"
	line "watching the light"
	cont "through the trees."
	done

FollowerText_Tower1:
	follower_text_mon " is"
	line "looking up at the"
	cont "tall pillars."
	done

FollowerText_Tower2:
	follower_text_mon " is"
	line "tiptoeing on the"
	cont "creaky floor."
	done

FollowerText_Ruins1:
	follower_text_mon " is"
	line "staring at the"
	cont "strange carvings."
	done

FollowerText_Ruins2:
	follower_text_mon " is"
	line "listening to an"
	cont "echo… or a voice?"
	done

FollowerText_Sea1:
	follower_text_mon " is"
	line "enjoying the sea"
	cont "breeze."
	done

FollowerText_Sea2:
	follower_text_mon " is"
	line "watching the"
	cont "waves roll in."
	done

FollowerText_Jungle1:
	follower_text_mon " is"
	line "peeking through"
	cont "the tall leaves."
	done

FollowerText_Jungle2:
	follower_text_mon " is"
	line "sniffing the damp"
	cont "jungle air."
	done

FollowerText_Pokecenter1:
	follower_text_mon " looks"
	line "relieved to be"
	cont "here."
	done

FollowerText_Pokecenter2:
	follower_text_mon " is"
	line "watching the"
	cont "healing machine."
	done

FollowerText_GameCorner1:
	follower_text_mon " is"
	line "dazzled by the"
	cont "flashing lights!"
	done

FollowerText_GameCorner2:
	follower_text_mon " is"
	line "covering its ears"
	cont "from the noise."
	done

FollowerText_LakeOfRage1:
	follower_text_mon " is"
	line "gazing at the"
	cont "huge lake."
	done

FollowerText_LakeOfRage2:
	follower_text_mon " senses"
	line "something stirring"
	cont "in the water…"
	done

FollowerText_TinTower1:
	follower_text_mon " is"
	line "looking up toward"
	cont "the rooftop."
	done

FollowerText_BurnedTower1:
	follower_text_mon " is"
	line "sniffing the old"
	cont "ashes."
	done

FollowerText_BurnedTower2:
	follower_text_mon " senses"
	line "something sleeping"
	cont "below…"
	done

FollowerText_SlowpokeWell1:
	follower_text_mon " is"
	line "yawning, just like"
	cont "a Slowpoke."
	done

FollowerText_DragonsDen1:
	follower_text_mon " feels"
	line "a mighty power"
	cont "here."
	done

FollowerText_WhirlIslands1:
	follower_text_mon " is"
	line "listening to the"
	cont "roaring currents."
	done

FollowerText_MtMoon1:
	follower_text_mon " is"
	line "looking for Moon"
	cont "Stones!"
	done

FollowerText_MtMoon2:
	follower_text_mon " heard"
	line "something dancing"
	cont "nearby…"
	done

FollowerText_PowerPlant1:
	follower_text_mon " is"
	line "humming along with"
	cont "the generators."
	done

FollowerText_SilverCave1:
	follower_text_mon " feels"
	line "a strong presence"
	cont "deep inside…"
	done

FollowerText_NationalPark1:
	follower_text_mon " is"
	line "rolling in the"
	cont "soft grass!"
	done

FollowerText_FieryPath1:
	follower_text_mon " is"
	line "sweating from the"
	cont "heat!"
	done

FollowerText_Desert1:
	follower_text_mon " is"
	line "squinting in the"
	cont "desert glare."
	done

FollowerText_MeteorFalls1:
	follower_text_mon " is"
	line "listening to the"
	cont "falling water."
	done

FollowerText_MtPyre1:
	follower_text_mon " is"
	line "standing quietly"
	cont "in respect."
	done

FollowerText_MtPyre2:
	follower_text_mon " is"
	line "shivering in the"
	cont "cold mist."
	done

FollowerText_Sootopolis1:
	follower_text_mon " is"
	line "admiring the deep"
	cont "blue water."
	done
