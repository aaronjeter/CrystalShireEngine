; The Battle Resort's Battle Tower (FACILITY_ELITE): doubles with
; FACILITY_TEAM_SIZE Pokémon locked for a whole streak, in sets of
; TOWER_SET_LENGTH battles against random elite trainers (TowerTrainers), with
; the Tower head at battle TOWER_BOSS_BATTLE. The streak, the best streak, the
; TOWER_*_F bits and the locked team are in the save extension (WRAM bank 5).
; Script flow (maps/hoenn/battle/BattleResortTower*.asm): TowerCheck, then
; FacilitySetup with FacilityChooseTeam + TowerBeginStreak (a new streak) or
; TowerResumeTeam; TowerStartSet and a save; FacilityStartRun; per battle
; TowerPickTrainer, TowerLoadTrainer, TowerWon; after a set TowerSetBP and
; TowerMilestone; TowerRest + a save, or TowerEndStreak; FacilityEndRun.

; wStringBuffer3 and wStringBuffer4 (together 2 * STRING_BUFFER_LENGTH bytes) hold
; a copy of wTowerTeam; wStringBuffer5 one Pokémon's identity
DEF wTowerTeamBuffer EQUS "wStringBuffer3"
DEF wTowerMonScratch EQUS "wStringBuffer5"
	assert FACILITY_TEAM_SIZE * TOWER_TEAM_MON_LENGTH <= 2 * STRING_BUFFER_LENGTH
	assert TOWER_TEAM_MON_LENGTH <= STRING_BUFFER_LENGTH

TowerGetState:
; a = wTowerState
	ld hl, wTowerState
TowerReadByte:
; a = the save extension's byte at hl
	ldh a, [rSVBK]
	push af
	ld a, BANK(wTowerState)
	ldh [rSVBK], a
	ld b, [hl]
	pop af
	ldh [rSVBK], a
	ld a, b
	ret

TowerSetState:
; wTowerState = a
	ld hl, wTowerState
TowerWriteByte:
; the save extension's byte at hl = a
	ld b, a
	ldh a, [rSVBK]
	push af
	ld a, BANK(wTowerState)
	ldh [rSVBK], a
	ld [hl], b
	pop af
	ldh [rSVBK], a
	ret

TowerGetStreak:
; hl = wTowerStreak
	ld hl, wTowerStreak
TowerGetWord:
; hl = the save extension's big-endian word at hl
	ldh a, [rSVBK]
	push af
	ld a, BANK(wTowerStreak)
	ldh [rSVBK], a
	ld a, [hli]
	ld l, [hl]
	ld h, a
	pop af
	ldh [rSVBK], a
	ret

TowerSetStreak:
; wTowerStreak = de
	ld hl, wTowerStreak
TowerSetWord:
; the save extension's big-endian word at hl = de
	ldh a, [rSVBK]
	push af
	ld a, BANK(wTowerStreak)
	ldh [rSVBK], a
	ld a, d
	ld [hli], a
	ld [hl], e
	pop af
	ldh [rSVBK], a
	ret

TowerNumberFromHL:
; wTowerNumber = hl
	ld a, h
	ld [wTowerNumber], a
	ld a, l
	ld [wTowerNumber + 1], a
	ret

TowerCheck::
; wScriptVar = TOWER_NO_STREAK, TOWER_RESUME (wTowerNumber = the streak) or
; TOWER_INTERRUPTED (the last set wasn't finished: the streak is ended now,
; wTowerNumber = what it was)
	call TowerGetState
	bit TOWER_IN_SET_F, a
	jr nz, .interrupted
	bit TOWER_STREAK_F, a
	ld a, TOWER_NO_STREAK
	jr z, .done
	call TowerGetStreak
	call TowerNumberFromHL
	ld a, TOWER_RESUME
	jr .done

.interrupted
	call TowerEndStreak
	ld a, TOWER_INTERRUPTED
.done
	ld [wScriptVar], a
	ret

TowerShowBest::
; wTowerNumber = the best streak
	ld hl, wTowerBestStreak
	call TowerGetWord
	jr TowerNumberFromHL

TowerEndStreak::
; The streak ends: the best streak is updated, wTowerNumber = the streak, and
; the team is no longer locked.
	call TowerGetStreak
	call TowerNumberFromHL
	push hl
	ld hl, wTowerBestStreak
	call TowerGetWord
	pop de
	ld a, h
	cp d
	jr c, .better
	jr nz, .keep
	ld a, l
	cp e
	jr nc, .keep
.better
	ld hl, wTowerBestStreak
	call TowerSetWord
.keep
	ld de, 0
	call TowerSetStreak
	call TowerGetState
	and ~(1 << TOWER_IN_SET_F | 1 << TOWER_STREAK_F)
	jp TowerSetState

TowerBeginStreak::
; A new streak with the picked team (after FacilityChooseTeam), which is now
; locked.
	ld de, 0
	call TowerSetStreak
	ld hl, wTowerTeamBuffer
	ld c, 0
.loop
	push hl
	ld hl, wFacilityPicks
	ld b, 0
	add hl, bc
	ld a, [hl]
	ld [wCurPartyMon], a
	pop hl
	push bc
	call TowerMonID
	pop bc
	inc c
	ld a, c
	cp FACILITY_TEAM_SIZE
	jr c, .loop
	ld de, wTowerTeamBuffer
	ld hl, wTowerTeam
	ld c, FACILITY_TEAM_SIZE * TOWER_TEAM_MON_LENGTH
.save
	ld a, [de]
	inc de
	push bc
	call TowerWriteByte
	pop bc
	inc hl
	dec c
	jr nz, .save
	call TowerGetState
	set TOWER_STREAK_F, a
	jp TowerSetState

TowerMonID:
; The identity of party Pokémon wCurPartyMon at hl (species index, DVs, OT ID;
; big-endian), hl += TOWER_TEAM_MON_LENGTH
	push hl
	ld a, [wCurPartyMon]
	ld e, a
	ld d, 0
	ld hl, wPartySpecies
	add hl, de
	ld a, [hl]
	call GetPokemonIndexFromID
	ld d, h
	ld e, l
	pop hl
	ld a, d
	ld [hli], a
	ld a, e
	ld [hli], a
	ld a, MON_DVS
	call .Word
	ld a, MON_OT_ID
.Word:
; the party Pokémon's word at offset a, to hl
	push hl
	call GetPartyParamLocation
	ld d, [hl]
	inc hl
	ld e, [hl]
	pop hl
	ld a, d
	ld [hli], a
	ld a, e
	ld [hli], a
	ret

TowerResumeTeam::
; wScriptVar = TRUE if every locked Pokémon is in the party: they're picked, in
; their order (wFacilityPicks)
	ld hl, wTowerTeam
	ld de, wTowerTeamBuffer
	ld c, FACILITY_TEAM_SIZE * TOWER_TEAM_MON_LENGTH
.load
	push bc
	call TowerReadByte
	pop bc
	ld [de], a
	inc de
	inc hl
	dec c
	jr nz, .load
	xor a
	ld [wFacilityPickCount], a
	ld hl, wTowerTeamBuffer
.team
	ld b, 0 ; party slot
.party
	ld a, b
	ld [wCurPartyMon], a
	push hl
	push bc
	ld hl, wTowerMonScratch
	call TowerMonID
	pop bc
	pop hl
	push hl
	ld de, wTowerMonScratch
	ld c, TOWER_TEAM_MON_LENGTH
.compare
	ld a, [de]
	cp [hl]
	jr nz, .different
	inc de
	inc hl
	dec c
	jr nz, .compare
	pop hl
; found it: party slot b is the next pick
	ld a, [wFacilityPickCount]
	ld e, a
	ld d, 0
	push hl
	ld hl, wFacilityPicks
	add hl, de
	ld [hl], b
	pop hl
	inc a
	ld [wFacilityPickCount], a
	ld de, TOWER_TEAM_MON_LENGTH
	add hl, de
	cp FACILITY_TEAM_SIZE
	jr c, .team
	ld a, TRUE
	ld [wScriptVar], a
	ret

.different
	pop hl
	inc b
	ld a, [wPartyCount]
	cp b
	jr nz, .party
	xor a ; FALSE
	ld [wScriptVar], a
	ret

TowerStartSet::
; A set starts (if it isn't finished, the streak ends on the next visit).
	xor a
	ld [wTowerSetRound], a
	dec a
	ld [wTowerLastTrainer], a
	call TowerGetState
	set TOWER_IN_SET_F, a
	jp TowerSetState

TowerRest::
; Between sets: the streak and the team stay.
	call TowerGetState
	res TOWER_IN_SET_F, a
	jp TowerSetState

TowerPrizeDue::
; wScriptVar = what the next set can give for the first time: 1 the 7-win item,
; 2 the TOWER_BOSS_BATTLE prize, or 0
	call TowerGetState
	ld c, a
	call TowerGetStreak
	ld a, h
	and a
	jr nz, .none
	ld a, l
	cp TOWER_SET_LENGTH
	jr nc, .boss
	bit TOWER_PRIZE7_F, c
	jr nz, .none
	ld a, 1
	jr .done

.boss
	cp TOWER_BOSS_BATTLE
	jr nc, .none
	cp TOWER_BOSS_BATTLE - TOWER_SET_LENGTH
	jr c, .none
	bit TOWER_PRIZE49_F, c
	jr nz, .none
	ld a, 2
	jr .done

.none
	xor a
.done
	ld [wScriptVar], a
	ret

TowerPickTrainer::
; The next trainer: the Tower head at battle TOWER_BOSS_BATTLE, otherwise a
; random TowerTrainers entry (not the last one). Its sprite shows on
; SPRITE_BATTLE_TOWER_OPPONENT (then special LoadUsedSpritesGFX). wScriptVar =
; TRUE for the Tower head.
	call TowerGetStreak
	ld a, h
	and a
	jr nz, .random
	ld a, l
	cp TOWER_BOSS_BATTLE - 1
	jr nz, .random
	ld hl, TowerHead
	ld a, TRUE
	jr .got

.random
	call Random
.mod
	cp NUM_TOWER_TRAINERS
	jr c, .in_range
	sub NUM_TOWER_TRAINERS
	jr .mod

.in_range
	ld hl, wTowerLastTrainer
	cp [hl]
	jr z, .random
	ld [hl], a
	ld hl, TowerTrainers
	ld bc, TOWER_TRAINER_LENGTH
	rst AddNTimes
	xor a ; FALSE
.got
	ld [wScriptVar], a
	ld a, [hli]
	ld [wTowerTrainerClass], a
	ld a, [hli]
	ld [wTowerTrainerID], a
	ld a, [hl]
	ld [wVariableSprites + SPRITE_BATTLE_TOWER_OPPONENT - SPRITE_VARS], a
	ret

TowerLoadTrainer::
; The picked trainer, for a Cup battle (as loadtrainer and loadvar
; VAR_BATTLETYPE, BATTLETYPE_CUP do)
	ld a, (1 << 7) | 1
	ld [wBattleScriptFlags], a
	ld a, [wTowerTrainerClass]
	ld [wOtherTrainerClass], a
	ld a, [wTowerTrainerID]
	ld [wOtherTrainerID], a
	ld a, BATTLETYPE_CUP
	ld [wBattleType], a
	ret

TowerWon::
; After a win: the streak goes up (wTowerNumber = the streak). wScriptVar =
; TRUE if the set goes on.
	call TowerGetStreak
	ld a, h
	cp HIGH(MAX_TOWER_STREAK)
	jr nz, .add
	ld a, l
	cp LOW(MAX_TOWER_STREAK)
	jr z, .capped
.add
	inc hl
.capped
	push hl
	ld d, h
	ld e, l
	call TowerSetStreak
	pop hl
	call TowerNumberFromHL
	ld hl, wTowerSetRound
	inc [hl]
	ld a, [hl]
	cp TOWER_SET_LENGTH
	ld a, FALSE
	jr nc, .done
	inc a ; TRUE
.done
	ld [wScriptVar], a
	ret

TowerSetBP::
; wScriptVar = the BP for the set just won: TOWER_FIRST_SET_BP for the first set
; of the streak, TOWER_SET_BP after
	call TowerGetStreak
	ld b, TOWER_SET_BP
	ld a, h
	and a
	jr nz, .got
	ld a, l
	cp TOWER_SET_LENGTH + 1
	jr nc, .got
	ld b, TOWER_FIRST_SET_BP
.got
	ld a, b
	ld [wScriptVar], a
	ret

TowerMilestone::
; wScriptVar = TOWER_MILESTONE_* for the streak (after a set): 7 or
; TOWER_BOSS_BATTLE wins, the first time or again
	call TowerGetState
	ld c, a
	call TowerGetStreak
	ld a, h
	and a
	jr nz, .none
	ld a, l
	cp TOWER_SET_LENGTH
	jr z, .seven
	cp TOWER_BOSS_BATTLE
	jr z, .boss
.none
	ld a, TOWER_MILESTONE_NONE
	jr .done

.seven
	bit TOWER_PRIZE7_F, c
	ld a, TOWER_MILESTONE_7
	jr nz, .done
	set TOWER_PRIZE7_F, c
	ld a, TOWER_MILESTONE_7_FIRST
	jr .first

.boss
	bit TOWER_PRIZE49_F, c
	ld a, TOWER_MILESTONE_49
	jr nz, .done
	set TOWER_PRIZE49_F, c
	ld a, TOWER_MILESTONE_49_FIRST
.first
	push af
	ld a, c
	call TowerSetState
	pop af
.done
	ld [wScriptVar], a
	ret

TowerSaveGame::
; Save the game (asking first only if it would overwrite another file).
; wScriptVar = TRUE if it was saved.
	farcall Link_SaveGame
	ld a, TRUE
	jr nc, .done
	xor a ; FALSE
.done
	ld [wScriptVar], a
	ret

; the elite trainers: class, id, overworld sprite
TowerTrainers:
	table_width TOWER_TRAINER_LENGTH
	db COOLTRAINERM, TOWER_ELITE_1, SPRITE_COOLTRAINER_M
	db COOLTRAINERM, TOWER_ELITE_2, SPRITE_COOLTRAINER_M
	db COOLTRAINERF, TOWER_ELITE_3, SPRITE_COOLTRAINER_F
	db COOLTRAINERF, TOWER_ELITE_4, SPRITE_COOLTRAINER_F
	db BLACKBELT_T, TOWER_ELITE_5, SPRITE_BLACK_BELT
	db PSYCHIC_T, TOWER_ELITE_6, SPRITE_YOUNGSTER
	db BEAUTY, TOWER_ELITE_7, SPRITE_BEAUTY
	db GENTLEMAN, TOWER_ELITE_8, SPRITE_GENTLEMAN
	db SAGE, TOWER_ELITE_9, SPRITE_SAGE
	db BATTLE_GIRL, TOWER_ELITE_10, SPRITE_COOLTRAINER_F
	db RANGERM, TOWER_ELITE_11, SPRITE_COOLTRAINER_M
	db RANGERF, TOWER_ELITE_12, SPRITE_COOLTRAINER_F
	assert_table_length NUM_TOWER_TRAINERS

TowerHead:
	db COOLTRAINERM, TOWER_HEAD, SPRITE_COOLTRAINER_M
