CountSetBits::
; Count the number of set bits in b bytes starting from hl.
; Return in a, c and [wNumSetBits].
	ld c, 0
.next
	ld a, [hli]
	ld e, a
	ld d, 8

.count
	srl e
	jr nc, .noCarry
	inc c
.noCarry

	dec d
	jr nz, .count

	dec b
	jr nz, .next

	ld a, c
	ld [wNumSetBits], a
	ret

CountSetBits16::
; Count the number of set bits in bc bytes starting from hl - assumes bc < $1000
; Returns in bc; hl points to the end of the buffer; clobbers everything else
; Assumes that CountSetBits will leave hl pointing to the end of the buffer
	swap b
	ld a, c
	swap a
	and $f
	or b
	ld d, a
	ld a, c
	jr z, .small_count
	ld bc, 0
	and $f
	jr z, .loop
	push de
	call .small_count
	pop de
.loop
	push bc
	push de
	ld b, $10
	call CountSetBits
	pop de
	pop bc
	add c
	ld c, a
	adc b
	sub c
	ld b, a
	dec d
	jr nz, .loop
	ret

.small_count
	ld b, a
	call CountSetBits
	ld b, 0
	ret

GetWeekday::
	ld a, [wCurDay]
.mod
	sub 7
	jr nc, .mod
	add 7
	ret

SetSeenAndCaughtMon::
	call GetPokemonFlagIndex
	push de
	call SetSeenMonIndex
	pop de
SetCaughtMonIndex::
	ld hl, wPokedexCaught
	jr SetPokedexStatusMonIndex

SetSeenMon::
	call GetPokemonFlagIndex
SetSeenMonIndex::
	ld hl, wPokedexSeen
SetPokedexStatusMonIndex:
	ld b, SET_FLAG
	jr FlagActionBaseOne

CheckCaughtMon::
	call GetPokemonFlagIndex
CheckCaughtMonIndex::
	ld hl, wPokedexCaught
	jr CheckPokedexStatusMonIndex

CheckSeenMon::
	call GetPokemonFlagIndex
CheckSeenMonIndex::
	ld hl, wPokedexSeen
CheckPokedexStatusMonIndex:
	ld b, CHECK_FLAG
FlagActionBaseOne:
	dec de
	jmp FlagActionInPlayerData2

CountDexFlags::
; The number of set bits in the bc bytes of dex flags at hl (wPokedexCaught or
; wPokedexSeen, WRAM bank 2): returns bc.
	ldh a, [rSVBK]
	push af
	ld a, BANK(wPokedexSeen)
	ldh [rSVBK], a
	ld de, 0
.byte_loop
	ld a, [hli]
	push bc
	ld b, 8
.bit_loop
	add a
	jr nc, .next_bit
	inc de
.next_bit
	dec b
	jr nz, .bit_loop
	pop bc
	dec bc
	ld a, b
	or c
	jr nz, .byte_loop
	pop af
	ldh [rSVBK], a
	ld b, d
	ld c, e
	ret

GetPokemonFlagIndex:
	call GetPokemonIndexFromID
	ld d, h
	ld e, l
	ret
