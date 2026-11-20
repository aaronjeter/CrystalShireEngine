CheckPokeMail::
; Lets the player pick a party Pokémon and hands it over if it matches the
; check data at b:de (dw species index, then the original trainer's name).
; Returns a POKEMAIL_* value in wScriptVar.
	push bc
	push de
	farcall SelectMonFromParty
	pop de
	pop bc
	ld a, POKEMAIL_REFUSED
	jr c, .return

	push de
	ld a, [wCurPartyMon]
	ld e, a
	ld d, 0
	ld hl, wPartySpecies
	add hl, de
	ld a, [hl]
	push bc
	call GetPokemonIndexFromID
	pop bc
	ld d, h
	ld e, l
	pop hl
	push hl
	ld a, b
	push de
	push bc
	call GetFarWord
	pop bc
	pop de
	ld a, h
	cp d
	jr nz, .wrong_pop
	ld a, l
	cp e
	jr nz, .wrong_pop

	ld a, [wCurPartyMon]
	ld hl, wPartyMonOTs
	push bc
	ld bc, NAME_LENGTH
	rst AddNTimes
	pop bc
	ld d, h
	ld e, l
	pop hl
	inc hl
	inc hl
.loop
	ld a, b
	call GetFarByte
	ld c, a
	ld a, [de]
	cp c
	jr nz, .wrong
	cp "@"
	jr z, .match
	inc hl
	inc de
	jr .loop

.match
	call CheckCurPartyMonFainted
	ld a, POKEMAIL_LAST_MON
	jr c, .return
	xor a ; REMOVE_PARTY
	ld [wPokemonWithdrawDepositParameter], a
	farcall RemoveMonFromParty
	ld a, POKEMAIL_CORRECT
	jr .return

.wrong_pop
	pop hl
.wrong
	ld a, POKEMAIL_NO_MAIL
.return
	ld [wScriptVar], a
	ret
