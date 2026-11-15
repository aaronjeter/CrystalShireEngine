ExpCandyGiveExp:
; Gives party mon wCurPartyMon the EXP of Exp. Candy wCurItem, up to the EXP of
; level wLevelCap. Expects its base data loaded and wCurPartyLevel = its level.
; Returns carry if it is already at the level cap. Otherwise: the amount in
; wStringBuffer2 (big endian), wTempLevel = the old level, the new level in
; MON_LEVEL and wCurPartyLevel, and a = the levels gained.
	ld a, [wLevelCap]
	ld b, a
	ld a, [wCurPartyLevel]
	cp b
	ccf
	ret c
	ld [wTempLevel], a

	ld a, [wCurItem]
	call GetItemIndexFromID
	ld de, -EXP_CANDY_S
	add hl, de
	add hl, hl
	ld de, ExpCandyAmounts
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, h
	ld [wStringBuffer2], a
	ld a, l
	ld [wStringBuffer2 + 1], a

; EXP += the amount (at most $ffffff)
	push hl
	ld a, MON_EXP + 2
	call GetPartyParamLocation
	pop de
	ld a, [hl]
	add e
	ld [hld], a
	ld a, [hl]
	adc d
	ld [hld], a
	jr nc, .no_overflow
	inc [hl]
	jr nz, .no_overflow
	ld a, $ff
	ld [hli], a
	ld [hli], a
	ld [hl], a
.no_overflow

; at most the EXP of level wLevelCap
	ld a, [wLevelCap]
	ld d, a
	farcall CalcExpAtLevel
	ld a, MON_EXP
	call GetPartyParamLocation
	inc hl
	inc hl
	ldh a, [hProduct + 3]
	ld e, a
	ld a, [hld]
	sub e
	ldh a, [hProduct + 2]
	ld e, a
	ld a, [hld]
	sbc e
	ldh a, [hProduct + 1]
	ld e, a
	ld a, [hl]
	sbc e
	jr c, .below_cap
	ldh a, [hProduct + 1]
	ld [hli], a
	ldh a, [hProduct + 2]
	ld [hli], a
	ldh a, [hProduct + 3]
	ld [hl], a
.below_cap

; the new level
	xor a ; PARTYMON
	ld [wMonType], a
	predef CopyMonToTempMon
	farcall CalcLevel
	ld a, MON_LEVEL
	call GetPartyParamLocation
	ld [hl], d
	ld a, d
	ld [wCurPartyLevel], a
	ld hl, wTempLevel
	sub [hl]
	and a
	ret

ExpCandyAmounts:
; indexed by item - EXP_CANDY_S
	dw 800   ; EXP_CANDY_S
	dw 3000  ; EXP_CANDY_M
	dw 10000 ; EXP_CANDY_L
	dw 30000 ; EXP_CANDY_XL

LearnMovesSinceTempLevel:
; Party mon wCurPartyMon learns the level-up moves of each level from
; wTempLevel + 1 to wCurPartyLevel.
	xor a ; PARTYMON
	ld [wMonType], a
	ld a, [wCurPartySpecies]
	ld [wTempSpecies], a
	ld a, [wCurPartyLevel]
	push af
	ld c, a
	ld a, [wTempLevel]
	ld b, a
.loop
	ld a, b
	cp c
	jr nc, .done
	inc b
	ld a, b
	ld [wCurPartyLevel], a
	push bc
	predef LearnLevelMoves
	pop bc
	jr .loop

.done
	pop af
	ld [wCurPartyLevel], a
	ret
