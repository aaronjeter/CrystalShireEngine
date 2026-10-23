BattleCommand_HealBell:
	ld a, BATTLE_VARS_SUBSTATUS1
	call GetBattleVarAddr
	res SUBSTATUS_NIGHTMARE, [hl]
	ld de, wPartyMon1Status
	ldh a, [hBattleTurn]
	and a
	jr z, .got_status
	ld de, wOTPartyMon1Status
.got_status
	ld a, BATTLE_VARS_STATUS
	call GetBattleVarAddr
	xor a
	ld [hl], a
	ld h, d
	ld l, e
	ld bc, PARTYMON_STRUCT_LENGTH
	ld d, PARTY_LENGTH
.loop
	ld [hl], a
	add hl, bc
	dec d
	jr nz, .loop
	call AnimateCurrentMove

	ld hl, BellChimedText
	call StdBattleTextbox
	call .CalcStats

; Double battles: the partner's stored copy (its party struct was cured above)
	ld a, [wDoubleBattle]
	and a
	ret z
	farcall GetBattlerPartnerSlot
	ret nc
	farcall SwapInBattlerSlot
	push af
	ld a, BATTLE_VARS_SUBSTATUS1
	call GetBattleVarAddr
	res SUBSTATUS_NIGHTMARE, [hl]
	ld a, BATTLE_VARS_STATUS
	call GetBattleVarAddr
	ld [hl], 0
	call .CalcStats
	pop af
	farjp SwapInBattlerSlot

.CalcStats:
	ldh a, [hBattleTurn]
	and a
	jmp z, CalcPlayerStats
	jmp CalcEnemyStats
