; Ability lookups. See data/abilities/species_abilities.asm.

GetSpeciesAbility::
; in:  bc = species index (16-bit), a = ability slot (ABILITY_SLOT_*)
; out: a = ability ID. An empty or invalid slot gives ability 1.
; Preserves bc, de and hl.
	push hl
	push bc
	push de
	cp NUM_ABILITY_SLOTS
	jr c, .slot_ok
	xor a ; ABILITY_SLOT_1
.slot_ok
	ld e, a
	ld d, 0
	ld hl, SpeciesAbilities
	ld a, BANK(SpeciesAbilities)
	call LoadIndirectPointer
	jr z, .done ; a = 0 = NO_ABILITY for an out-of-range species
; The entries are in this bank, so read them directly.
	push hl
	add hl, de
	ld a, [hl]
	pop hl
	and a
	jr nz, .done
	ld a, [hl] ; empty slot: use ability 1
.done
	pop de
	pop bc
	pop hl
	ret

GetSpeciesIDAbility::
; in:  a = species ID (8-bit, as in battle structs)
; out: a = ability 1 of that species
; TODO (ability plan A2): use the Pokemon's own ability slot.
; Preserves bc, de and hl.
	and a
	ret z ; no Pokemon: NO_ABILITY
	push hl
	push bc
	call GetPokemonIndexFromID
	ld b, h
	ld c, l
	xor a ; ABILITY_SLOT_1
	call GetSpeciesAbility
	pop bc
	pop hl
	ret

SetBattleMonAbility::
; Set wBattleMonAbility from wBattleMonSpecies. Preserves bc, de and hl.
	ld a, [wBattleMonSpecies]
	call GetSpeciesIDAbility
	ld [wBattleMonAbility], a
	ret

SetEnemyMonAbility::
; Set wEnemyMonAbility from wEnemyMonSpecies. Preserves bc, de and hl.
	ld a, [wEnemyMonSpecies]
	call GetSpeciesIDAbility
	ld [wEnemyMonAbility], a
	ret

INCLUDE "data/abilities/species_abilities.asm"
