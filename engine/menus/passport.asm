; Trainer Passport: full-screen pages opened from the Start menu.
; Left/Right (or A) change pages, B or Start closes.
; Each page is a list of elements (Passport_RunElements).

	const_def
	const PASSPORTPAGE_LEAGUES    ; 0
	const PASSPORTPAGE_FACILITIES ; 1
	const PASSPORTPAGE_RESORT     ; 2
	const PASSPORTPAGE_TITLE      ; 3 shown once the player is World Cup Champion
	const PASSPORTPAGE_STATS      ; 4
DEF NUM_PASSPORT_PAGES EQU const_value

; tiles in vTiles2 (gfx/passport/passport.png)
DEF PT_BORDER      EQU $00
DEF PT_STAR        EQU $01 ; 2x2
DEF PT_TROPHY      EQU $05 ; 2x2
DEF PT_DIVIDER     EQU $09
DEF PT_BADGE       EQU $0a ; 2x2
DEF PT_MEDAL       EQU $0e ; 2x2
DEF PT_NONE        EQU $ff ; draw nothing
DEF NUM_PASSPORT_TILES EQU $12

; BG palettes (PassportPalettes)
	const_def
	const PASSPORTPAL_FRAME      ; 0 border and text
	const PASSPORTPAL_GOLD       ; 1 rematch star, trophy, gold medal
	const PASSPORTPAL_GRAY       ; 2 trophy not won
	const PASSPORTPAL_SILVER     ; 3 League star, silver medal
	const PASSPORTPAL_BADGE      ; 4 badge icon, bronze medal
DEF NUM_PASSPORT_PALS EQU const_value

; page elements
	const_def
	const PE_TEXT     ; coord, string
	const PE_FLAG     ; coord, flag, tile/attr if set, tile/attr if not (PT_NONE: nothing), size (1 or 2)
	const PE_BADGES   ; coord, badge flags address (8 badges)
	const PE_NUM      ; coord, save extension address, PrintNum bytes, digits
	const PE_TILE     ; coord, tile, attr, size (1 or 2)
	const PE_FLAGTEXT ; coord, flag, string if set, string if not (0: nothing)
	const PE_IFCALL   ; unused coord, routine, bytes to skip and rows to move up if it returns z
	const PE_IFFLAG   ; unused coord, flag, bytes to skip and rows to move up if not set
	const PE_IFBADGES ; unused coord, badge flags address, bytes to skip and rows to move up if no badges
	const PE_BITICON  ; coord, save extension address, bit mask, first tile, attr: a 2x2 icon if any bit is set
DEF PE_END EQU -1

MACRO pe_text ; x, y, string
	db PE_TEXT
	dwcoord \1, \2
	dw \3
ENDM

MACRO pe_icon ; x, y, flag, first tile, palette: a 2x2 icon if set, nothing if not
	db PE_FLAG
	dwcoord \1, \2
	dw \3
	db \4, \5, PT_NONE, 0, 2
ENDM

MACRO pe_star ; x, y, flag, palette
	pe_icon \1, \2, \3, PT_STAR, \4
ENDM

MACRO pe_trophy ; x, y, flag
	db PE_FLAG
	dwcoord \1, \2
	dw \3
	db PT_TROPHY, PASSPORTPAL_GOLD, PT_TROPHY, PASSPORTPAL_GRAY, 2
ENDM

MACRO pe_badges ; x, y, badge flags address
	db PE_BADGES
	dwcoord \1, \2
	dw \3
ENDM

MACRO pe_num ; x, y, address, bytes, digits
	db PE_NUM
	dwcoord \1, \2
	dw \3
	db \4, \5
ENDM

MACRO pe_tile ; x, y, tile, attr
	db PE_TILE
	dwcoord \1, \2
	db \3, \4, 1
ENDM

MACRO pe_tile2x2 ; x, y, first tile, attr
	db PE_TILE
	dwcoord \1, \2
	db \3, \4, 2
ENDM

MACRO pe_flagtext ; x, y, flag, string if set, string if not
	db PE_FLAGTEXT
	dwcoord \1, \2
	dw \3, \4, \5
ENDM

MACRO pe_facilities ; y, name, intro flag, hall flag, hard flag, hall town, hard town
; a medal for the highest level cleared: bronze intro, silver hall, gold hard;
; hidden, with the regions below moved up, until the intro is cleared
	db PE_IFFLAG
	dwcoord 0, 0
	dw \3
	db .end\@ - .start\@, 4
.start\@
	pe_text   2, \1, \2
	pe_icon  15, \1, \3, PT_MEDAL, PASSPORTPAL_BADGE
	pe_icon  15, \1, \4, PT_MEDAL, PASSPORTPAL_SILVER
	pe_icon  15, \1, \5, PT_MEDAL, PASSPORTPAL_GOLD
	pe_text   3, \1 + 2, \6
	pe_flagtext 3, \1 + 2, \4, \7, 0
	pe_flagtext 3, \1 + 2, \5, PassportAllClearText, 0
.end\@
ENDM

MACRO pe_biticon ; x, y, save extension address, bit mask, first tile, attr
	db PE_BITICON
	dwcoord \1, \2
	dw \3
	db \4, \5, \6
ENDM

MACRO pe_hall ; y, name, best streak address, current streak address, state address, 7-win bit, 49-win bit
; a Battle Resort hall: name, a silver medal for the first 7-win streak and
; gold for the first 49-win streak, its best and current streaks
	pe_text     2, \1, \2
	pe_biticon 15, \1, \5, 1 << \6, PT_MEDAL, PASSPORTPAL_SILVER
	pe_biticon 15, \1, \5, 1 << \7, PT_MEDAL, PASSPORTPAL_GOLD
	pe_text     3, \1 + 1, PassportBestText
	pe_num      9, \1 + 1, \3, 2, 5
	pe_text     3, \1 + 2, PassportCurrentText
	pe_num      9, \1 + 2, \4, 2, 5
ENDM

MACRO pe_league ; y, name, badge flags address, cleared flag, rematch flag
; a silver star once the League is beaten, gold once its rematch is
; hidden, with the regions below moved up, until the region's first badge
	db PE_IFBADGES
	dwcoord 0, 0
	dw \3
	db .end\@ - .start\@, 4
.start\@
	pe_text   2, \1, \2
	pe_tile2x2 9, \1, PT_BADGE, PASSPORTPAL_BADGE
	pe_badges 11, \1 + 1, \3
	pe_star  15, \1, \4, PASSPORTPAL_SILVER
	pe_star  15, \1, \5, PASSPORTPAL_GOLD
.end\@
ENDM

Passport::
	ld a, [wStateFlags]
	push af
	xor a
	ld [wStateFlags], a
	ld hl, wOptions
	ld a, [hl]
	push af
	set NO_TEXT_SCROLL, [hl]

	call ClearBGPalettes
	call ClearSprites
	call ClearTilemap
	call DisableLCD
	ld hl, PassportGFX
	ld de, vTiles2
	ld bc, NUM_PASSPORT_TILES tiles
	ld a, BANK(PassportGFX)
	call FarCopyBytes
	call EnableLCD
	call Passport_LoadPalettes

	xor a
	ld [wJumptableIndex], a
	call Passport_DrawPage

.loop
	call JoyTextDelay
	ldh a, [hJoyLast]
	ld b, a
	and B_BUTTON | START
	jr nz, .quit
	ld a, b
	and D_LEFT
	jr nz, .left
	ld a, b
	and D_RIGHT | A_BUTTON
	jr nz, .right
	call DelayFrame
	jr .loop

.left
	ld a, [wJumptableIndex]
	ld b, a
.left_loop
	ld a, b
	and a
	jr nz, .previous
	ld b, NUM_PASSPORT_PAGES
.previous
	dec b
	ld a, b
	call Passport_PageVisible
	jr z, .left_loop
	ld a, b
	jr .turn

.right
	ld a, [wJumptableIndex]
	ld b, a
.right_loop
	inc b
	ld a, b
	cp NUM_PASSPORT_PAGES
	jr c, .check
	ld b, 0
.check
	ld a, b
	call Passport_PageVisible
	jr z, .right_loop
	ld a, b
.turn
	ld [wJumptableIndex], a
	ld de, SFX_MENU
	call PlaySFX
	call Passport_DrawPage
	jr .loop

.quit
	pop af
	ld [wOptions], a
	pop af
	ld [wStateFlags], a
	ret

Passport_LoadPalettes:
	ld hl, PassportPalettes
	ld de, wBGPals1
	ld bc, NUM_PASSPORT_PALS palettes
	ld a, BANK(wBGPals1)
	call FarCopyWRAM
	ld hl, PassportPalettes
	ld de, wBGPals2
	ld bc, NUM_PASSPORT_PALS palettes
	ld a, BANK(wBGPals2)
	call FarCopyWRAM
	ld a, TRUE
	ldh [hCGBPalUpdate], a
	ret

PassportPalettes:
; entries correspond to PASSPORTPAL_* constants
	RGB 31, 31, 31,  18, 24, 31,  04, 08, 20,  00, 00, 00 ; frame
	RGB 31, 31, 31,  31, 28, 08,  28, 16, 00,  12, 06, 00 ; gold
	RGB 31, 31, 31,  26, 26, 26,  18, 18, 18,  10, 10, 10 ; gray
	RGB 31, 31, 31,  27, 29, 31,  16, 18, 23,  05, 06, 10 ; silver
	RGB 31, 31, 31,  29, 21, 12,  19, 11, 04,  00, 00, 00 ; badge

Passport_NuzlockeOn:
; returns nz in Nuzlocke mode
	ld a, [wOptions2]
	and 1 << NUZLOCKE_ON
	ret

Passport_NuzlockeOff:
; returns nz outside Nuzlocke mode
	ld a, [wOptions2]
	cpl
	and 1 << NUZLOCKE_ON
	ret

Passport_PageVisible:
; a = PASSPORTPAGE_*; returns nz if the page is shown. Preserves bc, de, hl.
	cp PASSPORTPAGE_TITLE
	jr z, .title
	or 1
	ret

.title
	push bc
	push de
	push hl
	ld de, EVENT_WORLD_CUP_CHAMPION
	ld b, CHECK_FLAG
	call EventFlagAction
	ld a, c
	pop hl
	pop de
	pop bc
	and a
	ret

Passport_CountPages:
; a = the number of pages shown among the first c. Preserves hl.
	ld b, 0
	ld d, 0
.loop
	ld a, b
	cp c
	jr nc, .done
	call Passport_PageVisible
	jr z, .next
	inc d
.next
	inc b
	jr .loop

.done
	ld a, d
	ret

Passport_DrawPage:
	xor a
	ldh [hBGMapMode], a
	call Passport_DrawFrame
; title tab on the top border
	ld a, [wJumptableIndex]
	ld hl, PassportTitles
	call .GetPointer
	ld d, h
	ld e, l
	hlcoord 1, 0
	rst PlaceString
; page number on the bottom border, counting only the pages shown: " n/N "
	hlcoord 14, SCREEN_HEIGHT - 1
	ld a, " "
	ld [hli], a
	ld a, [wJumptableIndex]
	inc a
	ld c, a
	call Passport_CountPages
	add "0"
	ld [hli], a
	ld a, "/"
	ld [hli], a
	ld c, NUM_PASSPORT_PAGES
	call Passport_CountPages
	add "0"
	ld [hli], a
	ld [hl], " "
; the page's elements
	ld a, [wJumptableIndex]
	ld hl, PassportPages
	call .GetPointer
	xor a
	ld [wPassportRowShift], a
	call Passport_RunElements
	jmp WaitBGMap2

.GetPointer:
; hl = table of words, a = index -> hl = the word
	ld e, a
	ld d, 0
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ret

Passport_DrawFrame:
; border tiles around a blank page, all with the frame palette
	hlcoord 0, 0
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	ld a, " "
	rst ByteFill
	hlcoord 0, 0, wAttrmap
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	ld a, PASSPORTPAL_FRAME
	rst ByteFill
	hlcoord 0, 0
	ld bc, SCREEN_WIDTH
	ld a, PT_BORDER
	rst ByteFill
	hlcoord 0, SCREEN_HEIGHT - 1
	ld bc, SCREEN_WIDTH
	ld a, PT_BORDER
	rst ByteFill
	hlcoord 0, 1
	ld de, SCREEN_WIDTH - 1
	ld c, SCREEN_HEIGHT - 2
.sides
	ld [hl], PT_BORDER
	add hl, de
	ld [hl], PT_BORDER
	inc hl
	dec c
	jr nz, .sides
	ret

Passport_RunElements:
; hl = element list
	ld a, [hli]
	cp PE_END
	ret z
	ld c, a
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a ; de = tilemap address
	ld a, [wPassportRowShift]
	and a
	jr z, .got_coord
	push hl
	ld h, d
	ld l, e
	ld de, -SCREEN_WIDTH
.shift
	add hl, de
	dec a
	jr nz, .shift
	ld d, h
	ld e, l
	pop hl
.got_coord
	ld b, 0
	push hl
	ld hl, .Handlers
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld b, [hl]
	ld c, a
	pop hl
	call .Run
	jr Passport_RunElements

.Run:
	push bc
	ret

.Handlers:
; entries correspond to PE_* constants
	dw Passport_TextElement
	dw Passport_FlagElement
	dw Passport_BadgesElement
	dw Passport_NumElement
	dw Passport_TileElement
	dw Passport_FlagTextElement
	dw Passport_IfCallElement
	dw Passport_IfFlagElement
	dw Passport_IfBadgesElement
	dw Passport_BitIconElement

Passport_IfCallElement:
; the routine returns z: skip the given bytes of elements and move the
; remaining elements up by the given rows
	ld a, [hli]
	ld c, a
	ld a, [hli]
	push hl
	ld h, a
	ld l, c
	call _hl_
	pop hl
	jr z, Passport_HideElements
	inc hl
	inc hl
	ret

Passport_IfFlagElement:
; the flag isn't set: skip the given bytes of elements and move the
; remaining elements up by the given rows
	call Passport_ReadFlag
	jr z, Passport_HideElements
	inc hl
	inc hl
	ret

Passport_BitIconElement:
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ldh a, [rSVBK]
	push af
	ld a, BANK(wPassportStats)
	ldh [rSVBK], a
	ld a, [bc]
	ld b, a
	pop af
	ldh [rSVBK], a
	ld a, [hli] ; mask
	and b
	jr nz, .draw
	inc hl
	inc hl
	ret

.draw
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld c, a
	push hl
	ld h, d
	ld l, e
	ld a, b
	call Passport_Put2x2
	pop hl
	ret

Passport_TowerOpen:
; returns nz if all three hard halls are cleared (the Battle Tower is open)
	ld hl, .Flags
.loop
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	and e
	inc a
	jr z, .open
	push hl
	ld b, CHECK_FLAG
	call EventFlagAction
	pop hl
	ld a, c
	and a
	jr nz, .loop
	ret ; z

.open
	inc a ; nz
	ret

.Flags:
	dw EVENT_FACILITY_HARD_KANTO
	dw EVENT_FACILITY_HARD_JOHTO
	dw EVENT_FACILITY_HARD_HOENN
	dw -1

Passport_TowerClosed:
; returns nz if the Battle Tower isn't open yet
	call Passport_TowerOpen
	ld a, 0
	jr nz, .done
	inc a
.done
	and a
	ret

Passport_IfBadgesElement:
; no badges in the byte at the address: skip the given bytes of elements
; and move the remaining elements up by the given rows
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ld a, [bc]
	and a
	jr z, Passport_HideElements
	inc hl
	inc hl
	ret

Passport_HideElements:
	ld a, [hli]
	ld c, a
	ld b, 0
	ld a, [wPassportRowShift]
	add [hl]
	ld [wPassportRowShift], a
	inc hl
	add hl, bc
	ret

Passport_TextElement:
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
Passport_PlaceStringBC:
; de = tilemap address, bc = string (0: nothing); preserves hl
	ld a, b
	or c
	ret z
	push hl
	ld h, d
	ld l, e
	ld d, b
	ld e, c
	rst PlaceString
	pop hl
	ret

Passport_FlagTextElement:
	call Passport_ReadFlag
	jr z, .not_set
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	inc hl
	inc hl
	jr Passport_PlaceStringBC

.not_set
	inc hl
	inc hl
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	jr Passport_PlaceStringBC

Passport_TileElement:
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld c, a
	ld a, [hli] ; size
	push hl
	ld h, d
	ld l, e
	dec a
	jr nz, .big
	ld [hl], b
	ld a, c
	call Passport_SetAttr
	pop hl
	ret

.big
	ld a, b
	call Passport_Put2x2
	pop hl
	ret

Passport_FlagElement:
	call Passport_ReadFlag
	jr z, .not_set
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	inc hl
	inc hl
	jr .got

.not_set
	inc hl
	inc hl
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
.got
	ld a, c
	cp PT_NONE
	jr nz, .draw
	inc hl
	ret

.draw
	ld a, [hli] ; size
	push hl
	ld h, d
	ld l, e
	dec a
	jr nz, .big
	ld [hl], c
	ld a, b
	call Passport_SetAttr
	pop hl
	ret

.big
	ld a, c
	ld c, b
	call Passport_Put2x2
	pop hl
	ret

Passport_BadgesElement:
; "n/8" for the badge flags byte at the address in the list
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ld a, [bc]
	ld b, 0
.count
	srl a
	jr nc, .next
	inc b
.next
	and a
	jr nz, .count
	ld a, "0"
	add b
	ld [de], a
	inc de
	ld a, "/"
	ld [de], a
	inc de
	ld a, "8"
	ld [de], a
	ret

Passport_NumElement:
	push de
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld c, a
	push hl
	ld hl, sp + 2
	ld a, [hli]
	ld h, [hl]
	ld l, a ; tilemap address
	ldh a, [rSVBK]
	push af
	ld a, BANK(wPassportStats)
	ldh [rSVBK], a
	call PrintNum
	pop af
	ldh [rSVBK], a
	pop hl
	pop de
	ret

Passport_ReadFlag:
; reads the flag at hl (hl += 2); returns nz if set. Preserves de.
	push de
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	push bc
	push hl
	ld b, CHECK_FLAG
	call EventFlagAction
	pop hl
	ld a, c
	pop bc
	pop de
	and a
	ret

Passport_SetAttr:
; hl = tilemap address; writes a to the matching wAttrmap byte. Preserves hl and de.
	push hl
	push de
	ld de, wAttrmap - wTilemap
	add hl, de
	ld [hl], a
	pop de
	pop hl
	ret

Passport_Put2x2:
; hl = top-left in the tilemap, a = first tile, c = attribute
	ld [hli], a
	inc a
	ld [hld], a
	inc a
	ld de, SCREEN_WIDTH
	add hl, de
	ld [hli], a
	inc a
	ld [hl], a
	ld a, c
	call Passport_SetAttr
	dec hl
	call Passport_SetAttr
	ld de, -SCREEN_WIDTH
	add hl, de
	call Passport_SetAttr
	inc hl
	jr Passport_SetAttr

PassportTitles:
; entries correspond to PASSPORTPAGE_* constants
	dw .Leagues
	dw .Facilities
	dw .Resort
	dw .Title
	dw .Stats

.Leagues:    db " Leagues @"
.Facilities: db " Facilities @"
.Resort:     db " Battle Resort @"
.Title:      db " Title Defense @"
.Stats:      db " Stats @"

PassportPages:
; entries correspond to PASSPORTPAGE_* constants
	dw PassportLeaguesPage
	dw PassportFacilitiesPage
	dw PassportResortPage
	dw PassportTitlePage
	dw PassportStatsPage

PassportLeaguesPage:
; World Cup first, once the player is eligible; each later step overwrites
; the previous one
	db PE_IFCALL
	dwcoord 0, 0
	dw CheckWorldCupStarted
	db .wc_end - .wc_start, 3
.wc_start
	pe_text     2, 2, .WorldCup
	pe_text     3, 3, .Eligible
	pe_flagtext 3, 3, EVENT_WORLD_CUP_REGISTERED, .Registered, 0
	pe_flagtext 3, 3, EVENT_WORLD_CUP_QUALIFIED, .Qualified, 0
	pe_flagtext 3, 3, EVENT_WORLD_CUP_CHAMPION, .Champion, 0
	pe_icon    15, 2, EVENT_WORLD_CUP_CHAMPION, PT_TROPHY, PASSPORTPAL_GOLD
.wc_end
; per region: badges, a star for the League
	pe_league  5, PassportJohtoText, wJohtoBadges, EVENT_BEAT_JOHTO_LEAGUE, EVENT_BEAT_JOHTO_LEAGUE_REMATCH
	pe_league  9, PassportKantoText, wKantoBadges, EVENT_BEAT_INDIGO_LEAGUE, EVENT_BEAT_INDIGO_LEAGUE_REMATCH
	pe_league 13, PassportHoennText, wHoennBadges, EVENT_BEAT_HOENN_LEAGUE, EVENT_BEAT_HOENN_LEAGUE_REMATCH
	db PE_END

.WorldCup:   db "World Cup@"
.Eligible:   db "Eligible  @"
.Registered: db "Registered@"
.Qualified:  db "Qualified @"
.Champion:   db "Champion  @"

PassportFacilitiesPage:
; BP first, so hidden regions don't move it
	pe_text  2, 15, PassportBPText
	pe_num  12, 15, wBattlePoints, 2, 5
	pe_facilities  2, PassportJohtoText, EVENT_FACILITY_INTRO_JOHTO, EVENT_FACILITY_HALL_JOHTO, EVENT_FACILITY_HARD_JOHTO, .Goldenrod, .Route40
	pe_facilities  6, PassportKantoText, EVENT_FACILITY_INTRO_KANTO, EVENT_FACILITY_HALL_KANTO, EVENT_FACILITY_HARD_KANTO, .Vermilion, .Saffron
	pe_facilities 10, PassportHoennText, EVENT_FACILITY_INTRO_HOENN, EVENT_FACILITY_HALL_HOENN, EVENT_FACILITY_HARD_HOENN, .Mauville, .Lilycove
	db PE_END

; the next challenge; padded to overwrite each other
.Goldenrod: db "Next: Goldenrod@"
.Route40:   db "Next: Route 40 @"
.Vermilion: db "Next: Vermilion@"
.Saffron:   db "Next: Saffron  @"
.Mauville:  db "Next: Mauville @"
.Lilycove:  db "Next: Lilycove @"

ASSERT BANK(wTowerState) == BANK(wPassportStats) ; read by PE_BITICON

PassportResortPage:
; BP first, so hidden halls don't move it
	pe_text  2, 15, PassportBPText
	pe_num  12, 15, wBattlePoints, 2, 5
; until the Battle Tower opens
	db PE_IFCALL
	dwcoord 0, 0
	dw Passport_TowerClosed
	db .closed_end - .closed_start, 0
.closed_start
	pe_text  2, 2, .Tower
	pe_text  3, 3, .NotOpen
.closed_end
; one hall per block of 4 rows; later Resort halls go below the Tower
	db PE_IFCALL
	dwcoord 0, 0
	dw Passport_TowerOpen
	db .tower_end - .tower_start, 4
.tower_start
	pe_hall 2, .Tower, wTowerBestStreak, wTowerStreak, wTowerState, TOWER_PRIZE7_F, TOWER_PRIZE49_F
.tower_end
	db PE_END

.Tower:   db "Battle Tower@"
.NotOpen: db "Not open yet@"

PassportTitlePage:
; World Cup title defenses (the challenger list joins with the title defenses)
	pe_icon     2, 2, EVENT_WORLD_CUP_CHAMPION, PT_TROPHY, PASSPORTPAL_GOLD
	pe_text     5, 2, .WorldCup
	pe_text     5, 3, .Champion
	pe_text     2, 6, .CupsWon
	pe_num     13, 6, wHallOfFameCounts + LEAGUE_WORLD_CUP, 1, 3
	pe_text     2, 8, .Defenses
	pe_num     11, 8, wTitleDefenses, 2, 5
	db PE_END

.WorldCup: db "World Cup@"
.Champion: db "Champion@"
.CupsWon:  db "Cups won@"
.Defenses: db "Defenses@"

PassportStatsPage:
	pe_text  2, 3, .Battles
	pe_num  13, 3, wPassportStats + PASSPORT_BATTLES * 2, 2, 5
	pe_text  2, 5, .Trainers
	pe_num  13, 5, wPassportStats + PASSPORT_TRAINERS * 2, 2, 5
	pe_text  2, 7, .Caught
	pe_num  13, 7, wPassportStats + PASSPORT_CAUGHT * 2, 2, 5
	pe_text  2, 9, .Shinies
	pe_num  13, 9, wPassportStats + PASSPORT_SHINIES * 2, 2, 5
	pe_text  2, 11, .Eggs
	pe_num  13, 11, wPassportStats + PASSPORT_EGGS * 2, 2, 5
; Fainted, or Fallen in Nuzlocke mode
	db PE_IFCALL
	dwcoord 0, 0
	dw Passport_NuzlockeOff
	db .fainted_end - .fainted_start, 0
.fainted_start
	pe_text  2, 13, .Fainted
	pe_num  13, 13, wPassportStats + PASSPORT_FAINTED * 2, 2, 5
.fainted_end
	db PE_IFCALL
	dwcoord 0, 0
	dw Passport_NuzlockeOn
	db .fallen_end - .fallen_start, 0
.fallen_start
	pe_text  2, 13, .Fallen
	pe_num  13, 13, wPassportFallen, 2, 5
.fallen_end
	pe_text  2, 15, .Steps
	pe_num  11, 15, wPassportSteps, 3, 7
	db PE_END

.Battles:  db "Battles won@"
.Trainers: db "Trainers@"
.Caught:   db "Caught@"
.Shinies:  db "Shinies@"
.Eggs:     db "Hatched@"
.Fainted:  db "Fainted@"
.Fallen:   db "Fallen@"
.Steps:    db "Steps@"

PassportJohtoText: db "Johto@"
PassportKantoText: db "Kanto@"
PassportHoennText: db "Hoenn@"
PassportBPText:    db "BP@"
PassportBestText:    db "Best@"
PassportCurrentText: db "Current@"
PassportAllClearText: db "All cleared!   @"

PassportGFX:      INCBIN "gfx/passport/passport.2bpp"
