DEF MAX_DEFAULT_STATUS_MOVES EQU 2

TrainerLimitStatusMoves::
; For a trainer Pokemon whose party lists no moves: de = its moves, filled by
; FillMoves (the last NUM_MOVES level-up moves at wCurPartyLevel).
; While it has more than MAX_DEFAULT_STATUS_MOVES status moves, the earliest one in
; the list is replaced by the latest attacking move it learns by its level and
; doesn't know yet. Stops early if no such move is left. The PP are set after.
; wCurPartySpecies and wCurPartyLevel are set from the Pokemon's own struct.
	ld hl, MON_SPECIES - MON_MOVES
	add hl, de
	ld a, [hl]
	ld [wCurPartySpecies], a
	ld hl, MON_LEVEL - MON_MOVES
	add hl, de
	ld a, [hl]
	ld [wCurPartyLevel], a
.loop
	push de
	call .CountStatus ; b = status moves, hl = the first one's slot
	pop de
	ld a, b
	cp MAX_DEFAULT_STATUS_MOVES + 1
	jr c, .set_pp
	push hl
	call .LatestAttack ; a = move ID, or 0
	pop hl
	and a
	jr z, .set_pp
	ld [hl], a
	jr .loop

.set_pp
; de = the moves; the PP are MON_PP - MON_MOVES after them
	ld h, d
	ld l, e
	ld bc, MON_PP - MON_MOVES
	add hl, bc
	ld b, NUM_MOVES
.pp_loop
	ld a, [de]
	inc de
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
	ld [hli], a
	dec b
	jr nz, .pp_loop
	ret

.CountStatus:
; in: de = moves. out: b = how many are status moves, hl = the first one's slot
	ld hl, 0
	ld b, 0
	ld c, NUM_MOVES
.count_loop
	ld a, [de]
	and a
	jr z, .count_next
	push hl
	push bc
	call GetMoveIndexFromID
	call .IsStatusIndex
	pop bc
	pop hl
	jr nz, .count_next
	inc b
	ld a, h
	or l
	jr nz, .count_next
	ld h, d
	ld l, e
.count_next
	inc de
	dec c
	jr nz, .count_loop
	ret

.IsStatusIndex:
; in: hl = move index. out: z if it's a status move; de preserved
	push de
	ld b, h
	ld c, l
	ld hl, Moves
	ld a, BANK(Moves)
	call LoadIndirectPointer
	ld bc, MOVE_TYPE - 1 ; the table has no animation byte
	add hl, bc
	call GetFarByte
	pop de
	and STATUS
	cp STATUS
	ret

.LatestAttack:
; in: de = moves. out: a = the ID of the latest attacking level-up move by
; wCurPartyLevel that isn't in the moves, or 0. de preserved
	push de
	ld a, [wCurPartySpecies]
	call GetPokemonIndexFromID
	ld b, h
	ld c, l
	ld hl, EvosAttacksPointers
	ld a, BANK(EvosAttacksPointers)
	call LoadDoubleIndirectPointer
	ldh [hTemp], a
	call .SkipEvolutions
	pop de
	push de
	ld bc, 0 ; the best move's index so far
.scan
	ldh a, [hTemp]
	call GetFarByte
	inc hl
	and a
	jr z, .scanned
	push hl
	ld hl, wCurPartyLevel
	cp [hl]
	pop hl
	jr z, .in_level
	jr nc, .scanned
.in_level
	push bc
	push hl
	ldh a, [hTemp]
	call GetFarWord ; hl = the move's index
	push hl
	call .IsStatusIndex
	pop hl
	jr z, .skip_entry
	push hl
	call .KnowsIndex
	pop hl
	jr z, .skip_entry
	ld b, h ; the new best
	ld c, l
	pop hl
	add sp, 2 ; drop the old best
	jr .next_entry

.skip_entry
	pop hl
	pop bc
.next_entry
	inc hl
	inc hl
	jr .scan

.scanned
	pop de
	ld h, b
	ld l, c
	ld a, b
	or c
	ret z
	jmp GetMoveIDFromIndex

.SkipEvolutions:
; hTemp:hl = a species' evos and attacks; skips to the attacks (as SkipEvolutions,
; which is in another bank)
	ldh a, [hTemp]
	call GetFarByte
	inc hl
	and a
	ret z
	cp EVOLVE_LEVEL
	jr z, .one_byte_param
	cp EVOLVE_HAPPINESS
	jr z, .one_byte_param
	inc hl
.one_byte_param
	inc hl
	inc hl
	inc hl
	jr .SkipEvolutions

.KnowsIndex:
; in: hl = move index, de = moves. out: z if one of the moves has that index; de preserved
	push de
	ld c, NUM_MOVES
.knows_loop
	ld a, [de]
	inc de
	and a
	jr z, .knows_next
	push de
	push hl
	push bc
	call GetMoveIndexFromID ; hl = this slot's index
	ld d, h
	ld e, l
	pop bc
	pop hl
	ld a, d
	cp h
	jr nz, .knows_differ
	ld a, e
	cp l
	jr nz, .knows_differ
	pop de
	pop de
	xor a ; z
	ret

.knows_differ
	pop de
.knows_next
	dec c
	jr nz, .knows_loop
	pop de
	or 1 ; nz
	ret
