AddMobileMonToParty:
	ld hl, wPartyCount
	ld a, [hl]
	ld e, a
	inc [hl]

	ld hl, wMobileMonSpeciesPointer
	ld a, [hli]
	ld h, [hl]
	ld l, a
	inc hl
	ld bc, wPartySpecies
	ld d, e
.loop1
	inc bc
	dec d
	jr nz, .loop1
	ld a, e
	ld [wCurPartyMon], a
	ld a, [hl]
	ld [bc], a
	inc bc
	ld a, -1
	ld [bc], a

	ld hl, wPartyMon1Species
	ld bc, PARTYMON_STRUCT_LENGTH
	ld a, e
	ld [wMobileMonIndex], a
.loop2
	add hl, bc
	dec a
	and a
	jr nz, .loop2
	ld e, l
	ld d, h
	ld hl, wMobileMonStructPointer
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld bc, PARTYMON_STRUCT_LENGTH
	rst CopyBytes

	ld hl, wPartyMonOTs
	ld bc, NAME_LENGTH
	ld a, [wMobileMonIndex]
.loop3
	add hl, bc
	dec a
	and a
	jr nz, .loop3
	ld e, l
	ld d, h
	ld hl, wMobileMonOTPointer
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld bc, MON_NAME_LENGTH - 1
	rst CopyBytes
	ld a, "@"
	ld [de], a

	ld hl, wPartyMonNicknames
	ld bc, MON_NAME_LENGTH
	ld a, [wMobileMonIndex]
.loop4
	add hl, bc
	dec a
	and a
	jr nz, .loop4
	ld e, l
	ld d, h
	ld hl, wMobileMonNicknamePointer
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld bc, MON_NAME_LENGTH - 1
	rst CopyBytes
	ld a, "@"
	ld [de], a

	ld hl, sPartyMail
	ld bc, MAIL_STRUCT_LENGTH
	ld a, [wMobileMonIndex]
.loop5
	add hl, bc
	dec a
	and a
	jr nz, .loop5
	ld a, BANK(sPartyMail)
	call OpenSRAM
	ld e, l
	ld d, h
	ld hl, wMobileMonMailPointer
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld bc, MAIL_STRUCT_LENGTH
	rst CopyBytes

	jmp CloseSRAM
