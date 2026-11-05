SelectMonFromParty:
	call DisableSpriteUpdates
	xor a
	ld [wPartyMenuActionText], a
	call ClearBGPalettes
	call InitPartyMenuLayout
	call WaitBGMap
	call SetDefaultBGPAndOBP
	call DelayFrame
	call PartyMenuSelect
	jmp ReturnToMapWithSpeechTextbox

SelectTradeOrDayCareMon:
	ld a, b
	ld [wPartyMenuActionText], a
	call DisableSpriteUpdates
	call ClearBGPalettes
	call InitPartyMenuLayout
	call WaitBGMap
	ld b, SCGB_PARTY_MENU
	call GetSGBLayout
	call SetDefaultBGPAndOBP
	call DelayFrame
	call PartyMenuSelect
	jmp ReturnToMapWithSpeechTextbox

InitPartyMenuLayout:
	call LoadPartyMenuGFX
	call InitPartyMenuWithCancel
	call InitPartyMenuGFX
	call WritePartyMenuTilemap
	jmp PlacePartyMenuText

LoadPartyMenuGFX:
	call LoadFontsBattleExtra
	farcall InitPartyMenuPalettes
	farjp ClearSpriteAnims2

WritePartyMenuTilemap:
; The cards (engine/pokemon/party_cards.asm), the tilemap and the palettes.
	farjp DrawPartyCards

PlacePartymonHPBar:
	ld a, b
	ld bc, PARTYMON_STRUCT_LENGTH
	ld hl, wPartyMon1HP
	rst AddNTimes
	ld a, [hli]
	or [hl]
	jr nz, .not_fainted
	xor a
	ld e, a
	ld c, a
	ret

.not_fainted
	dec hl
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld e, a
	predef_jump ComputeHPBarPixels

InitPartyMenuGFX:
	ld hl, wPartyCount
	ld a, [hli]
	and a
	ret z
	ld c, a
	xor a
	ldh [hObjectStructIndex], a
.loop
	push bc
	push hl
	ld hl, LoadMenuMonIcon
	ld a, BANK(LoadMenuMonIcon)
	ld e, MONICON_PARTYMENU
	call FarCall_hl
	ldh a, [hObjectStructIndex]
	inc a
	ldh [hObjectStructIndex], a
	pop hl
	pop bc
	dec c
	jr nz, .loop
	farjp PlaySpriteAnimations

InitPartyMenuWithCancel:
; with cancel
	xor a
	ld [wSwitchMon], a
	ld de, PartyMenu2DMenuData
	call Load2DMenuData
	ld a, [wPartyCount]
	inc a
	ld [w2DMenuNumRows], a ; list length
	dec a
	ld b, a
	ld a, [wPartyMenuCursor]
	and a
	jr z, .skip
	inc b
	cp b
	jr c, .done

.skip
	ld a, 1

.done
	ld [wMenuCursorY], a
	ld a, A_BUTTON | B_BUTTON
	ld [wMenuJoypadFilter], a
	ret

InitPartyMenuNoCancel:
; no cancel
	ld de, PartyMenu2DMenuData
	call Load2DMenuData
	ld a, [wPartyCount]
	ld [w2DMenuNumRows], a ; list length
	ld b, a
	ld a, [wPartyMenuCursor]
	and a
	jr z, .skip
	inc b
	cp b
	jr c, .done
.skip
	ld a, 1
.done
	ld [wMenuCursorY], a
	ld a, A_BUTTON | B_BUTTON
	ld [wMenuJoypadFilter], a
	ret

PartyMenu2DMenuData:
	db 1, 0 ; cursor start y, x
	db 0, 1 ; rows, columns
	db _2DMENU_WRAP_UP_DOWN | _2DMENU_ENABLE_SPRITE_ANIMS ; flags 1
	db 0 ; flags 2
	dn 2, 0 ; cursor offset
	db 0 ; accepted buttons

PartyMenuSelect:
; sets carry if exitted menu.
	farcall PartyCardsJoypad
	ld a, [wPartyCount]
	inc a
	ld b, a
	ld a, [wMenuCursorY] ; menu selection?
	cp b
	jr z, .exitmenu ; CANCEL
	ld [wPartyMenuCursor], a
	ldh a, [hJoyLast]
	ld b, a
	bit B_BUTTON_F, b
	jr nz, .exitmenu ; B button
	ld a, [wMenuCursorY]
	dec a
	ld [wCurPartyMon], a
	ld c, a
	ld b, 0
	ld hl, wPartySpecies
	add hl, bc
	ld a, [hl]
	ld [wCurPartySpecies], a

	ld de, SFX_READ_TEXT_2
	call PlaySFX
	call WaitSFX
	and a
	ret

.exitmenu
	ld de, SFX_READ_TEXT_2
	call PlaySFX
	call WaitSFX
	scf
	ret

PlacePartyMenuText:
; The bottom bar: the prompt and the Cancel button.
	farjp DrawPartyMenuBar

PrintPartyMenuActionText:
	ld a, [wCurPartyMon]
	ld hl, wPartyMonNicknames
	call GetNickname
	ld a, [wPartyMenuActionText]
	and $f
	ld hl, .MenuActionTexts
	jr .PrintText

.MenuActionTexts:
; entries correspond to PARTYMENUTEXT_* constants
	dw .CuredOfPoisonText
	dw .BurnWasHealedText
	dw .WasDefrostedText
	dw .WokeUpText
	dw .RidOfParalysisText
	dw .RecoveredSomeHPText
	dw .HealthReturnedText
	dw .RevitalizedText
	dw .GrewToLevelText
	dw .CameToItsSensesText

.RecoveredSomeHPText:
	text_far _RecoveredSomeHPText
	text_end

.CuredOfPoisonText:
	text_far _CuredOfPoisonText
	text_end

.RidOfParalysisText:
	text_far _RidOfParalysisText
	text_end

.BurnWasHealedText:
	text_far _BurnWasHealedText
	text_end

.WasDefrostedText:
	text_far _WasDefrostedText
	text_end

.WokeUpText:
	text_far _WokeUpText
	text_end

.HealthReturnedText:
	text_far _HealthReturnedText
	text_end

.RevitalizedText:
	text_far _RevitalizedText
	text_end

.GrewToLevelText:
	text_far _GrewToLevelText
	text_end

.CameToItsSensesText:
	text_far _CameToItsSensesText
	text_end

.PrintText:
	push af
	push hl
	; the text box covers card tiles from VRAM bank 1: plain text-box tiles first
	xor a
	ldh [hBGMapMode], a
	hlcoord 0, 12
	ld bc, 6 * SCREEN_WIDTH
	ld a, " "
	rst ByteFill
	hlcoord 0, 12, wAttrmap
	ld bc, 6 * SCREEN_WIDTH
	ld a, PAL_BG_TEXT
	rst ByteFill
	call CopyTilemapAtOnce
	pop hl
	pop af
	ld e, a
	ld d, 0
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wOptions]
	push af
	set NO_TEXT_SCROLL, a
	ld [wOptions], a
	call PrintText
	pop af
	ld [wOptions], a
	ret
