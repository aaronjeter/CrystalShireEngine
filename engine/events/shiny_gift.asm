MakeLastPartyMonShiny:
; Give the last party Pokémon shiny DVs, then recalculate its stats at full HP.
	ld a, [wPartyCount]
	dec a
	ld [wCurPartyMon], a
	ld hl, wPartyMon1DVs
	ld bc, PARTYMON_STRUCT_LENGTH
	rst AddNTimes
	ld a, ATKDEFDV_SHINY
	ld [hli], a
	ld [hl], SPDSPCDV_SHINY
	ld a, MON_LEVEL
	call GetPartyParamLocation
	ld a, [hl]
	ld [wCurPartyLevel], a
	farjp ComputeNPCTrademonStats
