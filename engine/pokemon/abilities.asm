; Ability lookups. See data/abilities/species_abilities.asm.

GetSpeciesAbility::
; in:  bc = species index (16-bit), a = ability slot (ABILITY_SLOT_*)
; out: a = ability ID
;      carry if the slot is empty (NO_ABILITY) or invalid, so ability 1 was used
; Preserves bc, de and hl.
	push hl
	push bc
	push de
	ld e, a
	ld d, 0
	ld hl, SpeciesAbilities
	ld a, BANK(SpeciesAbilities)
	call LoadIndirectPointer
	jr z, .done ; out-of-range species: a = 0 = NO_ABILITY, no carry
; The entries are in this bank, so read them directly.
	ld a, e
	cp NUM_ABILITY_SLOTS
	jr nc, .ability_1
	push hl
	add hl, de
	ld a, [hl]
	pop hl
	and a
	jr nz, .done ; and a cleared the carry
.ability_1
	ld a, [hl]
	scf
.done
	pop de
	pop bc
	pop hl
	ret

GetSpeciesIDAbility::
; in:  a = species ID (8-bit), b = ability slot (ABILITY_SLOT_*)
; out: a = ability ID, carry as GetSpeciesAbility
; Preserves bc, de and hl.
	and a
	ret z ; no Pokemon: NO_ABILITY
	push hl
	push bc
	push bc
	call GetPokemonIndexFromID
	pop bc
	ld a, b
	ld b, h
	ld c, l
	call GetSpeciesAbility
	pop bc
	pop hl
	ret

GetMonAbilitySlot::
; in:  hl = box_struct or party_struct
; out: a = its ability slot (ABILITY_SLOT_*; 3 is possible and means ability 1)
; Preserves bc, de and hl.
	push hl
	push bc
	ld bc, MON_ABILITY_SLOT
	add hl, bc
	ld a, [hl]
	and ABILITY_SLOT_MASK
	pop bc
	pop hl
	ret

SetMonAbilitySlot::
; in:  hl = box_struct or party_struct, a = ABILITY_SLOT_*
; Leaves the other bits of the byte alone. Preserves bc, de and hl.
	push hl
	push bc
	and ABILITY_SLOT_MASK
	ld c, a
	push bc
	ld bc, MON_ABILITY_SLOT
	add hl, bc
	pop bc
	ld a, [hl]
	and ~ABILITY_SLOT_MASK
	or c
	ld [hl], a
	pop bc
	pop hl
	ret

GetMonAbility::
; in:  hl = box_struct or party_struct
; out: a = the Pokemon's ability (species + slot), carry as GetSpeciesAbility
; Preserves bc, de and hl.
	push bc
	call GetMonAbilitySlot
	ld b, a
	ld a, [hl] ; species
	call GetSpeciesIDAbility
	pop bc
	ret

RollAbilitySlot::
; Pick the ability slot for a newly created Pokemon of species a (8-bit ID):
; the setnextability slot if one is waiting (and clear it), otherwise
; ability 1 or 2 at random if the species has an ability 2, else ability 1.
; out: a = ABILITY_SLOT_*. Preserves bc, de and hl.
	assert ABILITY_SLOT_1 == 0 && ABILITY_SLOT_2 == 1
	push bc
	ld c, a
	ld a, [wAbilitySlotOverride]
	and a
	jr z, .roll
	dec a
	ld b, a
	xor a
	ld [wAbilitySlotOverride], a
	ld a, b
	jr .done

.roll
	ld a, c
	ld b, ABILITY_SLOT_2
	call GetSpeciesIDAbility
	ld a, ABILITY_SLOT_1
	jr c, .done ; no ability 2
	call Random
	and 1
.done
	pop bc
	ret

SetBattleMonAbility::
; Set wBattleMonAbility from wBattleMonSpecies and the ability slot of
; party mon wCurPartyMon (the one InitBattleMon copied).
; Preserves bc, de and hl.
	push hl
	push bc
	ld a, [wCurPartyMon]
	ld hl, wPartyMon1
	call GetPartyLocation
	call GetMonAbilitySlot
	ld b, a
	ld a, [wBattleMonSpecies]
	call GetSpeciesIDAbility
	ld [wBattleMonAbility], a
	pop bc
	pop hl
	ret

SetEnemyMonAbility::
; Called by LoadEnemyMon. Set wEnemyAbilitySlot, then wEnemyMonAbility.
; - Trainer and link battles: the slot from party struct wOTPartyMon[wCurPartyMon].
; - A wild Pokemon re-loaded in battle to catch it (SUBSTATUS_TRANSFORMED is
;   set then): keep the slot.
; - Otherwise (a new wild Pokemon, or a gift Pokemon going to the PC):
;   RollAbilitySlot.
; Preserves bc, de and hl.
	push hl
	push bc
	ld a, [wBattleMode]
	cp TRAINER_BATTLE
	jr z, .trainer
	and a
	jr z, .roll
	ld a, [wEnemySubStatus5]
	bit SUBSTATUS_TRANSFORMED, a
	jr nz, .got_slot
.roll
	ld a, [wEnemyMonSpecies]
	call RollAbilitySlot
	jr .set_slot

.trainer
	ld a, [wCurPartyMon]
	ld hl, wOTPartyMon1
	call GetPartyLocation
	call GetMonAbilitySlot
.set_slot
	ld [wEnemyAbilitySlot], a
.got_slot
	ld a, [wEnemyAbilitySlot]
	ld b, a
	ld a, [wEnemyMonSpecies]
	call GetSpeciesIDAbility
	ld [wEnemyMonAbility], a
	pop bc
	pop hl
	ret

INCLUDE "data/abilities/species_abilities.asm"
