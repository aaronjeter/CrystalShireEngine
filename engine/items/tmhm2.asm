CanLearnTMHMMove:
; in: wCurPartySpecies, wPutativeTMHMMove (8-bit move ID)
; out: c = nonzero if the species can learn the TM/HM/tutor move: the TM is
; universal (UniversalTMs, unless the species is in NoTMSpecies), its TM bit
; is set, or the move is anywhere in its level-up learnset (any level).
; Moves that aren't TMs, HMs or tutor moves always give c = 0.
; de is preserved.
	ld a, [wCurPartySpecies]
	ld [wCurSpecies], a
	call GetBaseData
	ld hl, wBaseTMHM
	push hl

	ld a, [wPutativeTMHMMove]
	call GetMoveIndexFromID
	ld b, h
	ld c, l
	ld hl, TMHMMoves
.loop
	ld a, [hli]
	or [hl]
	jr z, .end
	dec hl
	ld a, [hli]
	cp c
	ld a, [hli]
	jr nz, .loop
	cp b
	jr nz, .loop

	ld a, l
	sub LOW(TMHMMoves + 2)
	rrca
	ld c, a
	ld hl, UniversalTMs
.universal_loop
	ld a, [hli]
	cp -1
	jr z, .not_universal
	cp c
	jr nz, .universal_loop
	call .IsNoTMSpecies
	jr c, .not_universal
	pop hl
	ld c, 1
	ret

.not_universal
	pop hl
	ld b, CHECK_FLAG
	push de
	ld d, 0
	predef SmallFarFlagAction
	pop de
	ld a, c
	and a
	ret nz
	; no TM bit: does the species learn the move by level-up?
	push de
	ld a, [wPutativeTMHMMove]
	call GetMoveIndexFromID
	ld d, h
	ld e, l
	ld a, [wCurPartySpecies]
	call GetPokemonIndexFromID
	ld b, h
	ld c, l
	ld hl, EvosAttacksPointers
	ld a, BANK(EvosAttacksPointers)
	call LoadDoubleIndirectPointer
	call FarSkipEvolutions
.learnset_loop
	ld a, b
	call GetFarByte ; level, 0 = end
	inc hl
	and a
	jr z, .not_in_learnset
	push hl
	ld a, b
	call GetFarWord ; move index
	ld a, l
	cp e
	ld a, h
	pop hl
	inc hl
	inc hl
	jr nz, .learnset_loop
	cp d
	jr nz, .learnset_loop
	pop de
	ld c, 1
	ret

.not_in_learnset
	pop de
	ld c, 0
	ret

.end
	pop hl
	ld c, 0
	ret

.IsNoTMSpecies:
; carry if wCurPartySpecies is in NoTMSpecies; preserves bc and de
	push de
	push bc
	ld a, [wCurPartySpecies]
	call GetPokemonIndexFromID
	ld b, h
	ld c, l
	ld hl, NoTMSpecies
.no_tm_loop
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	and e
	inc a
	jr z, .no_tm_done ; -1 = end (no carry)
	ld a, e
	cp c
	jr nz, .no_tm_loop
	ld a, d
	cp b
	jr nz, .no_tm_loop
	scf
.no_tm_done
	pop bc
	pop de
	ret

UniversalTMs:
; TMs/HMs/tutor moves every species can learn, except those in NoTMSpecies.
; They don't need to be in the species' tmhm lists.
	db TOXIC_TMNUM - 1
	db PROTECT_TMNUM - 1
	db REST_TMNUM - 1
	db SLEEP_TALK_TMNUM - 1
	db HIDDEN_POWER_TMNUM - 1
	db RETURN_TMNUM - 1
	db ATTRACT_TMNUM - 1
	db SUBSTITUTE_TMNUM - 1
	db FACADE_TMNUM - 1
	db -1

NoTMSpecies:
; species that learn no universal TMs (only their own tmhm bits and level-up moves)
	dw CATERPIE
	dw METAPOD
	dw WEEDLE
	dw KAKUNA
	dw MAGIKARP
	dw DITTO
	dw SMEARGLE
	dw WOBBUFFET
	dw WYNAUT
	dw WURMPLE
	dw SILCOON
	dw CASCOON
	dw -1

GetTMHMMove:
	ld a, [wTempTMHM]
	dec a
	add a
	ld hl, TMHMMoves
	ld b, 0
	ld c, a
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call GetMoveIDFromIndex
	ld [wTempTMHM], a
	ret

INCLUDE "data/moves/tmhm_moves.asm"
