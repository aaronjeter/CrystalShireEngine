GetPartyParamLocation::
; Get the location of parameter a from wCurPartyMon in hl
	push bc
	ld hl, wPartyMons
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [wCurPartyMon]
	call GetPartyLocation
	pop bc
	ret

GetPartyLocation::
; Add the length of a PartyMon struct to hl a times.
	ld bc, PARTYMON_STRUCT_LENGTH
	jmp AddNTimes

FarSkipEvolutions::
; Calls SkipEvolutions from another bank. It can't be a farcall because it uses hl.
	ldh a, [hROMBank]
	push af
	ld a, BANK(SkipEvolutions)
	rst Bankswitch
	call SkipEvolutions
	pop af
	rst Bankswitch
	ret

UserPartyAttr::
	push af
	ldh a, [hBattleTurn]
	and a
	jr nz, .ot
	pop af
	jr BattlePartyAttr
.ot
	pop af
	jr OTPartyAttr

OpponentPartyAttr::
	push af
	ldh a, [hBattleTurn]
	and a
	jr z, .ot
	pop af
	jr BattlePartyAttr
.ot
	pop af
	jr OTPartyAttr

BattlePartyAttr::
; Get attribute a from the party struct of the active battle mon.
	push bc
	ld c, a
	ld b, 0
	ld hl, wPartyMons
	add hl, bc
	ld a, [wCurBattleMon]
	call GetPartyLocation
	pop bc
	ret

OTPartyAttr::
; Get attribute a from the party struct of the active enemy mon.
	push bc
	ld c, a
	ld b, 0
	ld hl, wOTPartyMon1Species
	add hl, bc
	ld a, [wCurOTMon]
	call GetPartyLocation
	pop bc
	ret

ResetDamage::
	xor a
	ld [wCurDamage], a
	ld [wCurDamage + 1], a
	ret

; Real side vs loaded area (double battles): the player's area (hBattleTurn 0) and the
; enemy's (1) each hold one battler. Its real side is the area XOR wAreaSideFlip[area],
; which is 0 in singles. Side state (screens, Safeguard, Spikes and their counters) and
; the "Enemy" text prefix go by the real side.

GetUserSide::
; a = the user's real side (0: player, 1: enemy); z if the player's
	ldh a, [hBattleTurn]
	jr GetAreaSide

GetTargetSide::
	ldh a, [hBattleTurn]
	xor 1
	; fallthrough

GetAreaSide::
; a = area (0: the player's, 1: the enemy's) -> a = the real side of its battler; z if the player's
	push hl
	ld hl, wAreaSideFlip
	and a
	jr z, .got_area
	inc hl
.got_area
	xor [hl]
	pop hl
	ret

GetUserScreens::
; hl = the screens byte (SCREENS_*) of the user's real side; de = that side's Safeguard
; count (Light Screen +1, Reflect +2). a = the side; z if the player's.
	ldh a, [hBattleTurn]
	jr GetAreaScreens

GetTargetScreens::
	ldh a, [hBattleTurn]
	xor 1
	; fallthrough

GetAreaScreens::
; a = area; as GetUserScreens for the battler loaded there
	call GetAreaSide
	ld hl, wPlayerScreens
	ld de, wPlayerSafeguardCount
	ret z
	inc hl ; wEnemyScreens
	ld de, wEnemySafeguardCount
	ret

GetAreaScreensByte::
; a = area -> a = the screens byte of its battler's real side. Preserves bc, de and hl.
	push hl
	push de
	call GetAreaScreens
	ld a, [hl]
	pop de
	pop hl
	ret

	assert wEnemyScreens == wPlayerScreens + 1
	assert wPlayerLightScreenCount == wPlayerSafeguardCount + 1 && wPlayerReflectCount == wPlayerSafeguardCount + 2
	assert wEnemyLightScreenCount == wEnemySafeguardCount + 1 && wEnemyReflectCount == wEnemySafeguardCount + 2

SetPlayerTurn::
	xor a
	ldh [hBattleTurn], a
	ret

SetEnemyTurn::
	ld a, 1
	ldh [hBattleTurn], a
	ret

UpdateOpponentInParty::
	ldh a, [hBattleTurn]
	and a
	jr z, UpdateEnemyMonInParty
	jr UpdateBattleMonInParty

UpdateUserInParty::
	ldh a, [hBattleTurn]
	and a
	jr nz, UpdateEnemyMonInParty
; fallthrough
UpdateBattleMonInParty::
; Update level, status, current HP

	ld a, [wCurBattleMon]

UpdateBattleMon::
	ld hl, wPartyMon1Level
	call GetPartyLocation

	ld d, h
	ld e, l
	ld hl, wBattleMonLevel
	ld bc, wBattleMonMaxHP - wBattleMonLevel
	jmp CopyBytes

UpdateEnemyMonInParty::
; Update level, status, current HP

; No wildmons.
	ld a, [wBattleMode]
	dec a
	ret z

	ld a, [wCurOTMon]
	ld hl, wOTPartyMon1Level
	call GetPartyLocation

	ld d, h
	ld e, l
	ld hl, wEnemyMonLevel
	ld bc, wEnemyMonMaxHP - wEnemyMonLevel
	jmp CopyBytes

RefreshBattleHuds::
	call UpdateBattleHuds
	ld c, 3
	call DelayFrames
	jmp WaitBGMap

UpdateBattleHuds::
	farcall UpdatePlayerHUD
	farjp UpdateEnemyHUD

INCLUDE "home/battle_vars.asm"

FarCopyRadioText::
	inc hl
	ldh a, [hROMBank]
	push af
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ldh [hROMBank], a
	ld [MBC3RomBank], a
	ld a, e
	ld l, a
	ld a, d
	ld h, a
	ld de, wRadioText
	ld bc, 2 * SCREEN_WIDTH
	rst CopyBytes
	pop af
	ldh [hROMBank], a
	ld [MBC3RomBank], a
	ret

MobileTextBorder::
	; For mobile link battles only.
	ld a, [wLinkMode]
	cp LINK_MOBILE
	ret c

	; Draw a cell phone icon at the
	; top right corner of the border.
	hlcoord 19, 12
	ld [hl], $5e ; top
	hlcoord 19, 13
	ld [hl], $5f ; bottom
	ret

BattleTextbox::
; Open a textbox and print text at hl.
	push hl
	call SpeechTextbox
	call MobileTextBorder
	call UpdateSprites
	call ApplyTilemap
	pop hl
	jmp PrintTextboxText

StdBattleTextbox::
; Open a textbox and print battle text at 20:hl.

	ldh a, [hROMBank]
	push af

	ld a, BANK(BattleText)
	rst Bankswitch

	call BattleTextbox

	pop af
	rst Bankswitch
	ret

GetBattleAnimPointer::
	ld hl, BattleAnimations
	ld a, BANK(BattleAnimations)
	call LoadDoubleIndirectPointer
	jr nz, .found
	ld hl, BattleAnim_Dummy
.found
	ld [wBattleAnimBank], a
	ld a, l
	ld [wBattleAnimAddress], a
	ld a, h
	ld [wBattleAnimAddress + 1], a
	ret

GetBattleAnimByte::
	push hl
	push de

	ld hl, wBattleAnimAddress
	ld a, [hli]
	ld d, [hl]
	ld e, a

	ld a, [wBattleAnimBank]
	rst Bankswitch

	ld a, [de]
	ld [wBattleAnimByte], a
	inc de

	ld a, BANK(BattleAnimCommands)
	rst Bankswitch

	ld a, d
	ld [hld], a
	ld [hl], e

	pop de
	pop hl

	ld a, [wBattleAnimByte]
	ret

PushLYOverrides::
	ldh a, [hLCDCPointer]
	and a
	ret z

	ld a, LOW(wLYOverridesBackup)
	ld [wRequested2bppSource], a
	ld a, HIGH(wLYOverridesBackup)
	ld [wRequested2bppSource + 1], a

	ld a, LOW(wLYOverrides)
	ld [wRequested2bppDest], a
	ld a, HIGH(wLYOverrides)
	ld [wRequested2bppDest + 1], a

	ld a, (wLYOverridesEnd - wLYOverrides) / LEN_2BPP_TILE
	ld [wRequested2bppSize], a
	ret
