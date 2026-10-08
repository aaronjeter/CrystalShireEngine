DEF FIELDMOVE_GRASS EQU $80
DEF FIELDMOVE_TREE  EQU $84
DEF FIELDMOVE_FLY   EQU $84

PlayWhirlpoolSound:
	call WaitSFX
	ld de, SFX_SURF
	call PlaySFX
	jmp WaitSFX

BlindingFlash:
	call FadeOutToWhite
	ld hl, wStatusFlags
	set STATUSFLAGS_FLASH_F, [hl]
	call ReplaceTimeOfDayPals
	call UpdateTimeOfDayPal
	ld b, SCGB_MAPPALS
	call GetSGBLayout
	farcall LoadOW_BGPal7
	jmp FadeInPalettes_EnableDynNoApply

ShakeHeadbuttTree:
	farcall CopyBGGreenToOBPal7
	call ClearSpriteAnims
	ld de, CutGrassGFX
	ld hl, vTiles0 tile FIELDMOVE_GRASS
	lb bc, BANK(CutGrassGFX), 4
	call Request2bpp
	ld de, HeadbuttTreeGFX
	ld hl, vTiles0 tile FIELDMOVE_TREE
	lb bc, BANK(HeadbuttTreeGFX), 8
	call Request2bpp
	call Cut_Headbutt_GetPixelFacing
	ld a, SPRITE_ANIM_OBJ_HEADBUTT
	call InitSpriteAnimStruct
	ld hl, SPRITEANIMSTRUCT_TILE_ID
	add hl, bc
	ld [hl], FIELDMOVE_TREE
	ld a, 36 * SPRITEOAMSTRUCT_LENGTH
	ld [wCurSpriteOAMAddr], a
	call DoNextFrameForAllSprites
	call HideHeadbuttTree
	ld a, 32
	ld [wFrameCounter], a
	call WaitSFX
	ld de, SFX_SANDSTORM
	call PlaySFX
.loop
	ld hl, wFrameCounter
	ld a, [hl]
	and a
	jr z, .done
	dec [hl]
	ld a, 36 * SPRITEOAMSTRUCT_LENGTH
	ld [wCurSpriteOAMAddr], a
	call DoNextFrameForAllSprites
	call DelayFrame
	jr .loop

.done
	; restore the tree's tiles and attributes together while the sprite still covers it
	call LoadOverworldTilemapAndAttrmapPals
	call CopyTilemapAtOnce
	xor a
	ldh [hBGMapMode], a
	call ClearSpriteAnims
	ld hl, wShadowOAMSprite36
	ld bc, wShadowOAMEnd - wShadowOAMSprite36
	xor a
	rst ByteFill
	ld de, Font
	ld hl, vTiles1
	lb bc, BANK(Font), 12
	call Get1bpp
	jmp UpdatePlayerSprite

HeadbuttTreeGFX:
INCBIN "gfx/overworld/headbutt_tree.2bpp"

HideHeadbuttTree:
	; Replaces the four headbutted tree tiles with the tileset's grass
	; (HeadbuttGrassTiles), tiles and attributes together: the grass can be in
	; the other VRAM bank than the tree.
	xor a
	ldh [hBGMapMode], a
	ld a, [wPlayerDirection]
	and %00001100
	srl a
	ld e, a
	ld d, 0
	ld hl, TreeRelativeLocationTable
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	push hl ; tilemap position

	; find this tileset's grass (or the default entry)
	ld a, [wMapTileset]
	ld c, a
	ld de, HeadbuttGrassTiles
.find
	ld a, [de]
	cp -1
	jr z, .found
	cp c
	jr z, .found
	ld a, e
	add HEADBUTT_GRASS_ENTRY_LENGTH
	ld e, a
	adc d
	sub e
	ld d, a
	jr .find
.found
	inc de

	; tiles
	ld bc, SCREEN_WIDTH - 1
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	inc de
	ld [hl], a
	add hl, bc
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	inc de
	ld [hl], a

	; attributes (-1: leave them as they are)
	pop hl
	ld a, [de]
	cp -1
	jr z, .copy
	push de
	ld de, wAttrmap - wTilemap
	add hl, de
	pop de
	ld [hli], a
	ld [hl], a
	add hl, bc
	ld [hli], a
	ld [hl], a

.copy
	; let the shaking tree sprite appear first, then update the BG map at once
	call DelayFrame
	call CopyTilemapAtOnce
	ld c, 3
	call DelayFrames
	xor a
	ldh [hBGMapMode], a
	ret

HeadbuttGrassTiles:
; tileset, top-left, top-right, bottom-left, bottom-right tile, attribute (-1: unchanged)
	db TILESET_JOHTO,        $4e, $4f, $5e, $5f, PAL_BG_GREEN | VRAM_BANK_1
DEF HEADBUTT_GRASS_ENTRY_LENGTH EQU @ - HeadbuttGrassTiles
	db TILESET_JOHTO_MODERN, $62, $63, $72, $73, PAL_BG_GREEN
	db -1,                   $05, $05, $05, $05, -1 ; any other tileset

TreeRelativeLocationTable:
	dwcoord 8,     8 + 2 ; RIGHT
	dwcoord 8,     8 - 2 ; LEFT
	dwcoord 8 - 2, 8     ; DOWN
	dwcoord 8 + 2, 8     ; UP

OWCutAnimation:
	; Animation index in e
	; 0: Split tree in half
	; 1: Mow the lawn
	ld a, e
	and 1
	ld [wJumptableIndex], a
	call .LoadCutGFX
	call WaitSFX
	ld de, SFX_PLACE_PUZZLE_PIECE_DOWN
	call PlaySFX
.loop
	ld a, [wJumptableIndex]
	bit JUMPTABLE_EXIT_F, a
	ret nz
	ld a, 36 * SPRITEOAMSTRUCT_LENGTH
	ld [wCurSpriteOAMAddr], a
	call DoNextFrameForAllSprites
	call OWCutJumptable
	call DelayFrame
	jr .loop

.LoadCutGFX:
	call ClearSpriteAnims
	ld de, CutGrassGFX
	ld hl, vTiles0 tile FIELDMOVE_GRASS
	lb bc, BANK(CutGrassGFX), 4
	call Request2bpp
	ld de, CutTreeGFX
	ld hl, vTiles0 tile FIELDMOVE_TREE
	lb bc, BANK(CutTreeGFX), 4
	jmp Request2bpp

CutTreeGFX:
INCBIN "gfx/overworld/cut_tree.2bpp"

CutGrassGFX:
INCBIN "gfx/overworld/cut_grass.2bpp"

OWCutJumptable:
	jumptable .dw, wJumptableIndex

.dw
	dw Cut_SpawnAnimateTree
	dw Cut_SpawnAnimateLeaves
	dw Cut_StartWaiting
	dw Cut_WaitAnimSFX

Cut_SpawnAnimateTree:
	call Cut_Headbutt_GetPixelFacing
	ld a, SPRITE_ANIM_OBJ_CUT_TREE ; cut tree
	call InitSpriteAnimStruct
	ld hl, SPRITEANIMSTRUCT_TILE_ID
	add hl, bc
	ld [hl], FIELDMOVE_TREE
	ld a, 32
	ld [wFrameCounter], a
; Cut_StartWaiting
	ld hl, wJumptableIndex
	inc [hl]
	inc [hl]
	ret

Cut_SpawnAnimateLeaves:
	call Cut_GetLeafSpawnCoords
	xor a
	call Cut_SpawnLeaf
	ld a, $10
	call Cut_SpawnLeaf
	ld a, $20
	call Cut_SpawnLeaf
	ld a, $30
	call Cut_SpawnLeaf
	ld a, 32 ; frames
	ld [wFrameCounter], a
; Cut_StartWaiting
	ld hl, wJumptableIndex
	inc [hl]
	ret

Cut_StartWaiting:
; Cut_WaitAnimSFX
	ld hl, wJumptableIndex
	inc [hl]

Cut_WaitAnimSFX:
	ld hl, wFrameCounter
	ld a, [hl]
	and a
	jr z, .finished
	dec [hl]
	cp 30
	ret nz
; Two frames in, the tree/leaf sprites are on screen: now copy the new block's
; attributes and tiles to the BG map at once. Its tiles can be in the other VRAM
; bank than the tree's (e.g. Johto grass uses bank 1), so updating only the tile
; IDs would draw the wrong graphics.
	call CopyTilemapAtOnce
	ld a, 1
	ldh [hBGMapMode], a
	ret

.finished
	ld hl, wJumptableIndex
	set JUMPTABLE_EXIT_F, [hl]
	ret

Cut_SpawnLeaf:
	push de
	push af
	ld a, SPRITE_ANIM_OBJ_LEAF ; leaf
	call InitSpriteAnimStruct
	ld hl, SPRITEANIMSTRUCT_TILE_ID
	add hl, bc
	ld [hl], FIELDMOVE_GRASS
	ld hl, SPRITEANIMSTRUCT_VAR3
	add hl, bc
	ld [hl], $4
	pop af
	ld hl, SPRITEANIMSTRUCT_VAR1
	add hl, bc
	ld [hl], a
	pop de
	ret

; cut leaf spawn coords table bits
DEF CUT_LEAF_SPAWN_RIGHT_F  EQU 0
DEF CUT_LEAF_SPAWN_BOTTOM_F EQU 1

Cut_GetLeafSpawnCoords:
	ld de, 0
	ld a, [wPlayerMetatileX]
	bit 0, a ; even or odd?
	jr z, .left_side
	set CUT_LEAF_SPAWN_RIGHT_F, e
.left_side
	ld a, [wPlayerMetatileY]
	bit 0, a ; even or odd?
	jr z, .top_side
	set CUT_LEAF_SPAWN_BOTTOM_F, e
.top_side
	ld a, [wPlayerDirection]
	and %00001100
	add e
	ld e, a
	ld hl, .Coords
	add hl, de
	add hl, de
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ret

.Coords:
	dbpixel 11, 12 ; facing down,  top left
	dbpixel  9, 12 ; facing down,  top right
	dbpixel 11, 14 ; facing down,  bottom left
	dbpixel  9, 14 ; facing down,  bottom right

	dbpixel 11,  8 ; facing up,    top left
	dbpixel  9,  8 ; facing up,    top right
	dbpixel 11, 10 ; facing up,    bottom left
	dbpixel  9, 10 ; facing up,    bottom right

	dbpixel  7, 12 ; facing left,  top left
	dbpixel  9, 12 ; facing left,  top right
	dbpixel  7, 10 ; facing left,  bottom left
	dbpixel  9, 10 ; facing left,  bottom right

	dbpixel 11, 12 ; facing right, top left
	dbpixel 13, 12 ; facing right, top right
	dbpixel 11, 10 ; facing right, bottom left
	dbpixel 13, 10 ; facing right, bottom right

Cut_Headbutt_GetPixelFacing:
	ld a, [wPlayerDirection]
	and %00001100
	srl a
	ld e, a
	ld d, 0
	ld hl, .Coords
	add hl, de
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ret

.Coords:
	dbpixel 10, 13
	dbpixel 10,  9
	dbpixel  8, 11
	dbpixel 12, 11

FlyFromAnim:
	call DelayFrame
	ld a, [wStateFlags]
	push af
	xor a
	ld [wStateFlags], a
	call FlyFunction_InitGFX
	depixel 10, 10, 4, 0
	ld a, SPRITE_ANIM_OBJ_RED_WALK
	call InitSpriteAnimStruct
	ld hl, SPRITEANIMSTRUCT_TILE_ID
	add hl, bc
	ld [hl], FIELDMOVE_FLY
	ld hl, SPRITEANIMSTRUCT_ANIM_SEQ_ID
	add hl, bc
	ld [hl], SPRITE_ANIM_FUNC_FLY_FROM
	ld a, 128
	ld [wFrameCounter], a
.loop
	ld a, [wJumptableIndex]
	bit JUMPTABLE_EXIT_F, a
	jr nz, .exit
	ld a, 0 * SPRITEOAMSTRUCT_LENGTH
	ld [wCurSpriteOAMAddr], a
	call DoNextFrameForAllSprites
	call FlyFunction_FrameTimer
	call DelayFrame
	jr .loop

.exit
	pop af
	ld [wStateFlags], a
	ret

FlyToAnim:
	call DelayFrame
	ld a, [wStateFlags]
	push af
	xor a
	ld [wStateFlags], a
	call FlyFunction_InitGFX
	depixel 31, 10, 4, 0
	ld a, SPRITE_ANIM_OBJ_RED_WALK
	call InitSpriteAnimStruct
	ld hl, SPRITEANIMSTRUCT_TILE_ID
	add hl, bc
	ld [hl], FIELDMOVE_FLY
	ld hl, SPRITEANIMSTRUCT_ANIM_SEQ_ID
	add hl, bc
	ld [hl], SPRITE_ANIM_FUNC_FLY_TO
	ld hl, SPRITEANIMSTRUCT_VAR4
	add hl, bc
	ld [hl], 11 * TILE_WIDTH
	ld a, 64
	ld [wFrameCounter], a
.loop
	ld a, [wJumptableIndex]
	bit JUMPTABLE_EXIT_F, a
	jr nz, .exit
	ld a, 0 * SPRITEOAMSTRUCT_LENGTH
	ld [wCurSpriteOAMAddr], a
	call DoNextFrameForAllSprites
	call FlyFunction_FrameTimer
	call DelayFrame
	jr .loop

.exit
	pop af
	ld [wStateFlags], a
; fallthrough
.RestorePlayerSprite_DespawnLeaves:
	ld hl, wShadowOAMSprite00TileID
	xor a
	ld c, 4
.OAMloop
	ld [hli], a ; tile id
rept SPRITEOAMSTRUCT_LENGTH - 1
	inc hl
endr
	inc a
	dec c
	jr nz, .OAMloop
	ld hl, wShadowOAMSprite04
	ld bc, wShadowOAMEnd - wShadowOAMSprite04
	xor a
	jmp ByteFill

FlyFunction_InitGFX:
	call ClearSpriteAnims
	call SetOWFlyMonColor
	ld de, CutGrassGFX
	ld hl, vTiles0 tile FIELDMOVE_GRASS
	lb bc, BANK(CutGrassGFX), 4
	call Request2bpp
	ld a, [wCurPartyMon]
	ld hl, wPartySpecies
	ld e, a
	ld d, 0
	add hl, de
	ld a, [hl]
	ld [wTempIconSpecies], a
	ld e, FIELDMOVE_FLY
	call FlyFunction_GetMonIcon
	xor a
	ld [wJumptableIndex], a
	ret

FlyFunction_FrameTimer:
	call .SpawnLeaf
	ld hl, wFrameCounter
	ld a, [hl]
	and a
	jr z, .exit
	dec [hl]
	cp $40
	ret c
	and $7
	ret nz
	ld de, SFX_FLY
	jmp PlaySFX

.exit
	ld hl, wJumptableIndex
	set JUMPTABLE_EXIT_F, [hl]
	ret

.SpawnLeaf:
	ld hl, wFrameCounter2
	ld a, [hl]
	inc [hl]
	and $7
	ret nz
	ld a, [hl]
	and (6 * 8) >> 1
	add a
	add 8 * 8 ; gives a number in [$40, $50, $60, $70]
	ld d, a
	ld e, 0
	ld a, SPRITE_ANIM_OBJ_FLY_LEAF
	call InitSpriteAnimStruct
	ld hl, SPRITEANIMSTRUCT_TILE_ID
	add hl, bc
	ld [hl], FIELDMOVE_GRASS
	ret
