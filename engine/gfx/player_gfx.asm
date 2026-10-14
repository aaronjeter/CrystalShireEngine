MovePlayerPicRight:
	hlcoord 6, 4
	ld de, 1
	jr MovePlayerPic

MovePlayerPicLeft:
	hlcoord 13, 4
	ld de, -1
	; fallthrough

MovePlayerPic:
; Move player pic at hl by de * 7 tiles.
	ld c, $8
.loop
	push bc
	push hl
	push de
	xor a
	ldh [hBGMapMode], a
	lb bc, 7, 7
	predef PlaceGraphic
	xor a
	ldh [hBGMapThird], a
	call WaitBGMap
	call DelayFrame
	pop de
	pop hl
	add hl, de
	pop bc
	dec c
	ret z
	push hl
	push bc
	ld a, l
	sub e
	ld l, a
	ld a, h
	sbc d
	ld h, a
	lb bc, 7, 7
	call ClearBox
	pop bc
	pop hl
	jr .loop

ShowPlayerNamingChoices:
	ld hl, ChrisNameMenuHeader
	ld a, [wPlayerGender]
	bit PLAYERGENDER_FEMALE_F, a
	jr z, .got_header
	ld hl, KrisNameMenuHeader
.got_header
	call LoadMenuHeader
	call VerticalMenu
	ld a, [wMenuCursorY]
	dec a
	call CopyNameFromMenu
	jmp CloseWindow

INCLUDE "data/player_names.asm"

; GetPlayerIcon, GetCardPic, GetPlayerBackpic, DrawIntroPlayerPic and
; HOF_LoadTrainerFrontpic are in engine/gfx/player_characters.asm.

ChrisCardPic:
INCBIN "gfx/trainer_card/chris_card.2bpp"

KrisCardPic:
INCBIN "gfx/trainer_card/kris_card.2bpp"

TrainerCardGFX:
INCBIN "gfx/trainer_card/trainer_card.2bpp"

ChrisPic:
INCBIN "gfx/player/chris.2bpp"

KrisPic:
INCBIN "gfx/player/kris.2bpp"

KrisBackpic:
; Kris's backpic is uncompressed.
INCBIN "gfx/player/kris_back.2bpp"
