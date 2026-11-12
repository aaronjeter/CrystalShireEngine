Crystal_FillBoxCGB:
; This is a copy of FillBoxCGB.
.row
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
	jr nz, .row
	ret

LoadOW_BGPal7::
	ld hl, Palette_TextBG7
	ld de, wBGPals1 palette PAL_BG_TEXT
	ld bc, 1 palettes
	ld a, BANK(wBGPals1)
	jmp FarCopyWRAM

Palette_TextBG7:
INCLUDE "gfx/font/bg_text.pal"

INCLUDE "engine/tilesets/tileset_palettes.asm"

_InitMG_Mobile_LinkTradePalMap:
	hlcoord 0, 0, wAttrmap
	lb bc, 16, 2
	ld a, $4
	call Crystal_FillBoxCGB
	ld a, $3
	ldcoord_a 0, 1, wAttrmap
	ldcoord_a 0, 14, wAttrmap
	hlcoord 2, 0, wAttrmap
	lb bc, 8, 18
	ld a, $5
	call Crystal_FillBoxCGB
	hlcoord 2, 8, wAttrmap
	lb bc, 8, 18
	ld a, $6
	call Crystal_FillBoxCGB
	hlcoord 0, 16, wAttrmap
	lb bc, 2, SCREEN_WIDTH
	ld a, $4
	call Crystal_FillBoxCGB
	ld a, $3
	lb bc, 6, 1
	hlcoord 6, 1, wAttrmap
	call Crystal_FillBoxCGB
	ld a, $3
	lb bc, 6, 1
	hlcoord 17, 1, wAttrmap
	call Crystal_FillBoxCGB
	ld a, $3
	lb bc, 6, 1
	hlcoord 6, 9, wAttrmap
	call Crystal_FillBoxCGB
	ld a, $3
	lb bc, 6, 1
	hlcoord 17, 9, wAttrmap
	call Crystal_FillBoxCGB
	ld a, $2
	hlcoord 2, 16, wAttrmap
	ld [hli], a
	ld a, $7
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], $2
	hlcoord 2, 17, wAttrmap
	ld a, $3
	ld bc, 6
	jmp ByteFill

_LoadTradeRoomBGPals:
	ld hl, TradeRoomPalette
	ld de, wBGPals1 palette PAL_BG_GREEN
	ld bc, 6 palettes
	ld a, BANK(wBGPals1)
	call FarCopyWRAM
	farjp ApplyPals

TradeRoomPalette:
INCLUDE "gfx/trade/border.pal"

InitMG_Mobile_LinkTradePalMap:
	jmp _InitMG_Mobile_LinkTradePalMap
