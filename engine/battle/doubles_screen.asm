; The double battle screen (double battles phase 4; see claude/double-battles-phase4.md).
;
; Layout (tile coordinates), one entry per battler slot in DoublesSlotGeometry:
;   E1's pic 7x7 at (6, 0), E2's at (13, 0); P1's back pic 6x6 at (0, 7), P2's at (6, 7).
;   HP boxes, one tile row each, drawn into tiles in a 3x5 font: E1 (0, 1) and E2 (0, 3),
;   6 tiles; P1 (12, 9) and P2 (12, 11), 8 tiles. No HP numbers.
;   The text box is rows 13-17 (SpeechTextbox and TextScroll check hDoublesScreen).
; VRAM: E1 and P1 keep the singles tiles (bank 0, $00 and $31); E2 and P2 are in bank 1
; ($ab and $dc), above the room a front pic's animation frames take there; the HP boxes
; are bank 0 tiles $55-$70 (the singles HUD's, unused here).
; Palettes: pics 0 (P1), 1 (E1), 5 (P2), 6 (E2); HP boxes 2 (E1), 3 (P1), 4 (E2), 7 (P2;
; the text only uses its white and black). See _CGB_DoublesBattleColors.
;
; The screen is on while hDoublesScreen has DOUBLES_SCREEN_F (DoublesEnterScreen until
; DoublesLeaveScreen or the end of the battle). Each pic is on the screen while its slot is
; in wDoublesShown (from its send-out to its faint or withdrawal).

	assert DOUBLES_SCREEN_F == 0 ; tested with rra

; Tiles, first in the section (aligned) so they're copied with GDMA, safe in VRAM bank 1.
DoublesBlankTile:
	ds 1 tiles, 0

DoublesArrowGFX:
; The target arrow: solid color 3 (black in every OBJ palette)
	db $ff, $ff ; ########
	db $ff, $ff ; ########
	db $7e, $7e ; .######.
	db $3c, $3c ; ..####..
	db $18, $18 ; ...##...
	db $00, $00
	db $00, $00
	db $00, $00

rsreset
DEF DSG_PIC_X     rb
DEF DSG_PIC_Y     rb
DEF DSG_PIC_SIZE  rb
DEF DSG_PIC_TILE  rb
DEF DSG_PIC_ATTR  rb ; palette | VRAM_BANK_1
DEF DSG_HUD_X     rb
DEF DSG_HUD_Y     rb
DEF DSG_HUD_TILES rb ; the HP box's width
DEF DSG_HUD_TILE  rb ; its first tile (VRAM bank 0)
DEF DSG_HUD_PAL   rb
DEF DSG_LENGTH EQU _RS

DEF DOUBLES_PP_TILE    EQU $71 ; 4 tiles (VRAM bank 0): the move menu's PP
DEF DOUBLES_POWER_TILE EQU $75 ; 4 tiles (VRAM bank 0): the move menu's power (singles' HUD border tiles)
DEF DOUBLES_JUNCTION_TILE EQU $79 ; 2 tiles (VRAM bank 0): the move menu divider's "┬" and "┴" (unused in battle)
DEF DIVIDER_FRAME_BUF EQUS "(wDoublesTileBuf + 2 tiles)" ; 3 frame tiles (1bpp)
DEF DOUBLES_ARROW_TILE EQU NUM_TYPE_ICONS * TYPE_ICON_WIDTH ; VRAM bank 1 vTiles3, after the type icons
	assert DOUBLES_ARROW_TILE < $80
DEF DOUBLES_TARGET_ARROW_PAL EQU PAL_BATTLE_OB_YELLOW ; the target arrow's OBJ palette (the arrow only uses color 3)

; wDoublesPicKeys flags
DEF DOUBLES_PIC_SUB_F   EQU 0
DEF DOUBLES_PIC_MIN_F   EQU 1
DEF DOUBLES_PIC_VALID_F EQU 7

DEF DOUBLES_HUD_KEY_SIZE EQU 6 ; HP (2), status, level, marker, valid

; wDoublesScratch
DEF DSCR_AREA EQUS "wDoublesScratch + 0"
DEF DSCR_SLOT EQUS "wDoublesScratch + 1"
DEF DSCR_VBANK EQUS "wDoublesScratch + 2"
DEF DSCR_DEST EQUS "wDoublesScratch + 3" ; 2 bytes
DEF DSCR_COLUMNS EQUS "wDoublesScratch + 5"
DEF DSCR_ANIMSLOT EQUS "wDoublesScratch + 6"
DEF DSCR_STEP EQUS "wDoublesScratch + 7"
DEF DSCR_WIDTH EQUS "wDoublesScratch + 8" ; HP box width in pixels
DEF DSCR_BARPX EQUS "wDoublesScratch + 9"
DEF DSCR_RIGHTX EQUS "wDoublesScratch + 10"
DEF DSCR_HUDSLOT EQUS "wDoublesScratch + 11"
DEF DSCR_TEXT EQUS "wDoublesScratch + 12" ; 4 bytes
DEF DSCR_CURPX EQUS "wDoublesScratch + 16"
DEF DSCR_TARGETPX EQUS "wDoublesScratch + 17"
DEF DSCR_LEN EQUS "wDoublesScratch + 18"
DEF DSCR_FRAME EQUS "wDoublesScratch + 19"

	assert wDoublesHUDMaxHP + 2 - wDoublesHUDLevel == 7
	assert BATTLEMON_MAX_HP + 2 - BATTLEMON_LEVEL == 7
	assert wBattleMonMaxHP + 2 - wBattleMonLevel == 7
	assert wEnemyMonMaxHP + 2 - wEnemyMonLevel == 7
	assert wPlayerSubStatus4 - wPlayerSubStatus1 == 3
	assert wDoublesHUDKeys == wDoublesPicKeys + NUM_BATTLER_SLOTS * 2
	assert wDoublesHUDKeys + NUM_BATTLER_SLOTS * DOUBLES_HUD_KEY_SIZE == wDoublesSlotPals

DoublesSlotGeometry:
	table_width DSG_LENGTH
	; BATTLER_SLOT_P1
	db  0,  7, 6, $31, PAL_BATTLE_BG_PLAYER
	db 12,  9, 8, $61, PAL_BATTLE_BG_PLAYER_HP
	; BATTLER_SLOT_P2
	db  6,  7, 6, $dc, PAL_BATTLE_BG_5 | VRAM_BANK_1
	db 12, 11, 8, $69, PAL_BATTLE_BG_TEXT
	; BATTLER_SLOT_E1
	db  6,  0, 7, $00, PAL_BATTLE_BG_ENEMY
	db  0,  1, 6, $55, PAL_BATTLE_BG_ENEMY_HP
	; BATTLER_SLOT_E2
	db 13,  0, 7, $ab, PAL_BATTLE_BG_6 | VRAM_BANK_1
	db  0,  3, 6, $5b, PAL_BATTLE_BG_EXP
	assert_table_length NUM_BATTLER_SLOTS
	assert $ab + 7 * 7 == $dc && $dc + 6 * 6 == $100 ; E2 and P2 end vTiles4
	assert $7f + ($ab - $80) >= DOUBLES_MAX_PIC_TILES ; the frames end below E2 (GetAnimatedEnemyFrontpic)
	assert $55 + 6 + 6 + 8 + 8 == DOUBLES_PP_TILE
	assert DOUBLES_PP_TILE + 4 == DOUBLES_POWER_TILE && DOUBLES_POWER_TILE + 4 == DOUBLES_JUNCTION_TILE
	assert DOUBLES_JUNCTION_TILE + 2 <= " " ; $7f

; ---------------------------------------------------------------- entering and leaving

DoublesEnterScreen:
; Double battles, before the leads are sent out: both trainers slide out and the double
; battle screen starts (empty field, 5-row text box).
	hlcoord 18, 0
	ld a, 8
	farcall SlideBattlePicOut
	hlcoord 1, 5
	ld a, 9
	farcall SlideBattlePicOut
	ldh a, [hDoublesScreen]
	set DOUBLES_SCREEN_F, a
	ldh [hDoublesScreen], a
	xor a
	ld [wDoublesShown], a
	ld [wDoublesChooser], a
	call DoublesInitCaches
	call DoublesBlankBank1Space
	xor a
	ldh [hBGMapMode], a
	hlcoord 0, 0
	ld bc, (TEXTBOX_Y + 1) * SCREEN_WIDTH
	ld a, " "
	rst ByteFill
	farcall EmptyBattleTextbox
	farcall FinishBattleAnim
	call CopyTilemapAtOnce
	call LoadTilemapToTempTilemap
	ld a, 1
	ldh [hBGMapMode], a
	ret

DoublesLeaveScreen:
; Back to the singles layout (for the trainer's pic at the end of a double battle).
	ldh a, [hDoublesScreen]
	rra ; DOUBLES_SCREEN_F
	ret nc
	xor a
	ldh [hDoublesScreen], a
	ld [wDoublesShown], a
	ldh [hBGMapMode], a
	hlcoord 0, 0
	ld bc, (TEXTBOX_Y + 1) * SCREEN_WIDTH
	ld a, " "
	rst ByteFill
	farcall FinishBattleAnim
	call CopyTilemapAtOnce
	ld a, 1
	ldh [hBGMapMode], a
	ret

DoublesInitCaches:
; No pic or HP box is in VRAM yet; white pic palettes, green HP boxes.
	ldh a, [rSVBK]
	push af
	ld a, BANK(wDoublesPicKeys)
	ldh [rSVBK], a
	ld hl, wDoublesPicKeys
	ld bc, NUM_BATTLER_SLOTS * (2 + DOUBLES_HUD_KEY_SIZE)
	xor a
	rst ByteFill
	ld hl, wDoublesSlotPals
	ld b, NUM_BATTLER_SLOTS
.pal
	ld c, 3
.color
	ld a, LOW(PALRGB_WHITE)
	ld [hli], a
	ld a, HIGH(PALRGB_WHITE)
	ld [hli], a
	dec c
	jr nz, .color
	xor a
	ld [hli], a
	ld [hli], a
	dec b
	jr nz, .pal
	ld hl, wDoublesHPPals
	ld c, NUM_BATTLER_SLOTS
	ld a, HP_GREEN
.hp
	ld [hli], a
	dec c
	jr nz, .hp
	pop af
	ldh [rSVBK], a
	ret

DoublesInvalidateKeys:
; Every pic and HP box has to be loaded again (a menu used their tiles).
	ldh a, [rSVBK]
	push af
	ld a, BANK(wDoublesPicKeys)
	ldh [rSVBK], a
	ld hl, wDoublesPicKeys
	ld bc, NUM_BATTLER_SLOTS * (2 + DOUBLES_HUD_KEY_SIZE)
	xor a
	rst ByteFill
	pop af
	ldh [rSVBK], a
	ret

DoublesBlankBank1Space:
; Tile " " in VRAM bank 1 is blank too, so the bank 1 pics' empty cells can keep their
; attributes. (A front pic's frames never use tile $7f.)
	xor a
	ldh [hBGMapMode], a
	ld a, 1
	ldh [rVBK], a
	ld hl, vTiles2 tile " "
	ld de, DoublesBlankTile
	lb bc, BANK(DoublesBlankTile), 1
	call Get2bpp
	xor a
	ldh [rVBK], a
	ret

DoublesRestoreScreenGfx:
; After a menu (the party menu, the Pack, the stats screen) overwrote the screen's tiles:
; load every pic and HP box again. Only VRAM tiles; the menu's exit restores the tilemap.
	ldh a, [hDoublesScreen]
	rra ; DOUBLES_SCREEN_F
	ret nc
	call DoublesBlankBank1Space
	call DoublesInvalidateKeys
	ld c, 0
.loop
	ld a, c
	call DoublesSlotOnScreen
	jr z, .next
	push bc
	call DoublesLoadSlotPic
	pop bc
	push bc
	ld a, c
	call DoublesGatherHUD
	pop bc
	push bc
	ld a, c
	call DoublesRenderHUD
	pop bc
.next
	inc c
	ld a, c
	cp NUM_BATTLER_SLOTS
	jr nz, .loop
	ret

; ---------------------------------------------------------------- slot helpers

DoublesGetGeometry:
; hl = slot a's DoublesSlotGeometry entry. Preserves bc and de.
	push bc
	and %11
	ld hl, DoublesSlotGeometry
	ld bc, DSG_LENGTH
	rst AddNTimes
	pop bc
	ret

DoublesTilemapAddr:
; hl = wTilemap at (c, b). Preserves bc and de.
	push de
	ld hl, wTilemap
	ld de, SCREEN_WIDTH
	ld a, b
	and a
	jr z, .got_row
.row
	add hl, de
	dec a
	jr nz, .row
.got_row
	ld e, c
	ld d, 0
	add hl, de
	pop de
	ret

DoublesTileAddress:
; hl = the VRAM address of BG tile a ($8800 addressing). Preserves bc and de.
	push de
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	ld de, vTiles2
	cp $80
	jr c, .got_base
	ld de, vTiles0
.got_base
	add hl, de
	pop de
	ret

DoublesScrSlotMask:
; a = 1 << slot a. Preserves bc, de and hl.
	push bc
	and %11
	ld b, a
	inc b
	ld a, 1
.loop
	dec b
	jr z, .done
	add a
	jr .loop
.done
	pop bc
	ret

DoublesSlotOnScreen:
; nz if slot a's pic is on the screen (shown, not empty). Preserves a, bc, de and hl.
	push bc
	ld c, a
	call DoublesScrSlotMask
	ld b, a
	ld a, [wEmptyBattlerSlots]
	and b
	jr nz, .no
	ld a, [wDoublesShown]
	and b
	ld a, c
	pop bc
	ret

.no
	xor a
	ld a, c
	pop bc
	ret

DoublesSlotOffField:
; nz if slot a's battler is flying or underground (Fly, Dig: its pic stays hidden).
; Preserves a, bc, de and hl.
	push hl
	push bc
	ld c, a
	call DoublesScrIsLoaded
	jr nz, .stored
	ld a, [wPlayerSubStatus3]
	bit BATTLER_SLOT_ENEMY_F, c
	jr z, .got
	ld a, [wEnemySubStatus3]
	jr .got

.stored
	ld a, c
	ld hl, BSLOT_SUBSTATUS + 2 ; substatus 3
	farcall ReadBattlerSlotByte
.got
	and 1 << SUBSTATUS_FLYING | 1 << SUBSTATUS_UNDERGROUND
	ld a, c
	pop bc
	pop hl
	ret

DoublesSetShown:
; Slot a's pic is on the screen (c != 0) or not (c = 0). Preserves bc, de and hl.
	push hl
	call DoublesScrSlotMask
	ld hl, wDoublesShown
	inc c
	dec c
	jr z, .clear
	or [hl]
	ld [hl], a
	pop hl
	ret

.clear
	cpl
	and [hl]
	ld [hl], a
	pop hl
	ret

DoublesAreaSlot:
; a = the slot loaded in area a (0: the player's, 1: the enemy's). Preserves bc, de and hl.
	push hl
	ld hl, wAreaSlots
	and 1
	add l
	ld l, a
	adc h
	sub l
	ld h, a
	ld a, [hl]
	pop hl
	ret

DoublesScrIsLoaded:
; z if slot a is the one loaded in its side's area. Preserves a, bc, de and hl.
	push bc
	ld c, a
	and 1 << BATTLER_SLOT_ENEMY_F
	rrca
	call DoublesAreaSlot
	cp c
	ld a, c
	pop bc
	ret

DoublesAnimPicWriteOK:
; z if a battle animation may write the pic tiles of the battler in area a (0: the player's,
; 1: the enemy's) where singles has them: always in singles; on the double battle screen only
; for P1 and E1 (P2's and E2's pics are elsewhere; DoublesRefreshScreen reloads them).
	push hl
	ld l, a
	ldh a, [hDoublesScreen]
	rra ; DOUBLES_SCREEN_F
	jr nc, .ok
	ld a, l
	call DoublesAreaSlot
	and 1 ; P2 or E2?
	pop hl
	ret

.ok
	xor a
	pop hl
	ret

; ---------------------------------------------------------------- pics

DoublesCurrentPicKey:
; d = the species, e = the DOUBLES_PIC_* flags of the pic slot a's battler should show.
; Clobbers bc and hl.
	ld c, a
	call DoublesScrIsLoaded
	jr nz, .stored
	bit BATTLER_SLOT_ENEMY_F, c
	jr nz, .enemy
	ld a, [wBattleMonSpecies]
	ld d, a
	ld a, [wPlayerSubStatus4]
	ld b, a
	ld a, [wPlayerMinimized]
	jr .flags

.enemy
	ld a, [wEnemyMonSpecies]
	ld d, a
	ld a, [wEnemySubStatus4]
	ld b, a
	ld a, [wEnemyMinimized]
	jr .flags

.stored
	ld a, c
	ld hl, BSLOT_MON + BATTLEMON_SPECIES
	farcall ReadBattlerSlotByte
	ld d, a
	ld a, c
	ld hl, BSLOT_SUBSTATUS + 3 ; substatus 4
	farcall ReadBattlerSlotByte
	ld b, a
	ld a, c
	ld hl, BSLOT_MINIMIZED
	farcall ReadBattlerSlotByte
.flags
	ld e, 1 << DOUBLES_PIC_VALID_F
	and a
	jr z, .not_minimized
	set DOUBLES_PIC_MIN_F, e
.not_minimized
	bit SUBSTATUS_SUBSTITUTE, b
	ret z
	set DOUBLES_PIC_SUB_F, e
	ret

DoublesPicKeyAddr:
; hl = slot a's wDoublesPicKeys entry. Preserves bc and de.
	and %11
	add a
	add LOW(wDoublesPicKeys)
	ld l, a
	adc HIGH(wDoublesPicKeys)
	sub l
	ld h, a
	ret

DoublesPicKeyChanged:
; nz if slot a's pic in VRAM isn't the one its battler should show.
	push af
	call DoublesCurrentPicKey
	pop af
	call DoublesPicKeyAddr
	ldh a, [rSVBK]
	push af
	ld a, BANK(wDoublesPicKeys)
	ldh [rSVBK], a
	ld a, [hli]
	cp d
	jr nz, .done
	ld a, [hl]
	cp e
.done
	pop bc
	ld a, b
	ldh [rSVBK], a
	ret

DoublesLoadSlotPic:
; Load slot a's pic into its tiles (swapping its battler in if it isn't loaded).
	call DoublesScrIsLoaded
	jr nz, .stored
	and 1 << BATTLER_SLOT_ENEMY_F
	rrca
	jr DoublesLoadAreaPic

.stored
	farcall SwapInBattlerSlot
	push af ; the slot that was loaded before
	and 1 << BATTLER_SLOT_ENEMY_F
	rrca
	call DoublesLoadAreaPic
	pop af
	farjp SwapInBattlerSlot

DoublesLoadAreaPic:
; The pic of the battler loaded in area a (0: the player's, 1: the enemy's) goes into its
; slot's tiles: its substitute, minimized or normal pic (as GetBattleMonBackpic and
; GetEnemyMonFrontpic choose). Also its palette and wDoublesPicKeys entry.
	ld [DSCR_AREA], a
	call DoublesAreaSlot
	ld [DSCR_SLOT], a
	call DoublesGetGeometry
	ld bc, DSG_PIC_TILE
	add hl, bc
	ld a, [hli]
	ld c, a
	ld a, [hl]
	and VRAM_BANK_1
	ld [DSCR_VBANK], a
	ld a, c
	call DoublesTileAddress
	ld a, l
	ld [DSCR_DEST], a
	ld a, h
	ld [DSCR_DEST + 1], a
	; the key
	ld a, [DSCR_SLOT]
	call DoublesCurrentPicKey
	ld a, [DSCR_SLOT]
	call DoublesPicKeyAddr
	ldh a, [rSVBK]
	push af
	ld a, BANK(wDoublesPicKeys)
	ldh [rSVBK], a
	ld [hl], d
	inc hl
	ld [hl], e
	pop af
	ldh [rSVBK], a
	; the pic
	xor a
	ldh [hBGMapMode], a
	ld a, e
	and 1 << DOUBLES_PIC_SUB_F | 1 << DOUBLES_PIC_MIN_F
	jr z, .normal
	call DoublesSpecialPic
	jr .palette

.normal
	ld a, [wCurPartySpecies]
	push af
	ld a, [DSCR_AREA]
	and a
	jr nz, .enemy
	ld a, [wBattleMonSpecies]
	ld [wCurPartySpecies], a
	ld hl, wBattleMonDVs
	predef GetUnownLetter
	call DoublesPicVBank
	call .dest
	predef GetMonBackpic
	jr .loaded

.enemy
	ld a, [wEnemyMonSpecies]
	ld [wCurSpecies], a
	ld [wCurPartySpecies], a
	call GetBaseData
	ld hl, wEnemyMonDVs
	predef GetUnownLetter
	call DoublesPicVBank
	call .dest
	predef GetMonFrontpic
.loaded
	xor a
	ldh [rVBK], a
	pop af
	ld [wCurPartySpecies], a

.palette
	ld a, [DSCR_SLOT]
	ld hl, wDoublesSlotPals
	ld bc, 1 palettes
	rst AddNTimes
	ld d, h
	ld e, l
	ld a, [DSCR_AREA]
	farjp DoublesGetPicPalette

.dest
	ld a, [DSCR_DEST]
	ld e, a
	ld a, [DSCR_DEST + 1]
	ld d, a
	ret

DoublesPicVBank:
; Select the VRAM bank of the pic being loaded (DSCR_VBANK).
	xor a
	ldh [hBGMapMode], a
	ld a, [DSCR_VBANK]
	and a
	ret z
	ld a, 1
	ldh [rVBK], a
	ret

DoublesSpecialPic:
; The substitute's pic (e has DOUBLES_PIC_SUB_F) or the minimized pic, built in sScratch as
; BattleAnimCmd_RaiseSub and GetMinimizePic do, then loaded.
	push de
	xor a ; BANK(sScratch)
	call OpenSRAM
	ld hl, sScratch
	ld bc, 7 * 7 tiles
	xor a
	rst ByteFill
	pop de
	ld a, [DSCR_AREA]
	and a
	ld hl, .EnemyTiles
	jr nz, .got_side
	ld hl, .PlayerTiles
.got_side
	bit DOUBLES_PIC_SUB_F, e
	jr z, .minimized
	ld c, 4
.sub_loop
	push bc
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	push hl
	ld h, [hl]
	ld l, a
	ld bc, 1 tiles
	ld a, BANK(MonsterSpriteGFX)
	call FarCopyBytes
	pop hl
	inc hl
	pop bc
	dec c
	jr nz, .sub_loop
	jr .load

.minimized
	ld bc, 4 * 4 ; past the substitute's tiles
	add hl, bc
	ld a, [hli]
	ld e, a
	ld d, [hl]
	ld hl, MinimizePic
	ld bc, 1 tiles
	ld a, BANK(MinimizePic)
	call FarCopyBytes

.load
	call DoublesPicVBank
	ld a, [DSCR_DEST]
	ld l, a
	ld a, [DSCR_DEST + 1]
	ld h, a
	ld de, sScratch
	ld c, 7 * 7
	ld a, [DSCR_AREA]
	and a
	jr nz, .got_size
	ld c, 6 * 6
.got_size
	ld b, BANK(@)
	call Get2bpp
	xor a
	ldh [rVBK], a
	jmp CloseSRAM

.PlayerTiles:
	dw sScratch + (2 * 6 + 4) tiles, MonsterSpriteGFX + 4 tiles
	dw sScratch + (3 * 6 + 4) tiles, MonsterSpriteGFX + 5 tiles
	dw sScratch + (2 * 6 + 5) tiles, MonsterSpriteGFX + 6 tiles
	dw sScratch + (3 * 6 + 5) tiles, MonsterSpriteGFX + 7 tiles
	dw sScratch + (3 * 6 + 4) tiles ; minimized

.EnemyTiles:
	dw sScratch + (2 * 7 + 5) tiles, MonsterSpriteGFX + 0 tiles
	dw sScratch + (3 * 7 + 5) tiles, MonsterSpriteGFX + 1 tiles
	dw sScratch + (2 * 7 + 6) tiles, MonsterSpriteGFX + 2 tiles
	dw sScratch + (3 * 7 + 6) tiles, MonsterSpriteGFX + 3 tiles
	dw sScratch + (3 * 7 + 5) tiles ; minimized

DoublesPlacePic:
; Place slot a's pic in the tilemap with only its top c rows showing, at the bottom of its
; box (c = its size: the whole pic; 0: blank). The send-out and faint effects step c.
	call DoublesGetGeometry
	push bc
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld [DSCR_COLUMNS], a
	ld a, [hl]
	push af ; the first column's first tile
	call DoublesTilemapAddr
	pop af
	ld d, a
	pop bc
	ld a, [DSCR_COLUMNS]
	ld b, a ; size
	sub c
	ld e, a ; blank rows at the top
.column
	push hl
	ld c, 0
.row
	ld a, c
	cp e
	ld a, " "
	jr c, .put
	ld a, c
	sub e
	add d
.put
	ld [hl], a
	ld a, l
	add SCREEN_WIDTH
	ld l, a
	jr nc, .no_carry
	inc h
.no_carry
	inc c
	ld a, c
	cp b
	jr nz, .row
	pop hl
	inc hl
	ld a, d
	add b
	ld d, a
	ld a, [DSCR_COLUMNS]
	dec a
	ld [DSCR_COLUMNS], a
	jr nz, .column
	ret

DoublesHideAreaPic:
; DisappearUser on the double battle screen: blank the pic box of the battler in area a.
	call DoublesAreaSlot
	call DoublesGetGeometry
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ld a, [hl] ; size
	push af
	call DoublesTilemapAddr
	pop af
	ld b, a
	ld c, a
	jmp ClearBox

DoublesShowAreaPic:
; AppearUser on the double battle screen: place the pic of the battler in area a (its tiles
; already hold the right pic: GetBattleMonBackpic, DropPlayerSub...).
	call DoublesAreaSlot
	call DoublesSlotOnScreen
	ret z
	push af
	call DoublesGetGeometry
	ld de, DSG_PIC_SIZE
	add hl, de
	ld c, [hl]
	pop af
	jr DoublesPlacePic

DoublesPlaceField:
; Rows 0-12: blank, then the pics on the screen.
	hlcoord 0, 0
	ld bc, (TEXTBOX_Y + 1) * SCREEN_WIDTH
	ld a, " "
	rst ByteFill
	ld c, 0
.loop
	ld a, c
	call DoublesSlotOnScreen
	jr z, .next
	call DoublesSlotOffField
	jr nz, .next
	push bc
	call DoublesGetGeometry
	ld de, DSG_PIC_SIZE
	add hl, de
	ld a, c
	ld c, [hl]
	call DoublesPlacePic
	pop bc
.next
	inc c
	ld a, c
	cp NUM_BATTLER_SLOTS
	jr nz, .loop
	ret

DoublesBuildAttrmap:
; The double battle screen's attributes: each pic's palette (and VRAM bank), each HP box's
; palette (on its row); elsewhere the E1 HP box's
; palette on the field (as in singles, so screen-wide palette flashes include the empty field;
; palette 7 isn't flashed) and the text palette on the text box.
	hlcoord 0, 0, wAttrmap
	ld bc, (TEXTBOX_Y + 1) * SCREEN_WIDTH ; rows 0-12 (the text box is a row lower)
	ld a, PAL_BATTLE_BG_ENEMY_HP
	rst ByteFill
	ld bc, (SCREEN_HEIGHT - TEXTBOX_Y - 1) * SCREEN_WIDTH
	ld a, PAL_BATTLE_BG_TEXT
	rst ByteFill
	ld a, BATTLER_SLOT_E2
.loop
	push af
	call DoublesGetGeometry
	; the pic
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld d, a ; size
	inc hl
	ld a, [hli]
	ld e, a ; attributes
	push hl
	call DoublesTilemapAddr
	ld bc, wAttrmap - wTilemap
	add hl, bc
	ld b, d
	ld c, d
	ld a, e
	call .FillBox
	pop hl
	; the HP box
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld d, a ; width
	inc hl
	ld e, [hl] ; palette
	call DoublesTilemapAddr
	ld bc, wAttrmap - wTilemap
	add hl, bc
	ld b, 1
	ld c, d
	ld a, e
	call .FillBox
	pop af
	dec a
	cp -1
	jr nz, .loop
	ret

.FillBox:
; Fill c x b at hl with a.
	push bc
	push hl
.col
	ld [hli], a
	dec c
	jr nz, .col
	pop hl
	ld bc, SCREEN_WIDTH
	add hl, bc
	pop bc
	dec b
	jr nz, .FillBox
	ret

DoublesRefreshScreen:
; Redraw the screen: reload the pics that changed (a new battler, a substitute, Transform),
; place all four pics and HP boxes, palettes and attributes. Move animations still draw where
; singles has its pics (phase 5), so this cleans up after them too.
	ldh a, [hDoublesScreen]
	rra ; DOUBLES_SCREEN_F
	ret nc
	xor a
	ldh [hBGMapMode], a
	ld c, 0
.pics
	ld a, c
	call DoublesSlotOnScreen
	jr z, .next_pic
	push bc
	call DoublesPicKeyChanged
	pop bc
	jr z, .next_pic
	push bc
	ld a, c
	call DoublesLoadSlotPic
	pop bc
.next_pic
	inc c
	ld a, c
	cp NUM_BATTLER_SLOTS
	jr nz, .pics
	call DoublesPlaceField
	ld c, 0
.huds
	ld a, c
	call DoublesSlotOnScreen
	jr z, .next_hud
	push bc
	call DoublesDrawSlotHUD
	pop bc
.next_hud
	inc c
	ld a, c
	cp NUM_BATTLER_SLOTS
	jr nz, .huds
	farcall FinishBattleAnim
	call CopyTilemapAtOnce
	call LoadTilemapToTempTilemap ; (BattleMenu and others restore it)
	ld a, 1
	ldh [hBGMapMode], a
	ret

DoublesRevealAreaPic:
; The send-out of the battler loaded in area a: its pic (already loaded) rises into its box
; from the bottom, with the ball's sound (and the shiny sound).
	ld [DSCR_AREA], a
	call DoublesAreaSlot
	ld [DSCR_ANIMSLOT], a
	ld c, 1
	call DoublesSetShown
	ld a, [DSCR_ANIMSLOT]
	call DoublesInvalidateHUDKey ; a new battler: draw its name
	farcall FinishBattleAnim ; its palette
	ld de, SFX_BALL_POOF
	call PlaySFX
	xor a
	ldh [hBGMapMode], a
	ld a, 1
.step
	ld [DSCR_STEP], a
	ld c, a
	ld a, [DSCR_ANIMSLOT]
	call DoublesPlacePic
	call CopyTilemapAtOnce
	ld c, 2
	call DelayFrames
	ld a, [DSCR_ANIMSLOT]
	call DoublesGetGeometry
	ld bc, DSG_PIC_SIZE
	add hl, bc
	ld a, [DSCR_STEP]
	cp [hl]
	inc a
	jr c, .step
	ld a, [DSCR_AREA]
	and a
	jr nz, .enemy
	farcall BattleCheckPlayerShininess
	jr .checked
.enemy
	farcall BattleCheckEnemyShininess
.checked
	ret nc
	ld de, SFX_SHINE
	call PlaySFX
	jmp WaitSFX

DoublesDropAreaPic:
; The battler loaded in area a faints or is withdrawn: its pic sinks out of its box.
	call DoublesAreaSlot
	call DoublesSlotOnScreen
	ret z
	ld [DSCR_ANIMSLOT], a
	xor a
	ldh [hBGMapMode], a
	ld a, [DSCR_ANIMSLOT]
	call DoublesGetGeometry
	ld bc, DSG_PIC_SIZE
	add hl, bc
	ld a, [hl]
.step
	dec a
	ld [DSCR_STEP], a
	ld c, a
	ld a, [DSCR_ANIMSLOT]
	call DoublesPlacePic
	call CopyTilemapAtOnce
	ld c, 2
	call DelayFrames
	ld a, [DSCR_STEP]
	and a
	jr nz, .step
	ld a, [DSCR_ANIMSLOT]
	ld c, 0
	jmp DoublesSetShown

DoublesEnemyEntranceAnim:
; The send-out animation of the enemy battler just revealed (DoublesRevealAreaPic), at its
; slot. Its frames go into VRAM bank 1 only, below E2's and P2's pics. Carry if its pic is too
; big for that room (the caller plays its cry instead).
	ld b, DOUBLES_MAX_PIC_TILES
	farcall GetAnimatedFrontpicFrames
	ret c
	ld a, 1 ; the enemy's area
	call DoublesAreaSlot
	ld [DSCR_ANIMSLOT], a
	call DoublesGetGeometry
	ld a, [hli]
	ld c, a
	ld b, [hl]
	call DoublesTilemapAddr
	ld a, [DSCR_ANIMSLOT]
	cp BATTLER_SLOT_E2
	jr nz, .animate
	ldh a, [hDoublesScreen]
	set DOUBLES_PIC_ANIM_BANK1_F, a ; it ends on the copy of its pic in VRAM bank 1
	ldh [hDoublesScreen], a
.animate
	lb de, $0, ANIM_MON_SLOW
	predef AnimateFrontpic
	ldh a, [hDoublesScreen]
	res DOUBLES_PIC_ANIM_BANK1_F, a
	ldh [hDoublesScreen], a
	; back on its own tiles
	xor a
	ldh [hBGMapMode], a
	ld a, [DSCR_ANIMSLOT]
	ld c, 7
	call DoublesPlacePic
	call CopyTilemapAtOnce
	ld a, 1
	ldh [hBGMapMode], a
	and a
	ret

; ---------------------------------------------------------------- HP boxes

DoublesGatherHUD:
; wDoublesHUD*: the nickname, level, status, HP and max HP of slot a's battler.
	ld c, a
	call DoublesScrIsLoaded
	jr nz, .stored
	ld hl, wBattleMonNickname
	ld de, wBattleMonLevel
	bit BATTLER_SLOT_ENEMY_F, c
	jr z, .live
	ld hl, wEnemyMonNickname
	ld de, wEnemyMonLevel
.live
	push de
	ld de, wDoublesHUDName
	ld bc, MON_NAME_LENGTH
	rst CopyBytes
	pop hl
	ld de, wDoublesHUDLevel
	ld bc, 7
	rst CopyBytes
	ret

.stored
	push bc
	ld a, c
	ld hl, BSLOT_NICKNAME
	ld de, wDoublesHUDName
	ld c, MON_NAME_LENGTH
	farcall CopyFromBattlerSlot
	pop bc
	ld a, c
	ld hl, BSLOT_MON + BATTLEMON_LEVEL
	ld de, wDoublesHUDLevel
	ld c, 7
	farjp CopyFromBattlerSlot

DoublesHUDKeyAddr:
; hl = slot a's wDoublesHUDKeys entry. Preserves bc and de.
	push bc
	and %11
	ld hl, wDoublesHUDKeys
	ld bc, DOUBLES_HUD_KEY_SIZE
	rst AddNTimes
	pop bc
	ret

DoublesInvalidateHUDKey:
; Slot a's HP box has to be drawn again. Preserves a, bc and de.
	push af
	call DoublesHUDKeyAddr
	ldh a, [rSVBK]
	push af
	ld a, BANK(wDoublesHUDKeys)
	ldh [rSVBK], a
	ld bc, DOUBLES_HUD_KEY_SIZE - 1
	add hl, bc
	ld [hl], 0 ; not valid
	pop af
	ldh [rSVBK], a
	pop af
	ret

DoublesHUDKeyMatches:
; z if slot a's HP box in VRAM shows wDoublesHUD* (and its marker); else the new key is stored.
	push af
	call DoublesMarkerFlag
	ld b, a
	pop af
	call DoublesHUDKeyAddr
	ldh a, [rSVBK]
	push af
	ld a, BANK(wDoublesHUDKeys)
	ldh [rSVBK], a
	ld c, 0 ; differences
	ld a, [wDoublesHUDHP]
	call .check
	ld a, [wDoublesHUDHP + 1]
	call .check
	ld a, [wDoublesHUDStatus]
	call .check
	ld a, [wDoublesHUDLevel]
	call .check
	ld a, b
	call .check
	ld a, 1 ; valid
	call .check
	pop af
	ldh [rSVBK], a
	ld a, c
	and a
	ret

.check
	cp [hl]
	jr z, .same
	inc c
.same
	ld [hli], a
	ret

DoublesMarkerFlag:
; a = 1 if slot a is the player's battler choosing (wDoublesChooser), else 0. Clobbers b.
	inc a
	ld b, a
	ld a, [wDoublesChooser]
	cp b
	ld a, 0
	ret nz
	inc a
	ret

DoublesDrawAreaHUD:
; DrawPlayerHUD / DrawEnemyHUD on the double battle screen: the HP box of the battler loaded
; in area a (0: the player's, 1: the enemy's). e = its HP bar's length out of
; HP_BAR_LENGTH_PX, for SetHPPal.
	call DoublesAreaSlot
	call DoublesSlotOnScreen
	jr nz, DoublesDrawSlotHUD
	call DoublesClearSlotHUD
	ld e, HP_BAR_LENGTH_PX
	ret

DoublesClearAreaHUD:
; Clear the HP box of the battler loaded in area a.
	call DoublesAreaSlot
	; fallthrough

DoublesClearSlotHUD:
; Blank slot a's HP box in the tilemap.
	ld [DSCR_HUDSLOT], a
	call DoublesInvalidateHUDKey
	call DoublesGetGeometry
	ld bc, DSG_HUD_X
	add hl, bc
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ld e, [hl] ; width
	call DoublesTilemapAddr
	ld a, " "
.blank
	ld [hli], a
	dec e
	jr nz, .blank
	ret

DoublesDrawSlotHUD:
; Slot a's HP box: its tiles if what they show changed, then its place in the tilemap.
; e = its HP bar's length out of HP_BAR_LENGTH_PX.
	ld [DSCR_HUDSLOT], a
	call DoublesGatherHUD
DoublesDrawGatheredHUD:
; The same, for wDoublesHUD* as they are (DoublesAnimateAreaHPBar sets the HP).
	ld a, [DSCR_HUDSLOT]
	call DoublesHUDKeyMatches
	ld a, [DSCR_HUDSLOT]
	call nz, DoublesRenderHUD
	call DoublesPlaceHUD
	ld a, HP_BAR_LENGTH_PX
	call DoublesHPPixels
	ld e, a
	ret

DoublesPlaceHUD:
; Slot [DSCR_HUDSLOT]'s HP box tiles in the tilemap.
	ld a, [DSCR_HUDSLOT]
	call DoublesGetGeometry
	ld bc, DSG_HUD_X
	add hl, bc
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld e, a ; width
	ld d, [hl] ; first tile
	call DoublesTilemapAddr
.tiles
	ld a, d
	ld [hli], a
	inc d
	dec e
	jr nz, .tiles
	ret

DoublesRenderHUD:
; Draw slot a's HP box (wDoublesHUD*) into its tiles: the marker if it's choosing, the name,
; the level (or status) on the right, and the HP bar under them. Also its HP palette.
	ld [DSCR_HUDSLOT], a
	call DoublesGetGeometry
	ld bc, DSG_HUD_TILES
	add hl, bc
	ld a, [hl]
	add a
	add a
	add a
	ld [DSCR_WIDTH], a
	ldh a, [rSVBK]
	push af
	ld a, BANK(wDoublesTileBuf)
	ldh [rSVBK], a
	call DoublesClearTileBuf
	; the right side: the status, else the level
	ld hl, DSCR_TEXT
	call DoublesRightText ; hl = its string, a = its width
	ld b, a
	ld a, [DSCR_WIDTH]
	dec a
	sub b
	ld [DSCR_RIGHTX], a
	ld d, a
	ld e, 0
	ld c, -1
	call DoublesTinyString
	; the marker and the name; the name loses letters until it ends 3 pixels before the level
	ld a, [DSCR_HUDSLOT]
	call DoublesMarkerFlag
	and a
	ld d, 1
	jr z, .name
	ld e, 0
	ld a, "▶"
	call DoublesTinyChar ; d = 1 + 4
	inc d
.name
	ld a, [DSCR_RIGHTX]
	sub 3
	sub d ; pixels for the name
	jr nc, .room
	xor a
.room
	inc a
	srl a
	srl a
	ld c, a ; letters
	ld e, 0
	ld hl, wDoublesHUDName
	call DoublesTinyString
	; the bar
	ld a, [DSCR_WIDTH]
	sub 2
	call DoublesHPPixels
	ld [DSCR_BARPX], a
	call DoublesDrawBar
	; into VRAM
	ld a, [DSCR_HUDSLOT]
	call DoublesGetGeometry
	ld bc, DSG_HUD_TILES
	add hl, bc
	ld a, [hli]
	ld c, a
	ld a, [hl]
	call DoublesTileAddress
	ld de, wDoublesTileBuf
	ld b, BANK(@)
	call Request2bpp
	pop af
	ldh [rSVBK], a
	; the HP palette
	ld a, HP_BAR_LENGTH_PX
	call DoublesHPPixels
	ld e, a
	call GetHPPal ; d
	ld a, [DSCR_HUDSLOT]
	add LOW(wDoublesHPPals)
	ld l, a
	adc HIGH(wDoublesHPPals)
	sub l
	ld h, a
	ldh a, [rSVBK]
	push af
	ld a, BANK(wDoublesHPPals)
	ldh [rSVBK], a
	ld a, [hl]
	cp d
	ld [hl], d
	pop bc
	ld a, b
	ldh [rSVBK], a
	ret z
	ld a, [DSCR_HUDSLOT]
	call DoublesGetGeometry
	ld bc, DSG_HUD_PAL
	add hl, bc
	ld c, [hl]
	ld a, d
	farjp DoublesSetHPPalette

DoublesHPPixels:
; a = wDoublesHUDHP out of wDoublesHUDMaxHP as a bar of a pixels (at least 1 if HP isn't 0).
	push bc
	push de
	push hl
	ld l, a
	ld a, [wDoublesHUDHP]
	ld b, a
	ld a, [wDoublesHUDHP + 1]
	ld c, a
	ld a, [wDoublesHUDMaxHP]
	ld d, a
	ld a, [wDoublesHUDMaxHP + 1]
	ld e, a
	ld a, l
	call DoublesBarPixels
	pop hl
	pop de
	pop bc
	ret

DoublesBarPixels:
; a = bc * a / de, at least 1 if bc isn't 0, at most a.
	push hl
	ld l, a
	ld a, b
	or c
	jr z, .zero
	ld a, d
	or e
	jr z, .zero
	xor a
	ldh [hMultiplicand + 0], a
	ld a, b
	ldh [hMultiplicand + 1], a
	ld a, c
	ldh [hMultiplicand + 2], a
	ld a, l
	ldh [hMultiplier], a
	call Multiply
	ld a, d
	and a
	jr z, .divide
	; the divisor has to fit in a byte: divide both by 4
	srl d
	rr e
	srl d
	rr e
	ldh a, [hProduct + 2]
	ld b, a
	ldh a, [hProduct + 3]
	srl b
	rra
	srl b
	rra
	ldh [hDividend + 3], a
	ld a, b
	ldh [hDividend + 2], a
.divide
	ld a, e
	ldh [hDivisor], a
	ld b, 4
	call Divide
	ldh a, [hQuotient + 3]
	and a
	jr nz, .not_zero
	inc a
.not_zero
	cp l
	jr c, .done
	ld a, l
.done
	pop hl
	ret

.zero
	xor a
	pop hl
	ret

DoublesRightText:
; The right side of an HP box: the status (PSN, BRN, FRZ, PAR, SLP), else the level, which
; is written at hl. Returns hl = its string, a = its width in pixels.
	ld a, [wDoublesHUDStatus]
	ld de, .Psn
	bit PSN, a
	jr nz, .status
	ld de, .Brn
	bit BRN, a
	jr nz, .status
	ld de, .Frz
	bit FRZ, a
	jr nz, .status
	ld de, .Par
	bit PAR, a
	jr nz, .status
	ld de, .Slp
	and SLP_MASK
	jr nz, .status
	; the level
	push hl
	ld a, [wDoublesHUDLevel]
	call DoublesNumberString
	ld [hl], "@"
	pop hl
	jr DoublesStringWidth

.status
	ld h, d
	ld l, e
	jr DoublesStringWidth

.Psn: db "PSN@"
.Brn: db "BRN@"
.Frz: db "FRZ@"
.Par: db "PAR@"
.Slp: db "SLP@"

DoublesStringWidth:
; a = the width of the tiny-font string at hl (4 pixels a letter, minus the last gap).
; Preserves hl.
	push hl
	ld c, -1
.loop
	ld a, [hli]
	cp "@"
	jr z, .done
	ld a, c
	add 4
	ld c, a
	jr .loop
.done
	ld a, c
	pop hl
	ret

DoublesNumberString:
; Write number a (0-255) at hl in decimal, without leading zeros. hl ends after it.
	ld c, 0 ; digits written
	ld b, 100
	call .digit
	ld b, 10
	call .digit
	add "0"
	ld [hli], a
	ret

.digit
	ld d, "0" - 1
.loop
	inc d
	sub b
	jr nc, .loop
	add b
	ld e, a ; the rest
	ld a, d
	cp "0"
	jr nz, .write
	inc c
	dec c
	jr z, .skip ; a leading zero
.write
	ld [hli], a
	inc c
.skip
	ld a, e
	ret

DoublesClearTileBuf:
	ld hl, wDoublesTileBuf
	ld bc, 8 tiles
	xor a
	rst ByteFill
	ret

DoublesDrawBar:
; The HP bar on pixel rows 6-7 (end caps from row 5): DSCR_BARPX pixels of the bar color,
; the rest beige, black ends. DSCR_WIDTH pixels wide.
	ld d, 0
.loop
	ld a, d
	and a
	jr z, .cap
	inc a
	ld hl, DSCR_WIDTH
	cp [hl]
	jr z, .cap
	; color 2 (the bar color) up to DSCR_BARPX, else 1 (beige)
	ld a, [DSCR_BARPX]
	cp d
	ld c, 2
	jr nc, .got_color
	dec c
.got_color
	ld e, 6
	ld a, d
	call DoublesSetPixel
	inc e
	ld a, d
	call DoublesSetPixel
	jr .next

.cap
	ld c, 3
	ld e, 5
.cap_rows
	ld a, d
	call DoublesSetPixel
	inc e
	ld a, e
	cp 8
	jr nz, .cap_rows
.next
	inc d
	ld a, [DSCR_WIDTH]
	cp d
	jr nz, .loop
	ret

DoublesSetPixel:
; Color c (1-3) at pixel (a, e) of wDoublesTileBuf (rows of 2bpp tiles side by side).
; Preserves bc, de and hl.
	push hl
	push bc
	ld b, a ; x
	; hl = wDoublesTileBuf + (x / 8) tiles + y * 2
	and $f8
	ld l, a
	ld h, 0
	add hl, hl
	ld a, e
	add a
	add l
	ld l, a
	adc h
	sub l
	ld h, a
	push de
	ld de, wDoublesTileBuf
	add hl, de
	pop de
	; the bit: $80 >> (x & 7)
	ld a, b
	and 7
	ld b, a
	inc b
	ld a, 1 ; (the first rotation makes it $80)
.shift
	rrca
	dec b
	jr nz, .shift
	ld b, a
	bit 0, c
	jr z, .high
	or [hl]
	ld [hl], a
.high
	inc hl
	bit 1, c
	jr z, .done
	ld a, b
	or [hl]
	ld [hl], a
.done
	pop bc
	pop hl
	ret

DoublesTinyString:
; Draw the string at hl in the 3x5 font with its top at pixel row e, from pixel x d, at most
; c letters. d ends after it.
.loop
	ld a, c
	and a
	ret z
	ld a, [hli]
	cp "@"
	ret z
	push bc
	push hl
	call DoublesTinyChar
	pop hl
	pop bc
	dec c
	jr .loop

DoublesTinyChar:
; Draw character a in the 3x5 font at pixel (d, e) (nothing for a space or a character it
; doesn't have). d += 4. Preserves e.
	call DoublesTinyGlyph
	jr c, .advance
	push de
	ld b, 5
.row
	ld a, [hli]
	push hl
	ld l, a ; the row's bits
	ld h, d ; x
	ld c, 3
.col
	sla l
	jr nc, .skip
	push bc
	ld a, h
	ld c, 3
	call DoublesSetPixel
	pop bc
.skip
	inc h
	dec c
	jr nz, .col
	pop hl
	inc e
	dec b
	jr nz, .row
	pop de
.advance
	ld a, d
	add 4
	ld d, a
	ret

DoublesTinyGlyph:
; hl = the 3x5 glyph of character a; carry if there's none. Preserves bc and de.
	cp "A"
	jr c, .none
	cp "Z" + 1
	jr c, .upper
	cp "a"
	jr c, .special
	cp "z" + 1
	jr c, .lower
	cp "0"
	jr nc, .digit
.special
	push bc
	ld b, a
	ld hl, .Specials
.find
	ld a, [hli]
	cp -1
	jr z, .not_found
	cp b
	ld a, [hli]
	jr nz, .find
	pop bc
	jr .got_index

.not_found
	pop bc
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
	push bc
	ld c, a
	ld b, 0
	ld h, b
	ld l, c
	add hl, hl
	add hl, hl
	add hl, bc ; * 5
	ld bc, DoublesTinyFont
	add hl, bc
	pop bc
	and a
	ret

.Specials:
	db "/", 36
	db "▶", 37
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

DoublesAnimateAreaHPBar:
; AnimateAreaHPBar on the double battle screen: the HP box of the battler loaded in area a
; goes from wHPBuffer2 to wHPBuffer3 (max HP wHPBuffer1), a pixel a frame. Preserves bc.
	push bc
	call DoublesAreaSlot
	call DoublesSlotOnScreen
	jmp z, .done
	ld [DSCR_HUDSLOT], a
	call DoublesGatherHUD
	; (the buffers are little-endian)
	ld a, [wHPBuffer1]
	ld [wDoublesHUDMaxHP + 1], a
	ld a, [wHPBuffer1 + 1]
	ld [wDoublesHUDMaxHP], a
	ld a, [wHPBuffer3]
	ld [wDoublesHUDHP + 1], a
	ld a, [wHPBuffer3 + 1]
	ld [wDoublesHUDHP], a
	ld a, [DSCR_HUDSLOT]
	call DoublesGetGeometry
	ld bc, DSG_HUD_TILES
	add hl, bc
	ld a, [hl]
	add a
	add a
	add a
	sub 2
	ld [DSCR_LEN], a
	call DoublesHPPixels
	ld [DSCR_TARGETPX], a
	ld a, [wHPBuffer2]
	ld [wDoublesHUDHP + 1], a
	ld a, [wHPBuffer2 + 1]
	ld [wDoublesHUDHP], a
	ld a, [DSCR_LEN]
	call DoublesHPPixels
	ld [DSCR_CURPX], a
	ld a, 1
	ldh [hBGMapMode], a
.loop
	ld a, [DSCR_TARGETPX]
	ld b, a
	ld a, [DSCR_CURPX]
	cp b
	jr z, .last
	jr c, .up
	dec a
	jr .step
.up
	inc a
.step
	ld [DSCR_CURPX], a
	cp b
	jr z, .last
	; HP = pixels * max HP / bar length
	ldh [hMultiplier], a
	xor a
	ldh [hMultiplicand + 0], a
	ld a, [wDoublesHUDMaxHP]
	ldh [hMultiplicand + 1], a
	ld a, [wDoublesHUDMaxHP + 1]
	ldh [hMultiplicand + 2], a
	call Multiply
	ld a, [DSCR_LEN]
	ldh [hDivisor], a
	ld b, 4
	call Divide
	ldh a, [hQuotient + 2]
	ld [wDoublesHUDHP], a
	ldh a, [hQuotient + 3]
	ld [wDoublesHUDHP + 1], a
	call DoublesDrawGatheredHUD
	call DelayFrame
	jr .loop

.last
	ld a, [wHPBuffer3]
	ld [wDoublesHUDHP + 1], a
	ld a, [wHPBuffer3 + 1]
	ld [wDoublesHUDHP], a
	call DoublesDrawGatheredHUD
	call DelayFrame
.done
	pop bc
	ret

; ---------------------------------------------------------------- menus

DoublesTargetMenu:
; The player's battler chose a move for one foe and both foes are out: which one?
; "<move> on" / "▶<foe>", and an arrow bobbing over the foe's pic. Left, right, up or down
; switch, A chooses, B goes back. a = the default slot; returns a = the chosen slot, carry if
; B was pressed. The cursor is wMenuCursorY (1: E1, 2: E2), which the battle test writes.
	sub BATTLER_SLOT_E1 - 1
	ld [wMenuCursorY], a
	call DoublesLoadArrowGFX
	farcall EmptyBattleTextbox
	ld a, [wCurPlayerMove]
	ld [wNamedObjectIndex], a
	call GetMoveName
	hlcoord 1, 14
	rst PlaceString
	ld h, b
	ld l, c
	ld de, .On
	rst PlaceString
	xor a
	ld [DSCR_FRAME], a
	dec a
	ld [DSCR_STEP], a ; the foe whose name is shown
.loop
	ld a, [wMenuCursorY]
	ld hl, DSCR_STEP
	cp [hl]
	call nz, .ShowFoe
	; the arrow bobs every 16 frames
	ld hl, DSCR_FRAME
	inc [hl]
	ld a, [hl]
	and %10000
	rrca
	rrca
	rrca ; 0 or 2
	add 1 + 16 ; (OAM's y is 16 more)
	ld hl, wShadowOAMSprite04YCoord
	ld [hli], a
	ld a, [wMenuCursorY]
	dec a
	ld a, 6 * TILE_WIDTH + 3 * TILE_WIDTH + 8 ; (OAM's x is 8 more) ; over E1
	jr z, .got_x
	ld a, 13 * TILE_WIDTH + 3 * TILE_WIDTH + 8 ; over E2
.got_x
	ld [hli], a
	ld a, DOUBLES_ARROW_TILE
	ld [hli], a
	ld [hl], DOUBLES_TARGET_ARROW_PAL | VRAM_BANK_1
	ld a, 1
	ldh [hBGMapMode], a
	call DelayFrame
	call GetJoypad
	ldh a, [hJoyPressed]
	bit A_BUTTON_F, a
	jr nz, .chosen
	bit B_BUTTON_F, a
	jr nz, .cancel
	and D_LEFT | D_RIGHT | D_UP | D_DOWN
	jr z, .loop
	ld a, [wMenuCursorY]
	xor %11
	ld [wMenuCursorY], a
	jr .loop

.chosen
	call .HideArrow
	call PlayClickSFX
	ld a, [wMenuCursorY]
	add BATTLER_SLOT_E1 - 1
	and a
	ret

.cancel
	call .HideArrow
	scf
	ret

.HideArrow:
	xor a
	ld [wShadowOAMSprite04YCoord], a
	ret

.ShowFoe:
	ld [hl], a
	hlcoord 1, 16
	ld bc, SCREEN_WIDTH - 2
	ld a, " "
	rst ByteFill
	ld a, "▶"
	ldcoord_a 1, 16
	ld a, [wMenuCursorY]
	add BATTLER_SLOT_E1 - 1
	call DoublesGatherHUD
	hlcoord 2, 16
	ld de, wDoublesHUDName
	rst PlaceString
	ret

.On:
	db " on@"

DoublesLoadArrowGFX:
; The target arrow's tile, in VRAM bank 1 after the type icons.
	xor a
	ldh [hBGMapMode], a
	ld a, 1
	ldh [rVBK], a
	ld hl, vTiles0 tile DOUBLES_ARROW_TILE
	ld de, DoublesArrowGFX
	lb bc, BANK(DoublesArrowGFX), 1
	call Get2bpp
	xor a
	ldh [rVBK], a
	ret

; ---------------------------------------------------------------- the move menu (singles and doubles)
; _MoveSelectionScreen's battle layout (not the Ether/Elixer menu's): one full-width box,
; rows 12-17, with the move info on the left (x 1-4: MoveInfoBox's category and type icons on
; rows 13-14, the power and PP in the 3x5 font on rows 15-16), a divider in column 5 and the
; moves from x 7. With weather, a box above the info holds GetWeatherImage's icon.
; The 3x5 text's 8 tiles (PP, then power): VRAM bank 0 $71-$78 in double battles; VRAM bank 1
; $ab-$b2 in singles, whose HUD uses bank 0's (bank 1 has E2's and P2's pics there in doubles).

DEF SINGLES_MOVE_INFO_TILE EQU $ab ; VRAM bank 1; 8 tiles
	assert SINGLES_MOVE_INFO_TILE >= $80 && SINGLES_MOVE_INFO_TILE + 8 <= $100

MoveMenuDivider:
; After the move menu's box is drawn: the vertical line between the move info and the moves,
; joining the box's top and bottom borders with junction tiles made from the current frame's
; "─" and "│" (the frame is an option); the info's text tiles, blank; and the weather box.
	ldh a, [rSVBK]
	push af
	ld a, BANK(wDoublesTileBuf)
	ldh [rSVBK], a
	; the frame's "─", "┐" and "│" (1bpp) after the two junction tiles (2bpp)
	ld a, [wTextboxFrame]
	maskbits NUM_FRAMES
	ld bc, TEXTBOX_FRAME_TILES * LEN_1BPP_TILE
	ld hl, Frames + 1 * LEN_1BPP_TILE ; "─"
	rst AddNTimes
	ld de, DIVIDER_FRAME_BUF
	ld bc, 3 * LEN_1BPP_TILE
	ld a, BANK(Frames)
	call FarCopyBytes
	; "┬": "─", plus "│" from the horizontal line's first row down
	ld hl, DIVIDER_FRAME_BUF
	ld de, wDoublesTileBuf
	lb bc, LEN_1BPP_TILE, 0
.top
	call MoveMenuDividerRow
	ld [de], a
	inc de
	ld [de], a
	inc de
	inc hl
	dec b
	jr nz, .top
	; "┴": "─", plus "│" from the horizontal line's last row up
	ld hl, DIVIDER_FRAME_BUF + LEN_1BPP_TILE - 1
	ld de, wDoublesTileBuf + 2 tiles - 1
	lb bc, LEN_1BPP_TILE, 0
.bottom
	call MoveMenuDividerRow
	ld [de], a
	dec de
	ld [de], a
	dec de
	dec hl
	dec b
	jr nz, .bottom
	ld hl, vTiles2 tile DOUBLES_JUNCTION_TILE
	ld de, wDoublesTileBuf
	lb bc, BANK(@), 2
	call Request2bpp
	; the info's 8 text tiles, blank
	call DoublesClearTileBuf
	call MoveMenuInfoVBank
	ld c, 16 ; the PP's, then the power's
	call MoveMenuInfoTile
	call DoublesTileAddress
	ld de, wDoublesTileBuf
	lb bc, BANK(@), 8
	call Request2bpp
	xor a
	ldh [rVBK], a
	pop af
	ldh [rSVBK], a
	; the line
	hlcoord 5, 12
	ld [hl], DOUBLES_JUNCTION_TILE ; "┬"
	ld de, SCREEN_WIDTH
	add hl, de
	ld b, NUM_MOVES
.loop
	ld [hl], "│"
	add hl, de
	dec b
	jr nz, .loop
	ld [hl], DOUBLES_JUNCTION_TILE + 1 ; "┴"
	; singles: the info's text cells take their tiles from VRAM bank 1
	ldh a, [hDoublesScreen]
	rra ; DOUBLES_SCREEN_F
	jr c, MoveMenuWeatherBox
	hlcoord 1, 15, wAttrmap
	call MoveMenuBank1Cells
	hlcoord 1, 16, wAttrmap
	call MoveMenuBank1Cells
	; fallthrough

MoveMenuWeatherBox:
; With weather: a box for GetWeatherImage's icon, like the old singles move info box, on rows
; 8-11 over a back pic (see MoveMenuWeatherColumn). MoveMenuClosed removes it.
	ld a, [wBattleWeather]
	and a
	ret z
	call MoveMenuWeatherColumn
	hlcoord 0, 8
	ld c, a
	ld b, 0
	add hl, bc
	lb bc, 2, 4
	jmp Textbox

MoveMenuWeatherColumn:
; a = the weather box's first column: 0 (above the move info, over the player's pic) in
; singles; in doubles over the back pic of the battler that isn't choosing, so the chooser
; stays in view: P2's (column 6) while P1 chooses, P1's (column 0) while P2 does.
	ldh a, [hDoublesScreen]
	rra ; DOUBLES_SCREEN_F
	ld a, 0
	ret nc
	ld a, [wDoublesChooser]
	cp BATTLER_SLOT_P1 + 1
	ld a, 0
	ret nz
	ld a, 6
	ret

MoveMenuWeatherIconX:
; After GetWeatherImage placed its 4 sprites for column 0: move them with the weather box.
	call MoveMenuWeatherColumn
	and a
	ret z
	add a
	add a
	add a ; * TILE_WIDTH
	ld hl, wShadowOAMSprite00XCoord
	ld de, SPRITEOAMSTRUCT_LENGTH
	ld c, 4
.loop
	ld b, a
	add [hl]
	ld [hl], a
	ld a, b
	add hl, de
	dec c
	jr nz, .loop
	ret

MoveMenuBank1Cells:
; Set VRAM_BANK_1 in 4 attributes at hl.
	ld b, 4
.cell
	set OAM_TILE_BANK, [hl]
	inc hl
	dec b
	jr nz, .cell
	ret

MoveMenuDividerRow:
; a = the "─" row at hl, ORed with the "│" row (2 tiles on) once a row of "─" had pixels
; (c = $ff from then on).
	ld a, [hl]
	and a
	jr z, .no_line
	ld c, $ff
.no_line
	push hl
	push de
	ld de, 2 * LEN_1BPP_TILE
	add hl, de
	ld a, [hl]
	pop de
	pop hl
	and c
	or [hl]
	ret

MoveMenuInfoPP:
; MoveInfoBox's PP: "PP 10/15" in the 3x5 font at (1, 16), under the power, from
; wStringBuffer1 (PP left) and wNamedObjectIndex (max PP).
	ld hl, wDoublesHUDName ; (free while the move menu is open)
	ld a, "P"
	ld [hli], a
	ld [hli], a
	ld a, " "
	ld [hli], a
	ld a, [wStringBuffer1]
	call DoublesNumberString
	ld a, "/"
	ld [hli], a
	ld a, [wNamedObjectIndex]
	call DoublesNumberString
	ld [hl], "@"
	ld hl, wDoublesHUDName
	ld c, 16
	jr MoveMenuInfoText

MoveMenuInfoPower:
; MoveInfoBox's power: "POW 90" in the 3x5 font at (1, 15), under the type icon, from
; wPlayerMoveStruct (after UpdateMoveData). "POW -" for power 0 (status moves, Splash),
; "POW ?" for 1 (worked out in battle: Return, Flail, Seismic Toss, Counter, the OHKO moves...).
	ld hl, wDoublesHUDName
	ld a, "P"
	ld [hli], a
	ld a, "O"
	ld [hli], a
	ld a, "W"
	ld [hli], a
	ld a, " "
	ld [hli], a
	ld a, [wPlayerMoveStruct + MOVE_POWER]
	cp 2
	jr nc, .number
	and a
	ld a, "-"
	jr z, .symbol
	ld a, "?"
.symbol
	ld [hli], a
	jr .done
.number
	call DoublesNumberString
.done
	ld [hl], "@"
	ld hl, wDoublesHUDName
	ld c, 15
	jr MoveMenuInfoText

MoveMenuInfoDisabled:
; MoveInfoBox's "Disabled!": at (1, 15) where the power goes, and no PP.
	ld hl, .Empty
	ld c, 16
	call MoveMenuInfoText
	ld hl, .Disabled
	ld c, 15
	jr MoveMenuInfoText

.Disabled:
	db "DISABLED"
.Empty:
	db "@"

MoveMenuInfoText:
; The 3x5-font text at hl in row c's 4 info tiles (c = 15: the power, 16: the PP), placed at
; (1, c).
	push bc
	ldh a, [rSVBK]
	push af
	ld a, BANK(wDoublesTileBuf)
	ldh [rSVBK], a
	push hl
	call DoublesClearTileBuf
	pop hl
	ld d, 0
	ld e, 2
	ld c, -1
	call DoublesTinyString
	pop af
	pop bc ; c = the row
	push af ; rSVBK to restore
	push bc
	call MoveMenuInfoVBank
	call MoveMenuInfoTile
	call DoublesTileAddress
	ld de, wDoublesTileBuf
	lb bc, BANK(@), 4
	call Request2bpp
	xor a
	ldh [rVBK], a
	pop bc
	pop af
	ldh [rSVBK], a
	call MoveMenuInfoTile
	push af
	ld b, c
	ld c, 1
	call DoublesTilemapAddr
	pop af
	ld [hli], a
	inc a
	ld [hli], a
	inc a
	ld [hli], a
	inc a
	ld [hl], a
	ret

MoveMenuInfoTile:
; a = the first of row c's 4 info tiles (c = 15: the power, 16: the PP). Preserves bc and de.
	ldh a, [hDoublesScreen]
	rra ; DOUBLES_SCREEN_F
	ld a, DOUBLES_PP_TILE
	jr c, .got_base
	ld a, SINGLES_MOVE_INFO_TILE
.got_base
	bit 0, c
	ret z ; the PP (row 16)
	add DOUBLES_POWER_TILE - DOUBLES_PP_TILE
	ret

MoveMenuInfoVBank:
; The info's text tiles' VRAM bank: 0 in double battles, 1 in singles.
	ldh a, [hDoublesScreen]
	cpl
	and 1 << DOUBLES_SCREEN_F
	ldh [rVBK], a
	ret

MoveMenuClosed:
; After the move menu (MoveSelectionScreen): back to the screen as BattleMenu saved it
; (wTempTilemap), and the attributes the menu changed (its box over row 12 and the weather box
; over the player's pic; in singles, the info's bank 1 cells).
	xor a
	ldh [hBGMapMode], a
	call LoadTempTilemapToTilemap
	ldh a, [hDoublesScreen]
	rra ; DOUBLES_SCREEN_F
	jr c, .doubles
	; singles: as _CGB_FinishBattleScreenLayout sets them
	hlcoord 0, 8, wAttrmap
	ld de, SCREEN_WIDTH
	ld b, 4
.row
	push hl
	ld c, 6
	ld a, PAL_BATTLE_BG_PLAYER
.col
	ld [hli], a
	dec c
	jr nz, .col
	pop hl
	add hl, de
	dec b
	jr nz, .row
	hlcoord 0, 12, wAttrmap
	ld bc, 6 * SCREEN_WIDTH
	ld a, PAL_BATTLE_BG_TEXT
	rst ByteFill
	jmp CopyTilemapAtOnce

.doubles
	call DoublesBuildAttrmap
	jmp CopyTilemapAtOnce

DoublesRestoreAttrs:
; A box over the double battle screen is gone: back to the screen's attributes.
	ldh a, [hDoublesScreen]
	rra ; DOUBLES_SCREEN_F
	ret nc
	call DoublesBuildAttrmap
	jmp CopyTilemapAtOnce

DoublesPushScreen:
; A box was drawn over the double battle screen (with Textbox, which only sets wAttrmap):
; show it with its attributes, or its tiles over E2's and P2's pics would come from VRAM bank 1.
	ldh a, [hDoublesScreen]
	rra ; DOUBLES_SCREEN_F
	ret nc
	jmp CopyTilemapAtOnce

DoublesTinyFont:
; The 3x5 font of the HP boxes: A-Z, 0-9, / ▶ . - ' ? ! ♂ ♀ :. Each row is the top 3 bits.
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
	assert @ - DoublesTinyFont == 46 * 5
