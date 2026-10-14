GetPlayerCharacter::
; Return the player's character (CHARACTER_*) in a.
; wPlayerCharacter holds CHARACTER_* + 1; 0 (saves from before characters
; existed) means Chris or Kris, by wPlayerGender.
	ld a, [wPlayerCharacter]
	and a
	jr z, .by_gender
	dec a
	ret

.by_gender
	ld a, [wPlayerGender]
	and 1 << PLAYERGENDER_FEMALE_F
	assert CHARACTER_CHRIS == 0 && CHARACTER_KRIS == 1 << PLAYERGENDER_FEMALE_F
	ret
