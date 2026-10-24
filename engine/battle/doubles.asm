; Double battles (2v2): the parts that run only when wDoubleBattle is set.
; See claude/double-battles-plan.md in the project. Included in the "Battle Core" section,
; so it can call the core routines directly.

InitDoubleBattleSlots:
; Double battles, before any lead is sent out: copy the fresh live variables of each side
; (as ClearBattleRAM and InitEnemyTrainer left them) into both of its slots, so a battler
; swapped in for the first time starts from the same state as the first lead.
	ld a, [wDoubleBattle]
	and a
	ret z
	ld a, BATTLER_SLOT_P2
	farcall SaveBattlerSlot
	ld a, BATTLER_SLOT_E2
	farcall SaveBattlerSlot
	ld a, BATTLER_SLOT_P1
	farcall SaveBattlerSlot
	ld a, BATTLER_SLOT_E1
	farcall SaveBattlerSlot
	ld a, 1 ; the leads' entrance abilities run together (DoublesLeadAbilities)
	ld [wDoublesDeferEntrance], a
	farjp DoublesEnterScreen ; the trainers slide out; the double battle screen

SendOutSecondEnemyLead:
; Double battles, after E1 was sent out: send the next OT mon with HP into E2 (or mark E2
; empty), then load E1 back. Its entrance ability runs later (DoublesLeadAbilities).
	ld a, [wDoubleBattle]
	and a
	ret z
	ld a, [wCurOTMon]
	ld c, a
	ld b, -1
	ld hl, wOTPartyMon1HP
	ld de, PARTYMON_STRUCT_LENGTH
.find
	inc b
	ld a, [wOTPartyCount]
	cp b
	jr z, .none
	ld a, b
	cp c
	jr z, .next
	ld a, [hli]
	or [hl]
	dec hl
	jr nz, .found
.next
	add hl, de
	jr .find

.none
	ld a, BATTLER_SLOT_E2
	jmp MarkBattlerSlotEmpty

.found
	push bc
	ld a, BATTLER_SLOT_E2
	farcall SwapInBattlerSlot
	pop bc
	ld a, b
	inc a
	ld [wEnemySwitchMonIndex], a
	call PrepareEnemySendIn
	call EnemySwitch_SetMode
	xor a
	ld [wEnemySwitchMonIndex], a
	ld [wEnemyIsSwitching], a ; BattleTurn clears it for the loaded battler only
	ld a, BATTLER_SLOT_E1
	farjp SwapInBattlerSlot

SendOutSecondPlayerLead:
; Double battles, after P1 was sent out: send the next fit party mon into P2 (or mark P2
; empty: the battle is 1v2), then load P1 back. Both enemy leads have faced both player
; leads (EXP).
	ld a, [wDoubleBattle]
	and a
	ret z
	ld a, [wCurBattleMon]
	ld [wCurPartyMon], a
.find
	ld hl, wCurPartyMon
	inc [hl]
	ld a, [wPartyCount]
	cp [hl]
	jr z, .none
	call CheckIfCurPartyMonIsFitToFight
	jr z, .find

	ld a, BATTLER_SLOT_P2
	farcall SwapInBattlerSlot
	ld a, [wCurPartyMon]
	ld [wCurBattleMon], a
	inc a
	ld hl, wPartySpecies - 1
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hl]
	ld [wCurPartySpecies], a
	ld [wTempBattleMonSpecies], a
	call InitBattleMon
	call ResetPlayerStatLevels
	call SendOutMonText
	call PreparePlayerSendIn
	call PlayerMonEntersField
	ld a, BATTLER_SLOT_P1
	farcall SwapInBattlerSlot
	jr .participants

.none
	ld a, BATTLER_SLOT_P2
	call MarkBattlerSlotEmpty

.participants
	ld a, [wFieldMons]
	ld [wBattleParticipantsNotFainted], a
	ld [wBattleParticipantsIncludingFainted], a
	ld e, a
	ld a, [wEmptyBattlerSlots]
	and 1 << BATTLER_SLOT_E2
	jr nz, .done
	ld a, BATTLER_SLOT_E2
	ld hl, BSLOT_PARTICIPANTS
	farcall WriteBattlerSlotByte
	ld a, BATTLER_SLOT_E2
	ld hl, BSLOT_PARTICIPANTS_ALL
	farcall WriteBattlerSlotByte
.done
	jr DrawLoadedBattlers

MarkBattlerSlotEmpty:
; a = slot: it has no battler. Update wFieldMons.
	farcall BattlerSlotMask
	ld hl, wEmptyBattlerSlots
	or [hl]
	ld [hl], a
	farjp UpdateFieldMons

DoublesLeadAbilities:
; Double battles, at the start: every lead's entrance ability, in Speed order.
; Returns nz in a double battle (DoBattle then goes to the turn loop), z in singles.
	ld a, [wDoubleBattle]
	and a
	ret z
	xor a
	ld [wDoublesDeferEntrance], a
	ld a, [wEmptyBattlerSlots]
	cpl
	and (1 << NUM_BATTLER_SLOTS) - 1
	ld [wDoublesNewMons], a
	call DoublesEntrances
	or 1
	ret

DrawLoadedBattlers:
; Redraw the double battle screen: the four pics and HP boxes (doubles_screen.asm). Its pics
; are reloaded only when they changed; move animations may have drawn over the screen.
	farjp DoublesRefreshScreen

; ---------------------------------------------------------------- the doubles turn (2B)

DoublesBattleTurn:
; BattleTurn for double battles. Returns when the battle ends.
.loop
	call DoublesTurnStart
	call DoublesAIChooseMoves
	call DoublesPlayerChoices
	jr c, .done
	call DoublesAIDecisions
	call DoublesAddFieldParticipants
	call DoublesDetermineOrder
	call DoublesRunActions
	jr c, .done
	call DoublesBetweenTurnEffects
	jr c, .done
	call DoublesReplaceFainted
	jr nc, .loop
.done
	; the battle ended: write the player's battlers back to the party
	jp DoublesUpdatePlayersInParty

DoublesTurnStart:
; Nobody is switching or has flinched; Speed order for the start-of-turn handlers.
	xor a
	ld [wBattleHasJustStarted], a
	ld [wCurDamage], a
	ld [wCurDamage + 1], a
	ld [wDoublesEnemyItemUsed], a
	ld [wDoublesActed], a
	ld hl, .reset
	call DoublesForEachSlot
	call DoublesComputeSpeedOrder
	call HandleBerserkGene
	jr DoublesUpdatePlayersInParty

.reset
	xor a
	ld [wPlayerIsSwitching], a
	ld [wEnemyIsSwitching], a
	ld hl, wPlayerLastDamage ; Counter and Mirror Coat count this turn's hits only
	ld [hli], a
	ld [hli], a
	ld hl, wEnemyLastDamage
	ld [hli], a
	ld [hl], a
	jmp ResetTurnFlinches

DoublesUpdatePlayersInParty:
; UpdateBattleMonInParty for each of the player's battlers.
	ld hl, .update
	jr DoublesForEachSlot

.update
	bit BATTLER_SLOT_ENEMY_F, c
	ret nz
	jmp UpdateBattleMonInParty

DoublesAddFieldParticipants:
; Every enemy battler has faced the player's battlers on the field (EXP).
	ld hl, .add
	jr DoublesForEachSlot

.add
	bit BATTLER_SLOT_ENEMY_F, c
	ret z
	ld a, [wFieldMons]
	ld b, a
	ld hl, wBattleParticipantsNotFainted
	or [hl]
	ld [hl], a
	ld a, b
	ld hl, wBattleParticipantsIncludingFainted
	or [hl]
	ld [hl], a
	ret

DoublesRemoveParticipant:
; The player's party mon a fainted: it no longer gets EXP from any enemy battler.
	ld b, a
	inc b
	ld a, 1 << 7
.mask
	rlca
	dec b
	jr nz, .mask
	cpl
	ld [wDoublesTemp], a
	ld hl, .remove
	jr DoublesForEachSlot

.remove
	bit BATTLER_SLOT_ENEMY_F, c
	ret z
	ld a, [wDoublesTemp]
	ld hl, wBattleParticipantsNotFainted
	and [hl]
	ld [hl], a
	ret

DoublesForEachSlot:
; For each slot with a battler, in slot order: load it, set hBattleTurn to its side and call
; hl with c = the slot.
	ld c, 0
.loop
	ld a, c
	call DoublesIsSlotEmpty
	jr nz, .next
	push hl
	push bc
	call DoublesSwapIn
	call DoublesSetTurn
	call _hl_
	pop bc
	pop hl
.next
	inc c
	ld a, c
	cp NUM_BATTLER_SLOTS
	jr nz, .loop
	ret

DoublesForEachBattler:
; ForEachBattler in double battles: routine hl for each battler in Speed order
; (wDoublesSpeedOrder), loaded with a foe and with hBattleTurn set.
	ld d, h
	ld e, l
DoublesForEachBattlerPair:
; ForEachBattlerPair in double battles: hl for the player's battlers, de for the enemy's.
	call DoublesSetRoutines
	ld c, 0
.loop
	push bc
	ld hl, wDoublesSpeedOrder
	ld b, 0
	add hl, bc
	ld a, [hl]
	cp $ff
	jr z, .next
	call DoublesIsSlotEmpty
	jr nz, .next
	call DoublesCallRoutine
.next
	pop bc
	inc c
	ld a, c
	cp NUM_BATTLER_SLOTS
	jr nz, .loop
	ret

DoublesForEachSide:
; ForEachSide in double battles: hl for the player's side, de for the enemy's, once each,
; with a battler of that side loaded (side state is shared).
	call DoublesSetRoutines
	ld a, BATTLER_SLOT_P1
	call .side
	ld a, BATTLER_SLOT_E1
.side
	call DoublesIsSlotEmpty
	jr z, DoublesCallRoutine
	inc a
	call DoublesIsSlotEmpty
	jr z, DoublesCallRoutine
	dec a
DoublesCallRoutine:
; Load slot a with a foe and call its side's routine (wDoublesRoutines) with hBattleTurn set.
	ld c, a
	call DoublesSwapIn
	call DoublesLoadFoeFor
	ld hl, wDoublesRoutines
	bit BATTLER_SLOT_ENEMY_F, c
	jr z, .got_routine
	inc hl
	inc hl
.got_routine
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call DoublesSetTurn
	jp hl

DoublesSetRoutines:
	ld a, l
	ld [wDoublesRoutines], a
	ld a, h
	ld [wDoublesRoutines + 1], a
	ld a, e
	ld [wDoublesRoutines + 2], a
	ld a, d
	ld [wDoublesRoutines + 3], a
	ret

; ---------------------------------------------------------------- choosing

DoublesAIChooseMoves:
; Each enemy battler chooses a move against the player's battler opposite it (or the other
; one) and targets it. The doubles AI is phase 6.
	ld c, BATTLER_SLOT_E1
.loop
	ld a, c
	call DoublesIsSlotEmpty
	jr nz, .next
	push bc
	call DoublesSwapIn
	call DoublesLoadFoeFor
	jr c, .no_foe
	push af
	farcall AIChooseMove
	pop af
	call DoublesSlotMask
	ld [wEnemyBattlerLinks + BATTLER_LINK_TARGET], a
.no_foe
	pop bc
.next
	inc c
	ld a, c
	cp NUM_BATTLER_SLOTS
	jr nz, .loop
	ret

DoublesPlayerChoices:
; P1, then P2, choose their actions. B on P2's battle menu goes back to P1 if P1 chose a
; move there. Carry if the battle ended.
	xor a
	ld [wDoublesP1Chose], a
	ld [wDoublesMenuBack], a
	ld a, BATTLER_SLOT_P1
	call DoublesChooseAction
	jr c, .ended
	ld a, [wDoublesP1Chose]
	ld [wDoublesMenuBack], a
	ld a, BATTLER_SLOT_P2
	call DoublesChooseAction
	ld a, [wDoublesMenuBack]
	ld b, a
	ld a, 0 ; no-optimize a = 0 (keep the carry)
	ld [wDoublesMenuBack], a
	ld [wDoublesChooser], a
	ret c
	bit 7, b
	jr nz, DoublesPlayerChoices
	ret

.ended
	xor a
	ld [wDoublesChooser], a
	scf
	ret

DoublesChooseAction:
; The player's battler in slot a chooses: the battle menu (items and switches take effect
; there), then a target for a move. Carry if the battle ended; nc with bit 7 of
; wDoublesMenuBack set if B went back.
	call DoublesIsSlotEmpty
	ret nz ; nc
	ld c, a
	inc a
	ld [wDoublesChooser], a ; its HP box is marked
	ld a, c
	call DoublesSwapIn
	call DoublesLoadFoeFor
	call DrawLoadedBattlers
	call CheckPlayerLockedIn
	jr c, .parse
.menu
	call BattleMenu
	jr nc, .chosen
	ld a, [wDoublesMenuBack]
	bit 7, a
	jr z, .ended
	and a
	ret

.chosen
	ld a, [wBattleEnded]
	and a
	jr nz, .ended
	ld a, [wForcedSwitch]
	and a
	jr nz, .ended
.parse
	call ParsePlayerAction
	push af
	call ClearSprites
	pop af
	jr nz, .menu
	ld a, [wBattlePlayerAction]
	and a ; BATTLEPLAYERACTION_USEMOVE?
	jr nz, .store ; a switch or an item
	call CheckPlayerLockedIn
	jr c, .store_move ; keeps its target
	call DoublesChooseTarget
	jr c, .menu
	ld a, [wAreaSlots]
	and a ; BATTLER_SLOT_P1?
	jr nz, .store_move
	inc a
	ld [wDoublesP1Chose], a
.store_move
	xor a ; BATTLEPLAYERACTION_USEMOVE
.store
	ld b, a
	ld a, [wAreaSlots]
	ld hl, wDoublesActions
	add l
	ld l, a
	adc h
	sub l
	ld h, a
	ld [hl], b
	xor a ; BATTLEPLAYERACTION_USEMOVE
	ld [wBattlePlayerAction], a
	ret

.ended
	scf
	ret

DoublesChooseTarget:
; The loaded player battler chose a move: set its target (BATTLER_LINK_TARGET), the foe
; opposite it by default. If the move targets one foe and both foes are out, ask which.
; Carry if B was pressed.
	ld a, [wAreaSlots]
	xor %10 ; the opposite foe
	call DoublesIsSlotEmpty
	jr z, .got_default
	xor 1
.got_default
	ld e, a
	ld a, [wEmptyBattlerSlots]
	and 1 << BATTLER_SLOT_E1 | 1 << BATTLER_SLOT_E2
	jr nz, .set
	ld a, [wCurPlayerMove]
	farcall GetMoveTarget
	cp MOVE_TARGET_SELECTED
	jr nz, .set ; spread moves hit both foes (DoublesSpreadPasses)
	ld a, e ; the default
	farcall DoublesTargetMenu
	ret c
	ld e, a
.set
	ld a, e
	call DoublesSlotMask
	ld [wPlayerBattlerLinks + BATTLER_LINK_TARGET], a
	and a
	ret

DoublesAIDecisions:
; Each enemy battler: the AI's switch or item (one item per side per turn), else its move
; is parsed. Sets the enemy slots' wDoublesActions.
	xor a
	ld [wDoublesEnemyItemUsed], a
	ld c, BATTLER_SLOT_E1
.loop
	ld a, c
	call DoublesIsSlotEmpty
	jr nz, .next
	push bc
	call DoublesSwapIn
	call DoublesLoadFoeFor
	call SetEnemyTurn
	ld a, [wCurEnemyMove]
	inc a
	ld b, BATTLEPLAYERACTION_USEITEM
	jr z, .got_action ; it already used Pursuit on a switching battler
	farcall AI_SwitchOrTryItem
	ld b, BATTLEPLAYERACTION_USEMOVE
	jr nc, .move
	ld b, BATTLEPLAYERACTION_USEITEM
	ld a, [wEnemyIsSwitching]
	and a
	jr nz, .switched
	ld a, 1
	ld [wDoublesEnemyItemUsed], a
	jr .got_action
.switched
	push bc
	farcall UpdateFieldMons
	pop bc
	jr .got_action
.move
	push bc
	call ParseEnemyAction
	pop bc
.got_action
	pop de
	push de
	ld hl, wDoublesActions
	ld d, 0
	add hl, de
	ld [hl], b
	pop bc
.next
	inc c
	ld a, c
	cp NUM_BATTLER_SLOTS
	jr nz, .loop
	ret

; ---------------------------------------------------------------- order

DoublesDetermineOrder:
; The turn's action list (wBattleActions): the battlers with their actions, ordered by move
; class (a switch or an item first, then move priority), Quick Claw, then Speed, with random
; ties. Fixed for the turn. Singles keeps DetermineMoveOrder.
	ld hl, wBattleActions
	lb bc, 0, BATTLER_SLOT_P1 ; b = count, c = slot
.loop
	ld a, c
	call DoublesIsSlotEmpty
	jr nz, .next
	ld [hl], c
	inc hl
	push hl
	ld hl, wDoublesActions
	ld e, c
	ld d, 0
	add hl, de
	ld a, [hl]
	pop hl
	ld [hli], a
	inc b
	push hl
	push bc
	ld a, c
	call DoublesTurnKeys
	pop bc
	pop hl
.next
	inc c
	ld a, c
	cp NUM_BATTLER_SLOTS
	jr nz, .loop
	ld a, b
	ld [wNumBattleActions], a
	ld hl, wBattleActions
	ld e, 2
	jr DoublesSortSlots

DoublesComputeSpeedOrder:
; wDoublesSpeedOrder = the slots with a battler, fastest first (random ties), $ff after them.
	ld hl, wDoublesSpeedOrder
	ld a, $ff
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ld hl, wDoublesSpeedOrder
	lb bc, 0, BATTLER_SLOT_P1
.loop
	ld a, c
	call DoublesIsSlotEmpty
	jr nz, .next
	ld [hl], c
	inc hl
	inc b
	push hl
	push bc
	ld a, c
	call DoublesSpeedKeys
	pop bc
	pop hl
.next
	inc c
	ld a, c
	cp NUM_BATTLER_SLOTS
	jr nz, .loop
	ld hl, wDoublesSpeedOrder
	ld e, 1
	; fallthrough

DoublesSortSlots:
; Sort the b entries at hl (e bytes each, the slot first) by their keys
; (wDoublesOrderKeys), highest first.
	ld a, b
	cp 2
	ret c
	dec a
	ld d, a ; comparisons per pass
	ld b, a ; passes
.pass
	push bc
	push hl
	ld c, d
.pair
	push bc
	push de
	push hl
	ld b, [hl]
	ld a, l
	add e
	ld l, a
	adc h
	sub l
	ld h, a
	ld a, b
	ld b, [hl]
	call DoublesCompareKeys
	pop hl
	pop de
	jr nc, .no_swap
	push hl
	push de
	ld b, e
	ld a, l
	add e
	ld e, a
	ld a, h
	adc 0
	ld d, a
.swap
	ld a, [de]
	ld c, [hl]
	ld [hli], a
	ld a, c
	ld [de], a
	inc de
	dec b
	jr nz, .swap
	pop de
	pop hl
.no_swap
	ld a, l
	add e
	ld l, a
	adc h
	sub l
	ld h, a
	pop bc
	dec c
	jr nz, .pair
	pop hl
	pop bc
	dec b
	jr nz, .pass
	ret

DoublesCompareKeys:
; Carry if slot b goes before slot a: higher keys, or equal keys and a coin flip.
; Preserves bc.
	push bc
	call DoublesKeyAddr
	ld d, h
	ld e, l
	ld a, b
	call DoublesKeyAddr
	ld b, 4
.loop
	ld a, [de]
	cp [hl]
	jr nz, .done
	inc de
	inc hl
	dec b
	jr nz, .loop
	call BattleRandom
	cp 50 percent + 1
.done
	pop bc
	ret

DoublesKeyAddr:
; hl = the keys of slot a. Preserves bc and de.
	and %11
	add a
	add a
	add LOW(wDoublesOrderKeys)
	ld l, a
	adc HIGH(wDoublesOrderKeys)
	sub l
	ld h, a
	ret

DoublesSpeedKeys:
; Keys of slot a for the Speed order: 0, 0, Speed.
	call DoublesLoadForKeys
	xor a
	ld [hli], a
	ld [hli], a
	jr DoublesSpeedKey

DoublesTurnKeys:
; Keys of slot a for the turn order: move class ($ff: a switch or an item, else the move's
; priority with Prankster/Gale Wings), Quick Claw (1 if it activated), Speed.
	call DoublesLoadForKeys
	push hl
	ld b, 0
	ld hl, wDoublesActions
	add hl, bc
	ld a, [hl]
	and a ; BATTLEPLAYERACTION_USEMOVE?
	ld a, $ff
	jr nz, .got_class
	ldh a, [hBattleTurn]
	and a
	ld a, [wCurPlayerMove]
	ld hl, wBattleMonAbility
	jr z, .got_move
	ld a, [wCurEnemyMove]
	ld hl, wEnemyMonAbility
.got_move
	push hl
	push af
	call GetMovePriority
	ld b, a
	pop af
	pop hl
	call ApplyPrankster
	ld a, b
.got_class
	pop hl
	ld [hli], a
	push hl
	farcall GetUserItem
	ld a, b
	cp HELD_QUICK_CLAW
	jr nz, .no_claw
	call BattleRandom
	cp c
	ld a, 1
	jr c, .got_claw
.no_claw
	xor a
.got_claw
	pop hl
	ld [hli], a
DoublesSpeedKey:
	push hl
	ldh a, [hBattleTurn]
	and a
	ld hl, wBattleMonSpeed
	jr z, .got_speed
	ld hl, wEnemyMonSpeed
.got_speed
	call GetTurnOrderSpeed
	pop hl
	ld a, b
	ld [hli], a
	ld [hl], c
	ret

DoublesLoadForKeys:
; Load slot a and set hBattleTurn to its side; hl = its keys, c = the slot.
	ld c, a
	call DoublesSwapIn
	call DoublesSetTurn
	ld a, c
	jr DoublesKeyAddr

; ---------------------------------------------------------------- running the turn

DoublesRunActions:
; Run the action list in order. Carry if the battle ended.
	xor a
	ld [wCurBattleAction], a
	ld [wDoublesActed], a
.loop
	ld a, [wCurBattleAction]
	ld hl, wNumBattleActions
	cp [hl]
	jr z, .done
	add a
	ld hl, wBattleActions
	add l
	ld l, a
	adc h
	sub l
	ld h, a
	ld a, [hli]
	ld c, a
	ld b, [hl]
	call DoublesRunAction
	ret c
	ld hl, wCurBattleAction
	inc [hl]
	jr .loop

.done
	xor a ; BATTLEPLAYERACTION_USEMOVE
	ld [wBattlePlayerAction], a
	ret

DoublesRunAction:
; Slot c's action b: its move against its target (if it hasn't fainted), the faints, then
; its residual damage. Carry if the battle ended.
	ld a, c
	call DoublesIsSlotEmpty
	ret nz ; nc: it fainted earlier this turn
	call DoublesSwapIn
	push bc
	call DoublesLoadTarget
	pop bc
	jr nc, .got_target
	ld b, BATTLEPLAYERACTION_USEITEM ; no foe is out: no move
.got_target
	call DoublesSetWentFirst
	ld a, c
	call DoublesSlotMask
	ld hl, wDoublesActed
	or [hl]
	ld [hl], a
	call DoublesSpreadSetup
	push bc
	call DrawLoadedBattlers
	pop bc
	push bc
	bit BATTLER_SLOT_ENEMY_F, c
	jr nz, .enemy
	ld a, b
	ld [wBattlePlayerAction], a
	call SetPlayerTurn
	call EndUserDestinyBond
	farcall DoPlayerTurn
	jr .moved

.enemy
	ld a, b
	and a ; BATTLEPLAYERACTION_USEMOVE?
	jr nz, .moved
	call SetEnemyTurn
	call EndUserDestinyBond
	farcall DoEnemyTurn
.moved
	pop bc
	call DoublesSpreadPasses
	xor a
	ld [wDoublesSpread], a
	ld a, [wForcedSwitch]
	and a
	jr nz, .ended
	call DoublesSetTurn
	push bc
	call DoublesCheckFaints
	pop bc
	ret c
	; the user's residual damage
	ld a, c
	call DoublesIsSlotEmpty
	ret nz ; nc
	call DoublesSwapIn
	call DoublesResidualDamage
	call DoublesSetTurn
	call DoublesCheckFaints
	ret c
	call RefreshBattleHuds
	and a
	ret

.ended
	scf
	ret

DoublesResidualDamage:
; ResidualDamage of the battler in slot c (loaded), with a foe loaded: the one that seeded it
; (Leech Seed heals whoever is in the seeder's slot; nobody is drained if that slot is empty),
; else the default foe. Preserves bc.
	ld a, c
	call DoublesLoadFoeFor
	call DoublesSetTurn
	ld hl, wPlayerSubStatus4
	ld de, wPlayerBattlerLinks + BATTLER_LINK_SEEDED_BY
	bit BATTLER_SLOT_ENEMY_F, c
	jr z, .got_side
	ld hl, wEnemySubStatus4
	ld de, wEnemyBattlerLinks + BATTLER_LINK_SEEDED_BY
.got_side
	bit SUBSTATUS_LEECH_SEED, [hl]
	jr z, .run
	ld a, [de]
	call DoublesMaskToSlot
	jr c, .run
	call DoublesIsSlotEmpty
	jr nz, .no_seeder
	call DoublesSwapIn
.run
	push bc
	call ResidualDamage
	pop bc
	ret

.no_seeder
	res SUBSTATUS_LEECH_SEED, [hl]
	push hl
	push bc
	call ResidualDamage
	pop bc
	pop hl
	set SUBSTATUS_LEECH_SEED, [hl]
	ret

DoublesLoadFutureSightTarget:
; HandleFutureSight, the attack is about to hit: in a double battle, load the battler in the
; target's slot (if it's empty, the foe already loaded is hit). Preserves bc, de and hl.
	ld a, [wDoubleBattle]
	and a
	ret z
	push hl
	ld hl, wPlayerFutureSightTarget
	ldh a, [hBattleTurn]
	and a
	jr z, .got_user
	ld hl, wEnemyFutureSightTarget
.got_user
	ld a, [hl]
	pop hl
	call DoublesMaskToSlot
	ret c
	call DoublesIsSlotEmpty
	ret nz
	jmp DoublesSwapIn

DoublesEnemyActed:
; nz in a double battle if the enemy's battler has already used its move this turn (Pursuit
; on a switching battler sets it to $ff), so ParseEnemyAction leaves it. z in singles.
	ld a, [wDoubleBattle]
	and a
	ret z
	ld a, [wCurEnemyMove]
	cp $ff
	jr z, .acted
	xor a
	ret

.acted
	or a ; nz
	ret

DoublesPursuitSwitch:
; The player's battler is switching out (BattleMonEntrance): PursuitSwitch for a foe that
; chose Pursuit. In a double battle, each foe that targeted the switcher's slot (it moves
; now, and not again this turn). Carry if the switcher fainted.
	ld a, [wDoubleBattle]
	and a
	jr nz, .doubles
	call SetEnemyTurn
	jmp PursuitSwitch

.doubles
	ld a, [wAreaSlots]
	call DoublesSlotMask
	ld [wDoublesTemp], a
	ld a, [wAreaSlots + 1]
	push af ; the foe loaded now
	ld c, BATTLER_SLOT_E1
.loop
	ld a, c
	call DoublesIsSlotEmpty
	jr nz, .next
	call DoublesSwapIn
	ld a, [wDoublesTemp]
	ld hl, wEnemyBattlerLinks + BATTLER_LINK_TARGET
	and [hl]
	jr z, .next
	push bc
	call SetEnemyTurn
	call PursuitSwitch
	pop bc
	jr c, .fainted
.next
	inc c
	ld a, c
	cp NUM_BATTLER_SLOTS
	jr nz, .loop
	pop af
	call DoublesSwapIn
	and a
	ret

.fainted
	pop af
	call DoublesSwapIn
	scf
	ret

DoublesSetWentFirst:
; "Did the target act first" (CheckOpponentWentFirst) for the battler in slot c against the
; target loaded opposite it: wEnemyGoesFirst = (the target has acted this turn) XOR (the
; user's side). Preserves bc and de.
	ld hl, wAreaSlots + 1
	bit BATTLER_SLOT_ENEMY_F, c
	jr z, .got_target_area
	dec hl
.got_target_area
	ld a, [hl]
	call DoublesSlotMask
	ld hl, wDoublesActed
	and [hl]
	jr z, .got_acted
	ld a, 1
.got_acted
	bit BATTLER_SLOT_ENEMY_F, c
	jr z, .got_first
	xor 1
.got_first
	ld [wEnemyGoesFirst], a
	ret

DoublesSpreadSetup:
; The battler in slot c is about to use action b: wDoublesSpread = DOUBLES_SPREAD_ACTIVE if
; it's a move that hits both foes (BOTH_FOES, ALL_OTHERS: no ally hits in v1) and both foes
; are out, else 0. Called moves (Metronome...) hit only the current target. Preserves bc.
	xor a
	ld [wDoublesSpread], a
	ld a, b
	and a ; BATTLEPLAYERACTION_USEMOVE?
	ret nz
	ld e, 1 << BATTLER_SLOT_E1 | 1 << BATTLER_SLOT_E2
	ld hl, wCurPlayerMove
	bit BATTLER_SLOT_ENEMY_F, c
	jr z, .got_side
	ld e, 1 << BATTLER_SLOT_P1 | 1 << BATTLER_SLOT_P2
	ld hl, wCurEnemyMove
.got_side
	ld a, [wEmptyBattlerSlots]
	and e
	ret nz
	ld a, [hl]
	farcall GetMoveTarget
	cp MOVE_TARGET_BOTH_FOES
	jr z, .spread
	cp MOVE_TARGET_ALL_OTHERS
	ret nz
.spread
	ld a, 1 << DOUBLES_SPREAD_ACTIVE_F
	ld [wDoublesSpread], a
	ret

DoublesSpreadPasses:
; After the first pass of the move of the battler in slot c: if it was a spread move that
; started (DOUBLES_SPREAD_ARMED), run it again against the other foe. The user must still
; be standing, unless it used Selfdestruct or Explosion. Preserves bc.
	ld a, [wDoublesSpread]
	bit DOUBLES_SPREAD_ARMED_F, a
	ret z
	call DoublesSetTurn
	ld hl, wBattleMonHP
	bit BATTLER_SLOT_ENEMY_F, c
	jr z, .got_hp
	ld hl, wEnemyMonHP
.got_hp
	ld a, [hli]
	or [hl]
	jr nz, .standing
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_SELFDESTRUCT
	ret nz
.standing
	ld hl, wDoublesSpread
	ld a, [wAttackMissed]
	and a
	jr nz, .missed
	set DOUBLES_SPREAD_HIT_F, [hl]
.missed
	set DOUBLES_SPREAD_PASS2_F, [hl]
	; the other foe
	ld hl, wAreaSlots + 1
	bit BATTLER_SLOT_ENEMY_F, c
	jr z, .got_target_area
	dec hl
.got_target_area
	ld a, [hl]
	xor 1
	call DoublesSwapIn
	call DoublesSetWentFirst
	push bc
	call DrawLoadedBattlers
	pop bc
	call DoublesSetTurn
	push bc
	farcall DoublesSpreadPass
	pop bc
	ret

DoublesLoadTarget:
; Load the target of the battler in slot c: its chosen target (BATTLER_LINK_TARGET), or the
; other foe if that slot is empty; a random foe for RANDOM_FOE moves. b = its action.
; Carry if no foe is out.
	ld a, b
	and a ; BATTLEPLAYERACTION_USEMOVE?
	jp nz, .default
	ld a, [wCurPlayerMove]
	ld hl, wPlayerBattlerLinks + BATTLER_LINK_TARGET
	bit BATTLER_SLOT_ENEMY_F, c
	jr z, .got_user
	ld a, [wCurEnemyMove]
	ld hl, wEnemyBattlerLinks + BATTLER_LINK_TARGET
.got_user
	push hl
	farcall GetMoveTarget
	pop hl
	cp MOVE_TARGET_RANDOM_FOE
	jr z, .random
	cp MOVE_TARGET_COUNTER
	jr z, .last_attacker
	; Bide, unleashing: whoever hit the user last
	push hl
	ld hl, wPlayerSubStatus3
	bit BATTLER_SLOT_ENEMY_F, c
	jr z, .got_substatus
	ld hl, wEnemySubStatus3
.got_substatus
	bit SUBSTATUS_BIDE, [hl]
	pop hl
	jr nz, .last_attacker
	ld a, [hl]
	call DoublesMaskToSlot
	jr c, .default
	ld b, a
	xor c
	and 1 << BATTLER_SLOT_ENEMY_F
	jr z, .default ; not a foe (no ally targets in v1)
	ld a, b
	call DoublesIsSlotEmpty
	jr z, .load
	xor 1
	call DoublesIsSlotEmpty
	jr z, .load
	scf
	ret

.last_attacker
; Counter, Mirror Coat, Bide: the battler that last hit the user, with that hit's damage this
; turn in wCurDamage (none: the default foe, no damage, so Counter fails).
	xor a
	ld [wCurDamage], a
	ld [wCurDamage + 1], a
	ld de, BATTLER_LINK_LAST_ATTACKER - BATTLER_LINK_TARGET
	add hl, de
	ld a, [hl]
	call DoublesMaskToSlot
	jr c, .default
	call DoublesIsSlotEmpty
	jr nz, .default
	ld hl, wPlayerLastDamage
	bit BATTLER_SLOT_ENEMY_F, c
	jr z, .got_damage
	ld hl, wEnemyLastDamage
.got_damage
	ld e, a
	ld a, [hli]
	ld [wCurDamage], a
	ld a, [hl]
	ld [wCurDamage + 1], a
	ld a, e
	jr .load

.random
	ld a, c
	xor %10
	and %10 ; the foes' first slot
	ld b, a
	call DoublesIsSlotEmpty
	jr nz, .default
	inc a
	call DoublesIsSlotEmpty
	jr nz, .default
	call BattleRandom
	and 1
	add b
.load
	call DoublesSwapIn
	and a
	ret

.default
	ld a, c
	jmp DoublesLoadFoeFor

DoublesMaskToSlot:
; a = the slot of the lowest bit set in mask a; carry if none. Preserves bc, de and hl.
	and a
	scf
	ret z
	push bc
	ld b, -1
.loop
	inc b
	rrca
	jr nc, .loop
	ld a, b
	pop bc
	and a
	ret

; ---------------------------------------------------------------- end of turn

DoublesBetweenTurnEffects:
; HandleBetweenTurnEffects for double battles: the same handlers, run per battler in Speed
; order by the doubles iterators, with the faint check after each damaging one. Protect and
; Endure end with the turn. Carry if the battle ended.
	ld hl, .end_protect
	call DoublesForEachSlot
	call DoublesComputeSpeedOrder
	call .faints
	ret c
	call HandleFutureSight
	call .faints
	ret c
	call HandleWeather
	call .faints
	ret c
	call HandleWrap
	call .faints
	ret c
	call HandlePerishSong
	call .faints
	ret c
	call HandleLeftovers
	call HandleHealAbilities
	call HandleWeatherHealAbilities
	call HandleShedSkin
	call HandleMysteryberry
	call HandleSafeguard
	call HandleScreens
	call HandleStatBoostingHeldItems
	call HandleHealingItems
	call DoublesUpdatePlayersInParty
	call LoadTilemapToTempTilemap
	call HandleEncore
	and a
	ret

.faints
	call SetEnemyTurn ; the player's battlers first
	jr DoublesCheckFaints

.end_protect
	ld hl, wPlayerSubStatus1
	res SUBSTATUS_PROTECT, [hl]
	res SUBSTATUS_ENDURE, [hl]
	ld hl, wEnemySubStatus1
	res SUBSTATUS_PROTECT, [hl]
	res SUBSTATUS_ENDURE, [hl]
	ret

; ---------------------------------------------------------------- faints (2C)

DoublesCheckFaints:
; Faint every battler on the field with no HP left: hBattleTurn's foes first, then its own
; side. The slot is marked empty (refilled at the end of the turn). Carry if the battle ended.
	ldh a, [hBattleTurn]
	push af
	xor 1
	call .side
	pop bc
	ret c
	ld a, b
.side
	add a
	ld c, a
	call .slot
	ret c
	inc c
.slot
	ld a, c
	call DoublesIsSlotEmpty
	ret nz ; nc
	call DoublesSlotHasNoHP
	ret nz ; nc
	push bc
	call DoublesFaintSlot
	pop bc
	ret

DoublesFaintSlot:
; The battler in slot a has fainted: the animation and text, EXP (enemy), its slot is marked
; empty, and the battle ends if its side has no mon left. Carry if the battle ended.
	ld c, a
	call DoublesSwapIn
	push bc
	call DrawLoadedBattlers
	pop bc
	bit BATTLER_SLOT_ENEMY_F, c
	jr nz, .enemy
	call FaintYourPokemon
	call UpdateFaintedPlayerMon
	xor a ; the player's area
	farcall BattlerLeavesField
	ld a, [wAreaSlots]
	call MarkBattlerSlotEmpty
	ld a, [wCurBattleMon]
	call DoublesRemoveParticipant ; (swaps the other battlers in)
	call CheckPlayerPartyForFitMon
	ld a, d
	and a
	jr nz, .continue
	call LostBattle
	scf
	ret

.enemy
	call FaintEnemyPokemon
	ld a, 1 ; the player's battler is handled on its own
	ld [wWhichMonFaintedFirst], a
	call UpdateBattleStateAndExperienceAfterEnemyFaint
	ld a, [wAreaSlots + 1]
	call MarkBattlerSlotEmpty
	call CheckEnemyTrainerDefeated
	jr nz, .continue
	call WinTrainerBattle
	scf
	ret

.continue
	and a
	ret

DoublesReplaceFainted:
; End of the turn: refill each empty slot whose side has a mon left that isn't on the field
; (the player picks; the AI picks for the enemy; no Shift prompt). Then Spikes and the entrance
; abilities of the new battlers in Speed order. Carry if the battle ended.
.again
	xor a
	ld [wDoublesNewMons], a
	ld c, BATTLER_SLOT_P1
.loop
	ld a, c
	call DoublesIsSlotEmpty
	jr z, .next
	call DoublesSideHasBench
	jr nc, .next
	push bc
	bit BATTLER_SLOT_ENEMY_F, c
	jr nz, .enemy
	call DoublesPlayerSendIn
	jr .sent
.enemy
	call DoublesEnemySendIn
.sent
	pop bc
	ld a, c
	call DoublesSlotMask
	ld hl, wDoublesNewMons
	or [hl]
	ld [hl], a
.next
	inc c
	ld a, c
	cp NUM_BATTLER_SLOTS
	jr nz, .loop
	ld a, [wDoublesNewMons]
	and a
	ret z ; nc
	call DoublesAddFieldParticipants
	call DoublesEntrances
	call SetEnemyTurn
	call DoublesCheckFaints
	ret c
	jr .again ; Spikes may have fainted one

DoublesSideHasBench:
; Carry if slot a's side has a mon with HP that isn't on the field. Preserves bc.
	push bc
	ld hl, wPartyMon1HP
	ld de, wPartyCount
	ld b, 0
	bit BATTLER_SLOT_ENEMY_F, a
	jr z, .got_side
	ld hl, wOTPartyMon1HP
	ld de, wOTPartyCount
	inc b
.got_side
	ld a, b
	ld [wDoublesTemp], a
	ld a, [de]
	ld b, a
	ld c, 0
.loop
	ld a, [hli]
	or [hl]
	dec hl
	jr z, .next
	push hl
	ld a, [wDoublesTemp]
	and a
	ld a, c
	jr nz, .enemy
	farcall IsPlayerMonOnField
	jr .checked
.enemy
	farcall IsEnemyMonOnField
.checked
	pop hl
	jr nz, .yes
.next
	ld de, PARTYMON_STRUCT_LENGTH
	add hl, de
	inc c
	dec b
	jr nz, .loop
	pop bc
	and a
	ret

.yes
	pop bc
	scf
	ret

DoublesPlayerSendIn:
; The player picks a mon for empty slot c (not one on the field) and sends it in.
; The entrance ability waits for DoublesEntrances.
	ld a, c
	call DoublesSwapIn
	ld a, c
	call DoublesLoadFoeFor
	call EmptyBattleTextbox
	call LoadStandardMenuHeader
	call SetUpBattlePartyMenu
.pick
	call ForcePickPartyMonInBattle
	ld a, [wCurPartyMon]
	farcall IsPlayerMonOnField
	jr nz, .picked
	ld hl, BattleText_MonIsAlreadyOut
	call StdBattleTextbox
	jr .pick

.picked
	ld a, [wAreaSlots]
	call DoublesSlotMask
	cpl
	ld hl, wEmptyBattlerSlots
	and [hl]
	ld [hl], a
	call ClearSprites
	ld a, [wCurBattleMon]
	ld [wLastPlayerMon], a
	ld a, [wCurPartyMon]
	ld [wCurBattleMon], a
	call InitBattleMon
	call ResetPlayerStatLevels
	call ClearPalettes
	call DelayFrame
	call _LoadHPBar
	call CloseWindow
	call GetMemSGBLayout
	call SetDefaultBGPAndOBP
	ld a, 1
	ld [wDoublesDeferEntrance], a
	call SendOutMonText
	call PreparePlayerSendIn
	call PlayerMonEntersField
	xor a
	ld [wDoublesDeferEntrance], a
	ret

DoublesEnemySendIn:
; The AI picks a mon for empty slot c (not one on the field) and sends it in.
	ld a, c
	call DoublesSwapIn
	ld a, c
	call DoublesLoadFoeFor
	ld a, [wAreaSlots + 1]
	call DoublesSlotMask
	cpl
	ld hl, wEmptyBattlerSlots
	and [hl]
	ld [hl], a
	xor a
	ld [wEnemySwitchMonIndex], a
	call PrepareEnemySendIn
	call EnemySwitch_SetMode
	xor a
	ld [wEnemyIsSwitching], a
	ld [wEnemyMoveStruct + MOVE_ANIM], a
	farjp UpdateFieldMons

DoublesEntrances:
; Spikes, then the entrance ability, for each battler in wDoublesNewMons, in Speed order.
	call DoublesComputeSpeedOrder
	ld c, 0
.loop
	push bc
	ld hl, wDoublesSpeedOrder
	ld b, 0
	add hl, bc
	ld a, [hl]
	cp $ff
	jr z, .next
	ld c, a
	call DoublesSlotMask
	ld hl, wDoublesNewMons
	and [hl]
	jr z, .next
	ld a, c
	call DoublesSwapIn
	call DoublesLoadFoeFor
	push bc
	call DrawLoadedBattlers
	pop bc
	call DoublesSetTurn
	call SpikesDamage
	call HasUserFainted
	jr z, .next
	ldh a, [hBattleTurn]
	and a
	ld a, [wBattleMonAbility]
	jr z, .got_ability
	ld a, [wEnemyMonAbility]
.got_ability
	ld [wTempAbility], a
	farcall Check_Entrance_Ability
	call DrawLoadedBattlers ; (its animation draws where singles has the pics)
.next
	pop bc
	inc c
	ld a, c
	cp NUM_BATTLER_SLOTS
	jr nz, .loop
	xor a
	ld [wDoublesNewMons], a
	ret

; ---------------------------------------------------------------- slot helpers

DoublesSlotMask:
; a = 1 << slot a. Preserves bc, de and hl.
	push bc
	and %11
	ld b, a
	ld a, 1
	jr z, .done
.loop
	add a
	dec b
	jr nz, .loop
.done
	pop bc
	ret

DoublesIsSlotEmpty:
; nz if slot a has no battler. Preserves a, bc, de and hl.
	push bc
	ld c, a
	call DoublesSlotMask
	ld b, a
	ld a, [wEmptyBattlerSlots]
	and b
	ld a, c
	pop bc
	ret

DoublesIsLoaded:
; z if slot a is the one loaded in its side's area. Preserves a, bc, de and hl.
	push hl
	push bc
	ld c, a
	ld hl, wAreaSlots
	bit BATTLER_SLOT_ENEMY_F, c
	jr z, .got_area
	inc hl
.got_area
	ld a, [hl]
	cp c
	ld a, c
	pop bc
	pop hl
	ret

DoublesSwapIn:
; Load slot a into its side's area (SwapInBattlerSlot). Preserves a, bc, de and hl.
	push af
	push bc
	push de
	push hl
	farcall SwapInBattlerSlot
	pop hl
	pop de
	pop bc
	pop af
	ret

DoublesSetTurn:
; hBattleTurn = the side of slot c. Preserves bc, de and hl.
	bit BATTLER_SLOT_ENEMY_F, c
	jmp nz, SetEnemyTurn
	jmp SetPlayerTurn

DoublesLoadFoeFor:
; Load a foe of slot a into the other area: the opposite slot (P1-E1, P2-E2), or the other
; foe if that one is empty. a = the foe's slot; carry if both foes are empty.
; Preserves bc, de and hl.
	xor %10
	call DoublesIsSlotEmpty
	jr z, .load
	xor 1
	call DoublesIsSlotEmpty
	jr z, .load
	scf
	ret

.load
	call DoublesSwapIn
	and a
	ret

DoublesSlotHasNoHP:
; z if the battler in slot a has no HP (live if loaded, else stored). Preserves bc, de, hl.
	push bc
	push de
	push hl
	ld c, a
	call DoublesIsLoaded
	jr nz, .stored
	ld hl, wBattleMonHP
	bit BATTLER_SLOT_ENEMY_F, c
	jr z, .live
	ld hl, wEnemyMonHP
.live
	ld a, [hli]
	or [hl]
	jr .done

.stored
	ld hl, BSLOT_MON + BATTLEMON_HP
	farcall ReadBattlerSlotByte
	ld b, a
	ld a, c
	ld hl, BSLOT_MON + BATTLEMON_HP + 1
	farcall ReadBattlerSlotByte
	or b
.done
	ld a, c
	pop hl
	pop de
	pop bc
	ret
