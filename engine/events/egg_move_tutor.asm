EggMoveTutor:
; The Day-Care Egg Move tutor: teaches a party Pokemon one of its line's egg
; moves (the first evolution stage's list) for EggMoveCost. Uses the Move
; Reminder's move list and menu.
	ld hl, EggMoveTutorIntroText
	call PrintText
	farcall PlaceMoneyTopRight
	call YesNoBox
	jr c, .cancel

	ld hl, EggMoveCost
	call CheckCostAgainstMoney
	jr c, .not_enough_money

	ld hl, MoveReminderWhichMonText
	call PrintText
	farcall SelectMonFromParty
	jr c, .cancel

	ld a, [wCurPartySpecies]
	cp EGG
	jr z, .is_an_egg
	call IsAPokemon
	jr c, .not_a_pokemon

	call GetEggTutorMoves
	jr z, .no_moves_to_learn

	ld hl, EggMoveTutorWhichMoveText
	call PrintText
	call ChooseMoveToLearn
	jr c, .exit_menu

	ld a, [wMenuSelection]
	ld [wNamedObjectIndex], a
	call GetMoveName
	call CopyName1
	predef LearnMove
	ld a, b
	dec a
	jr z, .move_learned

.exit_menu
	call ReturnToMapWithSpeechTextbox
.cancel
	ld hl, EggMoveTutorCancelText
	jp PrintText

.is_an_egg
	ld hl, MoveReminderEggText
	jp PrintText

.not_a_pokemon
	ld hl, MoveReminderNotaMonText
	jp PrintText

.no_moves_to_learn
	ld hl, EggMoveTutorNoMovesText
	jp PrintText

.not_enough_money
	ld hl, MoveReminderNotEnoughMoneyText
	jp PrintText

.move_learned
	call ReturnToMapWithSpeechTextbox
	ld hl, EggMoveTutorLearnedText
	call PrintText
	farcall PlaceMoneyTopRight
	ld hl, EggMoveCost
	ld de, hMoneyTemp
	ld bc, 3
	call CopyBytes
	call ApplyTilemap
	call PromptButton
	call WaitSFX
	ld bc, hMoneyTemp
	ld de, wMoney
	farcall TakeMoney
	farcall PlaceMoneyTopRight
	ld de, SFX_TRANSACTION
	call PlaySFX
	call WaitSFX
	ld hl, MoveReminderPaymentReceivedText
	call PrintText
	jr .cancel

CheckCostAgainstMoney:
; hl = a 3-byte cost; carry if the player has less money
	ld de, hMoneyTemp
	ld bc, 3
	call CopyBytes
	ld bc, hMoneyTemp
	ld de, wMoney
	farcall CompareMoney
	ret

EggMoveCost:
	dt 5000

GetEggTutorMoves:
; Fills the move list (wd002: count, then the moves, then $ff) with the egg
; moves of the selected Pokemon's first evolution stage that it doesn't know.
; Returns z if there are none.
	ld hl, wd002
	xor a
	ld [hli], a
	ld [hl], $ff

	ld a, MON_SPECIES
	call GetPartyParamLocation
	ld a, [hl]
	ld [wCurPartySpecies], a
	push af
	farcall GetLowestEvolutionStage

	ld a, [wCurPartySpecies]
	call GetPokemonIndexFromID
	ld b, h
	ld c, l
	ld hl, EggMovePointers
	ld a, BANK(EggMovePointers)
	call LoadDoubleIndirectPointer
	ldh [hTemp], a
	ld de, wd002 + 1
	ld b, 0

.loop
	push hl
	ldh a, [hTemp]
	call GetFarWord ; hl = the move's index; -1 ends the list
	ld a, h
	and l
	inc a
	jr z, .done
	ld a, b
	push af
	push de
	call GetMoveIDFromIndex
	pop de
	ld c, a
	pop af
	ld b, a
	call CheckAlreadyInList
	jr c, .next
	call CheckPokemonAlreadyKnowsMove
	jr c, .next
	ld a, c
	ld [de], a
	inc de
	ld a, $ff
	ld [de], a
	inc b
.next
	pop hl
	inc hl
	inc hl
	jr .loop

.done
	pop hl
	pop af
	ld [wCurPartySpecies], a
	ld a, b
	ld [wd002], a
	and a
	ret

EggMoveTutorIntroText:
	text "I teach moves a"
	line "#mon's line"
	cont "learns from Eggs."

	para "It's ¥5000 a move."
	line "Interested?"
	done

EggMoveTutorWhichMoveText:
	text "Which move should"
	line "it learn?"
	prompt

EggMoveTutorCancelText:
	text "Come back any"
	line "time!"
	done

EggMoveTutorNoMovesText:
	text "I have no moves"
	line "to teach this"
	cont "#mon."
	done

EggMoveTutorLearnedText:
	text "Done! Your #mon"
	line "learned the move."
	done
