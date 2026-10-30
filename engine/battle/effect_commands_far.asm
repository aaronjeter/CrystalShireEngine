; Move effects moved out of the Effect Commands bank (double battles phase 0.5, step 7)
; to make room there. Each BattleCommand_X left in effect_commands.asm is a 4-byte
; stub, "farjp _BattleCommand_X", so the command table and move scripts are unchanged.
; Calls from here into routines that stayed in Effect Commands are farcall/farjp
; (far calls keep a, bc, de, hl and the flags). A helper that reads a table at an
; address in its own bank (CheckMoveInList) must get a table that stayed there too.

; ---- from engine/battle/move_effects/thief.asm

_BattleCommand_Thief:
	ldh a, [hBattleTurn]
	and a
	jr nz, .enemy

; The player needs to be able to steal an item.

	call .playeritem
	ld a, [hl]
	and a
	ret nz
; Not if Knock Off only suppressed the item: the party struct still has it,
; and the stolen item would overwrite it.
	ld a, [de]
	and a
	ret nz

; The enemy needs to have an item to steal.

	call .enemyitem
	ld a, [hl]
	and a
	ret z

; Can't steal mail.

	ld [wNamedObjectIndex], a
	ld d, a
	farcall ItemIsMail
	ret c

	ld a, [wEffectFailed]
	and a
	ret nz

	ld a, [wLinkMode]
	and a
	jr z, .stealenemyitem

	ld a, [wBattleMode]
	dec a
	ret z

.stealenemyitem
	call .enemyitem
	xor a
	ld [hl], a
	ld [de], a

	call .playeritem
	ld a, [wNamedObjectIndex]
	ld [hl], a
	ld [de], a
	jr .stole

.enemy

; The enemy can't already have an item.

	call .enemyitem
	ld a, [hl]
	and a
	ret nz

; The player must have an item to steal.

	call .playeritem
	ld a, [hl]
	and a
	ret z

; Can't steal mail!

	ld [wNamedObjectIndex], a
	ld d, a
	farcall ItemIsMail
	ret c

	ld a, [wEffectFailed]
	and a
	ret nz

; If the enemy steals your item,
; it's gone for good if you don't get it back.

	call .playeritem
	xor a
	ld [hl], a
	ld [de], a

	call .enemyitem
	ld a, [wNamedObjectIndex]
	ld [hl], a
	ld [de], a

.stole
	call GetItemName
	ld hl, StoleText
	jmp StdBattleTextbox

.playeritem
	ld a, MON_ITEM
	call BattlePartyAttr
	ld d, h
	ld e, l
	ld hl, wBattleMonItem
	ret

.enemyitem
	ld a, MON_ITEM
	call OTPartyAttr
	ld d, h
	ld e, l
	ld hl, wEnemyMonItem
	ret

_BattleCommand_Ingrain:
; Ingrain and Aqua Ring (EFFECT_AQUA_RING): set the user's SubStatus2 bit; fails if it's
; already set. RootRingEndOfTurn heals (1/8 of max HP each, this hack; mainline 1/16).
; Ingrain also traps the user (TrappedByAbility) and blocks Roar (IngrainBlocksForceSwitch).
; Both pass with Baton Pass.
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_AQUA_RING
	ld b, 1 << SUBSTATUS_INGRAIN
	ld de, PlantedRootsText
	jr nz, .got_effect
	ld b, 1 << SUBSTATUS_AQUA_RING
	ld de, AquaRingText
.got_effect
	ld a, BATTLE_VARS_SUBSTATUS2
	call GetBattleVarAddr
	ld a, [hl]
	and b
	jr nz, .failed
	ld a, [hl]
	or b
	ld [hl], a
	push de
	farcall AnimateCurrentMove
	pop hl
	jmp StdBattleTextbox

.failed
	farcall AnimateFailedMove
	farjp PrintButItFailed

IngrainBlocksForceSwitch::
; Roar and Whirlwind (BattleCommand_ForceSwitch): carry, after "<TARGET> anchored itself
; with its roots!", if the move hit an ingrained target.
	ld a, [wAttackMissed]
	and a
	ret nz ; (no carry) the force-switch code handles misses
	ld a, BATTLE_VARS_SUBSTATUS2_OPP
	call GetBattleVar
	bit SUBSTATUS_INGRAIN, a
	ret z
	farcall AnimateFailedMove
	ld hl, AnchoredRootsText
	call StdBattleTextbox
	scf
	ret

RootRingEndOfTurn::
; End of turn (HandleRootRing, ForEachBattler: hBattleTurn = the battler): Ingrain and
; Aqua Ring each heal 1/8 of its max HP.
	ld a, BATTLE_VARS_SUBSTATUS2
	call GetBattleVar
	bit SUBSTATUS_INGRAIN, a
	jr z, .aqua_ring
	ld hl, IngrainHealText
	call .Heal
.aqua_ring
	ld a, BATTLE_VARS_SUBSTATUS2
	call GetBattleVar
	bit SUBSTATUS_AQUA_RING, a
	ret z
	ld hl, AquaRingHealText
; fallthrough
.Heal:
; hl = the text (<TARGET>: this battler). Nothing at full HP (or fainted).
	push hl
	ldh a, [hBattleTurn]
	and a
	ld hl, wBattleMonHP
	jr z, .got_hp
	ld hl, wEnemyMonHP
.got_hp
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld c, a
	or b
	jr z, .no_heal ; fainted
	ld a, [hli]
	cp b
	jr nz, .heal
	ld a, [hl]
	cp c
	jr z, .no_heal ; full HP
.heal
	farcall GetEighthMaxHP ; bc
	call BigRootBoostUser
	farcall SwitchTurnCore
	farcall RestoreHP
	pop hl
	call StdBattleTextbox
	farjp SwitchTurnCore

.no_heal
	pop hl
	ret

_BattleCommand_BrickBreak:
; Brick Break (Gen 5+): if it hits (not a miss, Protect or an immunity), Reflect and Light
; Screen end on the target's side first ("It shattered the barrier!"). The damage was
; worked out before the hit check, so without Reflect it's worked out again.
	ld a, [wAttackMissed]
	and a
	ret nz
	call GetTargetScreens ; hl = the screens byte, de = the Safeguard count
	ld a, [hl]
	and (1 << SCREENS_REFLECT) | (1 << SCREENS_LIGHT_SCREEN)
	ret z
	ld b, a
	ld a, [hl]
	and ~((1 << SCREENS_REFLECT) | (1 << SCREENS_LIGHT_SCREEN))
	ld [hl], a
	xor a
	inc de
	ld [de], a ; the Light Screen count
	inc de
	ld [de], a ; the Reflect count
	push bc
	ld hl, ShatteredBarrierText
	call StdBattleTextbox
	pop bc
	bit SCREENS_REFLECT, b
	ret z
	farcall BattleCommand_DamageStats
	farcall BattleCommand_DamageCalc
	farcall BattleCommand_Stab
	farjp BattleCommand_DamageVariation

_BattleCommand_WeightPower:
; Grass Knot and Low Kick (Gen 5+): the move's power from the target's weight, read from
; its Pokedex entry (tenths of a pound, after the species name and the height):
; under 10 kg 20, under 25 kg 40, under 50 kg 60, under 100 kg 80, under 200 kg 100,
; else 120. The pound thresholds match the kilogram ones for weights converted from
; tenths of a kilogram. Runs before damagestats; AIDamageCalc calls it too.
; Heavy Slam and Heat Crash (EFFECT_HEAVY_SLAM, Gen 5+): from the user's weight over the target's:
; 5x or more 120, 4x 100, 3x 80, 2x 60, less 40.
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_HEAVY_SLAM
	jr z, .heavy_slam
	call .TargetWeight
	ld hl, .Thresholds
	ld c, 0
.loop
	ld a, c
	cp .Powers - .Thresholds ; 5 thresholds
	jr z, .got_tier
	ld a, e
	sub [hl]
	inc hl
	ld a, d
	sbc [hl]
	inc hl
	jr c, .got_tier ; lighter than this threshold
	inc c
	jr .loop
.got_tier
	ld b, 0
	ld hl, .Powers
.set_power
	add hl, bc
	ld b, [hl]
	ld a, BATTLE_VARS_MOVE_POWER
	call GetBattleVarAddr
	ld [hl], b
	ret

.heavy_slam
	call .TargetWeight
	push de
	ldh a, [hBattleTurn]
	and a
	ld a, [wBattleMonSpecies]
	jr z, .got_user
	ld a, [wEnemyMonSpecies]
.got_user
	call .GetWeight ; de = the user's weight
	pop bc ; bc = the target's
; how many times the target's weight fits in the user's (at most 5)
	ld h, 0
.ratio_loop
	ld a, h
	cp 5
	jr z, .got_ratio
	ld a, e
	sub c
	ld e, a
	ld a, d
	sbc b
	ld d, a
	jr c, .got_ratio
	inc h
	jr .ratio_loop
.got_ratio
	ld c, h
	ld b, 0
	ld hl, .HeavySlamPowers
	jr .set_power

.TargetWeight:
; de = the target's weight
	ldh a, [hBattleTurn]
	and a
	ld a, [wEnemyMonSpecies]
	jr z, .GetWeight
	ld a, [wBattleMonSpecies]
; fallthrough
.GetWeight:
; de = species a's weight (tenths of a pound, from its Pokedex entry). Clobbers bc, hl.
	ld b, a
	farcall GetDexEntryPointer ; b:de = the entry
	ld h, d
	ld l, e
.skip_name
	ld a, b
	call GetFarByte
	inc hl
	cp "@"
	jr nz, .skip_name
	inc hl ; skip the height
	inc hl
	ld a, b
	call GetFarWord
	ld d, h
	ld e, l
	ret

.HeavySlamPowers: ; by how many times heavier the user is: 0, 1, 2, 3, 4, 5+
	db 40, 40, 60, 80, 100, 120

.Thresholds: ; tenths of a pound: 10, 25, 50, 100, 200 kg
	dw 220, 551, 1102, 2205, 4409
.Powers:
	db 20, 40, 60, 80, 100, 120

_BattleCommand_StrengthSap:
; Strength Sap (Gen 7+) and Enervate (this hack: the same with Sp. Atk): fails if it
; missed (Protect), against a Substitute, or if the target's Attack (Sp. Atk) is at -6.
; Otherwise wCurDamage = 2x that stat (with stat stages), so draintarget (which heals
; half of it) heals the stat. The script then lowers it; a blocked drop (Clear Body,
; Mist) still heals.
	ld a, [wAttackMissed]
	and a
	jr nz, .missed
	farcall CheckSubstituteOpp
	jr nz, .failed
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_ENERVATE
	jr z, .enervate
	ldh a, [hBattleTurn]
	and a
	ld a, [wEnemyAtkLevel]
	ld hl, wEnemyMonAttack
	jr z, .got_target
	ld a, [wPlayerAtkLevel]
	ld hl, wBattleMonAttack
.got_target
	cp BASE_STAT_LEVEL - 5 ; -6 is the lowest
	jr c, .failed
	ld a, [hli]
	ld l, [hl]
	ld h, a
; Burn halves the stored Attack here; mainline heals by the unhalved stat.
	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVar
	and 1 << BRN
	jr z, .got_attack
	ld a, BATTLE_VARS_ABILITY_OPP
	call GetBattleVar
	cp ABILITY_GUTS
	jr z, .got_attack
	add hl, hl
	jr .got_attack

.enervate
	ldh a, [hBattleTurn]
	and a
	ld a, [wEnemySAtkLevel]
	ld hl, wEnemyMonSpclAtk
	jr z, .got_sp_atk_target
	ld a, [wPlayerSAtkLevel]
	ld hl, wBattleMonSpclAtk
.got_sp_atk_target
	cp BASE_STAT_LEVEL - 5
	jr c, .failed
	ld a, [hli]
	ld l, [hl]
	ld h, a
; Frostbite halves the stored Sp. Atk: heal by the unhalved stat.
	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVar
	and 1 << FRZ
	jr z, .got_attack
	add hl, hl
.got_attack
	add hl, hl
	ld a, h
	ld [wCurDamage], a
	ld a, l
	ld [wCurDamage + 1], a
	ret

.missed
	farcall PrintDidntAffect2 ; "protected itself" against Protect
	farjp EndMoveEffect

.failed
	farcall AnimateFailedMove
	farcall PrintButItFailed
	farjp EndMoveEffect

_BattleCommand_Yawn:
; Yawn (Gen 5+): the target grows drowsy and falls asleep at the end of the next turn
; (YawnEndOfTurn). Fails on a target that has a status, is drowsy, is behind a
; Substitute or has an ability that prevents sleep (Safeguard: checksafeguard).
	ld a, [wAttackMissed]
	and a
	jr nz, .missed
	farcall CheckSubstituteOpp
	jr nz, .failed
	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVar
	and a
	jr nz, .failed
	ld a, BATTLE_VARS_SUBSTATUS2_OPP
	call GetBattleVarAddr
	ld a, [hl]
	and SUBSTATUS_YAWN_MASK
	jr nz, .failed
	ld b, SLP_MASK
	farcall OppAbilityBlocksStatus ; c = the ability
	jr c, .ability
	ld a, [hl]
	or 2 << SUBSTATUS_YAWN_SHIFT
	ld [hl], a
	farcall AnimateCurrentMove
	ld hl, GrewDrowsyText
	jmp StdBattleTextbox

.ability
	farjp FailStatusMoveAbility

.missed
	farjp PrintDidntAffect2 ; "protected itself" against Protect

.failed
	farcall AnimateFailedMove
	farjp PrintButItFailed

YawnEndOfTurn::
; End of turn (HandleYawn, ForEachBattler: hBattleTurn = the battler): count its
; drowsiness down; when it runs out, it falls asleep, unless it has a status by now,
; Safeguard, an ability or an item that prevents sleep. A status-healing berry works
; at once.
	ld a, BATTLE_VARS_SUBSTATUS2
	call GetBattleVarAddr
	ld a, [hl]
	and SUBSTATUS_YAWN_MASK
	ret z
	ld a, [hl]
	sub 1 << SUBSTATUS_YAWN_SHIFT
	ld [hl], a
	and SUBSTATUS_YAWN_MASK
	ret nz
; the drowsy battler is the target from here (the texts and the berry use it)
	farcall SwitchTurnCore
	call .TrySleep
	farjp SwitchTurnCore

.TrySleep:
	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVar
	and a
	ret nz
	farcall SafeCheckSafeguard
	ret nz
	ld a, BATTLE_VARS_ABILITY_OPP
	call GetBattleVar
	ld c, a
	ld b, SLP_MASK
	farcall AbilityBlocksStatus
	ret c
	farcall GetOpponentItem
	ld a, b
	cp HELD_PREVENT_SLEEP
	ret z
	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVarAddr
	ld b, %011
.random
	call BattleRandom
	and b
	jr z, .random
	inc a
	ld [hl], a
	call UpdateOpponentInParty
	call RefreshBattleHuds
	ld hl, FellAsleepText
	call StdBattleTextbox
	farjp UseHeldStatusHealingItem

BodyPressAttackStat::
; Physical damage stats (PlayerAttackDamage, EnemyAttackDamage; the AI's estimate too):
; hl = the attacker's Attack (wBattleMonAttack/wEnemyMonAttack, or the unboosted
; wPlayerAttack/wEnemyAttack on a critical hit). For Body Press: carry and hl = the
; Defense (the next word) instead, halved if burned (burn halves physical damage, and
; here the burn's own halving is on the Attack stat), unless the attacker has Guts.
; Thick Club and Guts don't apply. Otherwise nc, hl unchanged. Preserves bc, de.
	push hl
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	pop hl
	cp EFFECT_BODY_PRESS
	jr z, .body_press
	and a
	ret

.body_press
	inc hl
	inc hl
	ld a, [hli]
	ld l, [hl]
	ld h, a
	ld a, BATTLE_VARS_STATUS
	call GetBattleVar
	and 1 << BRN
	jr z, .done
	ld a, BATTLE_VARS_ABILITY
	call GetBattleVar
	cp ABILITY_GUTS
	jr z, .done
	srl h
	rr l
	ld a, h
	or l
	jr nz, .done
	inc l
.done
	scf
	ret

_BattleCommand_ElectroBall:
; Also Gyro Ball (EFFECT_GYRO_BALL: .gyro_ball).
; Electro Ball (Gen 5+): the move's power from the user's Speed over the target's:
; 4x or more 150, 3x 120, 2x 80, 1x 60, slower 40. Speeds as for the turn order (stat
; stages, paralysis, weather Speed abilities). Runs before damagestats; AIDamageCalc
; calls it too, for the AI's damage estimate.
	call .GetSpeed
	push bc
	ldh a, [hBattleTurn]
	xor 1
	ldh [hBattleTurn], a
	call .GetSpeed ; bc = the target's Speed
	ldh a, [hBattleTurn]
	xor 1
	ldh [hBattleTurn], a
	pop de ; de = the user's Speed
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_GYRO_BALL
	jr z, .gyro_ball
; h = how many times the target's Speed fits in the user's (at most 4)
	ld h, 0
.loop
	ld a, h
	cp 4
	jr z, .got_ratio
	ld a, e
	sub c
	ld e, a
	ld a, d
	sbc b
	ld d, a
	jr c, .got_ratio
	inc h
	jr .loop
.got_ratio
	ld a, h
	add LOW(.Powers)
	ld l, a
	ld a, HIGH(.Powers)
	adc 0
	ld h, a
	ld b, [hl]
	ld a, BATTLE_VARS_MOVE_POWER
	call GetBattleVarAddr
	ld [hl], b
	ret

.gyro_ball
; Gyro Ball (Gen 5+): power = 25 x the target's Speed / the user's Speed + 1, at most 150.
; hProduct = 25 x the target's Speed (it fits in 24 bits); then count how many times the
; user's Speed fits in it, stopping at 149.
	xor a
	ldh [hMultiplicand], a
	ld a, b
	ldh [hMultiplicand + 1], a
	ld a, c
	ldh [hMultiplicand + 2], a
	ld a, 25
	ldh [hMultiplier], a
	call Multiply
	ld c, 1
.gyro_loop
	ld a, c
	cp 150
	jr z, .gyro_done
	ldh a, [hProduct + 3]
	sub e
	ld l, a
	ldh a, [hProduct + 2]
	sbc d
	ld h, a
	ldh a, [hProduct + 1]
	sbc 0
	jr c, .gyro_done
	ldh [hProduct + 1], a
	ld a, h
	ldh [hProduct + 2], a
	ld a, l
	ldh [hProduct + 3], a
	inc c
	jr .gyro_loop
.gyro_done
	ld b, c
	ld a, BATTLE_VARS_MOVE_POWER
	call GetBattleVarAddr
	ld [hl], b
	ret

.GetSpeed:
; bc = hBattleTurn's battler's turn-order Speed
	ldh a, [hBattleTurn]
	and a
	ld hl, wBattleMonSpeed
	jr z, .got_speed
	ld hl, wEnemyMonSpeed
.got_speed
	farjp GetTurnOrderSpeed

.Powers:
	db 40, 60, 80, 120, 150

_BattleCommand_Taunt:
; Taunt (Gen 5+ duration): the target can't use status moves for 3 turns, or 4 if it
; already moved this turn (the count also goes down at the end of this turn). Goes through
; Substitute; fails on a taunted target.
	ld a, [wAttackMissed]
	and a
	jr nz, .missed
	ld a, BATTLE_VARS_SUBSTATUS2_OPP
	call GetBattleVarAddr
	ld a, [hl]
	and SUBSTATUS_TAUNT_MASK
	jr nz, .failed
	ld b, 3 << SUBSTATUS_TAUNT_SHIFT
	farcall CheckOpponentWentFirst
	jr z, .got_count
	ld b, 4 << SUBSTATUS_TAUNT_SHIFT
.got_count
	ld a, [hl]
	or b
	ld [hl], a
	farcall AnimateCurrentMove
	ld hl, FellForTauntText
	jmp StdBattleTextbox

.missed
	farjp PrintDidntAffect2 ; "protected itself" against Protect

.failed
	farcall AnimateFailedMove
	farjp PrintButItFailed

TauntCheckMove:
; Before the user (hBattleTurn) moves: carry, after "can't use <move> after the taunt!",
; if it's taunted and its move is a status move.
	ldh a, [hBattleTurn]
	and a
	jr nz, .enemy
	ld a, [wCurPlayerMove]
	call PlayerTauntBlocksMove
	jr .got_result
.enemy
	ld a, [wCurEnemyMove]
	call EnemyTauntBlocksMove
.got_result
	ret nc
	ld [wNamedObjectIndex], a
	call GetMoveName
	ld hl, CantUseAfterTauntText
	call StdBattleTextbox
	scf
	ret

PlayerTauntBlocksMove::
; Carry if the player's battler is taunted and move a is a status move. Preserves all
; registers but the flags.
	push hl
	ld hl, wPlayerSubStatus2
	jr TauntBlocksMove

EnemyTauntBlocksMove::
; As PlayerTauntBlocksMove, for the enemy's battler.
	push hl
	ld hl, wEnemySubStatus2
; fallthrough
TauntBlocksMove:
; hl = the battler's SubStatus2, pushed hl on the stack; a = a move.
	push bc
	ld b, a
	ld a, [hl]
	and SUBSTATUS_TAUNT_MASK
	jr z, .no
	ld a, b
	and a
	jr z, .no
	ld l, a
	ld a, MOVE_TYPE
	call GetMoveAttribute
	and ~TYPE_MASK
	cp STATUS
	jr nz, .no
	ld a, b
	pop bc
	pop hl
	scf
	ret
.no
	ld a, b
	pop bc
	pop hl
	and a
	ret

PlayerTauntUsableMoves::
; Carry if the player's battler is taunted; then a = nonzero if it has a usable move:
; PP left, not the disabled one, not a status move. Preserves bc, de, hl.
	ld a, [wPlayerSubStatus2]
	and SUBSTATUS_TAUNT_MASK
	ret z
	push bc
	push de
	push hl
	ld a, [wPlayerDisableCount]
	swap a
	and $f
	ld e, a ; the disabled move's slot + 1, or 0
	ld c, 0
.loop
	ld a, c
	cp NUM_MOVES
	jr z, .none
	inc c
	cp e
	jr z, .loop
	ld hl, wBattleMonPP - 1
	ld b, 0
	add hl, bc
	ld a, [hl]
	and PP_MASK
	jr z, .loop
	ld hl, wBattleMonMoves - 1
	add hl, bc
	ld a, [hl]
	and a
	jr z, .loop
	ld l, a
	ld a, MOVE_TYPE
	call GetMoveAttribute
	and ~TYPE_MASK
	cp STATUS
	jr z, .loop
	ld a, 1
	jr .done
.none
	xor a
.done
	pop hl
	pop de
	pop bc
	scf
	ret

AITauntScoreMoves::
; The AI: a taunted enemy battler's status moves get the "unusable" score (80).
; Preserves bc, de, hl.
	ld a, [wEnemySubStatus2]
	and SUBSTATUS_TAUNT_MASK
	ret z
	push bc
	push de
	push hl
	ld hl, wEnemyMonMoves
	ld de, wEnemyAIMoveScores
	ld b, NUM_MOVES
.loop
	ld a, [hli]
	call EnemyTauntBlocksMove
	jr nc, .next
	ld a, 80
	ld [de], a
.next
	inc de
	dec b
	jr nz, .loop
	pop hl
	pop de
	pop bc
	ret

TauntCountdown::
; End of turn: hl = a battler's SubStatus2; count its Taunt down ("shook off the taunt!"
; when it ends; <TARGET> is that battler).
	ld a, [hl]
	and SUBSTATUS_TAUNT_MASK
	ret z
	ld a, [hl]
	sub 1 << SUBSTATUS_TAUNT_SHIFT
	ld [hl], a
	and SUBSTATUS_TAUNT_MASK
	ret nz
	ld hl, ShookOffTauntText
	jmp StdBattleTextbox

_BattleCommand_SuckerPunch:
; Sucker Punch (Gen 7+): fails unless the target chose a damaging move this turn and
; hasn't used it yet (not a status move, a switch, an item, or a move already used).
; Singles and doubles alike: wBattleActions holds each battler slot's action this turn.
	farcall CheckOpponentWentFirst
	jr nz, .fail
; the target's slot: the one loaded in the opponent's area
	ldh a, [hBattleTurn]
	and a
	ld a, [wAreaSlots + 1]
	jr z, .got_slot
	ld a, [wAreaSlots]
.got_slot
	ld c, a
	ld hl, wBattleActions
	ld a, [wNumBattleActions]
	and a
	jr z, .fail
	ld b, a
.find
	ld a, [hli]
	cp c
	jr z, .found
	inc hl
	dec b
	jr nz, .find
	jr .fail
.found
	ld a, [hl]
	and a ; BATTLEPLAYERACTION_USEMOVE
	jr nz, .fail
; the target's chosen move
	ldh a, [hBattleTurn]
	and a
	ld a, [wCurEnemyMove]
	jr z, .got_move
	ld a, [wCurPlayerMove]
.got_move
	and a
	jr z, .fail
	ld l, a
	ld a, MOVE_TYPE
	call GetMoveAttribute
	and ~TYPE_MASK
	cp STATUS
	ret nz
.fail
	farcall PrintButItFailed
	farjp EndMoveEffect

_BattleCommand_KnockOff:
; Knock Off: suppress the target's held item for the rest of the battle. Only the
; battle copy is cleared: the party struct keeps the item, so it's back after the
; battle. wKnockedOffMons keeps it suppressed if the target switches out and back in.
	ld a, [wAttackMissed]
	and a
	ret nz
	farcall CheckSubstituteOpp
	ret nz
	ldh a, [hBattleTurn]
	and a
	ld hl, wEnemyMonHP
	ld de, wKnockedOffMons + 1
	ld a, [wCurOTMon]
	jr z, .got_target
	ld hl, wBattleMonHP
	ld de, wKnockedOffMons
	ld a, [wCurBattleMon]
.got_target
	ld c, a
; not if the target fainted
	ld a, [hli]
	or [hl]
	ret z
; the item (wEnemyMonItem / wBattleMonItem) is MON_ITEM - MON_HP bytes before the HP
	ld a, l
	sub LOW(wEnemyMonHP + 1 - wEnemyMonItem)
	ld l, a
	ld a, h
	sbc HIGH(wEnemyMonHP + 1 - wEnemyMonItem)
	ld h, a
	ld a, [hl]
	and a
	ret z
	ld [wNamedObjectIndex], a
	ld [hl], NO_ITEM
	ld a, c
	call KnockedOffBit
	ld h, d
	ld l, e
	or [hl]
	ld [hl], a
	call GetItemName
	ld hl, KnockedOffText
	jmp StdBattleTextbox

; ---- from engine/battle/move_effects/rollout.asm

DEF MAX_ROLLOUT_COUNT EQU 5

_BattleCommand_CheckRollout:
	ld de, wPlayerRolloutCount
	ldh a, [hBattleTurn]
	and a
	jr z, .ok
	ld de, wEnemyRolloutCount
.ok
	ld a, BATTLE_VARS_SUBSTATUS1
	call GetBattleVar
	bit SUBSTATUS_ROLLOUT, a
	jr z, .reset

	ld b, doturn_command
	farjp SkipToBattleCommand

.reset
	xor a
	ld [de], a
	ret

_BattleCommand_RolloutPower:
	ld a, BATTLE_VARS_STATUS
	call GetBattleVar
	and SLP_MASK
	ret nz

	ld hl, wPlayerRolloutCount
	ldh a, [hBattleTurn]
	and a
	jr z, .got_rollout_count
	ld hl, wEnemyRolloutCount

.got_rollout_count
	ld a, [hl]
	and a
	jr nz, .skip_set_rampage
	ld a, 1
	ld [wSomeoneIsRampaging], a

.skip_set_rampage
	ld a, [wAttackMissed]
	and a
	jr z, .hit

	ld a, BATTLE_VARS_SUBSTATUS1
	call GetBattleVarAddr
	res SUBSTATUS_ROLLOUT, [hl]
	ret

.hit
	inc [hl]
	ld a, [hl]
	ld b, a
	cp MAX_ROLLOUT_COUNT
	jr c, .not_done_with_rollout

	ld a, BATTLE_VARS_SUBSTATUS1
	call GetBattleVarAddr
	res SUBSTATUS_ROLLOUT, [hl]
	jr .done_with_substatus_flag

.not_done_with_rollout
	ld a, BATTLE_VARS_SUBSTATUS1
	call GetBattleVarAddr
	set SUBSTATUS_ROLLOUT, [hl]

.done_with_substatus_flag
	ld a, BATTLE_VARS_SUBSTATUS2
	call GetBattleVar
	bit SUBSTATUS_CURLED, a
	jr z, .not_curled
	inc b
.not_curled
.loop
	dec b
	ret z

	ld hl, wCurDamage + 1
	sla [hl]
	dec hl
	rl [hl]
	jr nc, .loop

	ld a, $ff
	ld [hli], a
	ld [hl], a
	ret

; ---- from engine/battle/move_effects/pain_split.asm

_BattleCommand_PainSplit:
	ld a, [wAttackMissed]
	and a
	jmp nz, .ButItFailed
	farcall CheckSubstituteOpp
	jmp nz, .ButItFailed
	farcall AnimateCurrentMove
	ld hl, wBattleMonMaxHP + 1
	ld de, wEnemyMonMaxHP + 1
	call .PlayerShareHP
	xor a ; the player's area
	farcall AnimateAreaHPBar
	ld hl, wEnemyMonHP
	ld a, [hli]
	ld [wHPBuffer2 + 1], a
	ld a, [hli]
	ld [wHPBuffer2], a
	ld a, [hli]
	ld [wHPBuffer1 + 1], a
	ld a, [hl]
	ld [wHPBuffer1], a
	call .EnemyShareHP
	call ResetDamage
	ld a, 1 ; the enemy's area
	farcall AnimateAreaHPBar
	farcall _UpdateBattleHUDs

	ld hl, SharedPainText
	jmp StdBattleTextbox

.PlayerShareHP:
	ld a, [hld]
	ld [wHPBuffer1], a
	ld a, [hld]
	ld [wHPBuffer1 + 1], a
	ld a, [hld]
	ld b, a
	ld [wHPBuffer2], a
	ld a, [hl]
	ld [wHPBuffer2 + 1], a
	dec de
	dec de
	ld a, [de]
	dec de
	add b
	ld [wCurDamage + 1], a
	ld b, [hl]
	ld a, [de]
	adc b
	srl a
	ld [wCurDamage], a
	ld a, [wCurDamage + 1]
	rra
	ld [wCurDamage + 1], a
	inc hl
	inc hl
	inc hl
	inc de
	inc de
	inc de

.EnemyShareHP:
	ld a, [hld]
	ld c, a
	ld a, [wCurDamage + 1]
	sub c
	ld a, [hld]
	ld b, a
	ld a, [wCurDamage]
	sbc b
	jr nc, .skip

	ld a, [wCurDamage]
	ld b, a
	ld a, [wCurDamage + 1]
	ld c, a
.skip
	ld a, c
	ld [hld], a
	ld [wHPBuffer3], a
	ld a, b
	ld [hli], a
	ld [wHPBuffer3 + 1], a
	ret

.ButItFailed:
	farjp PrintDidntAffect2

; ---- from engine/battle/move_effects/encore.asm

_BattleCommand_Encore:
	ld hl, wEnemyMonMoves
	ld de, wEnemyEncoreCount
	ldh a, [hBattleTurn]
	and a
	jr z, .ok
	ld hl, wBattleMonMoves
	ld de, wPlayerEncoreCount
.ok
	ld a, BATTLE_VARS_LAST_MOVE_OPP
	call GetBattleVar
	ld b, a
	push hl
	ld hl, EncoreInvalidMoves
	farcall CheckMoveInList
	pop hl
	jmp c, .failed

.got_move
	ld a, [hli]
	cp b
	jr nz, .got_move

	ld bc, wBattleMonPP - wBattleMonMoves - 1
	add hl, bc
	ld a, [hl]
	and PP_MASK
	jmp z, .failed
	ld a, [wAttackMissed]
	and a
	jr nz, .failed
	ld a, BATTLE_VARS_SUBSTATUS5_OPP
	call GetBattleVarAddr
	bit SUBSTATUS_ENCORED, [hl]
	jr nz, .failed
	set SUBSTATUS_ENCORED, [hl]
	call BattleRandom
	and $3
	inc a
	inc a
	inc a
	ld [de], a
	farcall CheckOpponentWentFirst
	jr nz, .finish_move
	ldh a, [hBattleTurn]
	and a
	jr z, .force_last_enemy_move

	push hl
	ld a, [wLastPlayerMove]
	ld b, a
	ld c, 0
	ld hl, wBattleMonMoves
.find_player_move
	ld a, [hli]
	cp b
	jr z, .got_player_move
	inc c
	ld a, c
	cp NUM_MOVES
	jr c, .find_player_move
	pop hl
	res SUBSTATUS_ENCORED, [hl]
	xor a
	ld [de], a
	jr .failed

.got_player_move
	pop hl
	ld a, c
	ld [wCurMoveNum], a
	ld a, b
	ld [wCurPlayerMove], a
	ld de, wPlayerMoveStruct
	call GetMoveData
	jr .finish_move

.force_last_enemy_move
	push hl
	ld a, [wLastEnemyMove]
	ld b, a
	ld c, 0
	ld hl, wEnemyMonMoves
.find_enemy_move
	ld a, [hli]
	cp b
	jr z, .got_enemy_move
	inc c
	ld a, c
	cp NUM_MOVES
	jr c, .find_enemy_move
	pop hl
	res SUBSTATUS_ENCORED, [hl]
	xor a
	ld [de], a
	jr .failed

.got_enemy_move
	pop hl
	ld a, c
	ld [wCurEnemyMoveNum], a
	ld a, b
	ld [wCurEnemyMove], a
	ld de, wEnemyMoveStruct
	call GetMoveData

.finish_move
	farcall AnimateCurrentMove
	ld hl, GotAnEncoreText
	jmp StdBattleTextbox

.failed
	farjp PrintDidntAffect2

; ---- from engine/battle/move_effects/conversion.asm

_BattleCommand_Conversion:
	ld hl, wBattleMonMoves
	ld de, wBattleMonType1
	ldh a, [hBattleTurn]
	and a
	jr z, .got_moves
	ld hl, wEnemyMonMoves
	ld de, wEnemyMonType1
.got_moves
	push de
	ld c, 0
	ld de, wStringBuffer1
.loop
	push hl
	ld b, 0
	add hl, bc
	ld a, [hl]
	pop hl
	and a
	jr z, .okay
	push hl
	push bc
	ld l, a
	ld a, MOVE_TYPE
	call GetMoveAttribute
	and TYPE_MASK
	ld [de], a
	inc de
	pop bc
	pop hl
	inc c
	ld a, c
	cp NUM_MOVES
	jr c, .loop
.okay
	ld a, $ff
	ld [de], a
	inc de
	ld [de], a
	inc de
	ld [de], a
	pop de
	ld hl, wStringBuffer1
.loop2
	ld a, [hl]
	cp -1
	jr z, .fail
	cp CURSE_TYPE
	jr z, .next
	ld a, [de]
	cp [hl]
	jr z, .next
	inc de
	ld a, [de]
	dec de
	cp [hl]
	jr nz, .done
.next
	inc hl
	jr .loop2

.fail
	farcall AnimateFailedMove
	farjp PrintButItFailed

.done
.loop3
	call BattleRandom
	maskbits NUM_MOVES
	ld c, a
	ld b, 0
	ld hl, wStringBuffer1
	add hl, bc
	ld a, [hl]
	cp -1
	jr z, .loop3
	cp CURSE_TYPE
	jr z, .loop3
	ld a, [de]
	cp [hl]
	jr z, .loop3
	inc de
	ld a, [de]
	dec de
	cp [hl]
	jr z, .loop3
	ld a, [hl]
	ld [de], a
	inc de
	ld [de], a
	ld [wNamedObjectIndex], a
	farcall GetTypeName
	farcall AnimateCurrentMove
	ld hl, TransformedTypeText
	jmp StdBattleTextbox

; ---- from engine/battle/move_effects/spite.asm

_BattleCommand_Spite:
	ld a, [wAttackMissed]
	and a
	jmp nz, .failed
	ld bc, PARTYMON_STRUCT_LENGTH ; unused
	ld hl, wEnemyMonMoves
	ldh a, [hBattleTurn]
	and a
	jr z, .got_moves
	ld hl, wBattleMonMoves
.got_moves
	ld a, BATTLE_VARS_LAST_COUNTER_MOVE_OPP
	call GetBattleVar
	and a
	jr z, .failed
	ld b, a
	push bc
	ld bc, STRUGGLE
	farcall CompareMove
	pop bc
	jr z, .failed
	ld c, -1
.loop
	inc c
	ld a, [hli]
	cp b
	jr nz, .loop
	ld [wNamedObjectIndex], a
	dec hl
	ld b, 0
	push bc
	ld c, wBattleMonPP - wBattleMonMoves
	add hl, bc
	pop bc
	ld a, [hl]
	and PP_MASK
	jr z, .failed
	push bc
	call GetMoveName
	; lose 2-5 PP
	call BattleRandom
	and %11
	inc a
	inc a
	ld b, a
	ld a, [hl]
	and PP_MASK
	cp b
	jr nc, .deplete_pp
	ld b, a
.deplete_pp
	ld a, [hl]
	sub b
	ld [hl], a
	push af
	ld a, MON_PP
	call OpponentPartyAttr
	ld d, b
	pop af
	pop bc
	add hl, bc
	ld e, a
	ld a, BATTLE_VARS_SUBSTATUS5_OPP
	call GetBattleVar
	bit SUBSTATUS_TRANSFORMED, a
	jr nz, .transformed
	ldh a, [hBattleTurn]
	and a
	jr nz, .not_wildmon
	ld a, [wBattleMode]
	dec a
	jr nz, .not_wildmon
	ld hl, wWildMonPP
	add hl, bc
.not_wildmon
	ld [hl], e
.transformed
	push de
	farcall AnimateCurrentMove
	pop de
	ld a, d
	ld [wTextDecimalByte], a
	ld hl, SpiteEffectText
	jmp StdBattleTextbox

.failed
	farjp PrintDidntAffect2

; ---- from engine/battle/move_effects/disable.asm

_BattleCommand_Disable:
	ld a, [wAttackMissed]
	and a
	jr nz, .failed

	ld de, wEnemyDisableCount
	ld hl, wEnemyMonMoves
	ldh a, [hBattleTurn]
	and a
	jr z, .got_moves
	ld de, wPlayerDisableCount
	ld hl, wBattleMonMoves
.got_moves

	ld a, [de]
	and a
	jr nz, .failed

	ld a, BATTLE_VARS_LAST_COUNTER_MOVE_OPP
	call GetBattleVar
	and a
	jr z, .failed
	ld b, a
	push bc
	ld bc, STRUGGLE
	farcall CompareMove
	pop bc
	jr z, .failed

	ld c, $ff
.loop
	inc c
	ld a, [hli]
	cp b
	jr nz, .loop

	ldh a, [hBattleTurn]
	and a
	ld hl, wEnemyMonPP
	jr z, .got_pp
	ld hl, wBattleMonPP
.got_pp
	ld b, 0
	add hl, bc
	ld a, [hl]
	and a
	jr z, .failed
.loop2
	call BattleRandom
	and 7
	jr z, .loop2
	inc a
	inc c
	swap c
	add c
	ld [de], a
	farcall AnimateCurrentMove
	ld hl, wDisabledMove
	ldh a, [hBattleTurn]
	and a
	jr nz, .got_disabled_move_pointer
	inc hl
.got_disabled_move_pointer
	ld a, BATTLE_VARS_LAST_COUNTER_MOVE_OPP
	call GetBattleVar
	ld [hl], a
	ld [wNamedObjectIndex], a
	call GetMoveName
	ld hl, WasDisabledText
	jmp StdBattleTextbox

.failed
	farjp FailMove

; ---- from engine/battle/move_effects/sketch.asm

_BattleCommand_Sketch:
	farcall ClearLastMove
; Don't sketch during a link battle
	ld a, [wLinkMode]
	and a
	jr z, .not_linked
	farcall AnimateFailedMove
	farjp PrintNothingHappened

.not_linked
; If the opponent has a substitute up, fail.
	farcall CheckSubstituteOpp
	jmp nz, .fail
; If the user is transformed, fail.
	ld a, BATTLE_VARS_SUBSTATUS5
	call GetBattleVarAddr
	bit SUBSTATUS_TRANSFORMED, [hl]
	jmp nz, .fail
; Get the user's moveset in its party struct.
; This move replacement shall be permanent.
; Pointer will be in de.
	ld a, MON_MOVES
	call UserPartyAttr
	ld d, h
	ld e, l
; Get the battle move structs.
	ld hl, wBattleMonMoves
	ldh a, [hBattleTurn]
	and a
	jr z, .get_last_move
	ld hl, wEnemyMonMoves
.get_last_move
	ld a, BATTLE_VARS_LAST_COUNTER_MOVE_OPP
	call GetBattleVar
	ld [wNamedObjectIndex], a
	ld b, a
; Fail if move is invalid or is Struggle.
	and a
	jr z, .fail
	push bc
	ld bc, STRUGGLE
	farcall CompareMove
	pop bc
	jr z, .fail
; Fail if user already knows that move
	ld c, NUM_MOVES
.does_user_already_know_move
	ld a, [hli]
	cp b
	jr z, .fail
	dec c
	jr nz, .does_user_already_know_move
; Find Sketch in the user's moveset.
; Pointer in hl, and index in c.
	push hl
	ld hl, SKETCH
	call GetMoveIDFromIndex
	pop hl
	ld c, NUM_MOVES
.find_sketch
	dec c
	dec hl
	cp [hl]
	jr nz, .find_sketch
; The Sketched move is loaded to that slot.
	ld a, b
	ld [hl], a
; Copy the base PP from that move.
	push bc
	push hl
	ld l, a
	ld a, MOVE_PP
	call GetMoveAttribute
	pop hl
	ld bc, wBattleMonPP - wBattleMonMoves
	add hl, bc
	ld [hl], a
	pop bc

	ldh a, [hBattleTurn]
	and a
	jr z, .user_trainer
	ld a, [wBattleMode]
	dec a
	jr nz, .user_trainer
; wildmon
	ld a, [hl]
	push bc
	ld hl, wWildMonPP
	ld b, 0
	add hl, bc
	ld [hl], a
	ld hl, wWildMonMoves
	add hl, bc
	pop bc
	ld [hl], b
	jr .done_copy

.user_trainer
	ld a, [hl]
	push af
	ld l, c
	ld h, 0
	add hl, de
	ld a, b
	ld [hl], a
	pop af
	ld de, MON_PP - MON_MOVES
	add hl, de
	ld [hl], a
.done_copy
	call GetMoveName
	farcall AnimateCurrentMove

	ld hl, SketchedText
	jmp StdBattleTextbox

.fail
	farcall AnimateFailedMove
	farjp PrintDidntAffect

; ---- from engine/battle/move_effects/mimic.asm

_BattleCommand_Mimic:
	farcall ClearLastMove
	farcall BattleCommand_MoveDelay
	ld a, [wAttackMissed]
	and a
	jr nz, .fail
	ld hl, wBattleMonMoves
	ldh a, [hBattleTurn]
	and a
	jr z, .player_turn
	ld hl, wEnemyMonMoves
.player_turn
	farcall CheckHiddenOpponent
	jr nz, .fail
	ld a, BATTLE_VARS_LAST_COUNTER_MOVE_OPP
	call GetBattleVar
	and a
	jr z, .fail
	ld b, a
	push bc
	ld bc, STRUGGLE
	farcall CompareMove
	pop bc
	jr z, .fail
	ld c, NUM_MOVES
.check_already_knows_move
	ld a, [hli]
	cp b
	jr z, .fail
	dec c
	jr nz, .check_already_knows_move
	push hl
	ld hl, MIMIC
	call GetMoveIDFromIndex
	pop hl
.find_mimic
	dec hl
	cp [hl]
	jr nz, .find_mimic
	ld a, BATTLE_VARS_LAST_COUNTER_MOVE_OPP
	call GetBattleVar
	ld [hl], a
	ld [wNamedObjectIndex], a
	ld bc, wBattleMonPP - wBattleMonMoves
	add hl, bc
	ld [hl], 5
	call GetMoveName
	farcall AnimateCurrentMove
	ld hl, MimicLearnedMoveText
	jmp StdBattleTextbox

.fail
	farjp FailMimic

; ---- from engine/battle/move_effects/conversion2.asm

_BattleCommand_Conversion2:
	ld a, [wAttackMissed]
	and a
	jr nz, .failed
	ld hl, wBattleMonType1
	ldh a, [hBattleTurn]
	and a
	jr z, .got_type
	ld hl, wEnemyMonType1
.got_type
	ld a, BATTLE_VARS_LAST_COUNTER_MOVE_OPP
	call GetBattleVar
	and a
	jr z, .failed
	push hl
	ld l, a
	ld a, MOVE_TYPE
	call GetMoveAttribute
	and TYPE_MASK
	ld d, a
	pop hl
	cp CURSE_TYPE
	jr z, .failed
	farcall AnimateCurrentMove
	farcall BattleCommand_SwitchTurn

.loop
	call BattleRandom
	maskbits TYPES_END
	cp UNUSED_TYPES
	jr c, .okay
	cp UNUSED_TYPES_END
	jr c, .loop
	cp TYPES_END
	jr nc, .loop
.okay
	ld [hli], a
	ld [hld], a
	push hl
	ld a, BATTLE_VARS_MOVE_TYPE
	call GetBattleVarAddr
	and TYPE_MASK
	push af
	push hl
	ld a, d
	ld [hl], a
	farcall BattleCheckTypeMatchup
	pop hl
	pop af
	ld [hl], a
	pop hl
	ld a, [wTypeMatchup]
	cp EFFECTIVE
	jr nc, .loop
	farcall BattleCommand_SwitchTurn

	ld a, [hl]
	ld [wNamedObjectIndex], a
	predef GetTypeName
	ld hl, TransformedTypeText
	jmp StdBattleTextbox

.failed
	farjp FailMove

; ---- from engine/battle/effect_commands.asm (BattleCommand_TrapTarget)

_BattleCommand_TrapTarget:
	ld a, [wAttackMissed]
	and a
	ret nz
	ld hl, wEnemyWrapCount
	ld de, wEnemyTrappingMove
	ldh a, [hBattleTurn]
	and a
	jr z, .got_trap
	ld hl, wPlayerWrapCount
	ld de, wPlayerTrappingMove

.got_trap
	ld a, [hl]
	and a
	ret nz
	ld a, BATTLE_VARS_SUBSTATUS4_OPP
	call GetBattleVar
	bit SUBSTATUS_SUBSTITUTE, a
	ret nz
	call BattleRandom
	; trapped for 2-5 turns
	and %11
	inc a
	inc a
	inc a
	ld [hl], a
	call BindingBandMark
	ld a, BATTLER_LINK_TRAPPED_BY
	farcall SetTargetLink
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	ld [de], a
	call GetMoveIndexFromID
	ld b, h
	ld c, l
	ld hl, .Traps

.find_trap_text
	ld a, [hli]
	cp c
	ld a, [hli]
	jr nz, .next_trap_text
	cp b
	jr z, .found_trap_text
.next_trap_text
	inc hl
	inc hl
	jr .find_trap_text

.found_trap_text
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jmp StdBattleTextbox

.Traps:
	dw BIND,      UsedBindText      ; 'used BIND on'
	dw WRAP,      WrappedByText     ; 'was WRAPPED by'
	dw FIRE_SPIN, FireSpinTrapText  ; 'was trapped!'
	dw CLAMP,     ClampedByText     ; 'was CLAMPED by'
	dw WHIRLPOOL, WhirlpoolTrapText ; 'was trapped!'

; ---- from engine/battle/effect_commands.asm (BattleCommand_Recoil)

_BattleCommand_Recoil:
; Magic Guard: no recoil damage.
	farcall CheckMagicGuardUser
	ret c
; Rock Head: no recoil damage, except from Struggle.
	ld a, BATTLE_VARS_ABILITY
	call GetBattleVar
	cp ABILITY_ROCK_HEAD
	jr nz, .no_rock_head
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	ld bc, STRUGGLE
	farcall CompareMove
	ret nz
.no_rock_head

	ld hl, wBattleMonMaxHP
	ldh a, [hBattleTurn]
	and a
	jr z, .got_hp
	ld hl, wEnemyMonMaxHP
.got_hp
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	ld d, a
; get 1/4 damage or 1 HP, whichever is higher
	ld a, [wCurDamage]
	ld b, a
	ld a, [wCurDamage + 1]
	ld c, a
	srl b
	rr c
	srl b
	rr c
	ld a, b
	or c
	jr nz, .min_damage
	inc c
.min_damage
	ld a, [hli]
	ld [wHPBuffer1 + 1], a
	ld a, [hl]
	ld [wHPBuffer1], a
	dec hl
	dec hl
	ld a, [hl]
	ld [wHPBuffer2], a
	sub c
	ld [hld], a
	ld [wHPBuffer3], a
	ld a, [hl]
	ld [wHPBuffer2 + 1], a
	sbc b
	ld [hl], a
	ld [wHPBuffer3 + 1], a
	jr nc, .dont_ko
	xor a
	ld [hli], a
	ld [hl], a
	ld hl, wHPBuffer3
	ld [hli], a
	ld [hl], a
.dont_ko
	ldh a, [hBattleTurn]
	farcall AnimateAreaHPBar
	call RefreshBattleHuds
	ld hl, RecoilText
	jmp StdBattleTextbox
