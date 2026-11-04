; Stats screen pages (roadmap §25): the pink, blue and orange pages and their
; helpers. "bank13_2" (stats_screen.asm) is full, so they live here and are
; reached by farcall/farjp from StatsScreen_LoadGFX and friends.
;
; Blue page sub-pages: bits 2-3 of wStatsScreenFlags (STAT_SUBPAGE_MASK):
; 0 = stats, 1 = DVs (+ Hidden Power), 2 = EVs (+ total). A cycles them.
;
; Bars: 9 exp bar tiles between end caps, filled from the left. The exp bar's
; partial tiles fill from the right, so the bar tiles are X-flipped in
; wAttrmap; StatsScreen_ClearBottom undoes the flips when the page changes.

; A full stat bar on the main page is a base-130 stat with 15 DVs and 252 EVs
; at the mon's level (user's choice, Nov 3: "scale B").
DEF STATS_BAR_GREAT_BASE EQU 130
DEF STATS_BAR_GREAT_CORE EQU (STATS_BAR_GREAT_BASE + 15) * 2 + 252 / 4
DEF STATS_BAR_PIXELS EQU 9 * TILE_WIDTH

StatsScreen_PageTilemap:
	ld a, [wStatsScreenFlags]
	maskbits NUM_STAT_PAGES
	ld hl, .Jumptable
	jmp JumpTable

.Jumptable:
; entries correspond to *_PAGE constants
	table_width 2
	dw LoadPinkPage
	dw .Green
	dw LoadBluePage
	dw LoadOrangePage
	assert_table_length NUM_STAT_PAGES

.Green:
	farjp LoadGreenPage

StatsScreen_ClearBottom:
; Clear rows 8-17 and undo the blue page's X-flipped bar tiles.
	hlcoord 0, 8
	lb bc, 10, SCREEN_WIDTH
	call ClearBox
	hlcoord 0, 8, wAttrmap
	ld bc, 10 * SCREEN_WIDTH
	ld d, FALSE
.loop
	bit OAM_X_FLIP, [hl]
	jr z, .next
	res OAM_X_FLIP, [hl]
	ld d, TRUE
.next
	inc hl
	dec bc
	ld a, b
	or c
	jr nz, .loop
	ld a, d
	and a
	ret z
	; the old page's tiles are still on screen: only its bars change, so
	; put the attributes back now rather than after the new tiles
	farjp HDMATransferAttrmapToWRAMBank3

StatsScreen_TransferTilemap:
; StatsScreen_WaitAnim's transfer: the blue page also needs its bar flips.
	farcall HDMATransferTilemapToWRAMBank3
	ld a, [wStatsScreenFlags]
	maskbits NUM_STAT_PAGES
	cp BLUE_PAGE
	ret nz
	farjp HDMATransferAttrmapToWRAMBank3

StatsScreen_PlaceTypeIconsFar:
; Type and category icons, once the page's tilemap is on screen.
	ld a, [wStatsScreenFlags]
	maskbits NUM_STAT_PAGES
	cp GREEN_PAGE
	jr z, .move_icons
	cp PINK_PAGE
	jr z, .mon_types
	cp BLUE_PAGE
	ret nz
	ld a, [wStatsScreenFlags]
	and STAT_SUBPAGE_MASK
	cp STAT_SUBPAGE_DVS
	ret nz
	call StatsScreen_GetHiddenPower
	lb bc, 16, 11 ; next to "Hid.Power"
	lb de, 0, 0
	farjp PlaceTypeIconForType

.move_icons
	farcall PlaceStatsMoveIcons ; category and type icons on each PP row
	; Hidden Power's row shows this Pokémon's real type
	ld hl, wTempMonMoves
	ld b, 11 ; row
	ld d, 0 ; move number = icon slot = OBJ palette
.hp_loop
	ld a, [hli]
	and a
	ret z
	push hl
	push bc
	push de
	ld l, a
	ld a, MOVE_EFFECT
	call GetMoveAttribute
	cp EFFECT_HIDDEN_POWER
	jr nz, .hp_next
	call StatsScreen_GetHiddenPower
	farcall GetTypeIcon
	pop de
	pop bc
	push bc
	push de
	ld c, 60 ; x in pixels, as in PlaceStatsMoveIcons
	ld e, d
	farcall PlaceTypeIconAtX
.hp_next
	pop de
	pop bc
	pop hl
	inc b
	inc b
	inc d
	ld a, d
	cp NUM_MOVES
	jr c, .hp_loop
	ret

.mon_types
; Under "Type/": one icon, or two side by side (row 16 is "Happy/").
	call GetBaseData
	ld a, [wBaseType2]
	ld hl, wBaseType1
	cp [hl]
	ld a, [hl]
	jr nz, .two_types
	lb bc, 15, 1
	lb de, 0, 0
	farjp PlaceTypeIconForType

.two_types
	farcall GetTypeIcon
	lb bc, 15, 4 ; x in pixels
	lb de, 0, 0
	farcall PlaceTypeIconAtX
	ld a, [wBaseType2]
	farcall GetTypeIcon
	lb bc, 15, 38
	lb de, 1, 1
	farjp PlaceTypeIconAtX

; Pink page

LoadPinkPage:
	hlcoord 0, 9
	ld b, $0
	predef DrawPlayerHP
	hlcoord 8, 9
	ld [hl], $41 ; right HP/exp bar end cap
	ld de, .Status_Type
	hlcoord 0, 12
	rst PlaceString
	ld a, [wTempMonPokerusStatus]
	ld b, a
	and $f
	jr nz, .HasPokerus
	ld a, b
	and $f0
	jr z, .NotImmuneToPkrs
	hlcoord 8, 8
	ld [hl], "." ; Pokérus immunity dot
.NotImmuneToPkrs:
	ld a, [wMonType]
	cp BOXMON
	jr z, .StatusOK
	hlcoord 6, 13
	push hl
	ld de, wTempMonStatus
	predef PlaceStatusString
	pop hl
	jr nz, .done_status
	jr .StatusOK
.HasPokerus:
	ld de, .PkrsStr
	hlcoord 1, 13
	rst PlaceString
	jr .done_status
.StatusOK:
	ld de, .OK_str
	rst PlaceString
.done_status
	ld de, .HappyStr
	hlcoord 0, 16
	rst PlaceString
	hlcoord 6, 17
	lb bc, 1, 3
	ld de, wTempMonHappiness
	call PrintNum
	hlcoord 9, 8
	ld de, SCREEN_WIDTH
	ld b, 10
	ld a, $31 ; vertical divider
.vertical_divider
	ld [hl], a
	add hl, de
	dec b
	jr nz, .vertical_divider
	ld de, .ExpPointStr
	hlcoord 10, 9
	rst PlaceString
	hlcoord 17, 14
	call .PrintNextLevel
	hlcoord 13, 10
	lb bc, 3, 7
	ld de, wTempMonExp
	call PrintNum
	call .CalcExpToNextLevel
	hlcoord 13, 13
	lb bc, 3, 7
	ld de, wExpToNextLevel
	call PrintNum
	ld de, .LevelUpStr
	hlcoord 10, 12
	rst PlaceString
	ld de, .ToStr
	hlcoord 14, 14
	rst PlaceString
	hlcoord 11, 16
	ld a, [wTempMonLevel]
	ld b, a
	ld de, wTempMonExp + 2
	predef FillInExpBar
	hlcoord 10, 16
	ld [hl], $40 ; left exp bar end cap
	hlcoord 19, 16
	ld [hl], $41 ; right exp bar end cap
	ret

.PrintNextLevel:
	ld a, [wTempMonLevel]
	push af
	cp MAX_LEVEL
	jr z, .AtMaxLevel
	inc a
	ld [wTempMonLevel], a
.AtMaxLevel:
	call PrintLevel
	pop af
	ld [wTempMonLevel], a
	ret

.CalcExpToNextLevel:
	ld a, [wTempMonLevel]
	cp MAX_LEVEL
	jr z, .AlreadyAtMaxLevel
	inc a
	ld d, a
	farcall CalcExpAtLevel
	ld hl, wTempMonExp + 2
	ldh a, [hQuotient + 3]
	sub [hl]
	dec hl
	ld [wExpToNextLevel + 2], a
	ldh a, [hQuotient + 2]
	sbc [hl]
	dec hl
	ld [wExpToNextLevel + 1], a
	ldh a, [hQuotient + 1]
	sbc [hl]
	ld [wExpToNextLevel], a
	ret

.AlreadyAtMaxLevel:
	ld hl, wExpToNextLevel
	xor a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ret

.Status_Type:
	db   "Status/"
	next "Type/@"

.OK_str:
	db "OK @"

.HappyStr:
	db "Happy/@"

.ExpPointStr:
	db "Exp Points@"

.LevelUpStr:
	db "Level Up@"

.ToStr:
	db "To@"

.PkrsStr:
	db "#rus@"

; Blue page

LoadBluePage:
	call StatsScreen_PlaceStatNames
	ld a, [wStatsScreenFlags]
	and STAT_SUBPAGE_MASK
	jmp z, .stats
	cp STAT_SUBPAGE_DVS
	jr z, .dvs

; EVs: value and bar out of 252 per stat, the total on row 16
	ld de, .EVsStr
	hlcoord 1, 8
	rst PlaceString
	xor a
.ev_loop
	push af
	call StatsScreen_GetEV
	ld e, a
	ld d, 0
	pop af
	push af
	call StatsScreen_StatRowCoord
	lb bc, 72, 252
	call StatsScreen_PrintValueAndBar
	pop af
	inc a
	cp NUM_STATS
	jr c, .ev_loop
	ld de, .TotalStr
	hlcoord 1, 16
	rst PlaceString
	ld hl, wTempMonEVs
	ld b, NUM_STATS
	ld de, 0
.sum
	ld a, [hli]
	add e
	ld e, a
	adc d
	sub e
	ld d, a
	dec b
	jr nz, .sum
	ld hl, wStringBuffer2
	ld a, d
	ld [hli], a
	ld [hl], e
	hlcoord 7, 16
	lb bc, 2, 4
	ld de, wStringBuffer2
	jmp PrintNum

.dvs
; DVs: value and bar out of 15 per stat, Hidden Power on row 16
	ld de, .DVsStr
	hlcoord 1, 8
	rst PlaceString
	xor a
.dv_loop
	push af
	call StatsScreen_GetDV
	ld e, a
	ld d, 0
	pop af
	push af
	call StatsScreen_StatRowCoord
	lb bc, 72, 15
	call StatsScreen_PrintValueAndBar
	pop af
	inc a
	cp NUM_STATS
	jr c, .dv_loop
	ld de, .HiddenPowerStr
	hlcoord 1, 16
	rst PlaceString
	call StatsScreen_GetHiddenPower ; the icon comes later (StatsScreen_PlaceTypeIconsFar)
	ld hl, wStringBuffer2
	ld [hl], d
	ld d, h
	ld e, l
	hlcoord 16, 16
	lb bc, 1, 3
	jmp PrintNum

.stats
; Stats: value and bar against a great stat at this level (STATS_BAR_GREAT_*)
	xor a
.stat_loop
	push af
	call StatsScreen_GetStat
	pop af
	push af
	push de
	call StatsScreen_GreatStatHalf
	pop de
	pop af
	push af
	push bc
	call StatsScreen_StatRowCoord
	pop bc
	call StatsScreen_PrintValueAndBar
	pop af
	inc a
	cp NUM_STATS
	jr c, .stat_loop
	ld de, .HintStr
	hlcoord 1, 16
	rst PlaceString
	ret

.DVsStr:
	db "DVs@"

.EVsStr:
	db "EVs@"

.TotalStr:
	db "Total@"

.HiddenPowerStr:
	db "Hid.Power@"

.HintStr:
	db "A: DVs and EVs@"

StatsScreen_PlaceStatNames:
	ld hl, .Names
	decoord 1, 9
	ld b, NUM_STATS
.loop
	ld c, 3
.char
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .char
	ld a, e
	add SCREEN_WIDTH - 3
	ld e, a
	adc d
	sub e
	ld d, a
	dec b
	jr nz, .loop
	ret

.Names:
; display order: HP, Attack, Defense, Sp.Atk, Sp.Def, Speed
	db "HP "
	db "Atk"
	db "Def"
	db "SpA"
	db "SpD"
	db "Spe"

StatsScreen_StatRowCoord:
; hl = coord 5, 9 + a
	hlcoord 5, 9
	push bc
	ld bc, SCREEN_WIDTH
	rst AddNTimes
	pop bc
	ret

StatsScreen_GetStat:
; de = stat a (display order) of wTempMon
	ld hl, .Offsets
	add l
	ld l, a
	adc h
	sub l
	ld h, a
	ld a, [hl]
	ld hl, wTempMonMaxHP
	add l
	ld l, a
	adc h
	sub l
	ld h, a
	ld a, [hli]
	ld d, a
	ld e, [hl]
	ret

.Offsets:
	db wTempMonMaxHP - wTempMonMaxHP
	db wTempMonAttack - wTempMonMaxHP
	db wTempMonDefense - wTempMonMaxHP
	db wTempMonSpclAtk - wTempMonMaxHP
	db wTempMonSpclDef - wTempMonMaxHP
	db wTempMonSpeed - wTempMonMaxHP

StatsScreen_GetEV:
; a = EV of stat a (display order)
	ld hl, .Offsets
	add l
	ld l, a
	adc h
	sub l
	ld h, a
	ld a, [hl]
	ld hl, wTempMonEVs
	add l
	ld l, a
	adc h
	sub l
	ld h, a
	ld a, [hl]
	ret

.Offsets:
	db wTempMonHPEV - wTempMonEVs
	db wTempMonAtkEV - wTempMonEVs
	db wTempMonDefEV - wTempMonEVs
	db wTempMonSpclAtkEV - wTempMonEVs
	db wTempMonSpclDefEV - wTempMonEVs
	db wTempMonSpdEV - wTempMonEVs

StatsScreen_GetDV:
; a = DV of stat a (display order); Sp.Atk and Sp.Def share the Special DV
	ld hl, wTempMonDVs
	ld b, [hl] ; Atk:Def
	inc hl
	ld c, [hl] ; Spd:Spc
	and a
	jr z, .hp
	dec a
	jr z, .high_b ; Attack
	dec a
	jr z, .low_b ; Defense
	cp 3 - 1 + 1
	jr z, .high_c ; Speed
	ld a, c ; Special
	and $f
	ret

.high_b
	ld a, b
	swap a
	and $f
	ret

.low_b
	ld a, b
	and $f
	ret

.high_c
	ld a, c
	swap a
	and $f
	ret

.hp
; HP DV = (Atk & 1) << 3 | (Def & 1) << 2 | (Spd & 1) << 1 | (Spc & 1)
	ld a, b
	and $10 ; Atk & 1
	rrca
	ld d, a ; bit 3
	ld a, b
	and 1
	add a
	add a ; bit 2
	or d
	ld d, a
	ld a, c
	and $10 ; Spd & 1
	swap a
	add a ; bit 1
	or d
	ld d, a
	ld a, c
	and 1
	or d
	ret

StatsScreen_GreatStatHalf:
; c = half of a great stat (STATS_BAR_GREAT_*) at wTempMonLevel for stat a
; (0 = HP), at most 255; b = 36, so a bar is value * 36 / c.
	push af
	xor a
	ldh [hMultiplicand], a
	ld a, HIGH(STATS_BAR_GREAT_CORE)
	ldh [hMultiplicand + 1], a
	ld a, LOW(STATS_BAR_GREAT_CORE)
	ldh [hMultiplicand + 2], a
	ld a, [wTempMonLevel]
	ldh [hMultiplier], a
	call Multiply
	ld a, 100
	ldh [hDivisor], a
	ld b, 4
	call Divide
	ldh a, [hQuotient + 2]
	ld h, a
	ldh a, [hQuotient + 3]
	ld l, a
	pop af
	ld bc, 5
	and a
	jr nz, .got_bonus
	ld a, [wTempMonLevel] ; HP: + level + 10
	add 10
	ld c, a
	adc b
	sub c
	ld b, a
.got_bonus
	add hl, bc
	srl h
	rr l
	ld c, l
	ld a, h
	and a
	jr z, .ok
	ld c, $ff
.ok
	ld b, STATS_BAR_PIXELS / 2
	ret

StatsScreen_PrintValueAndBar:
; At hl (column 5 of a stat row): print value de, then a bar of de * b / c
; pixels at column 9.
	push bc
	push de
	push hl
	ld hl, wStringBuffer2
	ld a, d
	ld [hli], a
	ld [hl], e
	pop hl
	push hl
	ld de, wStringBuffer2
	lb bc, 2, 3
	call PrintNum
	pop hl
	ld de, 4
	add hl, de
	pop de
	pop bc
	; fallthrough

StatsScreen_DrawBar:
; Draw a bar at hl (its left cap): de * b / c pixels out of STATS_BAR_PIXELS.
	push hl
	xor a
	ldh [hMultiplicand], a
	ld a, d
	ldh [hMultiplicand + 1], a
	ld a, e
	ldh [hMultiplicand + 2], a
	ld a, b
	ldh [hMultiplier], a
	call Multiply
	ld a, c
	ldh [hDivisor], a
	ld b, 4
	call Divide
	ldh a, [hQuotient + 1]
	ld b, a
	ldh a, [hQuotient + 2]
	or b
	jr nz, .full
	ldh a, [hQuotient + 3]
	cp STATS_BAR_PIXELS
	jr c, .got_pixels
.full
	ld a, STATS_BAR_PIXELS
.got_pixels
	ld b, a
	pop hl
	ld [hl], $40 ; left exp bar end cap
	inc hl
	ld c, 9
.loop
	ld a, b
	cp TILE_WIDTH
	jr c, .partial
	sub TILE_WIDTH
	ld b, a
	ld a, $6a ; full bar
	jr .place
.partial
	and a
	ld a, $62 ; empty bar
	jr z, .place
	ld a, b
	add $54 ; 1-7 pixels (filled from the right; X-flipped below)
	ld b, 0
.place
	ld [hli], a
	dec c
	jr nz, .loop
	ld [hl], $41 ; right exp bar end cap
	ld de, wAttrmap - wTilemap - 9
	add hl, de
	ld b, 9
.flip
	set OAM_X_FLIP, [hl]
	inc hl
	dec b
	jr nz, .flip
	ret

StatsScreen_GetHiddenPower:
; a = Hidden Power's type and d = its power for wTempMon's DVs
; (the same math as HiddenPowerDamage).
	ld hl, wTempMonDVs

; Power: the top bit of each DV
	; Attack
	ld a, [hl]
	swap a
	and %1000

	; Defense
	ld b, a
	ld a, [hli]
	and %1000
	srl a
	or b

	; Speed
	ld b, a
	ld a, [hl]
	swap a
	and %1000
	srl a
	srl a
	or b

	; Special
	ld b, a
	ld a, [hl]
	and %1000
	rrca
	rrca
	rrca
	and %00011111
	or b

; Multiply by 5
	ld b, a
	add a
	add a
	add b

; Add Special & 3
	ld b, a
	ld a, [hld]
	and %0011
	add b

; Divide by 2 and add 30 + 1
	srl a
	add 30
	inc a
	ld d, a

; Type: (Atk & 3) << 2 | Def & 3, skipping Normal, Bird and the unused types
	ld a, [hl]
	and %0011
	ld b, a
	ld a, [hl]
	and %0011 << 4
	swap a
	add a
	add a
	or b
	inc a
	cp BIRD
	ret c
	inc a
	cp UNUSED_TYPES
	ret c
	add UNUSED_TYPES_END - UNUSED_TYPES
	ret

; Orange page

LoadOrangePage:
	ld hl, wTempMon
	farcall GetMonAbility
	ld [wTempAbility], a

; Label a hidden ability as one, unless the species has none (ability 1 is used then).
	ld de, AbilityNameString
	jr c, .got_label
	farcall GetMonAbilitySlot
	cp ABILITY_SLOT_HIDDEN
	jr nz, .got_label
	ld de, HiddenAbilityNameString
.got_label
	hlcoord 1, 8
	rst PlaceString
	call PrintAbility

	hlcoord 0, 13
	ld bc, SCREEN_WIDTH
	ld a, $62 ; horizontal divider (empty HP/exp bar)
	rst ByteFill

; OT/ name and caught gender
	ld de, .OTStr
	hlcoord 1, 14
	rst PlaceString
	call StatsScreen_GetOTName
	hlcoord 4, 14
	rst PlaceString
	ld a, [wTempMonCaughtGender]
	and a
	jr z, .no_gender
	cp LANDMARK_EVENT
	jr z, .no_gender
	and CAUGHT_GENDER_MASK
	ld a, "♂"
	jr z, .got_gender
	ld a, "♀"
.got_gender
	hlcoord 12, 14
	ld [hl], a
.no_gender

; ID№.
	ld de, .IDNoStr
	hlcoord 1, 15
	rst PlaceString
	hlcoord 4, 15
	lb bc, PRINTNUM_LEADINGZEROS | 2, 5
	ld de, wTempMonID
	call PrintNum

; Met/ level and time (the place is left out until the caught data is fixed:
; landmarks above $7d don't fit its 7-bit location, see stats-screen.md)
	ld de, .MetStr
	hlcoord 1, 16
	rst PlaceString
	ld a, [wTempMonCaughtLevel]
	and CAUGHT_LEVEL_MASK
	jr nz, .met
	; no level: a gift, an event mon or no data (old saves, trades)
	ld a, [wTempMonCaughtLocation]
	and CAUGHT_LOCATION_MASK
	ld de, .GiftStr
	cp LANDMARK_GIFT
	jr z, .place_met
	ld de, .EventStr
	cp LANDMARK_EVENT
	jr z, .place_met
	ld de, .UnknownStr
.place_met
	hlcoord 5, 16
	rst PlaceString
	ret

.met
	cp CAUGHT_EGG_LEVEL
	jr nz, .level
	ld de, .HatchedStr
	hlcoord 5, 16
	rst PlaceString
	hlcoord 13, 16
	jr .time

.level
	ld [wStringBuffer2], a
	ld de, .LvStr
	hlcoord 5, 16
	rst PlaceString
	hlcoord 8, 16
	lb bc, PRINTNUM_LEFTALIGN | 1, 2
	ld de, wStringBuffer2
	call PrintNum
	hlcoord 11, 16
.time
	ld a, [wTempMonCaughtTime]
	and CAUGHT_TIME_MASK
	ret z ; evening isn't stored (it wraps to 0)
	rlca
	rlca
	dec a
	push hl
	ld hl, .TimeStrings
	add a
	add l
	ld l, a
	adc h
	sub l
	ld h, a
	ld a, [hli]
	ld d, [hl]
	ld e, a
	pop hl
	rst PlaceString
	ret

.TimeStrings:
	dw .MorningStr
	dw .DayStr
	dw .NightStr

.OTStr:
	db "OT/@"

.IDNoStr:
	db "<ID>№.@"

.MetStr:
	db "Met/@"

.LvStr:
	db "Lv.@"

.HatchedStr:
	db "Hatched@"

.GiftStr:
	db "Gift@"

.EventStr:
	db "Event@"

.UnknownStr:
	db "Unknown@"

.MorningStr:
	db "Morning@"

.DayStr:
	db "Day@"

.NightStr:
	db "Night@"

AbilityNameString:
	db "Ability:@"

HiddenAbilityNameString:
	db "Hidden Ability:@"

StatsScreen_GetOTName:
; de = wStringBuffer1 = the OT's name
	ld hl, .OTNamePointers
	ld a, [wMonType]
	add a
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wMonType]
	cp BUFFERMON
	jr z, .got_name
	ld a, [wCurPartyMon]
	call SkipNames
.got_name
	ld de, wStringBuffer1
	ld bc, MON_NAME_LENGTH
	push de
	rst CopyBytes
	pop de
	farcall CorrectNickErrors
	ld de, wStringBuffer1
	ret

.OTNamePointers:
	dw wPartyMonOTs
	dw wOTPartyMonOTs
	dw wBufferMonOT ; unused
	dw wBufferMonOT ; unused
	dw wBufferMonOT ; unused
	dw wBufferMonOT


; Green page sub-page (A): a cursor on the moves, the highlighted move's
; details in the top half instead of the picture. Party Pokémon outside battle
; can reorder their moves (A, A); elsewhere it's view-only. B leaves.
; The type icons stay on the move rows (all 8 icon slots are in use there).

DEF wMovesSubpageCursor EQUS "wStringBuffer4"     ; 0-3
DEF wMovesSubpageMark   EQUS "wStringBuffer4 + 1" ; 0 = none, else move + 1

StatsScreen_MovesSubpage:
	ld a, [wTempMonMoves]
	and a
	ret z
	xor a
	ld [wMovesSubpageCursor], a
	ld [wMovesSubpageMark], a
	; an animated picture's cells can use VRAM bank 1; the text needs bank 0
	ld a, [wAttrmap]
	and ~VRAM_BANK_1
	call .SetPicAttr
	call PlayClickSFX
.redraw
	call .Draw
.loop
	call DelayFrame
	call GetJoypad
	ldh a, [hJoyPressed]
	bit B_BUTTON_F, a
	jr nz, .b_button
	bit A_BUTTON_F, a
	jr nz, .a_button
	bit D_UP_F, a
	jr nz, .d_up
	bit D_DOWN_F, a
	jr z, .loop
	call .NumMoves
	ld b, a
	ld a, [wMovesSubpageCursor]
	inc a
	cp b
	jr nc, .loop
	ld [wMovesSubpageCursor], a
	jr .redraw

.d_up
	ld a, [wMovesSubpageCursor]
	and a
	jr z, .loop
	dec a
	ld [wMovesSubpageCursor], a
	jr .redraw

.b_button
	call PlayClickSFX
	ld a, [wMovesSubpageMark]
	and a
	jr z, .exit
.unmark
	xor a
	ld [wMovesSubpageMark], a
	jr .redraw

.a_button
	call .CanSwap
	jr nc, .loop
	call PlayClickSFX
	ld a, [wMovesSubpageCursor]
	inc a
	ld b, a
	ld a, [wMovesSubpageMark]
	and a
	jr nz, .swap
	ld a, b
	ld [wMovesSubpageMark], a
	jr .redraw

.swap
	cp b
	jr z, .unmark
	ld hl, wPartyMon1Moves
	ld bc, PARTYMON_STRUCT_LENGTH
	ld a, [wCurPartyMon]
	rst AddNTimes
	push hl
	call .SwapAt
	pop hl
	ld bc, wPartyMon1PP - wPartyMon1Moves
	add hl, bc
	call .SwapAt
	ld hl, wTempMonMoves
	call .SwapAt
	ld hl, wTempMonPP
	call .SwapAt
	xor a
	ld [wMovesSubpageMark], a
	ld de, SFX_SWITCH_POKEMON
	call PlaySFX
	call WaitSFX
	ld de, SFX_SWITCH_POKEMON
	call PlaySFX
	call WaitSFX
	; redraw the move list and its icons
	farcall HideTypeIcons
	hlcoord 0, 8
	lb bc, 10, SCREEN_WIDTH
	call ClearBox
	farcall LoadGreenPage
	call .Draw
	call StatsScreen_PlaceTypeIconsFar
	jmp .loop

.exit
; put the top half back (StatsScreen_JoypadAction then reloads the page)
	xor a
	ld [wMovesSubpageMark], a
	ldh [hBGMapMode], a
	hlcoord 0, 0
	lb bc, 7, SCREEN_WIDTH
	call ClearBox
	farcall StatsScreen_InitUpperHalfText ; the colors haven't changed
	; the picture as StatsScreen_PlaceFrontpic places it, without the cry
	; (animated pictures set their own VRAM bank attributes)
	ld hl, wTempMonDVs
	predef GetUnownLetter
	farcall StatsScreen_GetAnimationParam
	jr c, .animated
	farcall StatsScreen_PlaceFrontpic.AnimateMon
	jr .placed
.animated
	farcall StatsScreen_PlaceFrontpic.AnimateEgg
.placed
	farjp HDMATransferAttrmapAndTilemapToWRAMBank3

.SetPicAttr:
; attribute a for the picture's 7x7 cells
	hlcoord 0, 0, wAttrmap
	ld c, 7
.attr_row
	ld b, 7
.attr_col
	ld [hli], a
	dec b
	jr nz, .attr_col
	ld de, SCREEN_WIDTH - 7
	add hl, de
	dec c
	jr nz, .attr_row
	ret

.Draw:
	xor a
	ldh [hBGMapMode], a
	hlcoord 0, 0
	lb bc, 7, SCREEN_WIDTH
	call ClearBox
	call .Cursors
	call .Details
	farjp HDMATransferAttrmapAndTilemapToWRAMBank3

.CanSwap:
; carry if the moves can be reordered: a party Pokémon, outside battle
	ld a, [wBattleMode]
	and a
	ret nz
	ld a, [wMonType]
	and a ; PARTYMON
	ret nz
	scf
	ret

.NumMoves:
	ld hl, wTempMonMoves
	ld b, 0
.count
	ld a, [hli]
	and a
	jr z, .counted
	inc b
	ld a, b
	cp NUM_MOVES
	jr c, .count
.counted
	ld a, b
	ret

.CurMove:
; a = the highlighted move
	ld a, [wMovesSubpageCursor]
	ld hl, wTempMonMoves
	add l
	ld l, a
	adc h
	sub l
	ld h, a
	ld a, [hl]
	ret

.SwapAt:
; swap [hl + cursor] and [hl + mark - 1]
	ld a, [wMovesSubpageCursor]
	add l
	ld e, a
	adc h
	sub e
	ld d, a
	ld a, [wMovesSubpageMark]
	dec a
	add l
	ld l, a
	adc h
	sub l
	ld h, a
	ld a, [de]
	ld b, [hl]
	ld [hl], a
	ld a, b
	ld [de], a
	ret

.Cursors:
; ▶ on the highlighted move, ▷ on the marked one (column 0 of rows 10-16)
	hlcoord 0, 10
	ld bc, SCREEN_WIDTH * 2
	ld d, 0
.cursor_loop
	ld e, " "
	ld a, [wMovesSubpageMark]
	dec a
	cp d
	jr nz, .not_marked
	ld e, "▷"
.not_marked
	ld a, [wMovesSubpageCursor]
	cp d
	jr nz, .place_cursor
	ld e, "▶"
.place_cursor
	ld [hl], e
	add hl, bc
	inc d
	ld a, d
	cp NUM_MOVES
	jr nz, .cursor_loop
	ret

.Details:
; name (row 0), Pow/ and Acc/ (row 2), Eff/ (row 3), description (rows 5-6)
	call .CurMove
	ld [wNamedObjectIndex], a
	ld [wCurSpecies], a ; for PrintMoveDescription
	call GetMoveName
	hlcoord 1, 0
	rst PlaceString
	ld de, .PowStr
	hlcoord 1, 2
	rst PlaceString
	ld de, .AccStr
	hlcoord 10, 2
	rst PlaceString
	ld de, .EffStr
	hlcoord 1, 3
	rst PlaceString

	call .CurMove
	ld l, a
	ld a, MOVE_EFFECT
	call GetMoveAttribute
	cp EFFECT_HIDDEN_POWER
	jr nz, .base_power
	call StatsScreen_GetHiddenPower
	ld a, d
	jr .got_power
.base_power
	call .CurMove
	ld l, a
	ld a, MOVE_POWER
	call GetMoveAttribute
.got_power
	hlcoord 5, 2
	ld c, 2 ; 0 and 1 (no or variable power) show "---"
	call .NumberOrDashes

	call .CurMove
	ld l, a
	ld a, MOVE_ACC
	call GetMoveAttribute
	farcall ConvertPercentages
	hlcoord 14, 2
	ld c, 0
	call .NumberOrDashes

	call .CurMove
	ld l, a
	ld a, MOVE_CHANCE
	call GetMoveAttribute
	and a
	jr z, .no_chance
	farcall ConvertPercentages
.no_chance
	hlcoord 5, 3
	ld c, 1
	call .NumberOrDashes

	; the description's second line lands on row 7 (the divider): blank the
	; row, print, then move the line up to row 6 and put the divider back
	hlcoord 0, 7
	ld bc, SCREEN_WIDTH
	ld a, " "
	rst ByteFill
	hlcoord 1, 5
	predef PrintMoveDescription
	hlcoord 0, 7
	decoord 0, 6
	ld bc, SCREEN_WIDTH
	rst CopyBytes
	hlcoord 0, 7
	ld bc, SCREEN_WIDTH
	ld a, $62 ; horizontal divider (empty HP/exp bar)
	rst ByteFill
	ret

.NumberOrDashes:
; at hl: a as 3 digits, or "---" if a < c
	cp c
	jr c, .dashes
	ld [wStringBuffer2], a
	ld de, wStringBuffer2
	lb bc, 1, 3
	jmp PrintNum
.dashes
	ld de, .DashesStr
	rst PlaceString
	ret

.PowStr:
	db "Pow/@"

.AccStr:
	db "Acc/@"

.EffStr:
	db "Eff/@"

.DashesStr:
	db "---@"

INCLUDE "engine/pokemon/print_abilities.asm"
