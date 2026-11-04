INCLUDE "data/abilities/names.asm"
INCLUDE "data/abilities/descriptions.asm"

PrintAbility:
; Print the name (row 9) and description (rows 11-12) of ability [wTempAbility].
	ld a, [wTempAbility]
	push af
	ld hl, AbilityNames
	call .GetPointer
	hlcoord 3, 9
	call PlaceString
	pop af
	ld hl, AbilityDescriptions
	call .GetPointer
	hlcoord 1, 11
	call PlaceString
	; "next" skips a row: move the second line up from row 13 to row 12
	hlcoord 0, 13
	decoord 0, 12
	ld bc, SCREEN_WIDTH
	rst CopyBytes
	hlcoord 0, 13
	ld bc, SCREEN_WIDTH
	ld a, " "
	rst ByteFill
	ret

.GetPointer:
; de = entry a of the pointer table at hl
	ld e, a
	ld d, 0
	add hl, de
	add hl, de
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ret

GetAbilityName::
; Copy the name of ability a to wStringBuffer2.
; Preserves bc and de.
	push de
	push bc
	ld hl, AbilityNames
	call PrintAbility.GetPointer
	ld hl, wStringBuffer2
.loop
	ld a, [de]
	ld [hli], a
	inc de
	cp "@"
	jr nz, .loop
	pop bc
	pop de
	ret
