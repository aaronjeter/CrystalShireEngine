IsInJohto::
; Return 0 if the player is in Johto, and 1 in Kanto.

	ld a, [wMapGroup]
	ld b, a
	ld a, [wMapNumber]
	ld c, a
	call GetWorldMapLocation

	cp LANDMARK_FAST_SHIP
	jr z, .Johto

	cp LANDMARK_SPECIAL
	jr nz, .CheckRegion

	ld a, [wBackupMapGroup]
	ld b, a
	ld a, [wBackupMapNumber]
	ld c, a
	call GetWorldMapLocation

.CheckRegion:
	cp HOENN_LANDMARK
	jr nc, .Hoenn

	cp KANTO_LANDMARK
	jr nc, .Kanto

.Johto:
	ld a, JOHTO_REGION
	ret

.Kanto:
	ld a, KANTO_REGION
	ret

.Hoenn:
	ld a, HOENN_REGION
	ret
