BattleCommand_ConditionalBoost:
; Boost the damage if the move's condition holds.
; Acrobatics: x2 if the user holds no item.
; Knock Off: x1.5 if the target holds an item (one Knock Off hasn't removed).
; Facade: x2 if the user is burned, poisoned, paralyzed or frostbitten; x4 if burned
; without Guts, which undoes the burn's Attack halving (Gen 6+: Facade ignores it).
; Hex, Venoshock and Coup de Grace (the fallthrough): x2 if the target has any
; major status (sleep, poison, burn, freeze/frostbite, paralysis).
	ld a, BATTLE_VARS_MOVE
	call GetBattleVar
	ld bc, ACROBATICS
	call CompareMove
	jr z, .Acrobatics
	ld a, BATTLE_VARS_MOVE ; CompareMove clobbers a
	call GetBattleVar
	ld bc, KNOCK_OFF
	call CompareMove
	jr z, .KnockOff
	ld a, BATTLE_VARS_MOVE
	call GetBattleVar
	ld bc, FACADE
	call CompareMove
	jr z, .Facade

	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVar
	and a
	jp DoubleDamageIfNZ

.Acrobatics
	ld a, [wBattleMonItem]
	ld b, a
	ldh a, [hBattleTurn]
	and a
	jr z, .got_item
	ld a, [wEnemyMonItem]
	ld b, a
.got_item
	ld a, b
	and a
	ret nz
	jp DoubleDamage

.KnockOff
	ld a, [wEnemyMonItem]
	ld b, a
	ldh a, [hBattleTurn]
	and a
	jr z, .got_opp_item
	ld a, [wBattleMonItem]
	ld b, a
.got_opp_item
	ld a, b
	and a
	ret z
; wCurDamage += wCurDamage / 2, capped at $ffff
	ld hl, wCurDamage
	ld a, [hli]
	ld b, a
	ld c, [hl]
	srl b
	rr c
	ld a, [hl]
	add c
	ld [hld], a
	ld a, [hl]
	adc b
	ld [hl], a
	ret nc
	ld a, $ff
	ld [hli], a
	ld [hl], a
	ret

.Facade
	ld a, BATTLE_VARS_STATUS
	call GetBattleVar
	and (1 << PSN) | (1 << BRN) | (1 << FRZ) | (1 << PAR)
	ret z
	and 1 << BRN
	jp z, DoubleDamage
	ld a, BATTLE_VARS_ABILITY
	call GetBattleVar
	cp ABILITY_GUTS ; Guts already skipped the burn's Attack halving
	jp z, DoubleDamage
	call DoubleDamage
	jp DoubleDamage
