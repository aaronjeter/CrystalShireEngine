; The party menu's info popup (Start on a card): the Pokémon's front pic, name, level,
; gender and status, types, ability, held item, HP and EXP bars, and moves with their types
; and PP, on one big card. B closes it; Start opens the stats screen.
;
; It's built in BG map 1 ($9c00) while the cards stay in BG map 0, then shown by switching
; LCDC's BG map and BG tile data ($8000 addressing) in VBlank together with the palettes, so
; it opens and closes at once. Its own tiles go in VRAM bank 0 $8000-$87ff, where the party
; icons' tiles are (kept in WRAM bank 6 and put back after): tiles $00-$30 the front pic,
; $31-$7c the 3x5-font and VWF strips, bars and a navy tile, $7f a blank tile for spaces;
; $80-$ff are the font (names) in bank 0 and the cards' bar row in bank 1, the same with
; either addressing. VRAM $8800-$97ff (the cards' tiles, and in battle its pics) is left
; alone.
; Palettes: 0 the card (its color, its HP color, the background, black), 1 the front pic,
; 2 the EXP row (the card color, blue, the background, black), 6 the bar, 7 text.
; The type icons are sprites (engine/gfx/type_icons.asm); the party icons are hidden.
;
; Layout (tiles): the card on rows 0-14, its top row the cards' bottom row flipped and its
; right edge their left edge flipped; front pic at (1, 1); name (9, 1); level, gender and
; status (9, 2); type icons (9, 3); "ABILITY" (9, 4) and the ability (9, 5); "ITEM" (9, 6)
; and the item (9, 7); HP row (1, 8); EXP row (1, 9); moves on rows 10-13: type icon
; (1), name (5), PP (17-19).

DEF PI_T_INFO   EQU $31 ; level, gender, status (6 tiles)
DEF PI_T_ABL    EQU $37 ; "ABILITY" (4)
DEF PI_T_ABN    EQU $3b ; the ability (10)
DEF PI_T_ITL    EQU $45 ; "ITEM" (2)
DEF PI_T_ITN    EQU $47 ; the item (10)
DEF PI_T_HP     EQU $51 ; the HP row (14)
DEF PI_T_EXP    EQU $5f ; the EXP row (17)
DEF PI_T_PP     EQU $70 ; the PP column, 4 rows of 3
DEF PI_T_EDGE   EQU $7c ; the card's left edge, bottom left corner, bottom edge
DEF PI_T_BLANK  EQU " " ; color 0: the card, spaces, navy in the bar
	assert PI_T_PP + 12 == PI_T_EDGE
	assert PI_T_EDGE + 3 == PI_T_BLANK

DEF PI_LCDC     EQU (1 << rLCDC_BG_TILEMAP) | (1 << rLCDC_TILE_DATA)

; the party icons' tiles while the popup is shown: the first PI_ICON_TILES_A in sScratch
; after the padded front pic (which loading the popup's pic uses), the rest after the VWF
; strip in PC_STAGE (WRAM bank 6 below $d800 is the pic's decompression buffer)
DEF PI_SCRATCH      EQU $a000 ; sScratch
DEF PI_ICON_TILES   EQU 6 * 11
DEF PI_ICON_SAVE_A  EQU PI_SCRATCH + $320
DEF PI_ICON_TILES_A EQU (PI_SCRATCH + $60 tiles - PI_ICON_SAVE_A) / 16
DEF PI_ICON_SAVE_B  EQU PC_STAGE + SCREEN_WIDTH tiles
DEF PI_ICON_TILES_B EQU PI_ICON_TILES - PI_ICON_TILES_A
	assert PI_SCRATCH == sScratch
	assert PI_ICON_SAVE_A >= sPaddedEnemyFrontPic + 7 * 7 tiles
	assert PI_ICON_SAVE_B + PI_ICON_TILES_B tiles <= PC_SAVE

DEF PI_BAR_X    EQU 16 ; bar outline in the HP/EXP rows, 60 pixels inside
DEF PI_NUM_X    EQU 80 ; the numbers after the bars

; the popup's data in PC_DATA (after the cards' own)
rsset PCS_STATE + PARTY_LENGTH
DEF PCI_ABILITY rb 17
DEF PCI_EXPNEXT rb 3 ; big endian
DEF PCI_EXPPX   rb
DEF PCI_NMOVES  rb
DEF PCI_PP      rb 2 * NUM_MOVES ; current, max
DEF PCI_TYPES   rb 2
DEF PCI_STRIP   rb 12 ; the PP text being drawn
	assert _RS <= $100

PartyCardsInfo:
; Start on card [wMenuCursorY]: show the popup until B (back to the cards) or Start (the
; stats screen, then the party menu again).
	ld a, [wMenuCursorY]
	call PartyCards_IsCancel
	ret z
	ld a, [wMenuCursorY]
	dec a
	ld e, a
	ld d, 0
	ld hl, wPartySpecies
	add hl, de
	ld a, [hl]
	cp EGG
	ret z
	ld de, SFX_READ_TEXT_2
	call PlaySFX
	call PartyInfo_Show
.loop
	call DelayFrame
	call JoyTextDelay
	ldh a, [hJoyLast]
	bit B_BUTTON_F, a
	jr nz, .close
	bit START_F, a
	jr nz, .stats
	jr .loop

.close
	ld de, SFX_READ_TEXT_2
	call PlaySFX
	jmp PartyInfo_Hide

.stats
	call PartyInfo_Hide
	ld a, [wMenuCursorY]
	dec a
	ld [wCurPartyMon], a
	ld e, a
	ld d, 0
	ld hl, wPartySpecies
	add hl, de
	ld a, [hl]
	ld [wCurPartySpecies], a
	call PartyCards_HasCancel
	push af
	ld a, [wBattleMode]
	and a
	jr nz, .battle_stats
	farcall OpenPartyStats
	jr .stats_done
.battle_stats
	farcall Battle_StatsScreen ; (keeps the battle's pics)
.stats_done
	; the party menu again, as when it opens
	call ClearBGPalettes
	ld a, [wMenuCursorY]
	ld [wPartyMenuCursor], a
	farcall LoadPartyMenuGFX
	pop af
	jr z, .no_cancel
	farcall InitPartyMenuWithCancel
	jr .menu
.no_cancel
	farcall InitPartyMenuNoCancel
.menu
	farcall InitPartyMenuGFX
	call DrawPartyCards
	call DrawPartyMenuBar
	call WaitBGMap
	call SetDefaultBGPAndOBP
	jmp PartyCardsUpdatePals

PartyInfo_Show:
	xor a
	ldh [hBGMapMode], a
	; the party icons go now: their tiles are about to be the popup's
	call HideSprites
	call DelayFrame
	call PartyInfo_SaveIconTiles
	; keep what gathering clobbers
	ld a, [wCurPartyMon]
	push af
	ld a, [wCurPartySpecies]
	push af
	ld a, [wCurSpecies]
	push af
	ld a, [wMonType]
	push af
	ld a, [wNamedObjectIndex]
	push af
	ld a, [wMenuCursorY]
	push af
	ld de, wCurBaseData
	ld hl, PC_SAVE
	ld c, BASE_DATA_SIZE
	call PartyCards_CopyTo6

	pop af
	push af
	dec a
	call PartyCards_Gather
	call PartyInfo_Gather
	call PartyInfo_Render
	call PartyInfo_BuildMap

	ld hl, PC_SAVE
	ld de, wCurBaseData
	ld c, BASE_DATA_SIZE
	call PartyCards_CopyFrom6
	pop af
	ld [wMenuCursorY], a
	pop af
	ld [wNamedObjectIndex], a
	pop af
	ld [wMonType], a
	pop af
	ld [wCurSpecies], a
	pop af
	ld [wCurPartySpecies], a
	pop af
	ld [wCurPartyMon], a

	; show it (the bar empty), then the type icons and the bar's hints
	ld a, PI_LCDC
	call PartyInfo_SwitchMap
	call PartyInfo_TypeIcons
	ldh a, [rSVBK]
	push af
	ld a, PC_WRAM
	ldh [rSVBK], a
	call PartyInfo_DrawBar
	pop af
	ldh [rSVBK], a
	scf
	jr PartyInfo_BarRow

PartyInfo_Hide:
; Back to the cards: the popup's bar emptied while the cards' bar is drawn again, then their
; map, tiles and palettes, then the icons' tiles and the icons.
	farcall HideTypeIcons
	and a
	call PartyInfo_BarRow
	call DrawPartyMenuBar
	call PartyCardsUpdatePals
	xor a
	call PartyInfo_SwitchMap
	ld a, TRUE
	ldh [hCGBPalUpdate], a ; (the icons' OBJ palettes)
	ld a, BANK(sScratch)
	call OpenSRAM
	xor a
	ld de, PI_ICON_SAVE_A
	ld c, PI_ICON_TILES_A
	call PC_Transfer0
	call CloseSRAM
	ldh a, [rSVBK]
	push af
	ld a, PC_WRAM
	ldh [rSVBK], a
	ld a, PI_ICON_TILES_A
	ld de, PI_ICON_SAVE_B
	ld c, PI_ICON_TILES_B
	call PC_Transfer0
	pop af
	ldh [rSVBK], a
	farjp PlaySpriteAnimations

PartyInfo_SaveIconTiles:
; VRAM bank 0 tiles $00-$41 (the party icons) to PI_ICON_SAVE_A and _B, read while VRAM
; isn't locked.
	xor a
	ldh [rVBK], a
	ld a, BANK(sScratch)
	call OpenSRAM
	ld hl, vTiles0
	ld de, PI_ICON_SAVE_A
	ld bc, PI_ICON_TILES_A tiles
	call .Copy
	call CloseSRAM
	ldh a, [rSVBK]
	push af
	ld a, PC_WRAM
	ldh [rSVBK], a
	ld hl, vTiles0 tile PI_ICON_TILES_A
	ld de, PI_ICON_SAVE_B
	ld bc, PI_ICON_TILES_B tiles
	call .Copy
	pop af
	ldh [rSVBK], a
	ret

.Copy:
.loop
	ldh a, [rSTAT]
	and %10 ; modes 2 and 3 (wait out mode 3, when VRAM is locked)
	jr nz, .loop
	ld a, [hli]
	ld [de], a
	inc de
	dec bc
	ld a, b
	or c
	jr nz, .loop
	ret

PartyInfo_BarRow:
; In VBlank, BG map 1's middle bar row: carry, the bar's text tiles (VRAM bank 1); no carry,
; navy (VRAM bank 0).
	ld bc, (PCT_BAR_MID << 8) | (VRAM_BANK_1 | 6)
	jr c, .got
	ld bc, (PI_T_BLANK << 8) | 6
.got
	di
.wait
	ldh a, [rLY]
	cp LY_VBLANK
	jr nz, .wait
	ld hl, vBGMap1 + (PC_BAR_Y + 1) * BG_MAP_WIDTH
	ld e, SCREEN_WIDTH
	ld a, b
.tiles
	ld [hli], a
	cp PI_T_BLANK
	jr z, .same
	inc a
.same
	dec e
	jr nz, .tiles
	ld a, 1
	ldh [rVBK], a
	ld hl, vBGMap1 + (PC_BAR_Y + 1) * BG_MAP_WIDTH
	ld e, SCREEN_WIDTH
	ld a, c
.attrs
	ld [hli], a
	dec e
	jr nz, .attrs
	xor a
	ldh [rVBK], a
	reti

PartyInfo_SwitchMap:
; In VBlank: LCDC's BG map and tile data bits = a, and every BG palette from wBGPals1 at
; once (also copied to wBGPals2).
	ld b, a
	xor a
	ldh [hCGBPalUpdate], a
	ldh a, [rSVBK]
	push af
	ld a, BANK(wBGPals1)
	ldh [rSVBK], a
	push bc
	ld hl, wBGPals1
	ld de, wBGPals2
	ld bc, 8 palettes
	rst CopyBytes
	pop bc
	di
.wait
	ldh a, [rLY]
	cp LY_VBLANK
	jr nz, .wait
	ldh a, [rLCDC]
	and ~PI_LCDC
	or b
	ldh [rLCDC], a
	ld a, 1 << rBGPI_AUTO_INCREMENT
	ldh [rBGPI], a
	ld hl, wBGPals1
	ld c, 8 palettes
.pals
	ld a, [hli]
	ldh [rBGPD], a
	dec c
	jr nz, .pals
	ei
	pop af
	ldh [rSVBK], a
	ret

; Data ---------------------------------------------------------------------------------------

PartyInfo_Gather:
; After PartyCards_Gather (wCurPartyMon, wCurPartySpecies): the ability, EXP and PP.
	ld a, [wCurPartySpecies]
	ld [wCurSpecies], a
	call GetBaseData
	ld a, [wBaseType1]
	ld c, PCI_TYPES
	call PartyCards_Store
	ld a, [wBaseType2]
	inc c
	call PartyCards_Store
	; the ability's name
	ld a, MON_SPECIES
	call GetPartyParamLocation
	farcall GetMonAbility
	farcall GetAbilityName
	ld de, wStringBuffer2
	ld c, PCI_ABILITY
	ld b, 17
	call PartyCards_StoreString
	; EXP to the next level, and the EXP bar (60 pixels)
	ld a, MON_LEVEL
	call GetPartyParamLocation
	ld a, [hl]
	cp MAX_LEVEL
	jr c, .not_max
	xor a
	ld c, PCI_EXPNEXT
	call PartyCards_Store
	inc c
	call PartyCards_Store
	inc c
	call PartyCards_Store
	ld a, 60
	jr .got_exp_px
.not_max
	push af
	inc a
	ld d, a
	farcall CalcExpAtLevel
	ld a, MON_EXP + 2
	call GetPartyParamLocation
	ldh a, [hQuotient + 3]
	sub [hl]
	ld c, PCI_EXPNEXT + 2
	call PartyCards_Store
	dec hl
	ldh a, [hQuotient + 2]
	sbc [hl]
	dec c
	call PartyCards_Store
	dec hl
	ldh a, [hQuotient + 1]
	sbc [hl]
	dec c
	call PartyCards_Store
	pop bc ; b = the level
	ld a, MON_EXP + 2
	call GetPartyParamLocation
	ld d, h
	ld e, l
	farcall CalcExpBar ; b = pixels out of 64
	ld a, b
	srl a
	srl a
	srl a
	srl a
	cpl
	inc a
	add b ; * 15 / 16
.got_exp_px
	ld c, PCI_EXPPX
	call PartyCards_Store
	; PP: current and max of each move
	ld a, [wMenuCursorY]
	push af
	xor a
	ld [wMonType], a ; PARTYMON
	ld b, a ; moves counted
.pp_loop
	ld a, b
	cp NUM_MOVES
	jr z, .pp_done
	push bc
	ld a, MON_MOVES
	call GetPartyParamLocation
	pop bc
	ld e, b
	ld d, 0
	add hl, de
	ld a, [hl]
	and a
	jr z, .pp_done
	ld de, MON_PP - MON_MOVES
	add hl, de
	ld a, [hl]
	and PP_MASK
	push af
	ld a, b
	add a
	add PCI_PP
	ld c, a
	pop af
	call PartyCards_Store
	ld a, b
	ld [wMenuCursorY], a
	push bc
	farcall GetMaxPPOfMove
	pop bc
	ld a, b
	add a
	add PCI_PP + 1
	ld c, a
	ld a, [wTempPP]
	call PartyCards_Store
	inc b
	jr .pp_loop
.pp_done
	pop af
	ld [wMenuCursorY], a
	ld a, b
	ld c, PCI_NMOVES
	jmp PartyCards_Store

; Tiles ---------------------------------------------------------------------------------------

PartyInfo_Render:
; The strips, into VRAM bank 0, and the bar's hints.
	ldh a, [rSVBK]
	push af
	ld a, PC_WRAM
	ldh [rSVBK], a

	; the card's edges, from the cards' template: left edge, bottom left corner, bottom edge
	ld hl, PartyCardGFX + 10 tiles
	ld de, PC_CANVAS
	ld bc, 1 tiles
	rst CopyBytes
	ld hl, PartyCardGFX + 40 tiles
	ld bc, 2 tiles
	rst CopyBytes
	ld a, PI_T_EDGE
	ld c, 3
	call .Send

	; level, gender, status (6 tiles)
	ld a, 6
	call .Clear
	ld a, 3
	ld [PC_DATA + PCV_COLOR], a
	ld hl, PC_DATA + PCV_NUM
	ld a, "L"
	ld [hli], a
	ld de, PC_DATA + PCD_LEVEL
	lb bc, PRINTNUM_LEFTALIGN | 1, 3
	call PrintNum
	ld [hl], "@"
	ld hl, PC_DATA + PCV_NUM
	lb de, 0, 2
	call PC_TinyString
	inc d
	inc d
	push de
	ld e, 1
	call PC_GenderSignAt
	pop de
	ld a, [PC_DATA + PCD_STATUS]
	and a
	jr z, .no_status
	; the capsule: black, the letters in the card color
	ld a, d
	add 9
	ld d, a
	push de
	ld e, 1
	lb bc, 15, 7
	call PC_FillRect
	xor a
	ld [PC_DATA + PCV_COLOR], a
	ld a, [PC_DATA + PCD_STATUS]
	dec a
	add a
	add a
	ld c, a
	ld b, 0
	ld hl, PartyCardStatusStrings
	add hl, bc
	pop de
	inc d
	inc d
	ld e, 2
	call PC_TinyString
.no_status
	ld a, PI_T_INFO
	ld c, 6
	call .Send

	; "ABILITY", "ITEM"
	ld hl, .AbilityLabel
	ld a, PI_T_ABL
	ld c, 4
	call .Label
	ld hl, .ItemLabel
	ld a, PI_T_ITL
	ld c, 2
	call .Label

	; the ability and the item in the VWF font
	ld de, PC_DATA + PCI_ABILITY
	ld a, PI_T_ABN
	call .VWF
	ld de, PC_DATA + PCD_ITEM
	ld a, [de]
	cp "@"
	jr nz, .item
	ld de, .NoItem
.item
	ld a, PI_T_ITN
	call .VWF

	; the HP row: "HP", the bar in the HP color, the numbers
	ld a, 14
	call .Clear
	ld hl, .HPLabel
	call .Capsule
	ld a, [PC_DATA + PCD_BARPX]
	call .Bar
	ld hl, PC_DATA + PCV_NUM
	ld de, PC_DATA + PCD_HP
	lb bc, PRINTNUM_LEFTALIGN | 2, 3
	call PrintNum
	ld [hl], "/"
	inc hl
	ld de, PC_DATA + PCD_MAXHP
	lb bc, PRINTNUM_LEFTALIGN | 2, 3
	call PrintNum
	ld [hl], "@"
	ld a, 3
	ld [PC_DATA + PCV_COLOR], a
	ld hl, PC_DATA + PCV_NUM
	lb de, PI_NUM_X, 2
	call PC_TinyString
	ld a, PI_T_HP
	ld c, 14
	call .Send

	; the EXP row: "EXP", the bar, the EXP to the next level
	ld a, 17
	call .Clear
	ld hl, .ExpLabel
	call .Capsule
	ld a, [PC_DATA + PCI_EXPPX]
	call .Bar
	ld a, 3
	ld [PC_DATA + PCV_COLOR], a
	ld a, [PC_DATA + PCD_LEVEL]
	cp MAX_LEVEL
	ld hl, .MaxLevel
	jr nc, .exp_text
	ld hl, PC_DATA + PCV_NUM
	ld de, PC_DATA + PCI_EXPNEXT
	lb bc, PRINTNUM_LEFTALIGN | 3, 7
	call PrintNum
	ld de, .ToL
.to_l
	ld a, [de]
	inc de
	ld [hli], a
	cp "@"
	jr nz, .to_l
	dec hl
	ld a, [PC_DATA + PCD_LEVEL]
	inc a
	ld [PC_DATA + PCI_STRIP], a
	ld de, PC_DATA + PCI_STRIP
	lb bc, PRINTNUM_LEFTALIGN | 1, 3
	call PrintNum
	ld [hl], "@"
	ld hl, PC_DATA + PCV_NUM
.exp_text
	lb de, PI_NUM_X, 2
	call PC_TinyString
	ld a, PI_T_EXP
	ld c, 17
	call .Send

	; the PP column: 4 rows of 3 tiles, right-aligned, the card's right edge in the last
	ld a, 3
	ld [PC_DATA + PCV_W], a
	ld hl, PC_CANVAS
	ld bc, 12 tiles
	xor a
	rst ByteFill
	ld a, 2
	ld [PC_DATA + PCV_COLOR], a
	lb de, 22, 0
	lb bc, 2, 32
	call PC_FillRect
	xor a
.pp_loop
	push af
	ld c, a
	ld a, [PC_DATA + PCI_NMOVES]
	cp c
	jr z, .pp_next
	jr c, .pp_next
	ld a, c
	add a
	add LOW(PC_DATA + PCI_PP)
	ld e, a
	ld d, HIGH(PC_DATA)
	ld hl, PC_DATA + PCI_STRIP
	lb bc, PRINTNUM_LEFTALIGN | 1, 2
	call PrintNum
	ld [hl], "/"
	inc hl
	pop af
	push af
	add a
	add LOW(PC_DATA + PCI_PP + 1)
	ld e, a
	ld d, HIGH(PC_DATA)
	lb bc, PRINTNUM_LEFTALIGN | 1, 2
	call PrintNum
	ld [hl], "@"
	ld hl, PC_DATA + PCI_STRIP
	call PC_TinyWidth
	cpl
	add 21 + 1 ; 21 - width
	ld d, a
	pop af
	push af
	add a
	add a
	add a
	add 2
	ld e, a
	ld a, 3
	ld [PC_DATA + PCV_COLOR], a
	ld hl, PC_DATA + PCI_STRIP
	call PC_TinyString
.pp_next
	pop af
	inc a
	cp NUM_MOVES
	jr c, .pp_loop
	ld a, PI_T_PP
	ld de, PC_CANVAS
	ld c, 12
	call PC_Transfer0

	; a blank tile: navy in the bar, and spaces
	ld a, 1
	call .Clear
	ld a, PI_T_BLANK
	ld c, 1
	call .Send
	ld a, " "
	ld c, 1
	call .Send

	pop af
	ldh [rSVBK], a
	ret

.Clear:
; A one-row canvas of a tiles in the card color.
	ld [PC_DATA + PCV_W], a
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	ld b, h
	ld c, l
	ld hl, PC_CANVAS
	xor a
	rst ByteFill
	ret

.Send:
; c tiles of the canvas to bank 0 tile a.
	ld de, PC_CANVAS
	jmp PC_Transfer0

.Label:
; String hl in the 3x5 font on c tiles, to tile a.
	push af
	push bc
	push hl
	ld a, c
	call .Clear
	ld a, 3
	ld [PC_DATA + PCV_COLOR], a
	pop hl
	lb de, 0, 3
	call PC_TinyString
	pop bc
	pop af
	jr .Send

.VWF:
; String de in the VWF font on 10 tiles, to tile a.
	push af
	push de
	ld a, 10
	call .Clear
	pop de
	ld c, 0
	call PC_VWFStrip
	ld de, PC_STAGE
	ld hl, PC_CANVAS
	ld a, 3
	ld [PC_DATA + PCV_COLOR], a
	ld c, 10 * TILE_WIDTH
.vwf_loop
	ld a, [de]
	inc de
	inc de
	call PC_ApplyMask
	inc hl
	inc hl
	dec c
	jr nz, .vwf_loop
	pop af
	ld c, 10
	jr .Send

.Capsule:
; A black capsule at x 0 with label hl in the card color, as the cards' "HP".
	push hl
	ld a, 3
	ld [PC_DATA + PCV_COLOR], a
	lb de, 0, 1
	lb bc, 15, 7
	call PC_FillRect
	xor a
	ld [PC_DATA + PCV_COLOR], a
	lb de, 0, 1
	call PC_Dot
	lb de, 14, 1
	call PC_Dot
	lb de, 0, 7
	call PC_Dot
	lb de, 14, 7
	call PC_Dot
	pop hl
	lb de, 2, 2
	jmp PC_TinyString

.Bar:
; A black outline from x PI_BAR_X, and a pixels of fill in color 1.
	push af
	ld a, 3
	ld [PC_DATA + PCV_COLOR], a
	lb de, PI_BAR_X, 1
	ld b, 62
	call PC_HLine
	lb de, PI_BAR_X, 7
	ld b, 62
	call PC_HLine
	lb de, PI_BAR_X, 2
	lb bc, 1, 5
	call PC_FillRect
	lb de, PI_BAR_X + 61, 2
	lb bc, 1, 5
	call PC_FillRect
	pop af
	and a
	ret z
	ld b, a
	ld a, 1
	ld [PC_DATA + PCV_COLOR], a
	lb de, PI_BAR_X + 1, 2
	ld c, 5
	jmp PC_FillRect

.AbilityLabel: db "ABILITY@"
.ItemLabel:    db "ITEM@"
.HPLabel:      db "HP@"
.ExpLabel:     db "EXP@"
.ToL:          db " TO L@"
.MaxLevel:     db "MAX LEVEL@"
.NoItem:       db "None@"

PartyInfo_DrawBar:
; The bottom bar with the popup's hints, "START Summary" and "B Back", in WRAM bank 6.
	ld a, SCREEN_WIDTH
	ld [PC_DATA + PCV_W], a
	ld hl, PC_CANVAS
	ld bc, 3 * SCREEN_WIDTH tiles
	xor a
	rst ByteFill
	ld a, 1 << PCH_BACK
	ld [PC_DATA + PCV_HINTS], a
	call PC_BarContents
	ld d, 4
	ld hl, PC_BarContents.StartLabel
	call PC_BarContents.Pill
	ld hl, .Summary
	call PC_BarContents.Word
	ld a, PCT_BAR_MID
	ld de, PC_CANVAS + SCREEN_WIDTH tiles
	ld c, SCREEN_WIDTH
	jmp PC_Transfer

.Summary: db "Summary@"

PC_Transfer0:
; c tiles from de (WRAM bank 6, 16-byte aligned) to VRAM bank 0 tile a ($8000 addressing),
; by HDMA before line 128 (the LCD is on while the cards are shown).
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	push de
	ld de, vTiles0
	add hl, de
	pop de
	ld a, h
	ld h, d
	ld d, a
	ld a, l
	ld l, e
	ld e, a
	di
	xor a
	ldh [rVBK], a
	farjp HDMATransfer_WaitForScanline128

; The map --------------------------------------------------------------------------------------

PartyInfo_BuildMap:
; The popup's tilemap and attributes into BG map 1, with the cards' wTilemap and wAttrmap
; kept (in the canvas) and put back after.
	ldh a, [rSVBK]
	push af
	ld a, PC_WRAM
	ldh [rSVBK], a
	ld hl, wTilemap
	ld de, PC_CANVAS
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	rst CopyBytes
	ld hl, wAttrmap
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	rst CopyBytes
	pop af
	ldh [rSVBK], a

	; the card: its fill everywhere (palette 0, VRAM bank 0), its edges
	hlcoord 0, 0
	ld bc, SCREEN_WIDTH * PC_BAR_Y
	ld a, PI_T_BLANK
	rst ByteFill
	hlcoord 0, 0, wAttrmap
	ld bc, SCREEN_WIDTH * PC_BAR_Y
	xor a
	rst ByteFill
	; the top and bottom rows (the top one flipped vertically), the right ends flipped
	hlcoord 0, 0
	call .EdgeRow
	hlcoord 0, PC_BAR_Y - 1
	call .EdgeRow
	hlcoord 0, 0, wAttrmap
	ld bc, SCREEN_WIDTH
	ld a, Y_FLIP
	rst ByteFill
	ld a, X_FLIP | Y_FLIP
	ldcoord_a SCREEN_WIDTH - 1, 0, wAttrmap
	ld a, X_FLIP
	ldcoord_a SCREEN_WIDTH - 1, PC_BAR_Y - 1, wAttrmap
	; the sides: the left edge, flipped on the right
	hlcoord 0, 1
	ld b, PC_BAR_Y - 2
.sides
	ld [hl], PI_T_EDGE
	push hl
	ld de, SCREEN_WIDTH - 1
	add hl, de
	ld [hl], PI_T_EDGE
	ld de, wAttrmap - wTilemap
	add hl, de
	ld [hl], X_FLIP
	pop hl
	ld de, SCREEN_WIDTH
	add hl, de
	dec b
	jr nz, .sides

	; the strips (VRAM bank 0, palette 0)
	lb bc, 0, 6
	hlcoord 9, 2
	ld a, PI_T_INFO
	call .Run
	hlcoord 9, 4
	ld a, PI_T_ABL
	ld c, 4
	call .Run
	hlcoord 9, 5
	ld a, PI_T_ABN
	ld c, 10
	call .Run
	hlcoord 9, 6
	ld a, PI_T_ITL
	ld c, 2
	call .Run
	hlcoord 9, 7
	ld a, PI_T_ITN
	ld c, 10
	call .Run
	hlcoord 1, 8
	ld a, PI_T_HP
	ld c, 14
	call .Run
	ld b, 2 ; the EXP palette
	hlcoord 1, 9
	ld a, PI_T_EXP
	ld c, 17
	call .Run
	ld b, 0
	ld a, PI_T_PP
	hlcoord 17, 10
	ld e, NUM_MOVES
.pp_rows
	ld c, 3
	push de
	push hl
	call .Run
	pop hl
	ld de, SCREEN_WIDTH
	add hl, de
	pop de
	dec e
	jr nz, .pp_rows

	; the name and the moves' names (the font, VRAM bank 0)
	ld a, [wMenuCursorY]
	dec a
	ld hl, wPartyMonNicknames
	call GetNickname
	hlcoord 9, 1
	ld c, MON_NAME_LENGTH - 1
	call .Text
	ld a, [wMenuCursorY]
	dec a
	ld [wCurPartyMon], a
	ld a, MON_MOVES
	call GetPartyParamLocation
	ld b, NUM_MOVES
	decoord 5, 10
.moves
	ld a, [hli]
	and a
	jr z, .front_pic
	push bc
	push hl
	push de
	ld [wNamedObjectIndex], a
	call GetMoveName
	pop hl
	push hl
	ld c, MOVE_NAME_LENGTH - 1
	call .Text
	pop hl
	ld de, SCREEN_WIDTH
	add hl, de
	ld d, h
	ld e, l
	pop hl
	pop bc
	dec b
	jr nz, .moves

.front_pic
	ld a, [wMenuCursorY]
	dec a
	ld [wCurPartyMon], a
	ld e, a
	ld d, 0
	ld hl, wPartySpecies
	add hl, de
	ld a, [hl]
	ld [wCurPartySpecies], a
	ld a, MON_DVS
	call GetPartyParamLocation
	predef GetUnownLetter
	; as PrepMonFrontpic, into the popup's tiles
	ld a, 1
	ld [wBoxAlignment], a
	ld de, vTiles0
	predef GetMonFrontpic
	xor a
	ldh [hGraphicStartTile], a
	hlcoord 1, 1
	lb bc, 7, 7
	predef PlaceGraphic
	xor a
	ld [wBoxAlignment], a
	hlcoord 1, 1, wAttrmap
	lb bc, 7, 7
	ld a, 1 ; the pic's palette, VRAM bank 0
	farcall FillBoxCGB

	; an empty bar until its hints are drawn
	hlcoord 0, PC_BAR_Y
	ld bc, 3 * SCREEN_WIDTH
	ld a, PI_T_BLANK
	rst ByteFill
	hlcoord 0, PC_BAR_Y, wAttrmap
	ld bc, 3 * SCREEN_WIDTH
	ld a, 6 ; the bar's palette, VRAM bank 0
	rst ByteFill

	; into BG map 1, then the cards' maps back
	ld a, HIGH(vBGMap1)
	ldh [hBGMapAddress + 1], a
	call CopyTilemapAtOnce
	ld a, HIGH(vBGMap0)
	ldh [hBGMapAddress + 1], a
	ldh a, [rSVBK]
	push af
	ld a, PC_WRAM
	ldh [rSVBK], a
	ld hl, PC_CANVAS
	ld de, wTilemap
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	rst CopyBytes
	ld de, wAttrmap
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	rst CopyBytes
	pop af
	ldh [rSVBK], a
	jr PartyInfo_Palettes

.EdgeRow:
; A bottom row at hl: the corner, the edge, the corner (flipped by its attributes).
	ld a, PI_T_EDGE + 1
	ld [hli], a
	ld a, PI_T_EDGE + 2
	ld bc, SCREEN_WIDTH - 2
	rst ByteFill
	ld [hl], PI_T_EDGE + 1
	ret

.Run:
; c tiles from tile a at hl (attributes: palette b, VRAM bank 0); a ends after them.
	push hl
	push de
	ld de, wAttrmap - wTilemap
.run_loop
	ld [hl], a
	push hl
	add hl, de
	ld [hl], b
	pop hl
	inc hl
	inc a
	dec c
	jr nz, .run_loop
	pop de
	pop hl
	ret

.Text:
; String de at hl in the font (palette 0, VRAM bank 0), on c tiles cleared to spaces.
	push bc
	push hl
	push de
	ld b, c
.spaces
	ld [hl], " "
	inc hl
	dec b
	jr nz, .spaces
	pop de
	pop hl
	push hl
	rst PlaceString
	pop hl
	pop bc
	ld de, wAttrmap - wTilemap
	add hl, de
	xor a
.text_attr
	ld [hli], a
	dec c
	jr nz, .text_attr
	ret

PartyInfo_Palettes:
; BG palettes 0 (the card), 1 (the front pic) and 2 (EXP) into wBGPals1 and wBGPals2.
	ld a, [wMenuCursorY]
	dec a
	add PCS_STATE
	ld c, a
	call PartyCards_Load
	ld b, a
	ldh a, [rSVBK]
	push af
	xor a
	ldh [hBuffer], a ; wBGPals1 only (PartyInfo_SwitchMap copies them)
	; the card's fill and HP color
	ld a, b
	and %11
	add a
	add a
	ld e, a
	ld d, 0
	ld hl, PartyCardFillColors
	add hl, de
	push hl
	ld a, b
	swap a
	and %11
	add a
	ld e, a
	ld hl, PartyCardBarColors
	add hl, de
	ld b, h
	ld c, l
	pop hl
	push hl
	xor a
	call PartyCards_WritePals.Write
	pop hl
	ld bc, .ExpColor
	ld a, 2
	call PartyCards_WritePals.Write
	; the front pic
	ld a, 1
	ldh [rSVBK], a
	ld a, MON_DVS
	call GetPartyParamLocation
	ld b, h
	ld c, l
	ld a, [wCurPartySpecies]
	farcall GetMonNormalOrShinyPalettePointer
	ld de, wBGPals1 palette 1
	farcall LoadPalette_White_Col1_Col2_Black
	pop af
	ldh [rSVBK], a
	ret

.ExpColor:
	RGB 06, 18, 31

PartyInfo_TypeIcons:
; The species' types (row 3) and each move's type (rows 10-13) as type icon sprites.
	farcall LoadTypeIconGFX
	ld c, PCI_TYPES
	call PartyCards_Load
	push af
	lb bc, 3, 9
	lb de, 0, 1
	farcall PlaceTypeIconForType
	ld c, PCI_TYPES + 1
	call PartyCards_Load
	pop bc
	cp b
	jr z, .moves
	lb bc, 3, 13
	lb de, 1, 2
	farcall PlaceTypeIconForType
.moves
	ld a, [wMenuCursorY]
	dec a
	ld [wCurPartyMon], a
	ld a, MON_MOVES
	call GetPartyParamLocation
	lb bc, 10, 1
	lb de, 2, 3
.loop
	ld a, [hli]
	and a
	ret z
	push hl
	push bc
	ld l, a
	ld a, MOVE_TYPE
	call GetMoveAttribute
	and TYPE_MASK
	pop bc
	push bc
	farcall PlaceTypeIconForType
	pop bc
	pop hl
	inc b
	inc d
	inc e
	ld a, d
	cp 2 + NUM_MOVES
	jr c, .loop
	ret
