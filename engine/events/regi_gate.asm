RegiLeadType:
; wScriptVar = TRUE if the first party Pokémon (not an egg) has type
; [wScriptVar], else FALSE
	ld a, [wScriptVar]
	ld b, a
	xor a
	ld [wScriptVar], a
	ld a, [wPartyCount]
	and a
	ret z
	ld a, [wPartySpecies]
	cp EGG
	ret z
	ld [wCurSpecies], a
	push bc
	call GetBaseData
	pop bc
	ld a, [wBaseType1]
	cp b
	jr z, .yes
	ld a, [wBaseType2]
	cp b
	ret nz
.yes
	ld a, TRUE
	ld [wScriptVar], a
	ret

RegiPartyMoveType:
; wScriptVar = TRUE if a party Pokémon (not an egg) knows a move of type
; [wScriptVar], else FALSE
	ld a, [wScriptVar]
	ld c, a
	xor a
	ld [wScriptVar], a
	ld e, 0
.mon
	ld a, [wPartyCount]
	cp e
	ret z
	ld hl, wPartySpecies
	ld d, 0
	add hl, de
	ld a, [hl]
	cp EGG
	jr z, .next
	push bc
	ld hl, wPartyMon1Moves
	ld a, e
	ld bc, PARTYMON_STRUCT_LENGTH
	rst AddNTimes
	pop bc
	ld b, NUM_MOVES
.move
	ld a, [hli]
	and a
	jr z, .next
	push hl
	ld l, a
	ld a, MOVE_TYPE
	call GetMoveAttribute
	pop hl
	and TYPE_MASK
	cp c
	jr z, .yes
	dec b
	jr nz, .move
.next
	inc e
	jr .mon

.yes
	ld a, TRUE
	ld [wScriptVar], a
	ret
