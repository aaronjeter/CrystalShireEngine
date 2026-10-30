; Held items added on Oct 30, 2026 (Flame Orb, Toxic Orb, Black Sludge, Life Orb, Eviolite,
; Wide Lens, Focus Sash) and the Poison Heal ability. Bank $7e ("Effect Commands 2").
; Calls into Battle Core / Effect Commands are farcall/farjp (far calls keep a, bc, de, hl
; and the flags).

HeldItemsUserHP:
; hl = the HP of the battler whose turn it is. Clobbers a.
	ld hl, wBattleMonHP
	ldh a, [hBattleTurn]
	and a
	ret z
	ld hl, wEnemyMonHP
	ret

HeldItemsUserAtFullHP:
; z if the battler whose turn it is has full HP. Clobbers a, bc, hl.
	call HeldItemsUserHP
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld c, a
	ld a, [hli]
	cp b
	ret nz
	ld a, [hl]
	cp c
	ret

HeldItemsUserTypes:
; hl = the types of the battler whose turn it is. Clobbers a.
	ld hl, wBattleMonType1
	ldh a, [hBattleTurn]
	and a
	ret z
	ld hl, wEnemyMonType1
	ret

HeldItemsUserIsPoisonType:
; z if the battler whose turn it is is Poison type. Clobbers a, hl.
	call HeldItemsUserTypes
	ld a, [hli]
	cp POISON
	ret z
	ld a, [hl]
	cp POISON
	ret

; ---- Flame Orb, Toxic Orb (end of turn, last)

StatusOrbEffect:
; The holder (the battler whose turn it is) is burned / badly poisoned if it has no status
; and its types and ability allow it. Safeguard doesn't stop it.
	farcall HasUserFainted
	ret z
	farcall GetUserItem
	ld a, b
	ld de, FIRE << 8 | FIRE
	ld b, 1 << BRN
	cp HELD_FLAME_ORB
	jr z, .got_orb
	cp HELD_TOXIC_ORB
	ret nz
	ld de, POISON << 8 | STEEL
	ld b, 1 << PSN
.got_orb
	ld a, [hl]
	ld [wNamedObjectIndex], a
	ld a, BATTLE_VARS_STATUS
	call GetBattleVar
	and a
	ret nz
; types
	call HeldItemsUserTypes
	ld a, [hli]
	cp d
	ret z
	cp e
	ret z
	ld a, [hl]
	cp d
	ret z
	cp e
	ret z
; abilities (Water Veil, Immunity)
	ld a, BATTLE_VARS_ABILITY
	call GetBattleVar
	ld c, a
	farcall AbilityBlocksStatus
	ret c

	push bc
	call GetItemName
	farcall BattleCommand_SwitchTurn ; the holder is now the opponent
	pop bc
	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVarAddr
	ld [hl], b
	push bc
	call UpdateOpponentInParty
	pop bc
	bit BRN, b
	jr z, .toxic
	farcall ApplyBrnEffectOnAttack ; halves the opponent's (the holder's) Attack
	ld de, ANIM_BRN
	ld hl, StatusOrbBurnText
	jr .show

.toxic
	ld a, BATTLE_VARS_SUBSTATUS5_OPP
	call GetBattleVarAddr
	set SUBSTATUS_TOXIC, [hl]
	ld hl, wEnemyToxicCount
	ldh a, [hBattleTurn]
	and a
	jr z, .got_count
	ld hl, wPlayerToxicCount
.got_count
	ld [hl], 0
	ld de, ANIM_PSN
	ld hl, StatusOrbToxicText

.show
	push hl
	farcall PlayOpponentBattleAnim
	call RefreshBattleHuds
	pop hl
	call StdBattleTextbox
	farjp BattleCommand_SwitchTurn

; ---- Black Sludge (end of turn, before the faint check)

BlackSludgeEffect:
; Poison types heal 1/8 of their max HP (this hack; mainline 1/16); others lose 1/8 (not
; with Magic Guard).
	farcall HasUserFainted
	ret z
	farcall GetUserItem
	ld a, b
	cp HELD_BLACK_SLUDGE
	ret nz
	ld a, [hl]
	ld [wNamedObjectIndex], a
	call GetItemName
	call HeldItemsUserIsPoisonType
	jr z, .heal
	farcall CheckMagicGuardUser
	ret c
	farcall GetEighthMaxHP
	farcall SubtractHPFromUser
	ld hl, HurtByHeldItemText
	jmp StdBattleTextbox

.heal
	call HeldItemsUserAtFullHP
	ret z
	farcall GetEighthMaxHP
	farcall SwitchTurnCore
	farcall RestoreHP
	ld hl, BattleText_TargetRecoveredWithItem
	call StdBattleTextbox
	farjp SwitchTurnCore

; ---- Poison Heal (ResidualDamage)

PoisonHealResidual:
; Carry if the battler whose turn it is has Poison Heal and is poisoned (normal or bad):
; it heals 1/8 of its max HP (if not at full HP) instead of taking poison damage.
	ld a, BATTLE_VARS_ABILITY
	call GetBattleVar
	cp ABILITY_POISON_HEAL
	jr nz, .no
	ld a, BATTLE_VARS_STATUS
	call GetBattleVar
	and 1 << PSN
	jr z, .no
	call .heal
	scf
	ret

.no
	and a
	ret

.heal
	call HeldItemsUserAtFullHP
	ret z
	ld a, BATTLE_VARS_ABILITY
	call GetBattleVar
	farcall GetAbilityName
	farcall GetEighthMaxHP
	farcall SwitchTurnCore
	farcall RestoreHP
	farcall SwitchTurnCore
	ld hl, PoisonHealText
	jmp StdBattleTextbox

; ---- Life Orb, Muscle Band, Wise Glasses, Expert Belt (damage)

HeldItemDamageBoost:
; BattleCommand_DamageCalc (so the AI's estimate too): Life Orb x1.3; Muscle Band x1.1 for
; physical moves, Wise Glasses x1.1 for special moves.
	farcall GetUserItem
	ld a, b
	ld bc, 13 << 8 | 10
	cp HELD_LIFE_ORB
	jr z, .multiply
	ld c, PHYSICAL
	cp HELD_MUSCLE_BAND
	jr z, .category
	ld c, SPECIAL
	cp HELD_WISE_GLASSES
	ret nz
.category
	ld a, BATTLE_VARS_MOVE_TYPE
	call GetBattleVar
	and c
	ret z
	ld bc, 11 << 8 | 10
.multiply
	farjp MultiplyCurDamage

ExpertBeltBoost:
; BattleCommand_Stab, after BattleCheckTypeMatchup: x1.2 for a super-effective hit.
	ld a, [wTypeMatchup]
	cp EFFECTIVE + 1
	ret c
	farcall GetUserItem
	ld a, b
	cp HELD_EXPERT_BELT
	ret nz
	ld bc, 12 << 8 | 10
	farjp MultiplyCurDamage

; ---- Life Orb recoil, Shell Bell (after the move)

ClearMoveHitNotes:
; EndUserDestinyBond, before each action.
	xor a
	ld [wLifeOrbHit], a
	ld [wShellBellDamage], a
	ld [wShellBellDamage + 1], a
	ret

MoveHitNote:
; BattleCommand_ApplyDamage, before the damage is applied: note that the user's move did
; damage (not when Sheer Force boosted it), and add it, capped by the target's HP, to the
; Shell Bell total. PostMoveHeldItems acts on both once the move is over. Preserves all
; registers.
	push hl
	push de
	push bc
	ld hl, wCurDamage
	ld a, [hli]
	ld d, a
	ld e, [hl]
	or e
	jr z, .done
	ld a, [wAttackMissed]
	and a
	jr nz, .done
	farcall SheerForceApplies
	jr c, .done
	ld a, TRUE
	ld [wLifeOrbHit], a
; de = min(damage, the target's HP)
	ld hl, wEnemyMonHP
	ldh a, [hBattleTurn]
	and a
	jr z, .got_hp
	ld hl, wBattleMonHP
.got_hp
	ld a, [hli]
	ld c, [hl]
	ld b, a
	ld a, c
	sub e
	ld a, b
	sbc d
	jr nc, .got_damage
	ld d, b
	ld e, c
.got_damage
	ld hl, wShellBellDamage + 1
	ld a, [hl]
	add e
	ld [hld], a
	ld a, [hl]
	adc d
	ld [hl], a
	jr nc, .done
	ld a, $ff
	ld [hli], a
	ld [hl], a
.done
	jmp PopBCDEHL

PostMoveHeldItems:
; After the user's move (singles: EndOpponentProtectEndureDestinyBond; doubles: after the
; spread passes), if the move did damage and the user is still standing:
; - Life Orb: it loses 1/10 of its max HP (at least 1), unless it has Magic Guard;
; - Shell Bell: it heals 1/8 of the damage done (at least 1).
; Preserves all registers.
	push hl
	push de
	push bc
	ld hl, wLifeOrbHit
	ld a, [hl]
	ld [hl], FALSE
	ld hl, wShellBellDamage
	ld d, [hl]
	ld [hl], 0
	inc hl
	ld e, [hl]
	ld [hl], 0
	and a
	jr z, .done
	farcall HasUserFainted
	jr z, .done
	push de
	farcall GetUserItem
	pop de
	ld a, [hl]
	ld [wNamedObjectIndex], a
	ld a, b
	cp HELD_SHELL_BELL
	jr z, .shell_bell
	cp HELD_LIFE_ORB
	jr nz, .done
	farcall CheckMagicGuardUser
	jr c, .done
	farcall GetMaxHP
	ld h, b
	ld l, c
	ld bc, 0
	ld de, -10
.divide
	add hl, de
	jr nc, .divided
	inc bc
	jr .divide
.divided
	ld a, b
	or c
	jr nz, .got_damage
	inc c
.got_damage
	farcall SubtractHPFromUser
	ld hl, LifeOrbRecoilText
	call StdBattleTextbox
.done
	jmp PopBCDEHL

.shell_bell
	push de
	call HeldItemsUserAtFullHP
	pop bc
	jr z, .done
	ld a, 3
.eighth
	srl b
	rr c
	dec a
	jr nz, .eighth
	ld a, b
	or c
	jr nz, .got_heal
	inc c
.got_heal
	call GetItemName
	farcall SwitchTurnCore
	farcall RestoreHP
	farcall SwitchTurnCore
	ld hl, ShellBellText
	call StdBattleTextbox
	jr .done

; ---- Rocky Helmet

RockyHelmetDamage:
; HandleRockyHelmet (BattleCommand_CheckFaint): the attacker (whose turn it is) hit the holder
; with a contact move: it loses 1/6 of its max HP (at least 1), unless it has Magic Guard.
	farcall GetOpponentItem
	ld a, b
	cp HELD_ROCKY_HELMET
	ret nz
	ld a, [hl]
	ld [wNamedObjectIndex], a
	farcall HasUserFainted
	ret z
	farcall CheckMagicGuardUser
	ret c
	call GetItemName
	farcall GetMaxHP
	ld h, b
	ld l, c
	ld bc, 0
	ld de, -6
.divide
	add hl, de
	jr nc, .divided
	inc bc
	jr .divide
.divided
	ld a, b
	or c
	jr nz, .got_damage
	inc c
.got_damage
	farcall SubtractHPFromUser
	ld hl, RockyHelmetText
	jmp StdBattleTextbox

; ---- Big Root

BigRootBoostUser:
; bc = HP the battler whose turn it is heals: x1.3 if it holds a Big Root. Preserves de, hl.
	push hl
	push bc
	farcall GetUserItem
	jr BigRootBoost

BigRootBoostOpponent:
; The same for hBattleTurn's opponent (Leech Seed's seeder). Preserves de, hl.
	push hl
	push bc
	farcall GetOpponentItem
BigRootBoost:
	ld a, b
	pop bc
	pop hl
	cp HELD_BIG_ROOT
	ret nz
; bc = bc * 13 / 10
	push hl
	push de
	ld h, b
	ld l, c
	ld d, b
	ld e, c
	add hl, hl ; x2
	add hl, de ; x3
	add hl, hl ; x6
	add hl, hl ; x12
	add hl, de ; x13
	ld bc, 0
	ld de, -10
.divide
	add hl, de
	jr nc, .divided
	inc bc
	jr .divide
.divided
	pop de
	pop hl
	ret

BigRootSapHealth:
; SapHealth (drain moves, Dream Eater, Strength Sap): the HP to heal is in hDividend
; (big-endian). Preserves all registers.
	push bc
	ldh a, [hDividend]
	ld b, a
	ldh a, [hDividend + 1]
	ld c, a
	call BigRootBoostUser
	ld a, b
	ldh [hDividend], a
	ld a, c
	ldh [hDividend + 1], a
	pop bc
	ret

; ---- Binding Band

BindingBandMark:
; _BattleCommand_TrapTarget, once the target is trapped: SUBSTATUS_BINDING_BAND tells
; HandleWrap whether the trapper holds a Binding Band. Preserves bc, de, hl.
	push hl
	push de
	push bc
	farcall GetUserItem
	ld a, b
	cp HELD_BINDING_BAND
	push af
	ld a, BATTLE_VARS_SUBSTATUS4_OPP
	call GetBattleVarAddr
	pop af
	res SUBSTATUS_BINDING_BAND, [hl]
	jr nz, .done
	set SUBSTATUS_BINDING_BAND, [hl]
.done
	jmp PopBCDEHL

BindingBandDamage:
; HandleWrap: bc = 1/16 of the trapped mon's max HP: 1/8 if its trapper held a Binding Band.
	push bc
	ld a, BATTLE_VARS_SUBSTATUS4
	call GetBattleVar
	pop bc
	bit SUBSTATUS_BINDING_BAND, a
	ret z
	sla c
	rl b
	ret

; ---- Macho Brace

MachoBraceSpeed:
; GetTurnOrderSpeed (turn order, Gyro Ball, Electro Ball): bc = the Speed of the battler
; whose turn it is: halved (at least 1) if it holds a Macho Brace. Preserves de, hl.
	push hl
	push bc
	farcall GetUserItem
	ld a, b
	pop bc
	pop hl
	cp HELD_MACHO_BRACE
	ret nz
	srl b
	rr c
	ld a, b
	or c
	ret nz
	inc c
	ret

; ---- Eviolite

EvioliteBoost:
; BattleCommand_DamageStats, after TruncateHL_BC and DittoMetalPowder: b = the attacker's
; stat, c = the defender's (the opponent's) Def or Sp.Def, both 8-bit. x1.5 if the defender
; holds an Eviolite and can evolve. Preserves de and hl.
	push hl
	push de
	push bc
	farcall GetOpponentItem
	ld a, b
	cp HELD_EVIOLITE
	jr nz, .no
	ldh a, [hBattleTurn]
	and a
	ld a, [wEnemyMonSpecies]
	jr z, .got_species
	ld a, [wBattleMonSpecies]
.got_species
	call EvioliteSpecies
	jr nc, .no
	pop bc
; as pokecrystal's Metal Powder: c = c * 1.5; on overflow, halve both (b too) instead
	ld a, c
	srl a
	add c
	ld c, a
	jr nc, .done
	srl b
	ld a, b
	and a
	jr nz, .halved
	inc b
.halved
	scf
	rr c
.done
	pop de
	pop hl
	ret

.no
	pop bc
	pop de
	pop hl
	ret

EvioliteSpecies:
; a = species ID. Carry if Eviolite works for it: it has an evolution, and none of its
; evolutions uses a mega stone (EvioliteMegaStones). Clobbers a, bc, de, hl.
	call GetPokemonIndexFromID
	ld b, h
	ld c, l
	ld hl, EvosAttacksPointers
	ld a, BANK(EvosAttacksPointers)
	call LoadDoubleIndirectPointer
	ld d, a
	ld e, FALSE ; an evolution found
.loop
	ld a, d
	call GetFarByte
	inc hl
	and a
	jr z, .end
	cp EVOLVE_ITEM
	jr z, .item
	ld e, TRUE
	cp EVOLVE_LEVEL
	jr z, .skip_3
	cp EVOLVE_HAPPINESS
	jr z, .skip_3
	inc hl ; EVOLVE_TRADE, EVOLVE_STAT: 4 more bytes
.skip_3
	inc hl
	inc hl
	inc hl
	jr .loop

.item
; db EVOLVE_ITEM, dw item, dw species
	ld a, d
	call GetFarByte
	inc hl
	ld c, a
	ld a, d
	call GetFarByte
	inc hl
	ld b, a
	inc hl
	inc hl
	push hl
	ld hl, EvioliteMegaStones
.stone_loop
	ld a, [hli]
	cp c
	ld a, [hli]
	jr nz, .not_this
	cp b
	jr z, .is_stone
.not_this
	cp HIGH(-1) ; the end of the list (no item index has $ff as its high byte)
	jr nz, .stone_loop
	pop hl
	ld e, TRUE
	jr .loop

.is_stone
; a mega-stone evolution: no Eviolite
	pop hl
	and a
	ret

.end
	ld a, e
	and a
	ret z
	scf
	ret

EvioliteMegaStones:
; A species with an evolution using one of these items gets no Eviolite boost.
	dw KANTOITE_X
	dw KANTOITE_Y
	dw JOHTOITE_X
	dw HOENNITE_X
	dw -1

; ---- Wide Lens

WideLensBoost:
; BattleCommand_CheckHit: b = the move's accuracy (out of 255). x1.1 (capped at 255) if the
; attacker holds a Wide Lens. Preserves c, de and hl.
	push hl
	push de
	push bc
	farcall GetUserItem
	ld a, b
	cp HELD_WIDE_LENS
	pop bc
	jr nz, .done
	ld a, b
	ld d, 0
.tenth
	sub 10
	jr c, .got_tenth
	inc d
	jr .tenth
.got_tenth
	ld a, b
	add d
	jr nc, .got_accuracy
	ld a, $ff
.got_accuracy
	ld b, a
.done
	pop de
	pop hl
	ret

; ---- Focus Sash

ConsumeFocusSash:
; BattleCommand_ApplyDamage, after "<TARGET> hung on with <ITEM>!": a Focus Sash is used up
; for the rest of the battle. Like Knock Off, only the battle copy is cleared (and the mon's
; wKnockedOffMons bit set), so the party struct keeps it and it's back after the battle.
	farcall GetOpponentItem
	ld a, b
	cp HELD_FOCUS_SASH
	ret nz
	ld [hl], NO_ITEM
	ldh a, [hBattleTurn]
	and a
	ld hl, wKnockedOffMons + 1
	ld a, [wCurOTMon]
	jr z, .got_side
	ld hl, wKnockedOffMons
	ld a, [wCurBattleMon]
.got_side
	call KnockedOffBit
	or [hl]
	ld [hl], a
	ret

; ---- Used items come back after the battle (berries, Oct 30, 2026)

SuppressOpponentItem:
; Like Knock Off: set the wKnockedOffMons bit of hBattleTurn's opponent, whose battle copy of
; its item the caller has cleared. The party struct keeps the item, so it's back after the
; battle; the bit keeps it away if the mon switches out and back in. Preserves bc, de, hl.
	ldh a, [hBattleTurn]
	xor 1
	jr SuppressItemOfSide

SuppressUserItem:
; The same for the battler whose turn it is. Preserves bc, de, hl.
	ldh a, [hBattleTurn]
SuppressItemOfSide:
; a = 0: the player's battler, 1: the enemy's.
	push hl
	and a
	ld hl, wKnockedOffMons
	ld a, [wCurBattleMon]
	jr z, .got_side
	ld hl, wKnockedOffMons + 1
	ld a, [wCurOTMon]
.got_side
	call KnockedOffBit
	or [hl]
	ld [hl], a
	pop hl
	ret

; ---- Leppa Berry

LeppaRestoreAmount:
; HandleMysteryberry: a = the move ID, de = its PP byte (PP Ups in bits 6-7). b = the PP to
; restore: 10, or the move's max PP if lower (so 1 for Sketch). Preserves c, de and hl.
	push hl
	push de
	push bc
	ld l, a
	ld a, MOVE_PP
	call GetMoveAttribute
	ld d, a ; base PP
; each PP Up adds base / 5 (at most 7, as ComputeMaxPP)
	ld e, 0
.fifth
	sub 5
	jr c, .got_fifth
	inc e
	jr .fifth
.got_fifth
	ld a, e
	cp 8
	jr c, .fifth_ok
	ld e, 7
.fifth_ok
	pop bc
	pop hl ; the PP pointer
	push hl
	push bc
	ld a, [hl]
	rlca
	rlca
	and %11 ; PP Ups
	ld c, a
	ld a, d
	inc c
.pp_ups
	dec c
	jr z, .got_max
	add e
	jr .pp_ups
.got_max
	cp 10
	jr c, .got_amount
	ld a, 10
.got_amount
	pop bc
	ld b, a
	pop de
	pop hl
	ret
