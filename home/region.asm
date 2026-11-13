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
	jr LandmarkToRegion

.Johto:
	ld a, JOHTO_REGION
	ret

LandmarkToRegion::
; a = landmark -> a = region
	cp LANDMARK_FAST_SHIP
	jr z, .johto
	cp JOHTO_EXTRA_LANDMARK
	jr nc, .johto
	cp HOENN_LANDMARK
	jr nc, .hoenn
	cp KANTO_LANDMARK
	jr nc, .kanto
.johto
	ld a, JOHTO_REGION
	ret

.kanto
	ld a, KANTO_REGION
	ret

.hoenn
	ld a, HOENN_REGION
	ret
