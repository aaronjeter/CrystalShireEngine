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
