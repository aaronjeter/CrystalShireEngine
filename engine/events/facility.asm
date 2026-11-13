; Challenge facilities: the player enters FACILITY_TEAM_SIZE Pokémon, set to the
; facility's level, for FACILITY_ROUNDS battles (BATTLETYPE_CUP) in a row.
; The whole party is kept in SRAM meanwhile and comes back afterwards.
; Script flow (FacilityDeskScript): FacilitySetup, FacilityChooseTeam,
; FacilityStartRun, then per round FacilityLoadTrainer and a battle, then
; FacilityEndRun.

FacilitySetup::
; wScriptVar = a facility (FACILITY_*): start with it. Returns wScriptVar = how
; many party Pokémon may enter it.
	ld a, [wScriptVar]
	ld [wFacilityID], a
	xor a
	ld [wFacilityRound], a
	ld [wFacilityPickCount], a
	ld c, 0
	ld a, [wPartyCount]
	ld b, a
.loop
	ld a, b
	dec a
	ld [wCurPartyMon], a
	push bc
	call FacilityMonAllowed
	pop bc
	jr c, .next
	inc c
.next
	dec b
	jr nz, .loop
	ld a, c
	ld [wScriptVar], a
	ret

FacilityRecordByte:
; a = byte a of the current facility's record
	push hl
	push de
	push bc
	ld c, a
	ld b, 0
	ld a, [wFacilityID]
	ld hl, FacilityRecords
	push bc
	ld bc, FACILITY_RECORD_LENGTH
	rst AddNTimes
	pop bc
	add hl, bc
	ld a, [hl]
	pop bc
	pop de
	pop hl
	ret

FacilityMonAllowed:
; carry if party Pokémon wCurPartyMon may not enter the current facility
	ld a, [wCurPartyMon]
	ld e, a
	ld d, 0
	ld hl, wPartySpecies
	add hl, de
	ld a, [hl]
	cp EGG
	jr z, .no
	ld [wCurSpecies], a
	call GetPokemonIndexFromID
	ld de, FacilityEligibility
	add hl, de
	ld a, BANK(FacilityEligibility)
	call GetFarByte
	ld b, a ; FACILITY_LITTLE, FACILITY_MIDDLE, region
	ld a, FACILITY_CATEGORY
	call FacilityRecordByte
	and a ; FACILITY_ANY
	ret z
	cp FACILITY_LITTLE_CUP
	jr z, .little
	cp FACILITY_MIDDLE_CUP
	jr z, .middle
	cp FACILITY_TYPE_CUP
	jr z, .type
; FACILITY_REGION_CUP
	ld a, FACILITY_PARAM
	call FacilityRecordByte
	ld c, a
	ld a, b
	and FACILITY_REGION_MASK
	cp c
	ret z
.no
	scf
	ret

.little
	bit FACILITY_LITTLE_F, b
	jr z, .no
	ret

.middle
	bit FACILITY_MIDDLE_F, b
	jr z, .no
	ret

.type
	call GetBaseData
	ld a, FACILITY_PARAM
	call FacilityRecordByte
	ld hl, wBaseType1
	cp [hl]
	ret z
	inc hl ; wBaseType2
	cp [hl]
	ret z
	jr .no

FacilityChooseTeam::
; The player picks FACILITY_TEAM_SIZE party Pokémon in order (wFacilityPicks).
; wScriptVar = FALSE if they canceled.
	xor a
	ld [wFacilityPickCount], a
.pick
	call .FirstUnpicked
	ld [wPartyMenuCursor], a
	ld hl, .ChooseText
	call PrintText
	ld b, PARTYMENUACTION_CHOOSE_POKEMON
	farcall SelectTradeOrDayCareMon
	jr c, .canceled
; not one already picked
	ld a, [wFacilityPickCount]
	and a
	jr z, .new
	ld c, a
	ld hl, wFacilityPicks
	ld a, [wCurPartyMon]
.check_picked
	cp [hl]
	jr z, .already
	inc hl
	dec c
	jr nz, .check_picked
.new
	call FacilityMonAllowed
	jr c, .not_allowed
; not the same species as one already picked
	ld a, [wFacilityPickCount]
	and a
	jr z, .take
	ld c, a
	ld a, [wCurPartyMon]
	ld e, a
	ld d, 0
	ld hl, wPartySpecies
	add hl, de
	ld b, [hl]
	ld de, wFacilityPicks
.check_species
	ld a, [de]
	push de
	ld e, a
	ld d, 0
	ld hl, wPartySpecies
	add hl, de
	pop de
	ld a, [hl]
	cp b
	jr z, .same_species
	inc de
	dec c
	jr nz, .check_species
.take
	ld a, [wFacilityPickCount]
	ld e, a
	ld d, 0
	ld hl, wFacilityPicks
	add hl, de
	ld a, [wCurPartyMon]
	ld [hl], a
	ld a, e
	inc a
	ld [wFacilityPickCount], a
	call .GetName
	ld hl, .EnteredText
	call PrintText
	ld a, [wFacilityPickCount]
	cp FACILITY_TEAM_SIZE
	jr c, .pick
	ld a, TRUE
	ld [wScriptVar], a
	ret

.canceled
	xor a
	ld [wScriptVar], a
	ret

.already
	ld hl, .AlreadyText
	jr .refuse

.not_allowed
	call .GetName
	ld hl, .NotAllowedText
	jr .refuse

.same_species
	ld hl, .SameSpeciesText
.refuse
	call PrintText
	jmp .pick

.FirstUnpicked:
; a = the party menu cursor (1-based) on the first party Pokémon not picked yet
	ld c, 0 ; slot
.next_slot
	ld a, [wFacilityPickCount]
	and a
	jr z, .found
	ld b, a
	ld hl, wFacilityPicks
.compare
	ld a, [hli]
	cp c
	jr z, .picked
	dec b
	jr nz, .compare
.found
	ld a, c
	inc a
	ret

.picked
	inc c
	ld a, [wPartyCount]
	cp c
	jr nz, .next_slot
	ld a, 1
	ret

.GetName:
	ld a, [wCurPartyMon]
	ld hl, wPartyMonNicknames
	jmp GetNickname

.ChooseText:
	text "Which #MON will"
	line "you enter?"
	prompt

.EnteredText:
	text_ram wStringBuffer1
	text " is"
	line "entered!"
	prompt

.AlreadyText:
	text "That #MON is"
	line "already entered."
	prompt

.NotAllowedText:
	text_ram wStringBuffer1
	text " can't"
	line "enter this one."
	prompt

.SameSpeciesText:
	text "The #MON must"
	line "all be different"
	cont "kinds."
	prompt

FacilityStartRun::
; Keep the party in SRAM, then leave only the picked Pokémon (in pick order), at
; the facility's level with recalculated stats, fully healed.
	ld a, BANK(sFacilityParty)
	call OpenSRAM
	ld hl, wPartyCount
	ld de, sFacilityParty
	ld bc, wPartyMonNicknamesEnd - wPartyCount
	rst CopyBytes
	ld a, TRUE
	ld [sFacilityRunning], a
	call FacilityKeepIndexes
	call CloseSRAM
	ld a, [wFacilityPickCount]
	ld c, a
	ld b, 0 ; new slot
.copy
	push bc
	call .CopyPick
	pop bc
	inc b
	dec c
	jr nz, .copy
	ld a, [wFacilityPickCount]
	ld [wPartyCount], a
	ld e, a
	ld d, 0
	ld hl, wPartySpecies
	add hl, de
	ld [hl], -1 ; end
; the level: fixed, or the level cap
	ld a, FACILITY_LEVEL
	call FacilityRecordByte
	and a
	jr nz, .got_level
	ld a, [wLevelCap]
.got_level
	ld [wFacilityLevel], a
	ld a, FACILITY_STYLE
	call FacilityRecordByte
	ld [wFacilityStyle], a
	xor a
.level_loop
	ld [wCurPartyMon], a
	call FacilitySetLevel
	ld a, [wCurPartyMon]
	inc a
	ld hl, wPartyCount
	cp [hl]
	jr c, .level_loop
	predef HealParty
	farjp RefreshFollower

.CopyPick:
; party slot b = the backup's slot wFacilityPicks[b]
	ld e, b
	ld d, 0
	ld hl, wFacilityPicks
	add hl, de
	ld c, [hl] ; old slot
	ld a, BANK(sFacilityParty)
	call OpenSRAM
; species
	ld hl, sFacilityParty + (wPartySpecies - wPartyCount)
	ld a, c
	call .Offset1
	ld a, [hl]
	ld hl, wPartySpecies
	push af
	ld a, b
	call .Offset1
	pop af
	ld [hl], a
; struct
	push bc
	ld hl, sFacilityParty + (wPartyMons - wPartyCount)
	ld a, c
	ld bc, PARTYMON_STRUCT_LENGTH
	rst AddNTimes
	pop bc
	push bc
	push hl
	ld hl, wPartyMons
	ld a, b
	ld bc, PARTYMON_STRUCT_LENGTH
	rst AddNTimes
	ld d, h
	ld e, l
	pop hl
	ld bc, PARTYMON_STRUCT_LENGTH
	rst CopyBytes
	pop bc
; OT name
	push bc
	ld hl, sFacilityParty + (wPartyMonOTs - wPartyCount)
	ld a, c
	ld bc, NAME_LENGTH
	rst AddNTimes
	pop bc
	push bc
	push hl
	ld hl, wPartyMonOTs
	ld a, b
	ld bc, NAME_LENGTH
	rst AddNTimes
	ld d, h
	ld e, l
	pop hl
	ld bc, NAME_LENGTH
	rst CopyBytes
	pop bc
; nickname
	push bc
	ld hl, sFacilityParty + (wPartyMonNicknames - wPartyCount)
	ld a, c
	ld bc, MON_NAME_LENGTH
	rst AddNTimes
	pop bc
	push hl
	ld hl, wPartyMonNicknames
	ld a, b
	ld bc, MON_NAME_LENGTH
	rst AddNTimes
	ld d, h
	ld e, l
	pop hl
	ld bc, MON_NAME_LENGTH
	rst CopyBytes
	jmp CloseSRAM

.Offset1:
; hl += a
	add l
	ld l, a
	ret nc
	inc h
	ret

DEF FACILITY_KEPT_FIELDS EQU MON_MOVES + NUM_MOVES ; species, item, moves

FacilityKeepIndexes:
; sFacilityIndexes = the 16-bit index of each party Pokémon's species, item and
; moves (SRAM open)
	ld de, sFacilityIndexes
	xor a
.mon
	ld [wCurPartyMon], a
	ld b, 0 ; field
.field
	ld a, b
	call GetPartyParamLocation
	ld a, [hl]
	ld hl, 0
	and a
	jr z, .got_index
	push af
	ld a, b
	and a ; MON_SPECIES
	jr z, .species
	dec a ; MON_ITEM
	jr z, .item
	pop af
	call GetMoveIndexFromID
	jr .got_index
.species
	pop af
	call GetPokemonIndexFromID
	jr .got_index
.item
	pop af
	call GetItemIndexFromID
.got_index
	ld a, l
	ld [de], a
	inc de
	ld a, h
	ld [de], a
	inc de
	inc b
	ld a, b
	cp FACILITY_KEPT_FIELDS
	jr c, .field
	ld a, [wCurPartyMon]
	inc a
	ld hl, wPartyCount
	cp [hl]
	jr c, .mon
	ret

FacilityRestoreIDs:
; Give each party Pokémon's species, item and moves the IDs of the indexes in
; sFacilityIndexes (SRAM open), in its struct and wPartySpecies
	ld de, sFacilityIndexes
	xor a
.mon
	ld [wCurPartyMon], a
	ld b, 0 ; field
.field
	ld a, [de]
	ld l, a
	inc de
	ld a, [de]
	ld h, a
	inc de
	or l
	jr z, .got_id
	ld a, b
	and a ; MON_SPECIES
	jr z, .species
	dec a ; MON_ITEM
	jr z, .item
	call GetMoveIDFromIndex
	jr .got_id
.species
	call GetPokemonIDFromIndex
	push af
	push de
	ld a, [wCurPartyMon]
	ld e, a
	ld d, 0
	ld hl, wPartySpecies
	add hl, de
	pop de
	ld a, [hl]
	cp EGG
	jr z, .egg
	pop af
	ld [hl], a
	jr .got_id
.egg
	pop af
	jr .got_id
.item
	call GetItemIDFromIndex
.got_id
	push af
	ld a, b
	call GetPartyParamLocation
	pop af
	ld [hl], a
	inc b
	ld a, b
	cp FACILITY_KEPT_FIELDS
	jr c, .field
	ld a, [wCurPartyMon]
	inc a
	ld hl, wPartyCount
	cp [hl]
	jr c, .mon
	ret

FacilitySetLevel:
; party Pokémon wCurPartyMon: level wFacilityLevel, stats recalculated (DVs
; and EVs kept)
	ld a, [wFacilityLevel]
	ld [wCurPartyLevel], a
	ld d, a
	ld a, MON_LEVEL
	call GetPartyParamLocation
	ld [hl], d
	ld a, [wCurPartyMon]
	ld e, a
	ld d, 0
	ld hl, wPartySpecies
	add hl, de
	ld a, [hl]
	ld [wCurSpecies], a
	call GetBaseData
	ld a, MON_MAXHP
	call GetPartyParamLocation
	ld d, h
	ld e, l
	ld a, MON_EVS - 1
	call GetPartyParamLocation
	ld b, TRUE
	predef_jump CalcMonStats

FacilityLoadTrainer::
; The current round's trainer, for a Cup battle (as loadtrainer and
; loadvar VAR_BATTLETYPE, BATTLETYPE_CUP do)
	ld a, (1 << 7) | 1
	ld [wBattleScriptFlags], a
	call FacilityRoundOffset
	push af
	call FacilityRecordByte
	ld [wOtherTrainerClass], a
	pop af
	inc a
	call FacilityRecordByte
	ld [wOtherTrainerID], a
	ld a, BATTLETYPE_CUP
	ld [wBattleType], a
	ret

FacilityRoundOffset:
; a = the offset of the current round's trainer in the record
	ld a, [wFacilityRound]
	ld c, a
	add a
	add c ; * FACILITY_TRAINER_LENGTH
	add FACILITY_TRAINERS
	ret

FacilityOpponentSprite::
; SPRITE_BATTLE_TOWER_OPPONENT shows the current round's trainer (then
; special LoadUsedSpritesGFX)
	call FacilityRoundOffset
	add 2
	call FacilityRecordByte
	ld [wVariableSprites + SPRITE_BATTLE_TOWER_OPPONENT - SPRITE_VARS], a
	ret

FacilityNextRound::
; wScriptVar = TRUE if there's another round (and it's now the current one)
	ld hl, wFacilityRound
	inc [hl]
	ld a, [hl]
	cp FACILITY_ROUNDS
	ld a, FALSE
	jr nc, .done
	inc a ; TRUE
.done
	ld [wScriptVar], a
	ret

FacilityEndRun::
; The whole party comes back as it was.
	ld a, BANK(sFacilityParty)
	call OpenSRAM
	ld a, [sFacilityRunning]
	and a
	jr z, .done
	ld hl, sFacilityParty
	ld de, wPartyCount
	ld bc, wPartyMonNicknamesEnd - wPartyCount
	rst CopyBytes
	call FacilityRestoreIDs
	xor a
	ld [sFacilityRunning], a
.done
	call CloseSRAM
	xor a
	ld [wFacilityLevel], a
	ld [wFacilityStyle], a
	farjp RefreshFollower

FacilitySetCleared::
; Set the current facility's cleared flag, if it has one (the map script
; gives its prize)
	ld a, FACILITY_FLAG
	call FacilityRecordByte
	ld e, a
	ld a, FACILITY_FLAG + 1
	call FacilityRecordByte
	ld d, a
	or e
	ret z
	ld b, SET_FLAG
	jmp EventFlagAction

INCLUDE "data/events/facilities.asm"

DEF MAX_BATTLE_POINTS EQU 9999

AddLeagueRematchWin::
; wLeagueRematchWins[wScriptVar] += 1, up to 255
	ldh a, [rSVBK]
	push af
	ld a, BANK(wLeagueRematchWins)
	ldh [rSVBK], a
	ld a, [wScriptVar]
	ld e, a
	ld d, 0
	ld hl, wLeagueRematchWins
	add hl, de
	inc [hl]
	jr nz, .done
	dec [hl]
.done
	pop af
	ldh [rSVBK], a
	ret

GiveBattlePoints::
; wBattlePoints += wScriptVar, up to MAX_BATTLE_POINTS
	ldh a, [rSVBK]
	push af
	ld a, BANK(wBattlePoints)
	ldh [rSVBK], a
	ld hl, wBattlePoints
	ld a, [hli]
	ld l, [hl]
	ld h, a
	ld a, [wScriptVar]
	ld c, a
	ld b, 0
	add hl, bc
	ld a, h
	cp HIGH(MAX_BATTLE_POINTS + 1)
	jr c, .ok
	jr nz, .cap
	ld a, l
	cp LOW(MAX_BATTLE_POINTS + 1)
	jr c, .ok
.cap
	ld hl, MAX_BATTLE_POINTS
.ok
	ld a, h
	ld [wBattlePoints], a
	ld a, l
	ld [wBattlePoints + 1], a
	pop af
	ldh [rSVBK], a
	ret
