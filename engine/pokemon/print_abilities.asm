INCLUDE "data/abilities/names.asm"
INCLUDE "data/abilities/descriptions.asm"

PrintAbility:
; Print the name and description of ability [wTempAbility].
	ld a, [wTempAbility]
	push af
	ld hl, AbilityNames
	call .GetPointer
	hlcoord 3, 11
	call PlaceString
	pop af
	ld hl, AbilityDescriptions
	call .GetPointer
	hlcoord 1, 14
	jmp PlaceString

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
