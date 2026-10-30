; Battle Core code moved out of the Battle Core bank (double battles phase 1, item 7) to make
; room there: enemy mon loading, EXP and the EXP bar, and the link battle records.
; Calls between here and Battle Core are farcall/farjp (far calls keep a, bc, de, hl and the
; flags). Code here must not pass Battle Core a pointer to data in this bank, or the reverse.

KnockedOffBit:
; a = party index -> a = its bit in wKnockedOffMons (1 << index). Preserves bc, de, hl.
	push bc
	ld b, a
	inc b
	xor a
	scf
.loop
	rla
	dec b
	jr nz, .loop
	pop bc
	ret

SetBattleMonAbilityAndItem:
; InitBattleMon: set wBattleMonAbility, and clear wBattleMonItem if Knock Off
; suppressed this mon's item earlier in the battle. Preserves bc, de, hl.
	push hl
	ld a, [wCurPartyMon]
	call KnockedOffBit
	ld hl, wKnockedOffMons
	and [hl]
	jr z, .done
	xor a
	ld [wBattleMonItem], a
.done
	pop hl
	farjp SetBattleMonAbility

_LoadEnemyMon:
; Initialize enemy monster parameters
; To do this we pull the species from wTempEnemyMonSpecies

; Notes:
;   BattleRandom is used to ensure sync between Game Boys

; Clear the whole enemy mon struct (wEnemyMon)
	xor a
	ld hl, wEnemyMonSpecies
	ld bc, wEnemyMonEnd - wEnemyMon
	rst ByteFill

; We don't need to be here if we're in a link battle
	ld a, [wLinkMode]
	and a
	jr z, .not_link
	farjp InitEnemyMon
.not_link

; Make sure everything knows what species we're working with
	ld a, [wTempEnemyMonSpecies]
	ld [wEnemyMonSpecies], a
	ld [wCurSpecies], a
	ld [wCurPartySpecies], a

; Grab the BaseData for this species
	call GetBaseData

; Let's get the item:

; Is the item predetermined?
	ld a, [wBattleMode]
	dec a
	jr z, .WildItem

; If we're in a trainer battle, the item is in the party struct
	ld a, [wCurPartyMon]
	ld hl, wOTPartyMon1Item
	call GetPartyLocation ; bc = PartyMon[wCurPartyMon] - wPartyMons
	ld b, [hl]
; unless Knock Off suppressed it earlier in the battle
	ld a, [wCurPartyMon]
	call KnockedOffBit
	ld hl, wKnockedOffMons + 1
	and [hl]
	jr z, .UpdateItem
	ld b, NO_ITEM
	jr .UpdateItem

.WildItem:
; In a wild battle, we pull from the item slots in BaseData

; Force Item1
; Used for Ho-Oh, Lugia and Snorlax encounters
	ld a, [wBattleType]
	cp BATTLETYPE_FORCEITEM
; 16 bit
	push af
	ld hl, wBaseItem1
	call GetItemIDFromHL
	ld b, a
	pop af
	jr z, .UpdateItem

; Failing that, it's all up to chance
;  Effective chances:
;    50% None
;    37.5% Item1
;    12.5% Item2

; 50% chance of getting an item
	call BattleRandom
	cp 50 percent + 1
	ld b, NO_ITEM
	jr c, .UpdateItem

; From there, an 8% chance for Item2
; item 1
	ld hl, wBaseItem1
	call GetItemIDFromHL
	ld b, a
	call BattleRandom
	cp 25 percent ; 25% of 50% = 12.5% Item2
	jr nc, .UpdateItem
; item 2
	ld hl, wBaseItem2
	call GetItemIDFromHL
	ld b, a

.UpdateItem:
	ld a, b
	ld [wEnemyMonItem], a

; Initialize DVs

; If we're in a trainer battle, DVs are predetermined
	ld a, [wBattleMode]
	and a
	jr z, .InitDVs

	ld a, [wEnemySubStatus5]
	bit SUBSTATUS_TRANSFORMED, a
	jr z, .InitDVs

; Unknown
	ld hl, wEnemyBackupDVs
	ld de, wEnemyMonDVs
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	jmp .Happiness

.InitDVs:
	ld a, [wBattleMode]
	dec a
	jr z, .WildDVs

; Custom DVs
	ld a, [wCurPartyMon]
	ld hl, wOTPartyMon1DVs
	call GetPartyLocation
	ld b, [hl]
	inc hl
	ld c, [hl]
	jr .UpdateDVs

.WildDVs
; Wild DVs
; Here's where the fun starts

; Roaming monsters (Entei, Raikou) work differently
; They have their own structs, which are shorter than normal
	ld a, [wBattleType]
	cp BATTLETYPE_ROAMING
	jr nz, .NotRoaming

; Grab HP
	farcall GetRoamMonHP
	ld a, [hl]
; Check if the HP has been initialized
	and a
; We'll do something with the result in a minute
	push af

; Grab DVs
	farcall GetRoamMonDVs
	inc hl
	ld a, [hld]
	ld c, a
	ld b, [hl]

; Get back the result of our check
	pop af
; If the RoamMon struct has already been initialized, we're done
	jr nz, .UpdateDVs

; If it hasn't, we need to initialize the DVs
; (HP is initialized at the end of the battle)
	farcall GetRoamMonDVs
	inc hl
	call BattleRandom
	ld [hld], a
	ld c, a
	call BattleRandom
	ld [hl], a
	ld b, a
; We're done with DVs
	jr .UpdateDVs

.NotRoaming:
; Register a contains wBattleType

; Forced shiny battle type
; Used by Red Gyarados at Lake of Rage
	cp BATTLETYPE_FORCESHINY
	jr nz, .GenerateDVs

	lb bc, ATKDEFDV_SHINY, SPDSPCDV_SHINY ; $ea / $aa
	jr .UpdateDVs

.GenerateDVs:
; Generate new random DVs
	call BattleRandom
	ld b, a
	call BattleRandom
	ld c, a

.UpdateDVs:
; Input DVs in register bc
	ld hl, wEnemyMonDVs
	ld a, b
	ld [hli], a
	ld [hl], c

; We've still got more to do if we're dealing with a wild monster
	ld a, [wBattleMode]
	dec a
	jr nz, .Happiness

; Species-specfic:

; Unown
	ld a, [wTempEnemyMonSpecies]
	call GetPokemonIndexFromID ; will be preserved for the Magikarp check
	ld a, l
	sub LOW(UNOWN)
	if HIGH(UNOWN) == 0
		or h
	else
		jr nz, .Magikarp
		ld a, h
		if HIGH(UNOWN) == 1
			dec a
		else
			cp HIGH(UNOWN)
		endc
	endc
	jr nz, .Magikarp

; Get letter based on DVs
	ld hl, wEnemyMonDVs
	predef GetUnownLetter
; Can't use any letters that haven't been unlocked
; If combined with forced shiny battletype, causes an infinite loop
	call CheckUnownLetter
	jr c, .GenerateDVs ; try again
	jr .Happiness ; skip the Magikarp check

.Magikarp:
; These filters are untranslated.
; They expect at wMagikarpLength a 2-byte value in mm,
; but the value is in feet and inches (one byte each).

; The first filter is supposed to make very large Magikarp even rarer,
; by targeting those 1600 mm (= 5'3") or larger.
; After the conversion to feet, it is unable to target any,
; since the largest possible Magikarp is 5'3", and $0503 = 1283 mm.
	ld a, l
	sub LOW(MAGIKARP)
	if HIGH(MAGIKARP) == 0
		or h
	else
		jr nz, .Happiness
		if HIGH(MAGIKARP) == 1
			dec h
		else
			ld a, h
			cp HIGH(MAGIKARP)
		endc
	endc
	jr nz, .Happiness

; Get Magikarp's length
	ld de, wEnemyMonDVs
	ld bc, wPlayerID
	farcall CalcMagikarpLength

; No reason to keep going if length > 1536 mm (i.e. if HIGH(length) > 6 feet)
	ld a, [wMagikarpLength]
	cp 5
	jr nz, .CheckMagikarpArea

; 5% chance of skipping both size checks
	call Random
	cp 5 percent
	jr c, .CheckMagikarpArea
; Try again if length >= 1616 mm (i.e. if LOW(length) >= 4 inches)
	ld a, [wMagikarpLength + 1]
	cp 4
	jr nc, .GenerateDVs

; 20% chance of skipping this check
	call Random
	cp 20 percent - 1
	jr c, .CheckMagikarpArea
; Try again if length >= 1600 mm (i.e. if LOW(length) >= 3 inches)
	ld a, [wMagikarpLength + 1]
	cp 3
	jr nc, .GenerateDVs

.CheckMagikarpArea:
	ld a, [wMapGroup]
	cp GROUP_LAKE_OF_RAGE
	jr nz, .Happiness
	ld a, [wMapNumber]
	cp MAP_LAKE_OF_RAGE
	jr nz, .Happiness
; 40% chance of not flooring
	call Random
	cp 39 percent + 1
	jr c, .Happiness
; Try again if length < 1024 mm (i.e. if HIGH(length) < 3 feet)
	ld a, [wMagikarpLength]
	cp 3
	jr c, .GenerateDVs ; try again

; Finally done with DVs

.Happiness:
; Set happiness
	ld a, BASE_HAPPINESS
	ld [wEnemyMonHappiness], a
; Set level
	ld a, [wCurPartyLevel]
	ld [wEnemyMonLevel], a
; Fill stats
	ld de, wEnemyMonMaxHP
	ld b, FALSE
	ld hl, wEnemyMonDVs - (MON_DVS - MON_EVS + 1)
	predef CalcMonStats

; If we're in a trainer battle,
; get the rest of the parameters from the party struct
	ld a, [wBattleMode]
	cp TRAINER_BATTLE
	jr z, .OpponentParty

; If we're in a wild battle, check wild-specific stuff
	and a
	jr z, .TreeMon

	ld a, [wEnemySubStatus5]
	bit SUBSTATUS_TRANSFORMED, a
	jr nz, .Moves

.TreeMon:
; If we're headbutting trees, some monsters enter battle asleep
	call CheckSleepingTreeMon
	; a = carry ? TREEMON_SLEEP_TURNS : 0
	sbc a
	and TREEMON_SLEEP_TURNS
	ld hl, wEnemyMonStatus
	ld [hli], a

; Unused byte
	xor a
	ld [hli], a

; Full HP..
	ld a, [wEnemyMonMaxHP]
	ld [hli], a
	ld a, [wEnemyMonMaxHP + 1]
	ld [hl], a

; ..unless it's a RoamMon
	ld a, [wBattleType]
	cp BATTLETYPE_ROAMING
	jr nz, .Moves

; Grab HP
	farcall GetRoamMonHP
	ld a, [hl]
; Check if it's been initialized again
	and a
	jr z, .InitRoamHP
; Update from the struct if it has
	ld a, [hl]
	ld [wEnemyMonHP + 1], a
	jr .Moves

.InitRoamHP:
; HP only uses the lo byte in the RoamMon struct since
; Raikou and Entei will have < 256 hp at level 40
	ld a, [wEnemyMonHP + 1]
	ld [hl], a
	jr .Moves

.OpponentParty:
; Get HP from the party struct
	ld hl, (wOTPartyMon1HP + 1)
	ld a, [wCurPartyMon]
	call GetPartyLocation
	ld a, [hld]
	ld [wEnemyMonHP + 1], a
	ld a, [hld]
	ld [wEnemyMonHP], a

; Make sure everything knows which monster the opponent is using
	ld a, [wCurPartyMon]
	ld [wCurOTMon], a

; Get status from the party struct
	dec hl
	ld a, [hl] ; OTPartyMonStatus
	ld [wEnemyMonStatus], a

.Moves:
	ld hl, wBaseType1
	ld de, wEnemyMonType1
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a

; Get moves
	ld de, wEnemyMonMoves
; Are we in a trainer battle?
	ld a, [wBattleMode]
	cp TRAINER_BATTLE
	jr nz, .WildMoves
; Then copy moves from the party struct
	ld hl, wOTPartyMon1Moves
	ld a, [wCurPartyMon]
	call GetPartyLocation
	ld bc, NUM_MOVES
	rst CopyBytes
	jr .PP

.WildMoves:
; Clear wEnemyMonMoves
	xor a
	ld h, d
	ld l, e
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ld [wSkipMovesBeforeLevelUp], a
; Fill moves based on level
	predef FillMoves

.PP:
; Trainer battle?
	ld a, [wBattleMode]
	cp TRAINER_BATTLE
	jr z, .TrainerPP

; Fill wild PP
	ld hl, wEnemyMonMoves
	ld de, wEnemyMonPP
	predef FillPP
	jr .Finish

.TrainerPP:
; Copy PP from the party struct
	ld hl, wOTPartyMon1PP
	ld a, [wCurPartyMon]
	call GetPartyLocation
	ld de, wEnemyMonPP
	ld bc, NUM_MOVES
	rst CopyBytes

.Finish:
; Copy the first five base stats (the enemy mon's base Sp. Atk
; is also used to calculate Sp. Def stat experience)
	ld hl, wBaseStats
	ld de, wEnemyMonBaseStats
	ld b, NUM_STATS - 1
.loop
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, .loop

	ld a, [wBaseCatchRate]
	ld [de], a
	inc de

	ld a, [wBaseExp]
	ld [de], a

	ld a, [wTempEnemyMonSpecies]
	ld [wNamedObjectIndex], a

	call GetPokemonName

; Did we catch it?
	ld a, [wBattleMode]
	and a
	ret z

; Update enemy nickname
	ld hl, wStringBuffer1
	ld de, wEnemyMonNickname
	ld bc, MON_NAME_LENGTH
	rst CopyBytes

; Saw this mon
	ld a, [wTempEnemyMonSpecies]
	call SetSeenMon

	ld hl, wEnemyMonStats
	ld de, wEnemyStats
	ld bc, NUM_BATTLE_STATS * 2
	rst CopyBytes
	farjp ApplyStatusEffectOnEnemyStats

CheckSleepingTreeMon:
; Return carry if species is in the list
; for the current time of day

; Don't do anything if this isn't a tree encounter
	ld a, [wBattleType]
	cp BATTLETYPE_TREE
	jr nz, .NotSleeping

	ld a, [wTempEnemyMonSpecies]
	call GetPokemonIndexFromID
	ld b, h
	ld c, l

; Get list for the time of day
	ld hl, AsleepTreeMonsMorn
	ld a, [wTimeOfDay]
	cp DAY_F
	jr c, .Check
	ld hl, AsleepTreeMonsDay
	jr z, .Check
	ld hl, AsleepTreeMonsNite

.Check:
	ld de, 2 ; length of species id
	call IsInWordArray
; If it's a match, the opponent is asleep
	ret c

.NotSleeping:
	and a
	ret

INCLUDE "data/wild/treemons_asleep.asm"

CheckUnownLetter:
; Return carry if the Unown letter hasn't been unlocked yet

	ld a, [wUnlockedUnowns]
	ld c, a
	ld de, 0

.loop

; Don't check this set unless it's been unlocked
	srl c
	jr nc, .next

; Is our letter in the set?
	ld hl, UnlockedUnownLetterSets
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a

	push de
	ld a, [wUnownLetter]
	ld de, 1
	push bc
	call IsInArray
	pop bc
	pop de

	jr c, .match

.next
; Make sure we haven't gone past the end of the table
	inc e
	inc e
	ld a, e
	cp NUM_UNLOCKED_UNOWN_SETS * 2
	jr c, .loop

; Hasn't been unlocked, or the letter is invalid
	scf
	ret

.match
; Valid letter
	and a
	ret

INCLUDE "data/wild/unlocked_unowns.asm"

GiveExperiencePoints:
; Give experience to the party mons in bitfield a (bit n: party mon n).
; Then reset the participants (ResetBattleParticipants), as when the enemy faints.
; Don't give experience if linked or in a cup battle.
	ld [wExpRecipients], a
	ld a, [wLinkMode]
	and a
	ret nz

	ld a, [wBattleType]
	cp BATTLETYPE_CUP
	ret z
	
	xor a
	ld [wCurPartyMon], a
	ld bc, wPartyMon1Species

.loop
	ld hl, MON_HP
	add hl, bc
	ld a, [hli]
	or [hl]
	jmp z, .next_mon ; fainted

	push bc
	ld hl, wExpRecipients
	ld a, [wCurPartyMon]
	ld c, a
	ld b, CHECK_FLAG
	ld d, 0
	predef SmallFarFlagAction
	ld a, c
	and a
	pop bc
	jmp z, .next_mon

; Give EVs
; e = 0 for no Pokérus, 1 for Pokérus
	ld e, 0 ; bit 0: Pokerus (x2), bit 1: Macho Brace (x2)
	ld hl, MON_POKERUS
	add hl, bc
	ld a, [hl]
	and a
	jr z, .no_pokerus
	inc e
.no_pokerus
	ld hl, MON_ITEM
	add hl, bc
	ld a, [hl]
	and a
	jr z, .no_macho_brace
	push de
	push bc
	ld b, a
	farcall GetItemHeldEffect
	ld a, b
	pop bc
	pop de
	cp HELD_MACHO_BRACE
	jr nz, .no_macho_brace
	set 1, e
.no_macho_brace
	ld hl, MON_EVS
	add hl, bc
	push bc
	ld a, [wEnemyMonSpecies]
	ld [wCurSpecies], a
	call GetBaseData
; EV yield format: %hhaaddss %ttff0000
; h = hp, a = atk, d = def, s = spd
; t = sat, f = sdf, 0 = unused bits
	ld a, [wBaseHPAtkDefSpdEVs]
	ld b, a
	ld c, NUM_STATS ; six EVs
.ev_loop
	rlc b
	rlc b
	ld a, b
	and %11
	bit 0, e
	jr z, .no_pokerus_boost
	add a
.no_pokerus_boost
	bit 1, e
	jr z, .no_macho_brace_boost
	add a
.no_macho_brace_boost
; Make sure total EVs never surpass 510
	push de ; the boost flags in e (the code below reuses e)
	push bc
	push hl
	ld d, a
	ld a, c
.find_correct_ev_address
	; If address of first EV is changed, find the correct one.
	cp NUM_STATS
	jr z, .found_address
	dec hl
	inc a
	jr .find_correct_ev_address
.found_address
	ld e, NUM_STATS
	ld bc, 0
.count_evs
	ld a, [hli]
	add c
	ld c, a
	adc b
	sub c
	ld b, a
	dec e
	jr nz, .count_evs
	ld a, d
	add c
	ld c, a
	adc b
	sub c
	ld b, a
	ld e, d
.decrease_evs_gained	
.check_ev_overflow
	pop hl
	pop bc
	ld a, e
	add [hl]
	jr c, .ev_overflow
	cp MAX_EV + 1
	jr c, .got_ev
.ev_overflow
	ld a, MAX_EV
.got_ev
	ld [hli], a
	pop de
	dec c
	jr z, .evs_done
; Use the second byte for Sp.Atk and Sp.Def
	ld a, c
	cp 2 ; two stats left, Sp.Atk and Sp.Def
	jr nz, .ev_loop
	ld a, [wBaseSpAtkSpDefEVs]
	ld b, a
	jr .ev_loop
.evs_done
	xor a
	ldh [hMultiplicand + 0], a
	ldh [hMultiplicand + 1], a
	ld a, [wEnemyMonBaseExp]
	ldh [hMultiplicand + 2], a
	ld a, [wEnemyMonLevel]
	ldh [hMultiplier], a
	call Multiply
	ld a, 7
	ldh [hDivisor], a
	ld b, 4
	call Divide
; Boost Experience for traded Pokemon
	pop bc
	ld hl, MON_OT_ID
	add hl, bc
	ld a, [wPlayerID]
	cp [hl]
	jr nz, .boosted
	inc hl
	ld a, [wPlayerID + 1]
	cp [hl]
	ld a, 0 ; no-optimize a = 0
	jr z, .no_boost

.boosted
	call BoostExp
	ld a, 1

.no_boost
; Boost experience for a Trainer Battle
	ld [wStringBuffer2 + 2], a
	ld a, [wBattleMode]
	dec a
	call nz, BoostExp
; Boost experience for Lucky Egg
	push bc
	ld a, MON_ITEM
	call GetPartyParamLocation
	ld a, [hl]
	call GetItemIndexFromID
	cphl16 LUCKY_EGG
	call z, BoostExp
	ldh a, [hQuotient + 3]
	ld [wStringBuffer2 + 1], a
	ldh a, [hQuotient + 2]
	ld [wStringBuffer2], a
	ld a, [wCurPartyMon]
	ld hl, wPartyMonNicknames
	call GetNickname
	ld hl, Text_MonGainedExpPoint
	;call BattleTextbox
	ld a, [wStringBuffer2 + 1]
	ldh [hQuotient + 3], a
	ld a, [wStringBuffer2]
	ldh [hQuotient + 2], a
	pop bc
	call AnimateExpBar
	push bc
	call LoadTilemapToTempTilemap
	pop bc
; Pokemon at or above the level cap don't gain EXP. Otherwise the cap clamp
; below lowers their EXP to the cap level's amount, and once the cap rises
; their next "level up" drops their level and loops through every level,
; trying to learn their whole learnset.
	ld hl, MON_LEVEL
	add hl, bc
	ld a, [wLevelCap]
	cp [hl]
	jmp z, .next_mon
	jmp c, .next_mon
	ld hl, MON_EXP + 2
	add hl, bc
	ld d, [hl]
	ldh a, [hQuotient + 3]
	add d
	ld [hld], a
	ld d, [hl]
	ldh a, [hQuotient + 2]
	adc d
	ld [hl], a
	jr nc, .no_exp_overflow
	dec hl
	inc [hl]
	jr nz, .no_exp_overflow
	ld a, $ff
	ld [hli], a
	ld [hli], a
	ld [hl], a

.no_exp_overflow
	ld a, [wCurPartyMon]
	ld e, a
	ld d, 0
	ld hl, wPartySpecies
	add hl, de
	ld a, [hl]
	ld [wCurSpecies], a
	call GetBaseData
	push bc
	ld a, [wLevelCap]
	ld d, a
	farcall CalcExpAtLevel
	pop bc
	ld hl, MON_EXP + 2
	add hl, bc
	push bc
	ldh a, [hQuotient + 1]
	ld b, a
	ldh a, [hQuotient + 2]
	ld c, a
	ldh a, [hQuotient + 3]
	ld d, a
	ld a, [hld]
	sub d
	ld a, [hld]
	sbc c
	ld a, [hl]
	sbc b
	jr c, .not_max_exp
	ld a, b
	ld [hli], a
	ld a, c
	ld [hli], a
	ld a, d
	ld [hld], a

.not_max_exp
; Check if the mon leveled up
	xor a ; PARTYMON
	ld [wMonType], a
	predef CopyMonToTempMon
	farcall CalcLevel
	pop bc
	ld hl, MON_LEVEL
	add hl, bc
	ld a, [wLevelCap]
	push bc
	ld b, a
	ld a, [hl]
	cp b
	pop bc
	jmp nc, .next_mon
	cp d
	; never "level up" to a lower level (that would loop through every level)
	jmp nc, .next_mon
; <NICKNAME> grew to level ##!
	push af
	ld a, [wCurPartyMon]
	farcall SwapInPlayerPartyMon ; doubles: load the mon if it's out in the other slot
	pop af
	ld [wTempLevel], a
	ld a, [wCurPartyLevel]
	push af
	ld a, d
	ld [wCurPartyLevel], a
	ld [hl], a
	ld hl, MON_SPECIES
	add hl, bc
	ld a, [hl]
	ld [wCurSpecies], a
	ld [wTempSpecies], a ; unused?
	call GetBaseData
	ld hl, MON_MAXHP + 1
	add hl, bc
	ld a, [hld]
	ld e, a
	ld d, [hl]
	push de
	ld hl, MON_MAXHP
	add hl, bc
	ld d, h
	ld e, l
	ld hl, MON_EVS - 1
	add hl, bc
	push bc
	ld b, TRUE
	predef CalcMonStats
	pop bc
	pop de
	ld hl, MON_MAXHP + 1
	add hl, bc
	ld a, [hld]
	sub e
	ld e, a
	ld a, [hl]
	sbc d
	ld d, a
	dec hl
	ld a, [hl]
	add e
	ld [hld], a
	ld a, [hl]
	adc d
	ld [hl], a
	ld a, [wCurBattleMon]
	ld d, a
	ld a, [wCurPartyMon]
	cp d
	jr nz, .skip_active_mon_update
	ld de, wBattleMonHP
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	ld de, wBattleMonMaxHP
	push bc
	ld bc, PARTYMON_STRUCT_LENGTH - MON_MAXHP
	rst CopyBytes
	pop bc
	ld hl, MON_LEVEL
	add hl, bc
	ld a, [hl]
	ld [wBattleMonLevel], a
	ld a, [wPlayerSubStatus5]
	bit SUBSTATUS_TRANSFORMED, a
	jr nz, .transformed
	ld hl, MON_ATK
	add hl, bc
	ld de, wPlayerStats
	ld bc, PARTYMON_STRUCT_LENGTH - MON_ATK
	rst CopyBytes

.transformed
	xor a ; FALSE
	ld [wApplyStatLevelMultipliersToEnemy], a
	farcall ApplyStatLevelMultiplierOnAllStats
	farcall ApplyStatusEffectOnPlayerStats
	farcall UpdatePlayerHUD
	farcall EmptyBattleTextbox
	call LoadTilemapToTempTilemap
	ld a, $1
	ldh [hBGMapMode], a

.skip_active_mon_update
	farcall LevelUpHappinessMod
	ld a, [wDoubleBattle]
	and a
	jr nz, .grew_text ; doubles: no EXP bar, so always print it
	ld a, [wCurBattleMon]
	ld b, a
	ld a, [wCurPartyMon]
	cp b
	jr z, .skip_exp_bar_animation
.grew_text
	ld de, SFX_HIT_END_OF_EXP_BAR
	call PlaySFX
	call WaitSFX
	ld hl, BattleText_StringBuffer1GrewToLevel
	call StdBattleTextbox
	call LoadTilemapToTempTilemap

.skip_exp_bar_animation
	xor a ; PARTYMON
	ld [wMonType], a
	predef CopyMonToTempMon
	hlcoord 9, 0
	lb bc, 10, 9
	call Textbox
	farcall DoublesPushScreen ; (the box's attributes, over the double battle screen's pics)
	hlcoord 11, 1
	ld bc, 4
	predef PrintTempMonStats
	ld c, 30
	call DelayFrames
	call WaitPressAorB_BlinkCursor
	call SafeLoadTempTilemapToTilemap
	farcall DoublesRestoreAttrs
	xor a ; PARTYMON
	ld [wMonType], a
	ld a, [wCurSpecies]
	ld [wTempSpecies], a ; unused?
	ld a, [wCurPartyLevel]
	push af
	ld c, a
	ld a, [wTempLevel]
	ld b, a

.level_loop
	inc b
	ld a, b
	ld [wCurPartyLevel], a
	push bc
	predef LearnLevelMoves
	pop bc
	ld a, b
	cp c
	jr nz, .level_loop
	pop af
	ld [wCurPartyLevel], a
	ld hl, wEvolvableFlags
	ld a, [wCurPartyMon]
	ld c, a
	ld b, SET_FLAG
	predef SmallFarFlagAction
	pop af
	ld [wCurPartyLevel], a
	farcall RestorePartyMonSwap

.next_mon
	ld a, [wPartyCount]
	ld b, a
	ld a, [wCurPartyMon]
	inc a
	cp b
	jr z, .done
	ld [wCurPartyMon], a
	ld a, MON_SPECIES
	call GetPartyParamLocation
	ld b, h
	ld c, l
	jmp .loop

.done
	farjp ResetBattleParticipants

IsEvsGreaterThan510:
; Total EVs in bc. Set Carry flag if bc > 510.
	ld a, HIGH(MAX_TOTAL_EV)
	cp b
	ret nz
	ld a, LOW(MAX_TOTAL_EV)
	cp c
	ret

BoostExp:
; Multiply experience by 1.5x
	push bc
; load experience value
	ldh a, [hProduct + 2]
	ld b, a
	ldh a, [hProduct + 3]
	ld c, a
; halve it
	srl b
	rr c
; add it back to the whole exp value
	add c
	ldh [hProduct + 3], a
	ldh a, [hProduct + 2]
	adc b
	ldh [hProduct + 2], a
	pop bc
	ret

Text_MonGainedExpPoint:
	text_far Text_Gained
	text_asm
	ld hl, ExpPointsText
	ld a, [wStringBuffer2 + 2] ; IsTradedMon
	and a
	ret z

	ld hl, BoostedExpPointsText
	ret

BoostedExpPointsText:
	text_far _BoostedExpPointsText
	text_end

ExpPointsText:
	text_far _ExpPointsText
	text_end

AnimateExpBar:
	push bc

	ld a, [wDoubleBattle]
	and a
	jmp nz, .finish ; no EXP bar in doubles
	ld hl, wCurPartyMon
	ld a, [wCurBattleMon]
	cp [hl]
	jmp nz, .finish

	ld a, [wLevelCap]
	push bc
	ld b, a
	ld a, [wBattleMonLevel]
	cp b
	pop bc
	jmp nc, .finish

	ldh a, [hProduct + 3]
	ld [wExperienceGained + 2], a
	push af
	ldh a, [hProduct + 2]
	ld [wExperienceGained + 1], a
	push af
	xor a
	ld [wExperienceGained], a
	xor a ; PARTYMON
	ld [wMonType], a
	predef CopyMonToTempMon
	ld a, [wTempMonLevel]
	ld b, a
	ld e, a
	push de
	ld de, wTempMonExp + 2
	call CalcExpBar
	push bc
	ld hl, wTempMonExp + 2
	ld a, [wExperienceGained + 2]
	add [hl]
	ld [hld], a
	ld a, [wExperienceGained + 1]
	adc [hl]
	ld [hld], a
	jr nc, .NoOverflow
	inc [hl]
	jr nz, .NoOverflow
	ld a, $ff
	ld [hli], a
	ld [hli], a
	ld [hl], a

.NoOverflow:
	ld a, [wLevelCap]
	ld d, a
	farcall CalcExpAtLevel
	ldh a, [hProduct + 1]
	ld b, a
	ldh a, [hProduct + 2]
	ld c, a
	ldh a, [hProduct + 3]
	ld d, a
	ld hl, wTempMonExp + 2
	ld a, [hld]
	sub d
	ld a, [hld]
	sbc c
	ld a, [hl]
	sbc b
	jr c, .AlreadyAtMaxExp
	ld a, b
	ld [hli], a
	ld a, c
	ld [hli], a
	ld a, d
	ld [hld], a

.AlreadyAtMaxExp:
	farcall CalcLevel
	ld a, d
	pop bc
	pop de
	ld d, a
	cp e
	jr nc, .LoopLevels
	ld a, e
	ld d, a

.LoopLevels:
	ld a, [wLevelCap]
	push bc
	ld b, a
	ld a, e
	cp b
	pop bc
	jr nc, .FinishExpBar
	cp d
	jr z, .FinishExpBar
	inc a
	ld [wTempMonLevel], a
	ld [wCurPartyLevel], a
	ld [wBattleMonLevel], a
	push de
	call .PlayExpBarSound
	ld c, $40
	call .LoopBarAnimation
	farcall PrintPlayerHUD
	ld hl, wBattleMonNickname
	ld de, wStringBuffer1
	ld bc, MON_NAME_LENGTH
	rst CopyBytes
	call TerminateExpBarSound
	ld de, SFX_HIT_END_OF_EXP_BAR
	call PlaySFX
	farcall AnimateEndOfExpBar
	call WaitSFX
	ld hl, BattleText_StringBuffer1GrewToLevel
	call StdBattleTextbox
	pop de
	inc e
	ld b, $0
	jr .LoopLevels

.FinishExpBar:
	push bc
	ld b, d
	ld de, wTempMonExp + 2
	call CalcExpBar
	ld a, b
	pop bc
	ld c, a
	call .PlayExpBarSound
	call .LoopBarAnimation
	call TerminateExpBarSound
	pop af
	ldh [hProduct + 2], a
	pop af
	ldh [hProduct + 3], a

.finish
	pop bc
	ret

.PlayExpBarSound:
	push bc
	call WaitSFX
	ld de, SFX_EXP_BAR
	call PlaySFX
	ld c, 10
	call DelayFrames
	pop bc
	ret

.LoopBarAnimation:
	ld d, 3
	dec b
.anim_loop
	inc b
	push bc
	push de
	hlcoord 17, 11
	call PlaceExpBar
	pop de
	ld a, $1
	ldh [hBGMapMode], a
	ld c, d
	call DelayFrames
	xor a
	ldh [hBGMapMode], a
	pop bc
	ld a, c
	cp b
	jr z, .end_animation
	inc b
	push bc
	push de
	hlcoord 17, 11
	call PlaceExpBar
	pop de
	ld a, $1
	ldh [hBGMapMode], a
	ld c, d
	call DelayFrames
	xor a
	ldh [hBGMapMode], a
	dec d
	jr nz, .min_number_of_frames
	ld d, 1
.min_number_of_frames
	pop bc
	ld a, c
	cp b
	jr nz, .anim_loop
.end_animation
	ld a, $1
	ldh [hBGMapMode], a
	ret

FillInExpBar:
	push hl
	call CalcExpBar
	pop hl
	ld de, 7
	add hl, de
	jr PlaceExpBar

CalcExpBar:
; Calculate the percent exp between this level and the next
; Level in b
	push de
	ld d, b
	push de
	farcall CalcExpAtLevel
	pop de
; exp at current level gets pushed to the stack
	ld hl, hMultiplicand
	ld a, [hli]
	push af
	ld a, [hli]
	push af
	ld a, [hl]
	push af
; next level
	inc d
	farcall CalcExpAtLevel
; back up the next level exp, and subtract the two levels
	ld hl, hMultiplicand + 2
	ld a, [hl]
	ldh [hMathBuffer + 2], a
	pop bc
	sub b
	ld [hld], a
	ld a, [hl]
	ldh [hMathBuffer + 1], a
	pop bc
	sbc b
	ld [hld], a
	ld a, [hl]
	ldh [hMathBuffer], a
	pop bc
	sbc b
	ld [hl], a
	pop de

	ld hl, hMultiplicand + 1
	ld a, [hli]
	push af
	ld a, [hl]
	push af

; get the amount of exp remaining to the next level
	ld a, [de]
	dec de
	ld c, a
	ldh a, [hMathBuffer + 2]
	sub c
	ld [hld], a
	ld a, [de]
	dec de
	ld b, a
	ldh a, [hMathBuffer + 1]
	sbc b
	ld [hld], a
	ld a, [de]
	ld c, a
	ldh a, [hMathBuffer]
	sbc c
	ld [hld], a
	xor a
	ld [hl], a
	ld a, 64
	ldh [hMultiplier], a
	call Multiply
	pop af
	ld c, a
	pop af
	ld b, a
.loop
	ld a, b
	and a
	jr z, .done
	srl b
	rr c
	ld hl, hProduct
	srl [hl]
	inc hl
	rr [hl]
	inc hl
	rr [hl]
	inc hl
	rr [hl]
	jr .loop

.done
	ld a, c
	ldh [hDivisor], a
	ld b, 4
	call Divide
	ldh a, [hQuotient + 3]
	cpl
	add $40 + 1
	ld b, a
	ret

PlaceExpBar:
	ld c, $8 ; number of tiles
.loop1
	ld a, b
	sub $8
	jr c, .next
	ld b, a
	ld a, $6a ; full bar
	ld [hld], a
	dec c
	ret z
	jr .loop1

.next
	add $8
	jr z, .loop2
	add $54 ; tile to the left of small exp bar tile
	jr .skip

.loop2
	ld a, $62 ; empty bar

.skip
	ld [hld], a
	ld a, $62 ; empty bar
	dec c
	jr nz, .loop2
	ret

ShowLinkBattleParticipantsAfterEnd:
	ld a, [wCurOTMon]
	ld hl, wOTPartyMon1Status
	call GetPartyLocation
	ld a, [wEnemyMonStatus]
	ld [hl], a
	call ClearTilemap
	farjp _ShowLinkBattleParticipants

DisplayLinkBattleResult:
	ld a, [wBattleResult]
	and $f
	cp LOSE
	jr c, .win ; WIN
	jr z, .lose ; LOSE
	; DRAW
	ld de, .Draw
	jr .store_result

.win
	ld de, .YouWin
	jr .store_result

.lose
	ld de, .YouLose
.store_result
	hlcoord 6, 8
	rst PlaceString
	ld c, 200
	call DelayFrames

	ld a, BANK(sLinkBattleStats)
	call OpenSRAM

	call AddLastLinkBattleToLinkRecord
	call ReadAndPrintLinkBattleRecord

	call CloseSRAM

	call WaitPressAorB_BlinkCursor
	jmp ClearTilemap

.YouWin:
	db "YOU WIN@"
.YouLose:
	db "YOU LOSE@"
.Draw:
	db "  DRAW@"

_DisplayLinkRecord:
	ld a, BANK(sLinkBattleStats)
	call OpenSRAM

	call ReadAndPrintLinkBattleRecord

	call CloseSRAM
	hlcoord 0, 0, wAttrmap
	xor a
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	rst ByteFill
	call WaitBGMap2
	ld b, SCGB_DIPLOMA
	call GetSGBLayout
	call SetDefaultBGPAndOBP
	ld c, 8
	call DelayFrames
	jmp WaitPressAorB_BlinkCursor

ReadAndPrintLinkBattleRecord:
	call ClearTilemap
	call ClearSprites
	call .PrintBattleRecord
	hlcoord 0, 8
	ld b, NUM_LINK_BATTLE_RECORDS
	ld de, sLinkBattleRecord1Name
.loop
	push bc
	push hl
	push de
	ld a, [de]
	and a
	jr z, .PrintFormatString
	ld a, [wSavedAtLeastOnce]
	and a
	jr z, .PrintFormatString
	push hl
	push hl
	ld h, d
	ld l, e
	ld de, wLinkBattleRecordName
	ld bc, NAME_LENGTH - 1
	rst CopyBytes
	ld a, "@"
	ld [de], a
	inc de ; wLinkBattleRecordWins
	ld bc, 6
	rst CopyBytes
	ld de, wLinkBattleRecordName
	pop hl
	rst PlaceString
	pop hl
	ld de, 26
	add hl, de
	push hl
	ld de, wLinkBattleRecordWins
	lb bc, 2, 4
	call PrintNum
	pop hl
	ld de, 5
	add hl, de
	push hl
	ld de, wLinkBattleRecordLosses
	lb bc, 2, 4
	call PrintNum
	pop hl
	ld de, 5
	add hl, de
	ld de, wLinkBattleRecordDraws
	lb bc, 2, 4
	call PrintNum
	jr .next

.PrintFormatString:
	ld de, .Format
	rst PlaceString
.next
	pop hl
	ld bc, LINK_BATTLE_RECORD_LENGTH
	add hl, bc
	ld d, h
	ld e, l
	pop hl
	ld bc, 2 * SCREEN_WIDTH
	add hl, bc
	pop bc
	dec b
	jr nz, .loop
	ret

.PrintBattleRecord:
	hlcoord 1, 0
	ld de, .Record
	rst PlaceString

	hlcoord 0, 6
	ld de, .Result
	rst PlaceString

	hlcoord 0, 2
	ld de, .Total
	rst PlaceString

	hlcoord 6, 4
	ld de, sLinkBattleWins
	call .PrintZerosIfNoSaveFileExists
	ret c

	lb bc, 2, 4
	call PrintNum

	hlcoord 11, 4
	ld de, sLinkBattleLosses
	call .PrintZerosIfNoSaveFileExists

	lb bc, 2, 4
	call PrintNum

	hlcoord 16, 4
	ld de, sLinkBattleDraws
	call .PrintZerosIfNoSaveFileExists

	lb bc, 2, 4
	jmp PrintNum

.PrintZerosIfNoSaveFileExists:
	ld a, [wSavedAtLeastOnce]
	and a
	ret nz
	ld de, .Scores
	rst PlaceString
	scf
	ret

.Scores:
	db "   0    0    0@"

.Format:
	db "  ---  <LF>"
	db "         -    -    -@"
.Record:
	db "<PLAYER>'s RECORD@"
.Result:
	db "RESULT WIN LOSE DRAW@"
.Total:
	db "TOTAL  WIN LOSE DRAW@"

AddLastLinkBattleToLinkRecord:
	ld hl, wOTPlayerID
	ld de, wStringBuffer1
	ld bc, 2
	rst CopyBytes
	ld hl, wOTPlayerName
	ld bc, NAME_LENGTH - 1
	rst CopyBytes
	ld hl, sLinkBattleStats - (LINK_BATTLE_RECORD_LENGTH - 6)
	call .StoreResult
	ld hl, sLinkBattleRecord
	ld d, NUM_LINK_BATTLE_RECORDS
.loop
	push hl
	inc hl
	inc hl
	ld a, [hld]
	dec hl
	and a
	jr z, .copy
	push de
	ld bc, LINK_BATTLE_RECORD_LENGTH - 6
	ld de, wStringBuffer1
	call CompareBytesLong
	pop de
	pop hl
	jr c, .done
	ld bc, LINK_BATTLE_RECORD_LENGTH
	add hl, bc
	dec d
	jr nz, .loop
	ld bc, -LINK_BATTLE_RECORD_LENGTH
	add hl, bc
	push hl

.copy
	ld d, h
	ld e, l
	ld hl, wStringBuffer1
	ld bc, LINK_BATTLE_RECORD_LENGTH - 6
	rst CopyBytes
	ld b, 6
	xor a
.loop2
	ld [de], a
	inc de
	dec b
	jr nz, .loop2
	pop hl

.done
	call .StoreResult
	jr .FindOpponentAndAppendRecord

.StoreResult:
	ld a, [wBattleResult]
	and $f
	cp LOSE
	ld bc, (sLinkBattleRecord1Wins - sLinkBattleRecord1) + 1
	jr c, .okay ; WIN
	ld bc, (sLinkBattleRecord1Losses - sLinkBattleRecord1) + 1
	jr z, .okay ; LOSE
	; DRAW
	ld bc, (sLinkBattleRecord1Draws - sLinkBattleRecord1) + 1
.okay
	add hl, bc
	call .CheckOverflow
	ret nc
	inc [hl]
	ret nz
	dec hl
	inc [hl]
	ret

.CheckOverflow:
	dec hl
	ld a, [hli]
	cp HIGH(MAX_LINK_RECORD)
	ret c
	ld a, [hl]
	cp LOW(MAX_LINK_RECORD)
	ret

.FindOpponentAndAppendRecord:
	ld b, NUM_LINK_BATTLE_RECORDS
	ld hl, sLinkBattleRecord1End - 1
	ld de, wLinkBattleRecordBuffer
.loop3
	push bc
	push de
	push hl
	call .LoadPointer
	pop hl
	ld a, e
	pop de
	ld [de], a
	inc de
	ld a, b
	ld [de], a
	inc de
	ld a, c
	ld [de], a
	inc de
	ld bc, LINK_BATTLE_RECORD_LENGTH
	add hl, bc
	pop bc
	dec b
	jr nz, .loop3
	lb bc, $0, $1
.loop4
	ld a, b
	add b
	add b
	ld e, a
	ld d, 0
	ld hl, wLinkBattleRecordBuffer
	add hl, de
	push hl
	ld a, c
	add c
	add c
	ld e, a
	ld d, 0
	ld hl, wLinkBattleRecordBuffer
	add hl, de
	ld d, h
	ld e, l
	pop hl
	push bc
	ld c, 3
	call CompareBytes
	pop bc
	jr z, .equal
	jr nc, .done2

.equal
	inc c
	ld a, c
	cp $5
	jr nz, .loop4
	inc b
	ld c, b
	inc c
	ld a, b
	cp $4
	jr nz, .loop4
	ret

.done2
	push bc
	ld a, b
	ld bc, LINK_BATTLE_RECORD_LENGTH
	ld hl, sLinkBattleRecord
	rst AddNTimes
	push hl
	ld de, wLinkBattleRecordBuffer
	ld bc, LINK_BATTLE_RECORD_LENGTH
	rst CopyBytes
	pop hl
	pop bc
	push hl
	ld a, c
	ld bc, LINK_BATTLE_RECORD_LENGTH
	ld hl, sLinkBattleRecord
	rst AddNTimes
	pop de
	push hl
	ld bc, LINK_BATTLE_RECORD_LENGTH
	rst CopyBytes
	ld hl, wLinkBattleRecordBuffer
	ld bc, LINK_BATTLE_RECORD_LENGTH
	pop de
	jmp CopyBytes

.LoadPointer:
	ld e, $0
	ld a, [hld]
	ld c, a
	ld a, [hld]
	ld b, a
	ld a, [hld]
	add c
	ld c, a
	ld a, [hld]
	adc b
	ld b, a
	jr nc, .okay2
	inc e

.okay2
	ld a, [hld]
	add c
	ld c, a
	ld a, [hl]
	adc b
	ld b, a
	ret nc
	inc e
	ret
