; Scaled trainer parties (party option SCALED; engine/battle/read_trainer_party.asm):
; each Pokemon evolves along ScaledTrainerEvolutions as far as its level allows.

ScaledTrainerEvolve::
; de = a species index, evolved as far as wCurPartyLevel allows; where a species
; has several evolutions for the level, the trainer ID plus the party slot picks
; one. Carry if it evolved. Preserves hl.
	push hl
	push de
.evolve
	ld b, 0 ; evolutions for this level
	ld hl, ScaledTrainerEvolutions
.count
	call .AtEnd
	jr z, .counted
	call .Match
	jr nc, .count
	inc b
	jr .count

.counted
	ld a, b
	and a
	jr z, .done
	ld a, [wOtherTrainerID]
	ld c, a
	ld a, [wOTPartyCount]
	add c
.mod
	sub b
	jr nc, .mod
	add b
	ld b, a ; the evolution to take, 0 to count - 1
	ld hl, ScaledTrainerEvolutions
.find
	call .Match
	jr nc, .find
	ld a, b
	and a
	jr z, .take
	dec b
	jr .find

.take
	dec hl
	ld d, [hl]
	dec hl
	ld e, [hl]
	jr .evolve

.done
	pop bc ; the species before
	pop hl
	ld a, e
	cp c
	jr nz, .evolved
	ld a, d
	cp b
	jr nz, .evolved
	and a
	ret

.evolved
	scf
	ret

.AtEnd:
; z if hl is at the end of ScaledTrainerEvolutions
	ld a, l
	cp LOW(ScaledTrainerEvolutions.End)
	ret nz
	ld a, h
	cp HIGH(ScaledTrainerEvolutions.End)
	ret

.Match:
; hl = the next row (species, level, evolution); carry if it evolves de at
; wCurPartyLevel. hl is left past the row.
	ld a, [hli]
	cp e
	jr nz, .no_match_4
	ld a, [hli]
	cp d
	jr nz, .no_match_3
	ld a, [wCurPartyLevel]
	cp [hl]
	inc hl
	inc hl
	inc hl
	ccf
	ret

.no_match_4
	inc hl
.no_match_3
	inc hl
	inc hl
	inc hl
	and a
	ret

INCLUDE "data/trainers/scaled_evolutions.asm"
