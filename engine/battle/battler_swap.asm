; Battler slots for double battles.
;
; The battle engine only works on the live "player" and "enemy" variables. In a double battle,
; each of the four battlers (slots P1, P2, E1, E2) keeps its own copy of every per-battler
; variable in wBattlerSlots, and is copied in and out of the live variables of its side:
;   SaveBattlerSlot: live variables of slot a's side -> slot a
;   LoadBattlerSlot: slot a -> live variables of its side
;
; BattlerSwapList names every per-battler variable: size, player address, enemy address.
; A variable that only one side has uses 0 for the other side's address (its bytes in the
; slot stay unused). Every slot has the same layout, BATTLER_SLOT_SIZE bytes.
; Everything else in wBattle is shared: per-action and per-turn temporaries, side state
; (screens, Spikes, Safeguard), field state (weather), trainer and reward data.
; tools/claude_emu/battle_test.py (`check`) verifies that every wBattle byte is either listed
; here or named in its SHARED list, and that each pair's bytes match by name.

DEF BATTLER_SWAP_TOTAL = 0

MACRO swap_entry ; size, player address, enemy address
	db \1
	dw \2, \3
	DEF BATTLER_SWAP_TOTAL += \1
ENDM

MACRO swap_pair ; player, enemy, size
	swap_entry \3, \1, \2
ENDM

MACRO swap_player ; player, size
	swap_entry \2, \1, 0
ENDM

MACRO swap_enemy ; enemy, size
	swap_entry \2, 0, \1
ENDM

DEF BATTLER_SWAP_ENTRY_LENGTH EQU 5

BattlerSwapList:
	swap_pair wPlayerMoveStruct,        wEnemyMoveStruct,        MOVE_LENGTH
	swap_pair wBattleMonNickname,       wEnemyMonNickname,       MON_NAME_LENGTH
	swap_pair wBattleMon,               wEnemyMon,               BATTLE_STRUCT_LENGTH
	swap_pair wBattleMonAbility,        wEnemyMonAbility,        1
	swap_pair wCurBattleMon,            wCurOTMon,               1
	swap_pair wTempBattleMonSpecies,    wTempEnemyMonSpecies,    1
	swap_pair wPlayerSubStatus1,        wEnemySubStatus1,        5
	swap_pair wPlayerRolloutCount,      wEnemyRolloutCount,      8 ; through the Protect count
	swap_pair wPlayerDamageTaken,       wEnemyDamageTaken,       2
	swap_pair wPlayerStats,             wEnemyStats,             NUM_BATTLE_STATS * 2 + 1 ; + padding
	swap_pair wPlayerStatLevels,        wEnemyStatLevels,        NUM_LEVEL_STATS
	swap_pair wPlayerTurnsTaken,        wEnemyTurnsTaken,        1
	swap_pair wPlayerSubstituteHP,      wEnemySubstituteHP,      1
	swap_pair wCurPlayerMove,           wCurEnemyMove,           1
	swap_pair wCurMoveNum,              wCurEnemyMoveNum,        1
	swap_pair wDisabledMove,            wEnemyDisabledMove,      1
	swap_pair wLastPlayerCounterMove,   wLastEnemyCounterMove,   1
	swap_pair wPlayerMinimized,         wEnemyMinimized,         1
	swap_pair wPlayerIsSwitching,       wEnemyIsSwitching,       1
	swap_pair wLastPlayerMove,          wLastEnemyMove,          1
	swap_pair wPlayerFutureSightCount,  wEnemyFutureSightCount,  1
	swap_pair wPlayerFutureSightDamage, wEnemyFutureSightDamage, 2
	swap_pair wPlayerRageCounter,       wEnemyRageCounter,       1
	swap_pair wPlayerTrappingMove,      wEnemyTrappingMove,      1
	swap_pair wPlayerWrapCount,         wEnemyWrapCount,         1
	swap_pair wPlayerCharging,          wEnemyCharging,          1
	swap_pair wPlayerJustGotFrozen,     wEnemyJustGotFrozen,     1
	swap_player wPlayerUsedMoves, NUM_MOVES ; what the AI has seen this battler use
	swap_player wLastPlayerMon, 1
	swap_enemy wEnemyMonBaseStats, NUM_EXP_STATS + 2 ; base stats, catch rate, base EXP
	swap_enemy wEnemyAbilitySlot, 1
	swap_enemy wEnemyBackupDVs, 2 ; while transformed
	swap_enemy wEnemyAISwitchScore, 3 ; switch score, param, index
	swap_enemy wBackupEnemyMonBaseStats, NUM_EXP_STATS + 2
	swap_enemy wBattleParticipantsNotFainted, 1 ; the player's mons this battler has faced
	swap_enemy wBattleParticipantsIncludingFainted, 1
	swap_enemy wEnemyHPAtTimeOfPlayerSwitch, 2
	swap_enemy wEnemyItemState, 1 ; trainer AI item use for this battler
	db 0 ; end

	assert BATTLER_SWAP_TOTAL == BATTLER_SLOT_SIZE, \
		"BATTLER_SLOT_SIZE (constants/battle_constants.asm) must be {d:BATTLER_SWAP_TOTAL}"
	assert wBattleMonStructEnd - wBattleMon == BATTLE_STRUCT_LENGTH
	assert wEnemyMonStructEnd - wEnemyMon == BATTLE_STRUCT_LENGTH
	assert wEnemyMonEnd - wEnemyMonBaseStats == NUM_EXP_STATS + 2
	assert wBackupEnemyMonBaseExp + 1 - wBackupEnemyMonBaseStats == NUM_EXP_STATS + 2
	assert wPlayerProtectCount + 1 - wPlayerRolloutCount == 8
	assert wEnemyProtectCount + 1 - wEnemyRolloutCount == 8
	assert wEnemySwitchMonIndex + 1 - wEnemyAISwitchScore == 3

SaveBattlerSlot::
; Copy the live variables of slot a's side into slot a.
	ld c, a
	jr BattlerSlotCopy

LoadBattlerSlot::
; Copy slot a into the live variables of its side.
	or $80
	ld c, a
	; fallthrough

BattlerSlotCopy:
; c: slot in bits 0-1; bit 7 set: load (slot -> live), else save (live -> slot)
; Live WRAMX variables are in BANK(wEnemyMon); the slots are in BANK(wBattlerSlots).
	ldh a, [rSVBK]
	push af
	ld a, c
	and %11
	ld hl, wBattlerSlots
	ld de, BATTLER_SLOT_SIZE
	jr z, .got_slot
.slot_loop
	add hl, de
	dec a
	jr nz, .slot_loop
.got_slot
	ld d, h
	ld e, l
	ld hl, BattlerSwapList
.entry
	ld a, [hl]
	and a
	jr z, .done
	ld b, a
	push hl
	inc hl
	bit BATTLER_SLOT_ENEMY_F, c
	jr z, .got_side
	inc hl
	inc hl
.got_side
	ld a, [hli]
	ld h, [hl]
	ld l, a
	or h
	jr z, .skip
	bit 7, c
	jr nz, .load
.save
	ld a, BANK(wEnemyMon)
	ldh [rSVBK], a
	ld a, [hli]
	push af
	ld a, BANK(wBattlerSlots)
	ldh [rSVBK], a
	pop af
	ld [de], a
	inc de
	dec b
	jr nz, .save
	jr .next

.load
	ld a, BANK(wBattlerSlots)
	ldh [rSVBK], a
	ld a, [de]
	inc de
if DEF(SWAP_TEST)
	bit 6, c
	jr z, .not_wipe
	ld a, $a5
.not_wipe
endc
	push af
	ld a, BANK(wEnemyMon)
	ldh [rSVBK], a
	pop af
	ld [hli], a
	dec b
	jr nz, .load
	jr .next

.skip
	ld a, e
	add b
	ld e, a
	jr nc, .next
	inc d
.next
	pop hl
	ld a, l
	add BATTLER_SWAP_ENTRY_LENGTH
	ld l, a
	jr nc, .entry
	inc h
	jr .entry

.done
	pop af
	ldh [rSVBK], a
	ret

if DEF(SWAP_TEST)
SwapTest::
; Test builds only (built with -D SWAP_TEST; see the harness README): send both sides through
; all four slots, wiping the live variables in between. Singles must play exactly as without it.
	ld a, BATTLER_SLOT_P1
	call .round_trip
	ld a, BATTLER_SLOT_P2
	call .round_trip
	ld a, BATTLER_SLOT_E1
	call .round_trip
	ld a, BATTLER_SLOT_E2
.round_trip
	push af
	call SaveBattlerSlot
	pop af
	push af
	or $c0 ; load with wipe: fill the live variables with $a5
	ld c, a
	call BattlerSlotCopy
	pop af
	jp LoadBattlerSlot
endc
