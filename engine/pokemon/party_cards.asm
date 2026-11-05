; The party menu's cards: two columns of three cards, a bar at the
; bottom with the prompt and a Cancel button.
;
; Each card is 10x5 tiles. Its pixels are drawn into a canvas in WRAM bank 6 and copied to
; its own 36 tiles in VRAM bank 1 (rows 0 and 3 whole, rows 1-2 from column 2 on; the two
; tiles under the icon and the bottom row are shared). Each card has its own BG palette:
;   color 0: the card (normal / lead / selected / fainted), 1: its HP bar color,
;   2: the background between cards, 3: black (text).
; Palette 6 is the bottom bar (navy, white, the Cancel button, black); palette 7 stays the
; text box palette, so text boxes and menus drawn over the cards look as before.
;
; Card pixels (80x40): 2-pixel gaps on the left and right, 4 at the bottom, round corners
; (gfx/party_menu/card.png).
;   Name (normal font) at x 4, y 1; icon (sprite) at x 3, y 8; level (or a status capsule),
;   the gender sign after it, and the HP numbers at y 10; the held item at y 17 (3x5 font);
;   the HP label and bar at y 25-31 (gfx/party_menu/card_hp.png).
; Space for a favorite-Pokémon star is left between the level and the HP numbers.

DEF PC_CANVAS EQU $d800 ; wDecompressEnemyFrontpic (WRAM bank 6, 2 KB): the canvas (up to 60 tiles)
DEF PC_WRAM EQUS "BANK(wDecompressEnemyFrontpic)"
DEF PC_STAGE  EQU PC_CANVAS + $400 ; a card's 36 tiles in VRAM order / the VWF strip
DEF PC_SAVE   EQU PC_CANVAS + $680 ; wCurBaseData while the cards are gathered
DEF PC_DATA   EQU PC_CANVAS + $700 ; the card's data and the drawing variables
	assert LOW(PC_DATA) == 0
	assert PC_CANVAS == wDecompressEnemyFrontpic
	assert wDecompressEnemyFrontpic + $800 <= $e000
	assert BASE_DATA_SIZE <= PC_DATA - PC_SAVE

rsreset
DEF PCD_NAME   rb MON_NAME_LENGTH
DEF PCD_GENDER rb ; "♂", "♀" or 0
DEF PCD_LEVEL  rb
DEF PCD_STATUS rb ; 0, or 1 + an index into PartyCardStatusStrings
DEF PCD_HP     rw ; big endian, as in the party struct
DEF PCD_MAXHP  rw
DEF PCD_ITEM   rb ITEM_NAME_LENGTH
DEF PCD_FLAGS  rb ; bit 0: egg, bit 1: shiny
DEF PCD_MODE   rb 12 ; the text in place of the HP bar (TMs, stones, gender), or "@"
DEF PCD_BARPX  rb
DEF PCV_W      rb ; canvas width in tiles
DEF PCV_COLOR  rb
DEF PCV_CARD   rb
DEF PCV_MODE   rb ; PARTYCARDS_* of this draw
DEF PCV_ADV    rb ; name letter advance
DEF PCV_GLYPH  rb 8
DEF PCV_NUM    rb 16
DEF PCV_MASK   rb ; bit n: card n is drawn
DEF PCV_FRESH  rb ; wAttrmap's first byte before the draw
DEF PCS_STATE  rb PARTY_LENGTH ; per card: bit 7 present, bits 4-5 HP color, bits 0-1 fill
	assert _RS <= $100

	const_def
	const PARTYCARDS_HP
	const PARTYCARDS_TMHM
	const PARTYCARDS_EVO_STONE
	const PARTYCARDS_GENDER

	const_def
	const PCFILL_NORMAL
	const PCFILL_LEAD
	const PCFILL_FAINTED
	const PCFILL_SELECTED
	const PCFILL_HELD ; being moved

; VRAM bank 1 tiles ($8800 addressing): cards 0-2 at $00, 3-5 at $80, 36 each
DEF PC_CARD_TILES  EQU 36
DEF PCT_BG         EQU $6c ; shared tiles
DEF PCT_FILL_L     EQU $6d
DEF PCT_FILL       EQU $6e
DEF PCT_BOTTOM_L   EQU $6f
DEF PCT_BOTTOM     EQU $70
DEF PCT_BOTTOM_R   EQU $71
DEF PCT_BAR_TOP    EQU $72 ; the button's top row (6)
DEF PCT_BAR_BOTTOM EQU $78 ; the button's bottom row (6)
DEF PCT_NAVY       EQU $7e
DEF PCT_BAR_MID    EQU $ec ; the bar's middle row (20)
	assert PCT_BG == 3 * PC_CARD_TILES
	assert PCT_NAVY < $7f ; $7f in bank 1 is the doubles' blank tile
	assert PCT_BAR_MID == $80 + 3 * PC_CARD_TILES

DEF PC_BAR_Y      EQU 15 ; screen row of the bottom bar
DEF PC_BUTTON_X   EQU 114 ; the Cancel button, in bar canvas pixels
DEF PC_BUTTON_Y   EQU 4
DEF PC_BUTTON_W   EQU 44
DEF PC_BUTTON_H   EQU 16
DEF PC_PROMPT_TILES EQU 14

DrawPartyCards::
; WritePartyMenuTilemap: every card and the tilemap/attrmap of the whole screen, then the
; palettes. The bottom bar's tiles are drawn by DrawPartyMenuBar.
	ld a, (1 << PARTY_LENGTH) - 1
PartyCardsRedraw::
; DrawPartyCards for the cards in mask a (bit n: card n); the others keep their tiles. With
; the LCD on, the tilemap and attrmap are shown together at the end.
	ld c, PCV_MASK
	call PartyCards_Store
	xor a
	ldh [hBGMapMode], a
	; drawn from scratch (the cards aren't on the screen yet): keep the icons hidden until the
	; menu's input loop shows them, or they'd appear before the cards
	ld a, [wAttrmap]
	cp VRAM_BANK_1
	ld c, PCV_FRESH
	call PartyCards_Store
	call nz, HideSprites ; (y only: the icons keep their palettes)
	call PartyCards_GetMode
	ld c, PCV_MODE
	call PartyCards_Store
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
	ld de, wCurBaseData
	ld hl, PC_SAVE
	ld c, BASE_DATA_SIZE
	call PartyCards_CopyTo6

	call PartyCards_SharedTiles
	xor a
.loop
	push af
	call PartyCards_InMask
	jr nc, .next
	pop af
	push af
	ld hl, wPartyCount
	cp [hl]
	jr nc, .empty
	call PartyCards_Gather
	pop af
	push af
	call PartyCards_Render
	pop af
	push af
	scf
	call PartyCards_PlaceTiles
	jr .next
.empty
	ld c, PCS_STATE
	add c
	ld c, a
	xor a
	call PartyCards_Store
	pop af
	push af
	and a ; nc: empty
	call PartyCards_PlaceTiles
.next
	pop af
	inc a
	cp PARTY_LENGTH
	jr c, .loop
	call PartyCards_PlaceBarTiles

	ld hl, PC_SAVE
	ld de, wCurBaseData
	ld c, BASE_DATA_SIZE
	call PartyCards_CopyFrom6
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
	ld b, SCGB_PARTY_MENU
	call GetSGBLayout
	ldh a, [rLCDC]
	bit rLCDC_ENABLE, a
	ret z
	ld c, PCV_FRESH
	call PartyCards_Load
	cp VRAM_BANK_1
	jmp nz, CopyTilemapAtOnce
	; over the cards: the palettes, then the tiles, then the icons (those a closed menu
	; covered come back)
	call SetDefaultBGPAndOBP
	call DelayFrame
	call CopyTilemapAtOnce
	farjp PlaySpriteAnimations

PartyCards_InMask:
; carry if card a is in PCV_MASK.
	ld b, a
	inc b
	ld c, PCV_MASK
	call PartyCards_Load
.shift
	rrca
	dec b
	jr nz, .shift
	ret

PartyCards_GetMode:
; a = PARTYCARDS_* for wPartyMenuActionText
	ld a, [wPartyMenuActionText]
	and $f0
	ld a, PARTYCARDS_HP
	ret nz
	ld a, [wPartyMenuActionText]
	cp PARTYMENUACTION_TEACH_TMHM
	ld a, PARTYCARDS_TMHM
	ret z
	ld a, [wPartyMenuActionText]
	cp PARTYMENUACTION_EVO_STONE
	ld a, PARTYCARDS_EVO_STONE
	ret z
	ld a, [wPartyMenuActionText]
	cp PARTYMENUACTION_GIVE_MON
	jr z, .gender
	cp PARTYMENUACTION_GIVE_MON_FEMALE
	ld a, PARTYCARDS_HP
	ret nz
.gender
	ld a, PARTYCARDS_GENDER
	ret

; WRAM bank 6 access from the normal bank -------------------------------------------------

PartyCards_Store:
; [PC_DATA + c] = a in WRAM bank 6. Preserves every register.
	push hl
	push bc
	ld h, HIGH(PC_DATA)
	ld l, c
	ld b, a
	ldh a, [rSVBK]
	ld c, a
	ld a, PC_WRAM
	ldh [rSVBK], a
	ld [hl], b
	ld a, c
	ldh [rSVBK], a
	ld a, b
	pop bc
	pop hl
	ret

PartyCards_Load:
; a = [PC_DATA + c] in WRAM bank 6. Preserves bc, de and hl.
	push hl
	push bc
	ld h, HIGH(PC_DATA)
	ld l, c
	ldh a, [rSVBK]
	ld c, a
	ld a, PC_WRAM
	ldh [rSVBK], a
	ld b, [hl]
	ld a, c
	ldh [rSVBK], a
	ld a, b
	pop bc
	pop hl
	ret

PartyCards_StoreString:
; Copy b bytes from de to PC_DATA + c (WRAM bank 6), stopping after "@".
.loop
	ld a, [de]
	inc de
	call PartyCards_Store
	inc c
	cp "@"
	ret z
	dec b
	jr nz, .loop
	ret

PartyCards_CopyTo6:
; Copy c bytes from de to hl in WRAM bank 6.
.loop
	ld a, [de]
	inc de
	push bc
	ld b, a
	ldh a, [rSVBK]
	ld c, a
	ld a, PC_WRAM
	ldh [rSVBK], a
	ld [hl], b
	ld a, c
	ldh [rSVBK], a
	pop bc
	inc hl
	dec c
	jr nz, .loop
	ret

PartyCards_CopyFrom6:
; Copy c bytes from hl in WRAM bank 6 to de.
.loop
	push bc
	ldh a, [rSVBK]
	ld c, a
	ld a, PC_WRAM
	ldh [rSVBK], a
	ld b, [hl]
	ld a, c
	ldh [rSVBK], a
	ld a, b
	pop bc
	ld [de], a
	inc de
	inc hl
	dec c
	jr nz, .loop
	ret

; Gathering ---------------------------------------------------------------------------

PartyCards_Gather:
; Card a's data into PC_DATA, and its state into PCS_STATE.
	ld c, PCV_CARD
	call PartyCards_Store
	ld [wCurPartyMon], a
	; defaults
	ld a, "@"
	ld c, PCD_ITEM
	call PartyCards_Store
	ld c, PCD_MODE
	call PartyCards_Store
	xor a
	ld c, PCD_GENDER
	call PartyCards_Store
	ld c, PCD_STATUS
	call PartyCards_Store
	ld c, PCD_FLAGS
	call PartyCards_Store
	; the nickname
	ld a, [wCurPartyMon]
	ld hl, wPartyMonNicknames
	call GetNickname
	ld c, PCD_NAME
	ld b, MON_NAME_LENGTH
	call PartyCards_StoreString
	; an Egg shows only its name
	ld a, [wCurPartyMon]
	ld e, a
	ld d, 0
	ld hl, wPartySpecies
	add hl, de
	ld a, [hl]
	ld [wCurPartySpecies], a
	cp EGG
	jr nz, .not_egg
	ld a, 1
	ld c, PCD_FLAGS
	call PartyCards_Store
	ld b, PCFILL_NORMAL
	ld a, [wCurPartyMon]
	and a
	jr nz, .egg_state
	ld b, PCFILL_LEAD
.egg_state
	ld a, b
	or $80
	jmp .store_state

.not_egg
	ld a, [wCurPartyMon]
	ld hl, wPartyMon1
	ld bc, PARTYMON_STRUCT_LENGTH
	rst AddNTimes
	push hl
	ld bc, MON_LEVEL
	add hl, bc
	ld a, [hli]
	ld c, PCD_LEVEL
	call PartyCards_Store
	ld a, [hli] ; status
	ld b, a
	inc hl ; MON_HP
	ld a, [hli]
	ld c, PCD_HP
	call PartyCards_Store
	ld d, a
	ld a, [hli]
	ld c, PCD_HP + 1
	call PartyCards_Store
	or d
	ld e, a ; nz: not fainted
	ld a, [hli]
	ld c, PCD_MAXHP
	call PartyCards_Store
	ld a, [hl]
	ld c, PCD_MAXHP + 1
	call PartyCards_Store
	; the status capsule
	ld a, e
	and a
	ld a, 6 ; FNT
	jr z, .got_status
	ld a, b
	ld c, 1
	bit PSN, a
	jr nz, .status_c
	inc c
	bit BRN, a
	jr nz, .status_c
	inc c
	bit FRZ, a
	jr nz, .status_c
	inc c
	bit PAR, a
	jr nz, .status_c
	inc c
	and SLP_MASK
	jr nz, .status_c
	ld c, 0
.status_c
	ld a, c
.got_status
	ld c, PCD_STATUS
	call PartyCards_Store
	; the held item
	pop hl
	push hl
	ld bc, MON_ITEM
	add hl, bc
	ld a, [hl]
	and a
	jr z, .no_item
	ld [wNamedObjectIndex], a
	call GetItemName
	ld c, PCD_ITEM
	ld b, ITEM_NAME_LENGTH
	call PartyCards_StoreString
.no_item
	; shiny?
	pop hl
	push hl
	ld bc, MON_DVS
	add hl, bc
	ld b, h
	ld c, l
	farcall CheckShininess
	jr nc, .not_shiny
	ld a, 1 << 1
	ld c, PCD_FLAGS
	call PartyCards_Store
.not_shiny
	; the gender (after the name)
	xor a ; PARTYMON
	ld [wMonType], a
	predef GetGender
	ld a, 0
	jr c, .got_gender
	ld a, "♂"
	jr nz, .got_gender
	ld a, "♀"
.got_gender
	ld c, PCD_GENDER
	call PartyCards_Store
	; the mode's text
	call PartyCards_GatherMode
	; the HP bar: 60 pixels
	pop hl
	ld bc, MON_HP
	add hl, bc
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld d, a
	ld e, [hl]
	call PartyCards_BarPixels ; a = pixels, d = HP color
	ld c, PCD_BARPX
	call PartyCards_Store
	; the state
	ld c, PCD_HP
	call PartyCards_Load
	ld b, a
	inc c
	call PartyCards_Load
	or b
	ld b, PCFILL_FAINTED
	jr z, .got_fill
	ld b, PCFILL_NORMAL
	ld a, [wCurPartyMon]
	and a
	jr nz, .got_fill
	ld b, PCFILL_LEAD
.got_fill
	ld a, d
	swap a
	or b
	or $80
.store_state
	push af
	ld a, [wCurPartyMon]
	add PCS_STATE
	ld c, a
	pop af
	jmp PartyCards_Store

PartyCards_BarPixels:
; a = the bar pixels (out of 60) for HP bc of max HP de, d = its HP color
	push bc
	predef ComputeHPBarPixels ; e = pixels out of HP_BAR_LENGTH_PX (48)
	pop bc
	push de
	call GetHPPal ; d
	pop bc ; c = e
	ld a, c
	srl a
	srl a
	add c ; * 5 / 4
	ret

PartyCards_GatherMode:
	ld c, PCV_MODE
	call PartyCards_Load
	cp PARTYCARDS_TMHM
	jr z, .tmhm
	cp PARTYCARDS_EVO_STONE
	jr z, .evo_stone
	cp PARTYCARDS_GENDER
	ret nz
	ld c, PCD_GENDER
	call PartyCards_Load
	ld de, .unknown
	and a
	jr z, .got_string
	ld de, .male
	cp "♂"
	jr z, .got_string
	ld de, .female
	jr .got_string

.tmhm
	predef CanLearnTMHMMove
	ld a, c
	and a
	jr .able_not_able

.evo_stone
	ld a, [wCurPartyMon]
	ld hl, wPartyMon1Species
	ld bc, PARTYMON_STRUCT_LENGTH
	rst AddNTimes
	ld a, [hl]
	call GetPokemonIndexFromID
	ld b, h
	ld c, l
	ld hl, EvosAttacksPointers
	ld a, BANK(EvosAttacksPointers)
	call LoadDoubleIndirectPointer
	ld d, h
	ld e, l
	farcall DetermineEvolutionItemResults
	ld a, d
	or e
.able_not_able
	ld de, .not_able
	jr z, .got_string
	ld de, .able
.got_string
	ld c, PCD_MODE
	ld b, 12
	jmp PartyCards_StoreString

.able:     db "Able@"
.not_able: db "Not Able@"
.male:     db "♂…Male@"
.female:   db "♀…Female@"
.unknown:  db "…Unknown@"

; Drawing (WRAM bank 6) ------------------------------------------------------------------

PartyCards_Render:
; Draw card a (its data gathered) into its tiles.
	ldh a, [rSVBK]
	push af
	ld a, PC_WRAM
	ldh [rSVBK], a
	call PC_CardCanvas
	call PC_DrawName
	ld a, [PC_DATA + PCD_FLAGS]
	bit 0, a
	jr nz, .done
	call PC_DrawInfoLine
	call PC_DrawItemLine
	ld a, [PC_DATA + PCD_MODE]
	cp "@"
	jr nz, .mode
	; the HP label and the empty bar (gfx/party_menu/card_hp.png), then the bar
	ld hl, PartyCardHPGFX
	ld de, PC_CANVAS + 30 tiles
	ld bc, PartyCardHPGFX.End - PartyCardHPGFX
	rst CopyBytes
	call PC_DrawHPBar
	jr .done
.mode
	ld a, 3
	ld [PC_DATA + PCV_COLOR], a
	ld a, 8
	ld [PC_DATA + PCV_ADV], a
	ld hl, PC_DATA + PCD_MODE
	lb de, 4, 24
	call PC_String
.done
	call PC_StageCard
	ld a, [PC_DATA + PCV_CARD]
	call PC_CardTileBase
	ld de, PC_STAGE
	ld c, PC_CARD_TILES
	call PC_Transfer
	pop af
	ldh [rSVBK], a
	ret

PC_CardTileBase:
; a = the first tile of card a
	cp 3
	jr c, .first
	sub 3
	ld c, a
	add a
	add a
	add a
	add c ; * 9
	add a
	add a ; * 36
	add $80
	ret
.first
	ld c, a
	add a
	add a
	add a
	add c
	add a
	add a
	ret

PC_CardCanvas:
; A blank card (gfx/party_menu/card.png): the card color with its gaps and corners.
	ld a, 10
	ld [PC_DATA + PCV_W], a
	ld hl, PartyCardGFX
	ld de, PC_CANVAS
	ld bc, PartyCardGFX.End - PartyCardGFX
	rst CopyBytes
	ret

PC_Dot:
	ld a, $80
	jmp PC_Blit

PC_DrawName:
	ld a, 3
	ld [PC_DATA + PCV_COLOR], a
	; 8 pixels a letter if they fit, else 7
	ld hl, PC_DATA + PCD_NAME
	ld b, 0
.count
	ld a, [hli]
	cp "@"
	jr z, .counted
	inc b
	jr .count
.counted
	ld a, b
	cp 10
	ld a, 8
	jr c, .got_adv
	dec a
.got_adv
	ld [PC_DATA + PCV_ADV], a
	ld hl, PC_DATA + PCD_NAME
	lb de, 4, 1
	jmp PC_String

PC_DrawInfoLine:
	ld a, [PC_DATA + PCD_STATUS]
	and a
	jr z, .level
	; the status capsule: black, the letters in the card color
	ld a, 3
	ld [PC_DATA + PCV_COLOR], a
	lb de, 20, 9
	lb bc, 15, 7
	call PC_FillRect
	xor a
	ld [PC_DATA + PCV_COLOR], a
	ld a, [PC_DATA + PCD_STATUS]
	dec a
	ld c, a
	add a
	add a
	ld b, 0
	ld c, a
	ld hl, PartyCardStatusStrings
	add hl, bc
	lb de, 22, 10
	call PC_TinyString
	ld a, 3
	ld [PC_DATA + PCV_COLOR], a
	ld a, [PC_DATA + PCD_GENDER]
	and a
	jr z, .hp
	ld d, 37
	call PC_GenderSign
	jr .hp

.level
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
	lb de, 20, 10
	call PC_TinyString
	inc d
	inc d
	call PC_GenderSign

.hp
	ld a, 3
	ld [PC_DATA + PCV_COLOR], a
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
	ld hl, PC_DATA + PCV_NUM
	call PC_TinyWidth
	ld b, a
	ld a, 76
	sub b
	ld d, a
	ld e, 10
	ld hl, PC_DATA + PCV_NUM
	jmp PC_TinyString

PC_GenderSign:
; The gender sign at x d, y 9 (6x7 pixels), if any.
	ld a, [PC_DATA + PCD_GENDER]
	and a
	ret z
	ld hl, .Male
	cp "♂"
	jr z, .got_sign
	ld hl, .Female
.got_sign
	ld e, 9
	ld b, 7
	jmp PC_BlitRows

.Male:
	db %00011100
	db %00001100
	db %01110100
	db %10001000
	db %10001000
	db %01110000
	db %00000000

.Female:
	db %01110000
	db %10001000
	db %10001000
	db %01110000
	db %00100000
	db %01110000
	db %00100000

PC_DrawItemLine:
	ld a, [PC_DATA + PCD_FLAGS]
	bit 1, a
	jr z, .not_shiny
	; a sparkle at the end of the line
	ld a, 3
	ld [PC_DATA + PCV_COLOR], a
	ld hl, .Sparkle
	lb de, 70, 16
	ld b, 5
	call PC_BlitRows
.not_shiny
	ld a, [PC_DATA + PCD_ITEM]
	cp "@"
	ret z
	ld a, 3
	ld [PC_DATA + PCV_COLOR], a
	ld hl, PC_DATA + PCD_ITEM
	lb de, 20, 17
	jmp PC_TinyString

.Sparkle:
	db %00100000
	db %01110000
	db %11011000
	db %01110000
	db %00100000

PC_DrawHPBar:
	ld a, [PC_DATA + PCD_BARPX]
	and a
	ret z
	ld b, a
	ld a, 1
	ld [PC_DATA + PCV_COLOR], a
	lb de, 15, 26
	ld c, 5
	jmp PC_FillRect

PartyCardGFX:
INCBIN "gfx/party_menu/card.2bpp"
.End:
	assert .End - PartyCardGFX == 10 * 5 tiles

PartyCardHPGFX:
INCBIN "gfx/party_menu/card_hp.2bpp"
.End:
	assert .End - PartyCardHPGFX == 10 tiles

PartyCardStatusStrings:
	db "PSN@"
	db "BRN@"
	db "FRZ@"
	db "PAR@"
	db "SLP@"
	db "FNT@"

PC_StageCard:
; The card's 36 tiles from the canvas to PC_STAGE in VRAM order.
	ld hl, PC_CANVAS
	ld de, PC_STAGE
	ld bc, 10 tiles
	rst CopyBytes
	ld hl, PC_CANVAS + 12 tiles
	ld bc, 8 tiles
	rst CopyBytes
	ld hl, PC_CANVAS + 22 tiles
	ld bc, 8 tiles
	rst CopyBytes
	ld hl, PC_CANVAS + 30 tiles
	ld bc, 10 tiles
	rst CopyBytes
	ret

PC_Transfer:
; Copy c tiles from de (WRAM bank 6, 16-byte aligned) to VRAM bank 1 tile a ($8800
; addressing). With the LCD on, by HDMA in the HBlanks before line 128, with interrupts off
; from the VRAM bank switch on: VBlank code can select VRAM bank 0 again.
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	push de
	ld de, $9000
	cp $80
	jr c, .got_base
	ld de, $8000
.got_base
	add hl, de
	pop de
	ldh a, [hBGMapMode]
	push af
	xor a
	ldh [hBGMapMode], a
	ldh a, [rLCDC]
	bit rLCDC_ENABLE, a
	jr z, .lcd_off
	; HDMATransfer_WaitForScanline128: hl = source, de = destination, c = tiles; it ends
	; with reti, well before the next VBlank
	ld a, h
	ld h, d
	ld d, a
	ld a, l
	ld l, e
	ld e, a
	di
	ld a, 1
	ldh [rVBK], a
	farcall HDMATransfer_WaitForScanline128
	jr .done
.lcd_off
	ld a, 1
	ldh [rVBK], a
	ld b, c
.copy_tile
	ld c, LEN_2BPP_TILE
.copy_byte
	ld a, [de]
	inc de
	ld [hli], a
	dec c
	jr nz, .copy_byte
	dec b
	jr nz, .copy_tile
.done
	xor a
	ldh [rVBK], a
	pop af
	ldh [hBGMapMode], a
	ret

PartyCards_SharedTiles:
; The tiles every card shares (under the icon, the bottom row) and the background tile.
	ldh a, [rSVBK]
	push af
	ld a, PC_WRAM
	ldh [rSVBK], a
	call PC_CardCanvas
	ld de, PC_STAGE
	ld hl, PC_STAGE
	ld bc, 1 tiles
.bg
	xor a
	ld [hli], a
	dec a
	ld [hli], a
	dec c
	dec c
	jr nz, .bg
	ld de, PC_STAGE + 1 tiles
	ld hl, PC_CANVAS + 20 tiles ; row 2: column 0, column 1
	ld bc, 2 tiles
	rst CopyBytes
	ld hl, PC_CANVAS + 40 tiles ; row 4: column 0, column 1
	ld bc, 2 tiles
	rst CopyBytes
	ld hl, PC_CANVAS + 49 tiles ; row 4: column 9
	ld bc, 1 tiles
	rst CopyBytes
	ld a, PCT_BG
	ld de, PC_STAGE
	ld c, 6
	call PC_Transfer
	pop af
	ldh [rSVBK], a
	ret

; The tilemap -------------------------------------------------------------------------------

PartyCardsBlankCard::
; Show card a as an empty slot without its icon, as the switch animation does.
	push af
	call PartyCards_HideIcon
	pop af
	and a
	call PartyCards_PlaceTiles
	call DelayFrame ; (its icon, already hidden, goes first)
	jmp CopyTilemapAtOnce

PartyCards_PlaceTiles:
; Card a's tiles and attributes; carry: a Pokémon, nc: an empty slot.
	push af
	; hl = its top left corner in wTilemap
	ld c, a
	srl a
	ld b, a
	add a
	add a
	add b ; * 5 rows
	ld hl, wTilemap
	ld de, SCREEN_WIDTH
	and a
	jr z, .got_row
.row_loop
	add hl, de
	dec a
	jr nz, .row_loop
.got_row
	bit 0, c
	jr z, .got_col
	ld de, 10
	add hl, de
.got_col
	; the attributes
	push hl
	ld de, wAttrmap - wTilemap
	add hl, de
	ld a, c
	and 7
	or VRAM_BANK_1
	ld b, 5
.attr_row
	push hl
	push bc
	ld c, 10
.attr
	ld [hli], a
	dec c
	jr nz, .attr
	pop bc
	pop hl
	ld de, SCREEN_WIDTH
	add hl, de
	dec b
	jr nz, .attr_row
	pop hl
	pop af
	jr c, .card
	; an empty slot
	ld b, 5
.empty_row
	push hl
	ld c, 10
	ld a, PCT_BG
.empty
	ld [hli], a
	dec c
	jr nz, .empty
	pop hl
	ld de, SCREEN_WIDTH
	add hl, de
	dec b
	jr nz, .empty_row
	ret

.card
	call PC_CardTileBase
	ld b, a
	push hl
	ld c, 10 ; row 0
	call .run
	pop hl
	call .next_row
	ld e, 2 ; rows 1-2
.mid_row
	push hl
	ld a, PCT_FILL_L
	ld [hli], a
	ld a, PCT_FILL
	ld [hli], a
	ld c, 8
	call .run
	pop hl
	call .next_row
	dec e
	jr nz, .mid_row
	push hl
	ld c, 10 ; row 3
	call .run
	pop hl
	call .next_row
	ld a, PCT_BOTTOM_L ; row 4
	ld [hli], a
	ld c, 8
	ld a, PCT_BOTTOM
.bottom
	ld [hli], a
	dec c
	jr nz, .bottom
	ld [hl], PCT_BOTTOM_R
	ret

.run
	ld a, b
	ld [hli], a
	inc b
	dec c
	jr nz, .run
	ret

.next_row
	push de
	ld de, SCREEN_WIDTH
	add hl, de
	pop de
	ret

PartyCards_PlaceBarTiles:
; The bottom bar's tilemap and attributes (its tiles come from DrawPartyMenuBar).
	hlcoord 0, PC_BAR_Y
	ld bc, 3 * SCREEN_WIDTH
	ld a, PCT_NAVY
	rst ByteFill
	hlcoord 0, PC_BAR_Y, wAttrmap
	ld bc, 3 * SCREEN_WIDTH
	ld a, VRAM_BANK_1 | 6
	rst ByteFill
	hlcoord SCREEN_WIDTH - 6, PC_BAR_Y
	ld a, PCT_BAR_TOP
	ld c, 6
	call .run
	hlcoord 0, PC_BAR_Y + 1
	ld a, PCT_BAR_MID
	ld c, SCREEN_WIDTH
	call .run
	hlcoord SCREEN_WIDTH - 6, PC_BAR_Y + 2
	ld a, PCT_BAR_BOTTOM
	ld c, 6
.run
	ld [hli], a
	inc a
	dec c
	jr nz, .run
	ret

; The bottom bar --------------------------------------------------------------------------

DrawPartyMenuBar::
; PlacePartyMenuText: the prompt and, with a Cancel entry, the Cancel button.
	ldh a, [hBGMapMode]
	push af
	xor a
	ldh [hBGMapMode], a
	ld a, [wPartyCount]
	ld b, a
	ld a, [w2DMenuNumRows]
	cp b
	ld c, 0
	jr z, .got_cancel
	jr c, .got_cancel
	inc c
.got_cancel
	; the prompt
	ld de, PartyCardPrompts.none
	ld a, b
	and a
	jr z, .got_prompt
	ld a, [wPartyMenuActionText]
	and $f
	ld e, a
	ld d, 0
	ld hl, PartyCardPrompts
	add hl, de
	add hl, de
	ld a, [hli]
	ld d, [hl]
	ld e, a
.got_prompt
	ldh a, [rSVBK]
	push af
	ld a, PC_WRAM
	ldh [rSVBK], a
	push bc
	push de
	ld a, SCREEN_WIDTH
	ld [PC_DATA + PCV_W], a
	ld hl, PC_CANVAS
	ld bc, 3 * SCREEN_WIDTH tiles
	xor a
	rst ByteFill
	pop de
	ld c, 4
	call PC_VWFStrip
	ld a, 1 ; white
	ld b, 0
	ld c, PC_PROMPT_TILES
	call PC_MergeStrip
	pop bc
	ld a, c
	and a
	jr z, .no_button
	ld a, 3
	ld [PC_DATA + PCV_COLOR], a
	lb de, PC_BUTTON_X, PC_BUTTON_Y
	lb bc, PC_BUTTON_W, PC_BUTTON_H
	call PC_FillRect
	ld a, 2
	ld [PC_DATA + PCV_COLOR], a
	lb de, PC_BUTTON_X + 1, PC_BUTTON_Y + 1
	lb bc, PC_BUTTON_W - 2, PC_BUTTON_H - 2
	call PC_FillRect
	xor a
	ld [PC_DATA + PCV_COLOR], a
	lb de, PC_BUTTON_X, PC_BUTTON_Y
	call PC_Dot
	lb de, PC_BUTTON_X + PC_BUTTON_W - 1, PC_BUTTON_Y
	call PC_Dot
	lb de, PC_BUTTON_X, PC_BUTTON_Y + PC_BUTTON_H - 1
	call PC_Dot
	lb de, PC_BUTTON_X + PC_BUTTON_W - 1, PC_BUTTON_Y + PC_BUTTON_H - 1
	call PC_Dot
	ld de, .CancelString
	call GetVWFLength
	ld b, a
	ld a, PC_BUTTON_W
	sub b
	srl a
	add PC_BUTTON_X
	ld c, a
	ld de, .CancelString
	call PC_VWFStrip
	ld a, 3
	ld b, PC_PROMPT_TILES
	ld c, SCREEN_WIDTH - PC_PROMPT_TILES
	call PC_MergeStrip
.no_button
	; into VRAM
	ld a, PCT_NAVY
	ld de, PC_CANVAS
	ld c, 1
	call PC_Transfer
	ld a, PCT_BAR_TOP
	ld de, PC_CANVAS + (SCREEN_WIDTH - 6) tiles
	ld c, 6
	call PC_Transfer
	ld a, PCT_BAR_MID
	ld de, PC_CANVAS + SCREEN_WIDTH tiles
	ld c, SCREEN_WIDTH
	call PC_Transfer
	ld a, PCT_BAR_BOTTOM
	ld de, PC_CANVAS + (3 * SCREEN_WIDTH - 6) tiles
	ld c, 6
	call PC_Transfer
	pop af
	ldh [rSVBK], a
	pop af
	ldh [hBGMapMode], a
	ret

.CancelString: db "Cancel@"

PartyCardPrompts:
; entries correspond to PARTYMENUACTION_* constants
	table_width 2
	dw .pick     ; PARTYMENUACTION_CHOOSE_POKEMON
	dw .use_on   ; PARTYMENUACTION_HEALING_ITEM
	dw .which    ; PARTYMENUACTION_SWITCH
	dw .teach    ; PARTYMENUACTION_TEACH_TMHM
	dw .move_to  ; PARTYMENUACTION_MOVE
	dw .use_on   ; PARTYMENUACTION_EVO_STONE
	dw .pick     ; PARTYMENUACTION_GIVE_MON
	dw .pick     ; PARTYMENUACTION_GIVE_MON_FEMALE
	dw .to_which ; PARTYMENUACTION_GIVE_ITEM
	assert_table_length NUM_PARTYMENUACTIONS

.pick:     db "Pick a Pokémon.@"
.use_on:   db "Use on which Pokémon?@"
.which:    db "Which Pokémon?@"
.teach:    db "Teach which Pokémon?@"
.move_to:  db "Move to where?@"
.to_which: db "To which Pokémon?@"
.none:     db "You have no Pokémon!@"

PC_VWFStrip:
; String de in the VWF font into PC_STAGE (a strip of SCREEN_WIDTH tiles), c pixels in.
	push de
	push bc
	ld hl, PC_STAGE
	ld bc, SCREEN_WIDTH tiles
	xor a
	rst ByteFill
	pop bc
	pop de
	ld hl, PC_STAGE
	jmp PlaceVWFString

PC_MergeStrip:
; Draw tiles b to b + c - 1 of the strip into the canvas's second tile row, in color a.
	ld [PC_DATA + PCV_COLOR], a
	ld l, b
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	push hl
	ld de, PC_STAGE
	add hl, de
	ld d, h
	ld e, l
	pop hl
	push de
	ld de, PC_CANVAS + SCREEN_WIDTH tiles
	add hl, de
	pop de
	; c tiles * 8 rows
	ld a, c
	add a
	add a
	add a
	ld c, a
.loop
	ld a, [de]
	inc de
	inc de
	call PC_ApplyMask
	inc hl
	inc hl
	dec c
	jr nz, .loop
	ret

; Pixels ------------------------------------------------------------------------------------

PC_String:
; String hl in the normal font at (d, e), letters PCV_ADV pixels apart, in PCV_COLOR.
; Returns d after the last letter.
.loop
	ld a, [hli]
	cp "@"
	ret z
	push hl
	cp " "
	call nz, PC_Glyph
	pop hl
	ld a, [PC_DATA + PCV_ADV]
	add d
	ld d, a
	jr .loop

PC_Glyph:
; Letter a of the normal font at (d, e). Preserves de.
	sub $80
	ret c
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, hl
	push de
	ld de, Font
	add hl, de
	ld de, PC_DATA + PCV_GLYPH
	ld bc, LEN_1BPP_TILE
	ld a, BANK(Font)
	call FarCopyBytes
	pop de
	ld hl, PC_DATA + PCV_GLYPH
	ld b, TILE_WIDTH
	jr PC_BlitRows

PC_TinyString:
; String hl in the 3x5 font at (d, e), in PCV_COLOR. Returns d after it.
.loop
	ld a, [hli]
	cp "@"
	ret z
	push hl
	call PC_TinyChar
	pop hl
	ld a, d
	add 4
	ld d, a
	jr .loop

PC_TinyWidth:
; a = the width of 3x5 string hl in pixels
	ld b, -1
.loop
	ld a, [hli]
	cp "@"
	jr z, .done
	inc b
	inc b
	inc b
	inc b
	jr .loop
.done
	ld a, b
	ret

PC_TinyChar:
; Letter a of the 3x5 font at (d, e). Preserves de.
	call PC_TinyIndex
	ret c
	ld b, 5
	; fallthrough
PC_BlitRows:
; b rows of masks from hl at (d, e). Preserves de.
	push de
.loop
	ld a, [hli]
	push hl
	call PC_Blit
	pop hl
	inc e
	dec b
	jr nz, .loop
	pop de
	ret

PC_TinyIndex:
; hl = the 3x5 pattern of letter a; carry if none
	cp "A"
	jr c, .specials
	cp "Z" + 1
	jr c, .upper
	cp "a"
	jr c, .specials
	cp "z" + 1
	jr c, .lower
	cp "0"
	jr nc, .digit ; "0"-"9" are the last characters
.specials
	ld hl, .Specials
	ld b, a
.find
	ld a, [hli]
	cp -1
	jr z, .none
	cp b
	ld a, [hli]
	jr nz, .find
	jr .got_index
.none
	scf
	ret
.upper
	sub "A"
	jr .got_index
.lower
	sub "a"
	jr .got_index
.digit
	sub "0" - 26
.got_index
	ld l, a
	ld h, 0
	ld b, h
	ld c, l
	add hl, hl
	add hl, hl
	add hl, bc ; * 5
	ld bc, PartyCardTinyFont
	add hl, bc
	and a
	ret

.Specials:
	db "/", 36
	db ".", 38
	db "-", 39
	db "'", 40
	db "?", 41
	db "!", 42
	db "♂", 43
	db "♀", 44
	db ":", 45
	db "é", 4 ; E
	db -1

PC_FillRect:
; A b x c rectangle at (d, e) in PCV_COLOR.
.loop
	push bc
	push de
	call PC_HLine
	pop de
	pop bc
	inc e
	dec c
	jr nz, .loop
	ret

PC_HLine:
; b pixels from (d, e) in PCV_COLOR.
.loop
	ld a, b
	and a
	ret z
	cp 8
	jr c, .partial
	ld a, $ff
	call PC_Blit
	ld a, d
	add 8
	ld d, a
	ld a, b
	sub 8
	ld b, a
	jr .loop
.partial
	ld c, a
	ld a, $ff
.shift
	srl a
	dec c
	jr nz, .shift
	cpl
	; fallthrough
PC_Blit:
; The 8 pixels of mask a (bit 7 leftmost) at (d, e) in PCV_COLOR. Preserves bc and de.
	and a
	ret z
	push bc
	push de
	push af
	call PC_RowAddr
	pop af
	ld b, a
	ld c, 0
	ld a, d
	and 7
	jr z, .go
.shift
	srl b
	rr c
	dec a
	jr nz, .shift
.go
	ld a, b
	call PC_ApplyMask
	ld a, c
	and a
	jr z, .done
	ld de, LEN_2BPP_TILE
	add hl, de
	call PC_ApplyMask
.done
	pop de
	pop bc
	ret

PC_RowAddr:
; hl = the canvas bytes of pixel row (d, e). Preserves de.
	ld a, [PC_DATA + PCV_W]
	ld c, a
	ld a, e
	srl a
	srl a
	srl a
	ld b, a
	xor a
	inc b
.mul
	dec b
	jr z, .got_row
	add c
	jr .mul
.got_row
	ld b, a
	ld a, d
	srl a
	srl a
	srl a
	add b
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	ld a, e
	and 7
	add a
	ld c, a
	ld b, 0
	add hl, bc
	ld bc, PC_CANVAS
	add hl, bc
	ret

PC_ApplyMask:
; Set the pixels of mask a in the 2bpp row at hl to PCV_COLOR. Preserves bc, de and hl.
	push bc
	push hl
	ld b, a
	cpl
	ld c, a
	ld a, [PC_DATA + PCV_COLOR]
	rrca
	push af
	ld a, [hl]
	jr nc, .clear0
	or b
	jr .set0
.clear0
	and c
.set0
	ld [hli], a
	pop af
	rrca
	ld a, [hl]
	jr nc, .clear1
	or b
	jr .set1
.clear1
	and c
.set1
	ld [hl], a
	pop hl
	pop bc
	ret

PartyCardTinyFont:
; The 3x5 font of the double battle HP boxes (DoublesTinyFont): A-Z, 0-9, / ▶ . - ' ? ! ♂ ♀ :
	db %01000000, %10100000, %11100000, %10100000, %10100000 ; A
	db %11000000, %10100000, %11000000, %10100000, %11000000 ; B
	db %01100000, %10000000, %10000000, %10000000, %01100000 ; C
	db %11000000, %10100000, %10100000, %10100000, %11000000 ; D
	db %11100000, %10000000, %11000000, %10000000, %11100000 ; E
	db %11100000, %10000000, %11000000, %10000000, %10000000 ; F
	db %01100000, %10000000, %10100000, %10100000, %01100000 ; G
	db %10100000, %10100000, %11100000, %10100000, %10100000 ; H
	db %11100000, %01000000, %01000000, %01000000, %11100000 ; I
	db %00100000, %00100000, %00100000, %10100000, %01000000 ; J
	db %10100000, %10100000, %11000000, %10100000, %10100000 ; K
	db %10000000, %10000000, %10000000, %10000000, %11100000 ; L
	db %10100000, %11100000, %11100000, %10100000, %10100000 ; M
	db %11000000, %10100000, %10100000, %10100000, %10100000 ; N
	db %01000000, %10100000, %10100000, %10100000, %01000000 ; O
	db %11000000, %10100000, %11000000, %10000000, %10000000 ; P
	db %01000000, %10100000, %10100000, %11000000, %01100000 ; Q
	db %11000000, %10100000, %11000000, %10100000, %10100000 ; R
	db %01100000, %10000000, %01000000, %00100000, %11000000 ; S
	db %11100000, %01000000, %01000000, %01000000, %01000000 ; T
	db %10100000, %10100000, %10100000, %10100000, %11100000 ; U
	db %10100000, %10100000, %10100000, %10100000, %01000000 ; V
	db %10100000, %10100000, %11100000, %11100000, %10100000 ; W
	db %10100000, %10100000, %01000000, %10100000, %10100000 ; X
	db %10100000, %10100000, %01000000, %01000000, %01000000 ; Y
	db %11100000, %00100000, %01000000, %10000000, %11100000 ; Z
	db %11100000, %10100000, %10100000, %10100000, %11100000 ; 0
	db %01000000, %11000000, %01000000, %01000000, %11100000 ; 1
	db %11000000, %00100000, %01000000, %10000000, %11100000 ; 2
	db %11000000, %00100000, %01000000, %00100000, %11000000 ; 3
	db %10100000, %10100000, %11100000, %00100000, %00100000 ; 4
	db %11100000, %10000000, %11000000, %00100000, %11000000 ; 5
	db %01100000, %10000000, %11100000, %10100000, %11100000 ; 6
	db %11100000, %00100000, %01000000, %01000000, %01000000 ; 7
	db %11100000, %10100000, %11100000, %10100000, %11100000 ; 8
	db %11100000, %10100000, %11100000, %00100000, %11000000 ; 9
	db %00100000, %00100000, %01000000, %10000000, %10000000 ; /
	db %10000000, %11000000, %11100000, %11000000, %10000000 ; ▶
	db %00000000, %00000000, %00000000, %00000000, %01000000 ; .
	db %00000000, %00000000, %11100000, %00000000, %00000000 ; -
	db %01000000, %01000000, %00000000, %00000000, %00000000 ; '
	db %11000000, %00100000, %01000000, %00000000, %01000000 ; ?
	db %01000000, %01000000, %01000000, %00000000, %01000000 ; !
	db %01100000, %00100000, %11100000, %10100000, %11100000 ; ♂
	db %11100000, %10100000, %11100000, %01000000, %11100000 ; ♀
	db %00000000, %01000000, %00000000, %01000000, %00000000 ; :
	assert @ - PartyCardTinyFont == 46 * 5

; Palettes --------------------------------------------------------------------------------

PartyCardsLoadPals::
; The card palettes 0-6 into wBGPals1, and the favorite's star into OBJ palette 7.
	ldh a, [rSVBK]
	push af
	ld a, BANK(wOBPals1)
	ldh [rSVBK], a
	ld hl, PartyCardStarPal
	ld de, wOBPals1 + 7 palettes
	ld bc, 1 palettes
	rst CopyBytes
	pop af
	ldh [rSVBK], a
	xor a
	jr PartyCards_WritePals

PartyCardStarPal:
	RGB 31, 31, 31 ; (transparent)
	RGB 31, 25, 04 ; gold
	RGB 31, 31, 24 ; (unused)
	RGB 14, 08, 00 ; outline

PartyCardsUpdatePals::
; The card palettes 0-6 into wBGPals1 and wBGPals2, shown at once (cursor moves).
	ld a, 1
PartyCards_WritePals:
	ldh [hBuffer], a
	ldh a, [rSVBK]
	push af
	ld a, [wPartyCount]
	ld c, 0
.loop
	push bc
	; the fill: the cursor's card or the one being moved, else the state's
	ld a, PC_WRAM
	ldh [rSVBK], a
	ld a, c
	add LOW(PC_DATA + PCS_STATE)
	ld l, a
	ld h, HIGH(PC_DATA)
	ld b, [hl] ; state
	ld a, 1
	ldh [rSVBK], a
	ld a, c
	inc a
	ld hl, wMenuCursorY
	cp [hl]
	jr z, .selected
	ld hl, wSwitchMon
	cp [hl]
	ld a, PCFILL_HELD
	jr z, .got_fill
	ld a, b
	and %11
	jr .got_fill
.selected
	ld a, PCFILL_SELECTED
.got_fill
	ld hl, PartyCardFillColors
	add a
	add a
	ld e, a
	ld d, 0
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
	ld c, l ; bc = the bar color
	pop hl ; hl = the fill color
	pop de
	push de
	ld a, e ; the palette
	call .Write
	pop bc
	inc c
	ld a, c
	cp PARTY_LENGTH
	jr c, .loop
	; the bottom bar: the button is selected when the cursor is on Cancel
	ld a, 1
	ldh [rSVBK], a
	ld a, [wPartyCount]
	inc a
	ld hl, wMenuCursorY
	cp [hl]
	ld hl, PartyCardFillColors + PCFILL_NORMAL * 4
	jr nz, .got_button
	ld hl, PartyCardFillColors + PCFILL_SELECTED * 4
.got_button
	ld bc, .BarColors
	ld a, 6
	call .Write
	pop af
	ldh [rSVBK], a
	ldh a, [hBuffer]
	and a
	ret z
	ld a, TRUE
	ldh [hCGBPalUpdate], a
	ret

.BarColors:
	dw PARTY_CARD_NAVY, PARTY_CARD_WHITE

.Write:
; Palette a: for a card, the color at hl, the color at bc, the background, black;
; for the bar (a = 6): navy and white (bc), the color at hl, black.
	push af
	ld e, a
	ld a, BANK(wBGPals1)
	ldh [rSVBK], a
	ld a, e
	add a
	add a
	add a
	ld e, a
	ld d, 0
	push hl
	ld hl, wBGPals1
	add hl, de
	ld d, h
	ld e, l
	pop hl
	pop af
	push af
	call .WriteOne
	ldh a, [hBuffer]
	and a
	jr z, .no_second
	push hl
	ld hl, wBGPals2 - wBGPals1 - 1 palettes
	add hl, de
	ld d, h
	ld e, l
	pop hl
	pop af
	jr .WriteOne
.no_second
	pop af
	ret

.WriteOne:
; 4 colors to de (as .Write says). Preserves hl and bc; de ends after them.
	cp 6
	jr z, .bar
	; a card: its color, its HP bar color, the background, its dark color
	push hl
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	push hl
	ld h, b
	ld l, c
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	inc de
	ld a, LOW(PARTY_CARD_BG)
	ld [de], a
	inc de
	ld a, HIGH(PARTY_CARD_BG)
	ld [de], a
	inc de
	pop hl
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	inc de
	pop hl
	ret

.bar
	push hl
	ld h, b
	ld l, c
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	inc de
	pop hl
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hld]
.black
	ld [de], a
	inc de
	ld a, LOW(PARTY_CARD_BLACK)
	ld [de], a
	inc de
	ld a, HIGH(PARTY_CARD_BLACK)
	ld [de], a
	inc de
	ret

DEF PARTY_CARD_BG    EQU (3 << 0) | (12 << 5) | (13 << 10) ; dark teal
DEF PARTY_CARD_BLACK EQU (2 << 0) | (3 << 5) | (6 << 10)
DEF PARTY_CARD_NAVY  EQU (4 << 0) | (6 << 5) | (13 << 10)
DEF PARTY_CARD_WHITE EQU (31 << 0) | (31 << 5) | (31 << 10)

PartyCardFillColors:
; indexed by PCFILL_*: the card color, then its color 3 (text, capsules: black)
	RGB 20, 24, 30, 02, 03, 06 ; normal: blue
	RGB 25, 21, 28, 02, 03, 06 ; lead: dusty lilac
	RGB 25, 25, 25, 02, 03, 06 ; fainted: silver
	RGB 30, 26, 10, 02, 03, 06 ; selected: yellow
	RGB 14, 28, 28, 02, 03, 06 ; held (being moved): cyan

PartyCardBarColors:
; indexed by HP_GREEN, HP_YELLOW, HP_RED
	RGB 06, 24, 08
	RGB 31, 24, 00
	RGB 28, 05, 05
	RGB 06, 24, 08

; The cursor --------------------------------------------------------------------------------

PartyCardsJoypad::
; The party menu's input (instead of StaticMenuJoypad): the D-pad moves wMenuCursorY over the
; cards (1-6, two columns) and Cancel (wPartyCount + 1, if w2DMenuNumRows has it) until A or
; B. With PARTYMENU_REORDER_F set in wPartyMenuActionText, Select picks the Pokémon up to
; move it. Returns a = b = [hJoyLast].
	call PartyCardsUpdatePals
.loop
	farcall PlaySpriteAnimationsAndDelayFrame
	call JoyTextDelay
	ldh a, [hJoyLast]
	ld b, a
	and A_BUTTON | B_BUTTON
	jr nz, .done
	bit SELECT_F, b
	jr nz, .select
	call PartyCards_DPad
	jr .loop

.select
	ld a, [wPartyMenuActionText]
	bit PARTYMENU_REORDER_F, a
	jr z, .loop
	ld a, [wPartyCount]
	cp 2
	jr c, .loop
	ld a, [wMenuCursorY]
	call PartyCards_IsCancel
	jr z, .loop
	call PartyCards_MoveMode
	jr .loop

.done
	ld a, b
	ret

PartyCards_DPad:
; Move the cursor for the D-pad buttons in b.
	ld a, [wMenuCursorY]
	ld c, a
	ld a, b
	bit D_UP_F, a
	jr nz, .up
	bit D_DOWN_F, a
	jr nz, .down
	bit D_LEFT_F, a
	jr nz, .left
	bit D_RIGHT_F, a
	ret z
; right: from the left column to the card on its right
	ld a, c
	call PartyCards_IsCancel
	ret z
	bit 0, c
	ret z
	inc c
	ld a, [wPartyCount]
	cp c
	ret c
	jr .moved

.left
	ld a, c
	call PartyCards_IsCancel
	ret z
	bit 0, c
	ret nz
	dec c
	jr .moved

.down
	ld a, c
	call PartyCards_IsCancel
	jr z, .wrap_top
	inc c
	inc c
	ld a, [wPartyCount]
	cp c
	jr nc, .moved
	; past the last card: Cancel, else back to the top
	call PartyCards_HasCancel
	jr z, .wrap_top
	ld a, [wPartyCount]
	inc a
	ld c, a
	jr .moved
.wrap_top
	ld c, 1
	jr .moved

.up
	ld a, c
	call PartyCards_IsCancel
	jr z, .to_last
	dec c
	dec c
	jr z, .from_top
	bit 7, c
	jr z, .moved
.from_top
	; above the top row: Cancel, else the last card
	call PartyCards_HasCancel
	jr z, .to_last
	ld a, [wPartyCount]
	inc a
	ld c, a
	jr .moved
.to_last
	ld a, [wPartyCount]
	ld c, a
.moved
	ld a, c
	ld [wMenuCursorY], a
	jmp PartyCardsUpdatePals

PartyCards_IsCancel:
; z if a is the Cancel entry
	ld e, a
	ld a, [wPartyCount]
	inc a
	cp e
	ret

PartyCards_HasCancel:
; nz if the menu has a Cancel entry
	ld a, [wPartyCount]
	ld e, a
	ld a, [w2DMenuNumRows]
	cp e
	ret

PartyCards_MoveMode:
; Select on a card: "Move to where?" with that card held. A on another card swaps the two;
; B, Select or A on the held card puts it back.
	ld de, SFX_READ_TEXT_2
	call PlaySFX
	ld a, [wMenuCursorY]
	ld [wSwitchMon], a
	farcall HoldSwitchmonIcon
	ld a, [w2DMenuNumRows]
	push af
	ld a, [wPartyCount]
	ld [w2DMenuNumRows], a ; no Cancel
	ld a, [wPartyMenuActionText]
	push af
	and $f0
	or PARTYMENUACTION_MOVE
	ld [wPartyMenuActionText], a
	call DrawPartyMenuBar
	call PartyCardsUpdatePals
.loop
	farcall PlaySpriteAnimationsAndDelayFrame
	call JoyTextDelay
	ldh a, [hJoyLast]
	ld b, a
	and B_BUTTON | SELECT
	jr nz, .put_back
	bit A_BUTTON_F, b
	jr nz, .drop
	call PartyCards_DPad
	jr .loop

.drop
	ld a, [wSwitchMon]
	ld b, a
	ld a, [wMenuCursorY]
	cp b
	jr z, .put_back
	farcall _SwitchPartyMons
	ld a, [wMenuCursorY]
	ld [wPartyMenuCursor], a
	call .Restore
	farcall InitPartyMenuWithCancel
	jr PartyCardsRedrawSwitched

.put_back
	ld de, SFX_READ_TEXT_2
	call PlaySFX
	call .Restore
	farcall UnfreezeMonIcons
	call DrawPartyMenuBar
	jmp PartyCardsUpdatePals

.Restore:
	pop hl ; return address
	pop af
	ld [wPartyMenuActionText], a
	pop af
	ld [w2DMenuNumRows], a
	push hl
	xor a
	ld [wSwitchMon], a
	ret

PartyCardsRedrawSwitched::
; After _SwitchPartyMons (which shows both cards as empty slots): the bar, then the two cards
; and their icons together.
	call DrawPartyMenuBar
	call PartyCards_SwapIcons
	farcall UnfreezeMonIcons
	ld a, [wSwitchMonFrom]
	call .Bit
	ld b, a
	ld a, [wSwitchMonTo]
	call .Bit
	or b
	jmp PartyCardsRedraw

.Bit:
; a = 1 << a
	inc a
	ld c, a
	xor a
	scf
.shift
	rla
	dec c
	jr nz, .shift
	ret

PartyCardsRefresh::
; The party menu again after a submenu changed a Pokémon (an item taken or swapped): every
; card, then every icon, drawn over the cards still on the screen.
	farcall InitPartyMenuWithCancel
	call DrawPartyCards
	call DrawPartyMenuBar
	; (the icons on the screen stay until the new ones are loaded)
	farcall ClearSpriteAnims2
	farjp InitPartyMenuGFX

PartyCards_SwapIcons:
; Swap the icons' tiles and animation between the structs of cards [wSwitchMonFrom] and
; [wSwitchMonTo] (each struct keeps its place), so each card's icon is its new Pokémon's.
	ld a, [wSwitchMonFrom]
	call .Struct
	ld d, h
	ld e, l
	ld a, [wSwitchMonTo]
	call .Struct
	; the fields that go with the Pokémon: FRAMESET_ID, TILE_ID and DURATION to VAR4
	assert SPRITEANIMSTRUCT_LENGTH == 16 && SPRITEANIMSTRUCT_DURATION == 8
	lb bc, %11111111, (1 << SPRITEANIMSTRUCT_FRAMESET_ID) | (1 << SPRITEANIMSTRUCT_TILE_ID)
	ld a, SPRITEANIMSTRUCT_LENGTH
.loop
	push af
	srl b
	rr c
	jr nc, .next
	ld a, [de]
	push af
	ld a, [hl]
	ld [de], a
	pop af
	ld [hl], a
.next
	inc hl
	inc de
	pop af
	dec a
	jr nz, .loop
	ret

.Struct:
; hl = card a's icon struct
	swap a
	ld l, a
	ld h, 0
	ld bc, wSpriteAnimationStructs
	add hl, bc
	ret

PartyCards_HideIcon:
; Hide icon a's OAM entries until the icons' next frame. The icons' structs come first and
; write 4 entries each, 5 with the favorite's star.
	ld hl, wSpriteAnimationStructs + SPRITEANIMSTRUCT_FRAMESET_ID
	ld de, wShadowOAMSprite00
	inc a
	ld c, a
.loop
	ld b, 4
	ld a, [hl]
	cp SPRITE_ANIM_FRAMESET_PARTY_MON_FAV
	jr c, .got_count
	inc b
.got_count
	dec c
	jr z, .hide
	push bc
	ld bc, SPRITEANIMSTRUCT_LENGTH
	add hl, bc
	pop bc
	ld a, b
	add a
	add a ; * SPRITEOAMSTRUCT_LENGTH
	add e
	ld e, a
	jr .loop
.hide
	ld h, d
	ld l, e
	ld de, SPRITEOAMSTRUCT_LENGTH
.hide_loop
	ld [hl], OAM_YCOORD_HIDDEN
	add hl, de
	dec b
	jr nz, .hide_loop
	ret

PartyCardsFollowItem::
; a = the party submenu's MONMENUITEM_FOLLOW or _UNFOLLOW for wCurPartyMon, or 0 with
; followers turned off.
	ld a, [wOptions2]
	bit FOLLOWER_OFF, a
	ld a, 0
	ret nz
	ld a, MON_MARKS
	call GetPartyParamLocation
	bit MON_FAVORITE_F, [hl]
	ld a, MONMENUITEM_FOLLOW
	ret z
	ld a, MONMENUITEM_UNFOLLOW
	ret

PartyCardsFollow::
; Party submenu > Follow / Unfollow: make wCurPartyMon the favorite (the one Pokémon that
; follows the player; any other loses the mark), or clear its mark. Returns the party
; menu's action code in a (4: back to it as it is).
	ld a, MON_MARKS
	call GetPartyParamLocation
	bit MON_FAVORITE_F, [hl]
	jr nz, .unfollow
	; clear every mark, then set this one
	push hl
	ld hl, wPartyMon1 + MON_MARKS
	ld bc, PARTYMON_STRUCT_LENGTH
	ld a, [wPartyCount]
	ld e, a
.clear
	res MON_FAVORITE_F, [hl]
	add hl, bc
	dec e
	jr nz, .clear
	pop hl
	set MON_FAVORITE_F, [hl]
	ld de, SFX_FULL_HEAL
	jr .done
.unfollow
	res MON_FAVORITE_F, [hl]
	ld de, SFX_SWITCH_POKEMON
.done
	call PlaySFX
	farcall InitPartyMenuWithCancel
	farcall UnfreezeMonIcons
	call PartyCards_UpdateStars
	xor a ; the menu closed over the cards: show them again, no card changed
	call PartyCardsRedraw
	ld a, 4
	ret

PartyCards_UpdateStars:
; Every icon's frameset with or without the favorite's star, and the star's tile in the
; favorite's icon tiles.
	ld hl, wSpriteAnimationStructs
	ld de, wPartyMon1 + MON_MARKS
	ld a, [wPartyCount]
	ld c, a
.loop
	push bc
	push hl
	ld bc, SPRITEANIMSTRUCT_FRAMESET_ID
	add hl, bc
	ld a, [hl]
	cp SPRITE_ANIM_FRAMESET_PARTY_MON_FAV
	jr c, .plain
	sub SPRITE_ANIM_FRAMESET_PARTY_MON_FAV - SPRITE_ANIM_FRAMESET_PARTY_MON
.plain
	ld b, a
	ld a, [de]
	bit MON_FAVORITE_F, a
	ld a, b
	jr z, .set
	add SPRITE_ANIM_FRAMESET_PARTY_MON_FAV - SPRITE_ANIM_FRAMESET_PARTY_MON
	ld [hli], a
	inc hl ; SPRITEANIMSTRUCT_TILE_ID
	assert SPRITEANIMSTRUCT_TILE_ID == SPRITEANIMSTRUCT_FRAMESET_ID + 2
	ld a, [hl]
	push de
	call PartyCards_LoadStarTile
	pop de
	jr .next
.set
	ld [hl], a
.next
	pop hl
	ld bc, SPRITEANIMSTRUCT_LENGTH
	add hl, bc
	ld a, e
	add LOW(PARTYMON_STRUCT_LENGTH)
	ld e, a
	adc d
	sub e
	ld d, a
	pop bc
	dec c
	jr nz, .loop
	ret

PartyCardsIconStar::
; For the party menu's icon bc (party slot [hObjectStructIndex]), loaded at the tiles before
; wCurIconTile: a tile more for the favorite's star (loaded if it's the favorite, then
; its frameset with the star).
	ld a, [wCurIconTile]
	inc a
	ld [wCurIconTile], a
	ldh a, [hObjectStructIndex]
	ld hl, wPartyMon1 + MON_MARKS
	push bc
	ld bc, PARTYMON_STRUCT_LENGTH
	rst AddNTimes
	pop bc
	bit MON_FAVORITE_F, [hl]
	ret z
	ld hl, SPRITEANIMSTRUCT_FRAMESET_ID
	add hl, bc
	ld a, [hl]
	add SPRITE_ANIM_FRAMESET_PARTY_MON_FAV - SPRITE_ANIM_FRAMESET_PARTY_MON
	ld [hl], a
	ld hl, SPRITEANIMSTRUCT_TILE_ID
	add hl, bc
	ld a, [hl]
	push bc
	call PartyCards_LoadStarTile
	pop bc
	ret

PartyCards_LoadStarTile:
; The star into OBJ tile a + 10 (after an icon's 8 tiles and the mail and item marks).
	add 10
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	ld de, vTiles0
	add hl, de
	ld de, PartyCardStarGFX
	lb bc, BANK(PartyCardStarGFX), 1
	jmp Request2bpp

PartyCardStarGFX:
	dw `00030000
	dw `00313000
	dw `33111330
	dw `31111130
	dw `03111300
	dw `31131130
	dw `33000330
	dw `00000000

PartyCardsHidePrompt::
; Blank the prompt (a submenu is opening over the bar).
	hlcoord 0, PC_BAR_Y + 1
	ld bc, PC_PROMPT_TILES
	ld a, PCT_NAVY
	rst ByteFill
	ret

; The HP bar animation (wWhichHPBar 2) ----------------------------------------------------

PartyCardsAnimateHP::
; AnimateHPBar for the party menu: card wCurPartyMon's bar and numbers go from wHPBuffer2
; to wHPBuffer3 (max wHPBuffer1; little endian).
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
	ld de, wCurBaseData
	ld hl, PC_SAVE
	ld c, BASE_DATA_SIZE
	call PartyCards_CopyTo6
	ld a, [wCurPartyMon]
	call PartyCards_Gather
	ld hl, PC_SAVE
	ld de, wCurBaseData
	ld c, BASE_DATA_SIZE
	call PartyCards_CopyFrom6
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
	; step = |new - old| / 32, at least 1
	ld hl, wHPBuffer2
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a ; bc = old
	ld a, [hli]
	ld h, [hl]
	ld l, a ; hl = new
	push hl
	ld a, l
	sub c
	ld l, a
	ld a, h
	sbc b
	ld h, a
	jr nc, .positive
	ld a, l
	cpl
	ld l, a
	ld a, h
	cpl
	ld h, a
	inc hl
.positive
	; for the "recovered N HP" text (big endian)
	ld a, h
	ld [wCurHPAnimDeltaHP], a
	ld a, l
	ld [wCurHPAnimDeltaHP + 1], a
	ld a, 5
.div
	srl h
	rr l
	dec a
	jr nz, .div
	ld a, h
	or l
	jr nz, .got_step
	inc l
.got_step
	ld d, h
	ld e, l ; de = step
	pop hl ; hl = new
.loop
	; bc moves toward hl by de, without passing it
	ld a, l
	sub c
	ld a, h
	sbc b
	jr c, .down
	ld a, c
	add e
	ld c, a
	ld a, b
	adc d
	ld b, a
	ld a, l
	sub c
	ld a, h
	sbc b
	jr nc, .show
	ld b, h
	ld c, l
	jr .show
.down
	ld a, c
	sub e
	ld c, a
	ld a, b
	sbc d
	ld b, a
	jr c, .clamp
	ld a, l
	sub c
	ld a, h
	sbc b
	jr c, .show
.clamp
	ld b, h
	ld c, l
.show
	push hl
	push de
	push bc
	call .Show
	pop bc
	pop de
	pop hl
	ld a, l
	cp c
	jr nz, .loop
	ld a, h
	cp b
	jr nz, .loop
	ret

.Show:
; Show HP bc on the card.
	ld a, b
	push bc
	ld c, PCD_HP
	call PartyCards_Store
	pop bc
	ld a, c
	ld c, PCD_HP + 1
	call PartyCards_Store
	ld a, b
	or c
	push af ; z: fainted
	ld c, PCD_MAXHP
	call PartyCards_Load
	ld d, a
	inc c
	call PartyCards_Load
	ld e, a
	ld c, PCD_HP
	call PartyCards_Load
	ld b, a
	inc c
	call PartyCards_Load
	ld c, a
	call PartyCards_BarPixels ; a = pixels, d = HP color
	ld c, PCD_BARPX
	call PartyCards_Store
	; the state: its HP color, fainted or not
	ld a, [wCurPartyMon]
	add PCS_STATE
	ld c, a
	call PartyCards_Load
	and %10000011
	ld b, a
	ld a, d
	swap a
	or b
	ld b, a
	pop af
	ld a, b
	jr z, .fainted
	and %11
	cp PCFILL_FAINTED
	ld a, b
	jr nz, .got_state
	and %11111100 ; PCFILL_NORMAL (the lead stays the lead below)
	ld b, a
	ld a, [wCurPartyMon]
	and a
	ld a, b
	jr nz, .got_state
	or PCFILL_LEAD
	jr .got_state
.fainted
	and %11111100
	or PCFILL_FAINTED
.got_state
	call PartyCards_Store
	ld a, [wCurPartyMon]
	call PartyCards_Render
	jmp PartyCardsUpdatePals

; Text boxes and menus over the cards -------------------------------------------------------

PartyCardsTextboxHook::
; The end of TextboxPalette: over the cards (whose tiles come from VRAM bank 1), show the
; box with its attributes at once. Preserves every register.
	push af
	call PartyCards_OnScreen
	jr nz, .done
	push bc
	push de
	push hl
	call PartyCards_ShowTilemap
	pop hl
	pop de
	pop bc
.done
	pop af
	ret

ApplyTilemapNoSpriteUpdates::
; ApplyTilemap without sprite updates: WaitBGMap, or over the cards CopyTilemapAtOnce (a menu
; closing over them restores their bank 1 attributes too).
	call PartyCards_OnScreen
	jr z, PartyCards_ShowTilemap
	ld a, 1
	ldh [hBGMapMode], a
	ld c, 4
	jmp DelayFrames

PartyCards_ShowTilemap:
; CopyTilemapAtOnce, with the icons a menu now covers hidden a frame before (the copy takes
; a few frames with interrupts off) and the ones it uncovers shown after.
	farcall PlaySpriteAnimations
	call DelayFrame
	call CopyTilemapAtOnce
	farjp PlaySpriteAnimations

PartyCards_OnScreen:
; z if the party menu's cards are on the screen (card 1's attributes at the top left) and
; the LCD is on.
	ldh a, [hCGB]
	and a
	jr z, .no
	ldh a, [rLCDC]
	bit rLCDC_ENABLE, a
	jr z, .no
	ld a, [wAttrmap]
	cp VRAM_BANK_1
	ret nz
	ld a, [wAttrmap + 1]
	cp VRAM_BANK_1
	ret
.no
	or 1
	ret

; Submenu actions ---------------------------------------------------------------------------

PartyCardsNickname::
; Party submenu > Nickname: the naming screen for wCurPartyMon (not for Pokémon from a
; trade). Returns the party menu's action code in a.
	farcall CheckIfMonIsYourOT
	jr c, .traded
	call LoadStandardMenuHeader
	call ClearSprites
	xor a ; PARTYMON
	ld [wMonType], a
	ld a, [wCurPartySpecies]
	ld [wNamedObjectIndex], a
	ld [wCurSpecies], a
	call GetBaseData
	; (NamingScreen, not _NamingScreen: that one returns to the overworld)
	ld b, NAME_MON
	ld de, wStringBuffer2
	farcall NamingScreen
	; an empty name keeps the old one
	farcall IsNewNameEmpty
	jr c, .done
	ld hl, wPartyMonNicknames
	ld bc, MON_NAME_LENGTH
	ld a, [wCurPartyMon]
	rst AddNTimes
	ld d, h
	ld e, l
	ld hl, wStringBuffer2
	ld bc, MON_NAME_LENGTH
	rst CopyBytes
.done
	; the party menu comes back behind blank palettes (its tiles are the naming screen's now)
	call ClearBGPalettes
	call ClearSprites
	call ExitMenu
	xor a ; reload the party menu
	ret

.traded
	ld hl, .TradedText
	call MenuTextboxBackup
	ld a, 1 ; redraw the party menu
	ret

.TradedText:
	text_ram wStringBuffer1
	text " came from"
	line "a trade. Its name"
	cont "can't be changed."
	prompt

PartyCardsSwapItem::
; Party submenu > Item > Swap: move wCurPartyMon's held item to another party Pokémon,
; swapping it with that one's item. wMonOrItemNameBuffer holds its nickname.
	call PartyCards_HeldItem
	ld a, [hl]
	and a
	ld hl, .NotHoldingText
	jmp z, .message
	ld d, a
	farcall ItemIsMail
	ld hl, .MailText
	jmp c, .message
	; pick the other Pokémon
	ld a, [wCurPartyMon]
	push af
	inc a
	ld [wSwitchMon], a
	farcall HoldSwitchmonIcon
	ld a, PARTYMENUACTION_GIVE_ITEM ; "To which Pokémon?"
	ld [wPartyMenuActionText], a
	farcall InitPartyMenuWithCancel
	call DrawPartyCards
	call DrawPartyMenuBar
	call WaitBGMap
	call SetDefaultBGPAndOBP
	farcall PartyMenuSelect
	pop bc ; b = the first Pokémon
	jmp c, .cancel
	ld a, [wCurPartyMon]
	cp b
	jmp z, .cancel
	ld a, [wCurPartySpecies]
	cp EGG
	ld hl, .EggText
	jr z, .target_message
	call PartyCards_HeldItem
	ld a, [hl]
	ld c, a ; the target's item
	and a
	jr z, .target_ok
	push bc
	ld d, a
	farcall ItemIsMail
	pop bc
	ld hl, .MailText
	jr c, .target_message
.target_ok
	; the names: the target in wStringBuffer2, the item in wStringBuffer3
	push bc
	ld a, [wCurPartyMon]
	ld hl, wPartyMonNicknames
	call GetNickname
	ld hl, wStringBuffer1
	ld de, wStringBuffer2
	ld bc, MON_NAME_LENGTH
	rst CopyBytes
	pop bc
	push bc
	ld a, b
	ld [wCurPartyMon], a
	call PartyCards_HeldItem
	ld a, [hl]
	ld [wNamedObjectIndex], a
	call GetItemName
	ld hl, wStringBuffer1
	ld de, wStringBuffer3
	ld bc, ITEM_NAME_LENGTH
	rst CopyBytes
	pop bc
	; swap: the first Pokémon gets the target's item (c)
	call PartyCards_HeldItem
	ld e, [hl] ; its item
	ld [hl], c
	push bc
	ld a, [wPartyMenuCursor]
	dec a
	ld [wCurPartyMon], a
	call PartyCards_HeldItem
	ld [hl], e
	pop bc
	ld a, c
	and a
	ld hl, .MovedText
	jr z, .done_message
	ld hl, .SwappedText
.done_message
	call .Cleanup
	call MenuTextboxBackup
	ld a, 3 ; reload the party menu's graphics (the item marks)
	ret

.target_message
	push hl
	ld a, b
	ld [wCurPartyMon], a
	pop hl
	call .Cleanup
	call MenuTextboxBackup
	ld a, 3
	ret

.cancel
	ld a, b
	ld [wCurPartyMon], a
	call .Cleanup
	ld a, 3
	ret

.message
	call MenuTextboxBackup
	ld a, 3
	ret

.Cleanup:
	xor a
	ld [wSwitchMon], a
	ld [wPartyMenuActionText], a
	ret

.NotHoldingText:
	text_far _PokemonNotHoldingText
	text_end

.MailText:
	text "Mail can't be"
	line "moved this way."
	prompt

.EggText:
	text "An Egg can't hold"
	line "an item."
	prompt

.MovedText:
	text_ram wStringBuffer2
	text " is now"
	line "holding @"
	text_ram wStringBuffer3
	text "!"
	prompt

.SwappedText:
	text_ram wMonOrItemNameBuffer
	text " and"
	line "@"
	text_ram wStringBuffer2
	text " swapped"
	cont "their items!"
	prompt

PartyCards_HeldItem:
; hl = wCurPartyMon's held item. Preserves bc and de.
	push bc
	ld a, [wCurPartyMon]
	ld hl, wPartyMon1Item
	ld bc, PARTYMON_STRUCT_LENGTH
	rst AddNTimes
	pop bc
	ret
