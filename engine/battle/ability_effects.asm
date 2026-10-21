; Battle ability effects that don't fit in the full Effect Commands bank.

ContactStatusAbilityEffects:
; entries correspond to ABILITY_STATIC, ABILITY_FLAME_BODY,
; ABILITY_POISON_POINT and ABILITY_FRIGID,
; then Effect Spore's three entries (picked at random).
	assert ABILITY_FLAME_BODY == ABILITY_STATIC + 1
	assert ABILITY_POISON_POINT == ABILITY_STATIC + 2
	assert ABILITY_FRIGID == ABILITY_STATIC + 3
	assert ABILITY_EFFECT_SPORE == ABILITY_STATIC + 4
; status (SLP_MASK: sleep for 2-4 turns), immune type, immune type,
; animation, text
	db 1 << PAR, ELECTRIC, ELECTRIC
	dw ANIM_PAR, StaticParalyzedText
	db 1 << BRN, FIRE, FIRE
	dw ANIM_BRN, FlameBodyBurnedText
	db 1 << PSN, POISON, STEEL
	dw ANIM_PSN, PoisonPointPoisonedText
	db 1 << FRZ, ICE, ICE
	dw ANIM_FRZ, FrigidFrostbiteText
.EffectSpore:
	db 1 << PSN, POISON, STEEL
	dw ANIM_PSN, EffectSporePoisonedText
	db 1 << PAR, ELECTRIC, ELECTRIC
	dw ANIM_PAR, EffectSporeParalyzedText
	db SLP_MASK, -1, -1
	dw ANIM_SLP, EffectSporeSleepText
DEF CONTACT_ABILITY_ENTRY_SIZE EQU 7
DEF EFFECT_SPORE_ENTRY EQU ABILITY_EFFECT_SPORE - ABILITY_STATIC

_HandleContactStatusAbilities:
; The attacker made contact with a contact status ability holder
; (see HandleContactStatusAbilities, which already checked the rest).
; in: c = holder's ability - ABILITY_STATIC
	ld a, c
	cp EFFECT_SPORE_ENTRY
	jr nz, .got_entry

; Effect Spore: Grass types are immune. 30% chance, then an even pick of
; poison, paralysis or sleep.
	ld bc, GRASS << 8 | GRASS
	call .CheckAttackerType
	ret z
	call BattleRandom
	cp 30 percent
	ret nc
.pick
	call BattleRandom
	and %11
	cp 3
	jr z, .pick
	add EFFECT_SPORE_ENTRY
	jr .roll_done

.got_entry
	push af
	call BattleRandom
	cp 30 percent
	jr nc, .pop_fail ; failed the roll
	pop af

.roll_done
; hl = ContactStatusAbilityEffects + a * CONTACT_ABILITY_ENTRY_SIZE
	ld hl, ContactStatusAbilityEffects
	ld bc, CONTACT_ABILITY_ENTRY_SIZE
	rst AddNTimes

; Type immunity: the attacker can't have either immune type.
	push hl
	inc hl
	ld a, [hli]
	ld c, a
	ld b, [hl]
	call .CheckAttackerType
	pop hl
	ret z

; Ability immunity: Limber, Insomnia, Immunity, Water Veil, Magma Armor.
	ld b, [hl]
	ld a, BATTLE_VARS_ABILITY
	call GetBattleVar
	ld c, a
	push hl
	farcall AbilityBlocksStatus
	pop hl
	ret c

; Inflict the status. Switch turns so the attacker is the "opponent";
; the existing status helpers all act on the opponent.
	call .SwitchTurn
	push hl
	ld a, [hl]
	cp SLP_MASK
	jr nz, .got_status
.sleep_turns
	call BattleRandom
	and %11
	jr z, .sleep_turns
	inc a ; 2-4 turns
.got_status
	ld b, a
	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVarAddr
	ld [hl], b
	call UpdateOpponentInParty
	farcall ApplyPrzEffectOnSpeed
	farcall ApplyBrnEffectOnAttack
	farcall ApplyFrbEffectOnSpclAttack
	pop hl

	inc hl
	inc hl
	inc hl
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	push hl
; PlayOpponentBattleAnim clears wNumHits, which multi-hit moves still need.
	ld a, [wNumHits]
	push af
	farcall PlayOpponentBattleAnim
	pop af
	ld [wNumHits], a
	call RefreshBattleHuds
	pop hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call StdBattleTextbox
	farcall UseHeldStatusHealingItem
	; fallthrough

.SwitchTurn:
	ldh a, [hBattleTurn]
	xor 1
	ldh [hBattleTurn], a
	ret

.pop_fail
	pop af
	ret

.CheckAttackerType:
; Return z if the attacker (the current turn's Pokemon) has type b or c.
	ld hl, wBattleMonType1
	ldh a, [hBattleTurn]
	and a
	jr z, .got_types
	ld hl, wEnemyMonType1
.got_types
	ld a, [hli]
	cp c
	ret z
	cp b
	ret z
	ld a, [hl]
	cp c
	ret z
	cp b
	ret
