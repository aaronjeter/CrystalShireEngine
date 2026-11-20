LevelUpHappinessMod:
	ld a, [wCurPartyMon]
	ld hl, wPartyMon1CaughtLocation
	call GetPartyLocation
	ld d, [hl]
	ld a, [wMapGroup]
	ld b, a
	ld a, [wMapNumber]
	ld c, a
	call GetWorldMapLocation
	cp d
	ld c, HAPPINESS_GAINLEVEL
	jr nz, .ok
	ld c, HAPPINESS_GAINLEVELATHOME

.ok
	farjp ChangeHappiness
