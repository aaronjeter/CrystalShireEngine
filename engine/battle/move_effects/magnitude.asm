BattleCommand_GetMagnitude:
	; a later pass of the spread move keeps the first pass's magnitude
	call CheckSpreadLaterPass
	jr z, .roll
	ld a, [wDoublesSpreadPower]
	ld d, a
	ret

.roll
	push bc
	call BattleRandom
	ld b, a
	ld hl, MagnitudePower
.loop
	ld a, [hli]
	cp b
	jr nc, .ok
	inc hl
	inc hl
	jr .loop

.ok
	ld d, [hl]
	push de
	inc hl
	ld a, [hl]
	ld [wTextDecimalByte], a
	call BattleCommand_MoveDelay
	ld hl, MagnitudeText
	call StdBattleTextbox
	pop de
	ld a, d
	ld [wDoublesSpreadPower], a
	pop bc
	ret

INCLUDE "data/moves/magnitude_power.asm"
