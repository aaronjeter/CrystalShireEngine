BattleCommand_SwitchHit:
; Volt Switch, U-turn and Flip Turn: after a successful hit, the user
; switches out for a party member. Unlike Baton Pass, nothing carries over:
; the incoming Pokemon starts with fresh stat levels and no substatus, and
; the move's animation isn't played again.
; Does nothing (silently) if the move missed or had no effect, if either
; Pokemon fainted, or if there is nothing to switch to.

	ld a, [wAttackMissed]
	and a
	ret nz

; The user must still be standing (e.g. not knocked out by a contact ability)
	ld hl, wBattleMonHP
	ldh a, [hBattleTurn]
	and a
	jr z, .got_user_hp
	ld hl, wEnemyMonHP
.got_user_hp
	ld a, [hli]
	or [hl]
	ret z

	ldh a, [hBattleTurn]
	and a
	jr nz, .enemy

; Player: needs a healthy party member to switch to
	call CheckAnyOtherAlivePartyMons
	ret z

	call UpdateBattleMonInParty

	ld c, 20
	call DelayFrames

; Pick the incoming Pokemon (this menu can't be cancelled)
	call LoadStandardMenuHeader
	farcall SetUpBattlePartyMenu
	farcall ForcePickSwitchMonInBattle

; Return to the battle scene
	call ClearPalettes
	farcall _LoadBattleFontsHPBar
	call CloseWindow
	call ClearSprites
	farcall ClearEnemyHUDArea
	ld b, SCGB_BATTLE_COLORS
	call GetSGBLayout
	call SetDefaultBGPAndOBP
	call BatonPass_LinkPlayerSwitch

	ld hl, SwitchHitPlayerEntrance
	jmp CallBattleCore

.enemy
; Wild Pokemon have nothing to switch to
	ld a, [wBattleMode]
	dec a ; WILDMON
	ret z

	call CheckAnyOtherAliveEnemyMons
	ret z

	call UpdateEnemyMonInParty
	call BatonPass_LinkEnemySwitch

	ld hl, SwitchHitEnemyEntrance
	jmp CallBattleCore
