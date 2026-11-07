ReadTrainerParty:
; Loads the party of trainer wOtherTrainerClass/wOtherTrainerID into the OT party.
; Party format: data/trainers/parties.asm and the party macros in macros/data.asm.
	ld a, [wInBattleTowerBattle]
	bit IN_BATTLE_TOWER_BATTLE_F, a
	ret nz

	ld a, [wLinkMode]
	and a
	ret nz

	ld hl, wOTPartyCount
	xor a
	ld [hli], a
	dec a
	ld [hl], a

	ld hl, wOTPartyMons
	ld bc, PARTYMON_STRUCT_LENGTH * PARTY_LENGTH
	xor a
	rst ByteFill
	ld hl, wOTPartyMonNicknames ; nicknames: zero = none (see _LoadEnemyMon)
	ld bc, MON_NAME_LENGTH * PARTY_LENGTH
	xor a
	rst ByteFill

	ld a, [wOtherTrainerID]
	ld b, a
	ld a, [wOtherTrainerClass]
	ld c, a
	call FindTrainerParty
	call FindTrainerTeam
	ld a, [wTrainerGroupBank]
	call GetFarByte
	cp RANDOM_TEAM
	jr z, .random

.loop
	call ReadTrainerMon
	jr nc, .loop
	jmp ComputeTrainerReward

.random
; RANDOM_TEAM, count, list: pick count different entries of the list
	inc hl
	call GetNextTrainerDataByte
	ld [wRandomTrainerNumPokemon], a
	call GetNextTrainerDataByte
	ld e, a
	ld d, 0
	ld hl, RandomPartyLists
	add hl, de
	add hl, de
	ld a, BANK(RandomPartyLists)
	ld [wTrainerGroupBank], a
	call GetNextTrainerDataWord
	ld h, d
	ld l, e
	call GetNextTrainerDataByte
	ld [wRandomTrainerTotalPokemon], a
	push hl ; the list's first entry
.start_random
	ld hl, wRandomTrainerRandomNumbers
	ld a, [wRandomTrainerTotalPokemon]
	call RandomRange
	ld b, a
	ld a, [wOTPartyCount]
	ld c, a
	inc c
.repeats_loop
	dec c
	jr z, .no_repeats
	ld a, [hli]
	cp b
	jr z, .start_random
	jr .repeats_loop
.no_repeats
	ld [hl], b
	pop hl
	push hl
; each entry starts with its size (after the size byte)
.skip_entries
	call GetNextTrainerDataByte
	dec b
	inc b
	jr z, .got_entry
	add l
	ld l, a
	adc h
	sub l
	ld h, a
	dec b
	jr .skip_entries
.got_entry
	call ReadTrainerMon
	ld hl, wRandomTrainerNumPokemon
	dec [hl]
	jr nz, .start_random
	pop hl
	jmp ComputeTrainerReward

FindTrainerParty:
; hl = the party of trainer class c, ID b (after its size word), wTrainerGroupBank =
; its bank. TrainerGroups has 3-byte entries; each party starts with its size (a word).
	dec c
	push bc
	ld b, 0
	ld hl, TrainerGroups
	add hl, bc
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld [wTrainerGroupBank], a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	pop bc
.skip_party
	dec b
	jr z, .got_party
	push bc
	call GetNextTrainerDataWord
	add hl, de
	pop bc
	jr .skip_party
.got_party
	inc hl
	inc hl
	ret

FindTrainerTeam:
; From the party at hl: skips the name, sets wOtherTrainerType to the party flags
; and leaves hl at the team for this mode (the Hard team if there is one and
; wHardMode is on; wHardMode 1 = Normal).
.skip_name
	call GetNextTrainerDataByte
	cp "@"
	jr nz, .skip_name
	call GetNextTrainerDataByte
	ld [wOtherTrainerType], a
	bit TRAINERTYPE_HARD_F, a
	ret z
	ld a, [wHardMode]
	cp 1
	ret z
	; fallthrough

SkipTrainerTeam:
; hl = past the team at hl (RANDOM_TEAM, count, list; or Pokemon up to END_PARTY_MONS)
	call GetNextTrainerDataByte
	cp RANDOM_TEAM
	jr nz, .mon
	inc hl
	inc hl
	ret
.mon
	cp END_PARTY_MONS
	ret z
	ld b, a ; flags
	inc hl ; level
	inc hl ; species
	inc hl
	bit MONFLAG_ITEM_F, b
	jr z, .no_item
	inc hl
	inc hl
.no_item
	bit MONFLAG_ABILITY_F, b
	jr z, .no_ability
	inc hl
.no_ability
	bit MONFLAG_MOVES_F, b
	jr z, .no_moves
	call GetNextTrainerDataByte
	add a
	add l
	ld l, a
	adc h
	sub l
	ld h, a
.no_moves
	bit MONFLAG_DVS_F, b
	jr z, .no_dvs
	inc hl
	inc hl
.no_dvs
	bit MONFLAG_EVS_F, b
	jr z, .no_evs
	inc hl
.no_evs
	bit MONFLAG_NICKNAME_F, b
	jr z, SkipTrainerTeam.next
.nickname
	call GetNextTrainerDataByte
	cp "@"
	jr nz, .nickname
.next
	call GetNextTrainerDataByte
	jr .mon

ReadTrainerMon:
; Adds the Pokemon at hl (bank wTrainerGroupBank) to the OT party: flags, level,
; species, then the fields the flags name (MONFLAG_*, constants/trainer_data_constants.asm).
; Returns carry at END_PARTY_MONS; else hl points past the Pokemon.
	call GetNextTrainerDataByte
	cp END_PARTY_MONS
	scf
	ret z
	ld [wTrainerMonFlags], a

; the level is added to wBaseLevel; a Cup battle uses the level cap
	call GetNextTrainerDataByte
	ld b, a
	ld a, [wBaseLevel]
	add b
	ld [wCurPartyLevel], a
	ld a, [wBattleType]
	cp BATTLETYPE_CUP
	jr nz, .got_level
	ld a, [wLevelCap]
	ld [wCurPartyLevel], a
.got_level

	call GetNextTrainerDataWord
	push hl
	ld h, d
	ld l, e
	call GetPokemonIDFromIndex
	ld [wCurPartySpecies], a
	ld a, OTPARTYMON
	ld [wMonType], a
	predef TryAddMonToParty
	pop hl

	ld a, [wTrainerMonFlags]
	bit MONFLAG_ITEM_F, a
	jr z, .no_item
	call GetNextTrainerDataWord
	push hl
	ld h, d
	ld l, e
	call GetItemIDFromIndex
	pop hl
	push af
	ld bc, MON_ITEM
	call TrainerMonField
	pop af
	ld [de], a
.no_item

	ld a, [wTrainerMonFlags]
	bit MONFLAG_ABILITY_F, a
	call nz, .Ability

	ld a, [wTrainerMonFlags]
	bit MONFLAG_MOVES_F, a
	call nz, .Moves

	ld a, [wTrainerMonFlags]
	bit MONFLAG_DVS_F, a
	jr z, .no_dvs
	ld bc, MON_DVS
	call TrainerMonField
	call GetNextTrainerDataByte
	ld [de], a
	inc de
	call GetNextTrainerDataByte
	ld [de], a
	farcall SetTrainerMonColor ; a _COLOR preset's colors
.no_dvs

	ld a, [wTrainerMonFlags]
	bit MONFLAG_EVS_F, a
	jr nz, .ev_spread
	call .DefaultEVs
	jr .no_evs
.ev_spread
	call GetNextTrainerDataByte
	push hl
	dec a
	ld hl, TrainerEVSpreads
	ld bc, NUM_STATS
	rst AddNTimes
	push hl
	ld bc, MON_EVS
	call TrainerMonField
	pop hl
	ld bc, NUM_STATS
	rst CopyBytes
	pop hl
.no_evs

	ld a, [wTrainerMonFlags]
	bit MONFLAG_NICKNAME_F, a
	jr z, .no_nickname
	push hl
	ld a, [wOTPartyCount]
	dec a
	ld hl, wOTPartyMonNicknames
	call SkipNames
	ld d, h
	ld e, l
	pop hl
.nickname_loop
	call GetNextTrainerDataByte
	ld [de], a
	inc de
	cp "@"
	jr nz, .nickname_loop
.no_nickname

	ld a, [wTrainerMonFlags]
	bit MONFLAG_SHINY_F, a
	jr z, .no_shiny
	ld bc, MON_DVS + 1
	call TrainerMonField
	ld a, SHINY_SPDSPC_DV
	ld [de], a
.no_shiny

; DVs and EVs change the stats: recalculate them, and set HP to the new max
	push hl
	ld bc, MON_MAXHP
	call TrainerMonField
	push de
	ld bc, MON_EVS - 1
	call TrainerMonField
	ld h, d
	ld l, e
	pop de
	ld b, TRUE
	push de
	predef CalcMonStats
	pop hl
	ld a, [hli]
	ld c, [hl]
	dec hl
	dec hl
	ld [hl], c
	dec hl
	ld [hl], a
	pop hl
	and a
	ret

.DefaultEVs:
; EVs of a Pokemon with no ev_spread line (TrainerClassEVs): the class's preset
; shape, its off-stats (below 128) raised to CLASS_OFF_STAT_EV (EVS_ALL: every
; stat CLASS_ALL_STAT_EV), then scaled by the tier: each EV = shape * (ratio + 1)
; / 256, ratio 0-255 = level x 3 / 2 (ROUTE), level x 3 (ELITE) or 255 (BOSS).
; Hard mode is one tier up; above BOSS every EV is MAX_EV. Preserves hl.
	push hl
	ld bc, MON_EVS
	call TrainerMonField
	push de
	ld a, [wOtherTrainerClass]
	ld c, a
	ld b, 0
	ld hl, TrainerClassEVs - 1
	add hl, bc
	ld a, [hl]
	swap a
	and $f
	ld d, a ; tier
	ld a, [hl]
	and $f
	jr z, .no_default_evs
	ld e, CLASS_OFF_STAT_EV
	cp EVS_ALL
	jr nz, .got_off_ev
	ld e, CLASS_ALL_STAT_EV
.got_off_ev
	dec a
	ld hl, TrainerEVSpreads
	ld bc, NUM_STATS
	rst AddNTimes
	ld a, [wHardMode] ; 0 = Hard
	and a
	jr nz, .got_tier
	inc d
.got_tier
	pop bc ; the Pokemon's EVs
	push bc
	ld a, NUM_STATS
.shape_loop
	push af
	ld a, [hli]
	cp 128
	jr nc, .specialized
	ld a, e
.specialized
	ld [bc], a
	inc bc
	pop af
	dec a
	jr nz, .shape_loop

	ld a, d
	cp EV_TIER_MAX
	jr nc, .max_evs
	cp EV_TIER_BOSS
	ld a, $ff
	jr z, .got_ratio
	ld a, [wCurPartyLevel]
	ld l, a
	ld h, 0
	ld b, h
	ld c, l
	add hl, hl
	add hl, bc
	ld a, d
	and a ; EV_TIER_ROUTE
	jr nz, .not_route
	srl h
	rr l
.not_route
	ld a, h
	and a
	ld a, l
	jr z, .got_ratio
	ld a, $ff
.got_ratio
	ld c, a
	pop hl
	ld b, NUM_STATS
.scale_loop
	ld a, [hl]
	push hl
	push bc
	push af
	ldh [hMultiplicand + 2], a
	xor a
	ldh [hMultiplicand + 0], a
	ldh [hMultiplicand + 1], a
	ld a, c
	ldh [hMultiplier], a
	call Multiply
	pop af
	ld b, a
	ldh a, [hProduct + 3]
	add b
	ldh a, [hProduct + 2]
	adc 0
	pop bc
	pop hl
	ld [hli], a
	dec b
	jr nz, .scale_loop
	pop hl
	ret

.max_evs
	pop hl
	ld a, MAX_EV
	ld b, NUM_STATS
.max_loop
	ld [hli], a
	dec b
	jr nz, .max_loop
	pop hl
	ret

.no_default_evs
	pop de
	pop hl
	ret

.Ability:
; the slot of the species' ability that matches the listed one
; (the party macros check the species has it; if not, slot 1 stays)
	call GetNextTrainerDataByte
	push hl
	ld e, a
	ld a, [wCurPartySpecies]
	push de
	call GetPokemonIndexFromID
	pop de
	ld b, h
	ld c, l
	ld d, ABILITY_SLOT_1
.ability_loop
	ld a, d
	farcall GetSpeciesAbility ; preserves bc, de, hl
	cp e
	jr z, .got_ability_slot
	inc d
	ld a, d
	cp NUM_ABILITY_SLOTS
	jr c, .ability_loop
	ld d, ABILITY_SLOT_1
.got_ability_slot
	ld a, d
	push af
	ld bc, 0
	call TrainerMonField
	ld h, d
	ld l, e
	pop af
	farcall SetMonAbilitySlot
	pop hl
	ret

.Moves:
; count, then the moves; the other slots are cleared. Then the PP.
	ld bc, MON_MOVES
	call TrainerMonField
	call GetNextTrainerDataByte
	ld b, a
	ld c, NUM_MOVES
.move_loop
	push bc
	push de
	call GetNextTrainerDataWord
	push hl
	ld h, d
	ld l, e
	call GetMoveIDFromIndex
	pop hl
	pop de
	ld [de], a
	inc de
	pop bc
	dec c
	dec b
	jr nz, .move_loop
	xor a
.clear_moves
	inc c
	dec c
	jr z, .pp
	ld [de], a
	inc de
	dec c
	jr .clear_moves

.pp
	push hl
	ld bc, MON_PP
	call TrainerMonField
	push de
	ld bc, MON_MOVES
	call TrainerMonField
	ld h, d
	ld l, e
	pop de
	ld b, NUM_MOVES
.pp_loop
	ld a, [hli]
	and a
	jr z, .got_pp
	push hl
	push bc
	push de
	ld l, a
	ld a, MOVE_PP
	call GetMoveAttribute
	pop de
	pop bc
	pop hl
.got_pp
	ld [de], a
	inc de
	dec b
	jr nz, .pp_loop
	pop hl
	ret

TrainerMonField:
; de = field bc of the last Pokemon in the OT party. Preserves hl.
	push hl
	push bc
	ld a, [wOTPartyCount]
	dec a
	ld hl, wOTPartyMon1
	call GetPartyLocation
	pop bc
	add hl, bc
	ld d, h
	ld e, l
	pop hl
	ret

GetNextTrainerDataWord:
; de = the little-endian word at hl (bank wTrainerGroupBank); hl += 2
	call GetNextTrainerDataByte
	ld e, a
	call GetNextTrainerDataByte
	ld d, a
	ret

INCLUDE "data/trainers/ev_spreads.asm"
INCLUDE "data/trainers/class_evs.asm"

ComputeTrainerReward:
	ld hl, hProduct
	xor a
	ld [hli], a
	ld [hli], a ; hMultiplicand + 0
	ld [hli], a ; hMultiplicand + 1
	ld a, [wEnemyTrainerBaseReward]
	ld [hli], a ; hMultiplicand + 2
	ld a, [wCurPartyLevel]
	ld [hl], a ; hMultiplier
	call Multiply
	ld hl, wBattleReward
	xor a
	ld [hli], a
	ldh a, [hProduct + 2]
	ld [hli], a
	ldh a, [hProduct + 3]
	ld [hl], a
	ret

Battle_GetTrainerName::
	ld a, [wInBattleTowerBattle]
	bit IN_BATTLE_TOWER_BATTLE_F, a
	ld hl, wOTPlayerName
	ld a, BANK(@)
	ld [wTrainerGroupBank], a
	jr nz, CopyTrainerName

	ld a, [wOtherTrainerID]
	ld b, a
	ld a, [wOtherTrainerClass]
	ld c, a
	; fallthrough

GetTrainerName::
; c = trainer class, b = ID
	call FindTrainerParty
	; fallthrough

CopyTrainerName:
	ld de, wStringBuffer1
	push de
	ld bc, NAME_LENGTH
	ld a, [wTrainerGroupBank]
	call FarCopyBytes
	pop de
	ret

GetNextTrainerDataByte:
	ld a, [wTrainerGroupBank]
	call GetFarByte
	inc hl
	ret

INCLUDE "data/trainers/party_pointers.asm"

SetTrainerBattleLevel:
; wCurPartyLevel = the level of the trainer's lead (for the battle transition), found as
; ReadTrainerParty does (this mode's team), the listed level added to wBaseLevel (the level cap in a Cup
; battle). A random party's lead isn't chosen yet, so it counts as wBaseLevel.
	ld a, 255
	ld [wCurPartyLevel], a

	ld a, [wInBattleTowerBattle]
	bit 0, a
	ret nz

	ld a, [wLinkMode]
	and a
	ret nz

	ld a, [wOtherTrainerID]
	ld b, a
	ld a, [wOtherTrainerClass]
	ld c, a
	call FindTrainerParty
	call FindTrainerTeam
	call GetNextTrainerDataByte ; the lead's flags, or RANDOM_TEAM
	ld b, 0
	cp RANDOM_TEAM
	jr z, .got_level
	call GetNextTrainerDataByte ; the lead's level (added to wBaseLevel)
	ld b, a
.got_level
	ld a, [wBaseLevel]
	add b
	ld [wCurPartyLevel], a

	ld a, [wBattleType]
	cp BATTLETYPE_CUP
	ret nz
	ld a, [wLevelCap]
	ld [wCurPartyLevel], a
	ret
