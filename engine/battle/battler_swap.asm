; Battler slots for double battles.
;
; The battle engine only works on the live "player" and "enemy" variables. In a double battle,
; each of the four battlers (slots P1, P2, E1, E2) keeps its own copy of every per-battler
; variable in wBattlerSlots, and is copied in and out of the live variables of its side:
;   SaveBattlerSlot: live variables of slot a's side -> slot a
;   LoadBattlerSlot: slot a -> live variables of its side
;
; BattlerSwapList names every per-battler variable: its field in the slot (BSLOT_*, defined in
; constants/battle_constants.asm), size, player address, enemy address.
; A variable that only one side has uses 0 for the other side's address (its bytes in the
; slot stay unused). Every slot has the same layout, BATTLER_SLOT_SIZE bytes.
; Everything else in wBattle is shared: per-action and per-turn temporaries, side state
; (screens, Spikes, Safeguard), field state (weather), trainer and reward data.
; tools/claude_emu/battle_test.py (`check`) verifies that every wBattle byte is either listed
; here or named in its SHARED list, and that each pair's bytes match by name.

DEF BATTLER_SWAP_TOTAL = 0

MACRO swap_entry ; BSLOT_* field, size, player address, enemy address
	assert BATTLER_SWAP_TOTAL == \1, "BattlerSwapList: \1 is out of order or the size before it is wrong"
	db \2
	dw \3, \4
	DEF BATTLER_SWAP_TOTAL += \2
ENDM

MACRO swap_pair ; BSLOT_* field, player, enemy, size
	swap_entry \1, \4, \2, \3
ENDM

MACRO swap_player ; BSLOT_* field, player, size
	swap_entry \1, \3, \2, 0
ENDM

MACRO swap_enemy ; BSLOT_* field, enemy, size
	swap_entry \1, \3, 0, \2
ENDM

DEF BATTLER_SWAP_ENTRY_LENGTH EQU 5

BattlerSwapList:
	swap_pair BSLOT_MOVE_STRUCT,         wPlayerMoveStruct,        wEnemyMoveStruct,        MOVE_LENGTH
	swap_pair BSLOT_NICKNAME,            wBattleMonNickname,       wEnemyMonNickname,       MON_NAME_LENGTH
	swap_pair BSLOT_MON,                 wBattleMon,               wEnemyMon,               BATTLE_STRUCT_LENGTH
	swap_pair BSLOT_ABILITY,             wBattleMonAbility,        wEnemyMonAbility,        1
	swap_pair BSLOT_PARTY_INDEX,         wCurBattleMon,            wCurOTMon,               1
	swap_pair BSLOT_TEMP_SPECIES,        wTempBattleMonSpecies,    wTempEnemyMonSpecies,    1
	swap_pair BSLOT_SUBSTATUS,           wPlayerSubStatus1,        wEnemySubStatus1,        5
	swap_pair BSLOT_COUNTS,              wPlayerRolloutCount,      wEnemyRolloutCount,      8 ; through the Protect count
	swap_pair BSLOT_DAMAGE_TAKEN,        wPlayerDamageTaken,       wEnemyDamageTaken,       2
	swap_pair BSLOT_STATS,               wPlayerStats,             wEnemyStats,             NUM_BATTLE_STATS * 2 + 1 ; + padding
	swap_pair BSLOT_STAT_LEVELS,         wPlayerStatLevels,        wEnemyStatLevels,        NUM_LEVEL_STATS
	swap_pair BSLOT_TURNS_TAKEN,         wPlayerTurnsTaken,        wEnemyTurnsTaken,        1
	swap_pair BSLOT_SUBSTITUTE_HP,       wPlayerSubstituteHP,      wEnemySubstituteHP,      1
	swap_pair BSLOT_CUR_MOVE,            wCurPlayerMove,           wCurEnemyMove,           1
	swap_pair BSLOT_CUR_MOVE_NUM,        wCurMoveNum,              wCurEnemyMoveNum,        1
	swap_pair BSLOT_DISABLED_MOVE,       wDisabledMove,            wEnemyDisabledMove,      1
	swap_pair BSLOT_LAST_COUNTER_MOVE,   wLastPlayerCounterMove,   wLastEnemyCounterMove,   1
	swap_pair BSLOT_MINIMIZED,           wPlayerMinimized,         wEnemyMinimized,         1
	swap_pair BSLOT_IS_SWITCHING,        wPlayerIsSwitching,       wEnemyIsSwitching,       1
	swap_pair BSLOT_LAST_MOVE,           wLastPlayerMove,          wLastEnemyMove,          1
	swap_pair BSLOT_FUTURE_SIGHT_COUNT,  wPlayerFutureSightCount,  wEnemyFutureSightCount,  1
	swap_pair BSLOT_FUTURE_SIGHT_DAMAGE, wPlayerFutureSightDamage, wEnemyFutureSightDamage, 2
	swap_pair BSLOT_RAGE_COUNTER,        wPlayerRageCounter,       wEnemyRageCounter,       1
	swap_pair BSLOT_TRAPPING_MOVE,       wPlayerTrappingMove,      wEnemyTrappingMove,      1
	swap_pair BSLOT_WRAP_COUNT,          wPlayerWrapCount,         wEnemyWrapCount,         1
	swap_pair BSLOT_CHARGING,            wPlayerCharging,          wEnemyCharging,          1
	swap_pair BSLOT_JUST_GOT_FROZEN,     wPlayerJustGotFrozen,     wEnemyJustGotFrozen,     1
	swap_pair BSLOT_LINKS,               wPlayerBattlerLinks,      wEnemyBattlerLinks,      NUM_BATTLER_LINKS
	swap_pair BSLOT_LAST_DAMAGE,         wPlayerLastDamage,        wEnemyLastDamage,        2
	swap_pair BSLOT_FUTURE_SIGHT_TARGET, wPlayerFutureSightTarget, wEnemyFutureSightTarget, 1
	swap_player BSLOT_USED_MOVES,          wPlayerUsedMoves, NUM_MOVES ; what the AI has seen this battler use
	swap_player BSLOT_LAST_PLAYER_MON,     wLastPlayerMon, 1
	swap_enemy BSLOT_BASE_STATS,          wEnemyMonBaseStats, NUM_EXP_STATS + 2 ; base stats, catch rate, base EXP
	swap_enemy BSLOT_ABILITY_SLOT,        wEnemyAbilitySlot, 1
	swap_enemy BSLOT_BACKUP_DVS,          wEnemyBackupDVs, 2 ; while transformed
	swap_enemy BSLOT_AI_SWITCH,           wEnemyAISwitchScore, 3 ; switch score, param, index
	swap_enemy BSLOT_BACKUP_BASE_STATS,   wBackupEnemyMonBaseStats, NUM_EXP_STATS + 2
	swap_enemy BSLOT_PARTICIPANTS,        wBattleParticipantsNotFainted, 1 ; the player's mons this battler has faced
	swap_enemy BSLOT_PARTICIPANTS_ALL,    wBattleParticipantsIncludingFainted, 1
	swap_enemy BSLOT_HP_AT_PLAYER_SWITCH, wEnemyHPAtTimeOfPlayerSwitch, 2
	swap_enemy BSLOT_AI_ITEM_STATE,       wEnemyItemState, 1 ; trainer AI item use for this battler
	db 0 ; end

	assert BATTLER_SWAP_TOTAL == BATTLER_SLOT_SIZE, \
		"BATTLER_SLOT_SIZE (constants/battle_constants.asm) must be {d:BATTLER_SWAP_TOTAL}"
	assert wBattleMonStructEnd - wBattleMon == BATTLE_STRUCT_LENGTH
	assert wBattleMonHP - wBattleMon == BATTLEMON_HP
	assert wBattleMonType1 - wBattleMon == BATTLEMON_TYPE1
	assert wEnemyMonHP - wEnemyMon == BATTLEMON_HP
	assert wEnemyMonMoves - wEnemyMon == BATTLEMON_MOVES
	assert wEnemyMonStructEnd - wEnemyMon == BATTLE_STRUCT_LENGTH
	assert wEnemyMonEnd - wEnemyMonBaseStats == NUM_EXP_STATS + 2
	assert wBackupEnemyMonBaseExp + 1 - wBackupEnemyMonBaseStats == NUM_EXP_STATS + 2
	assert wPlayerProtectCount + 1 - wPlayerRolloutCount == 8
	assert wEnemyProtectCount + 1 - wEnemyRolloutCount == 8
	assert wEnemySwitchMonIndex + 1 - wEnemyAISwitchScore == 3

GetBattlerSlotAddress::
; hl = the address of field hl (BSLOT_*) of slot a, in WRAMX bank BANK(wBattlerSlots).
; Preserves bc and de.
	push de
	ld de, BATTLER_SLOT_SIZE
	and %11
	jr z, .got_slot
.loop
	add hl, de
	dec a
	jr nz, .loop
.got_slot
	ld de, wBattlerSlots
	add hl, de
	pop de
	ret

ReadBattlerSlotByte::
; a = field hl (BSLOT_*) of slot a. Preserves bc and de.
	call GetBattlerSlotAddress
	ldh a, [rSVBK]
	push af
	ld a, BANK(wBattlerSlots)
	ldh [rSVBK], a
	ld l, [hl]
	pop af
	ldh [rSVBK], a
	ld a, l
	ret

WriteBattlerSlotByte::
; Field hl (BSLOT_*) of slot a = e. Preserves bc and de.
	call GetBattlerSlotAddress
	ldh a, [rSVBK]
	push af
	ld a, BANK(wBattlerSlots)
	ldh [rSVBK], a
	ld [hl], e
	pop af
	ldh [rSVBK], a
	ret

CopyFromBattlerSlot::
; Copy c bytes of field hl (BSLOT_*) of slot a to de (any WRAM). Clobbers bc.
	call GetBattlerSlotAddress
	ldh a, [rSVBK]
	push af
.loop
	ld a, BANK(wBattlerSlots)
	ldh [rSVBK], a
	ld a, [hli]
	ld b, a
	pop af
	push af
	ldh [rSVBK], a
	ld a, b
	ld [de], a
	inc de
	dec c
	jr nz, .loop
	pop af
	ldh [rSVBK], a
	ret

BattlerSlotMask::
; a = 1 << slot a. Preserves bc, de and hl.
	push hl
	and %11
	add LOW(.masks)
	ld l, a
	adc HIGH(.masks)
	sub l
	ld h, a
	ld a, [hl]
	pop hl
	ret

.masks
	db 1 << BATTLER_SLOT_P1, 1 << BATTLER_SLOT_P2, 1 << BATTLER_SLOT_E1, 1 << BATTLER_SLOT_E2

SwapInBattlerSlot::
; Load slot a into its side's area (wAreaSlots), saving the battler that was loaded there.
; Returns a = the slot that was loaded before (a itself if it already was), so calling this
; again with that slot restores it. Clobbers bc, de and hl.
	ld c, a
	ld hl, wAreaSlots
	bit BATTLER_SLOT_ENEMY_F, c
	jr z, .got_area
	inc hl
.got_area
	ld a, [hl]
	cp c
	ret z
	ld [hl], c
	push af
	push bc
	call SaveBattlerSlot
	pop bc
	ld a, c
	call LoadBattlerSlot
	pop af
	ret

GetBattlerPartnerSlot::
; a = the other slot on the side of the battler loaded in hBattleTurn's area.
; Carry if a battler is in it (so it's stored, not loaded). Preserves de.
	ldh a, [hBattleTurn]
	ld c, a
	ld b, 0
	ld hl, wAreaSlots
	add hl, bc
	ld a, [hl]
	xor 1
	ld c, a
	call BattlerSlotMask
	ld hl, wEmptyBattlerSlots
	and [hl]
	ld a, c
	ret nz
	scf
	ret

SwapInPlayerPartyMon::
; a = party index. In a double battle, if that mon is out in the player's stored slot, load it
; into the player's area (the loaded battler is saved) and remember the swap for
; RestorePartyMonSwap. Code that edits a party mon and then updates the battle copy when
; it's wCurBattleMon then works for both of the player's battlers. One swap at a time.
; Preserves a, bc, de and hl.
	push bc
	push de
	push hl
	ld b, a
	ld a, [wDoubleBattle]
	and a
	jr z, .done
	ld a, [wPartyMonSwap]
	and a
	jr nz, .done
	ld a, [wCurBattleMon]
	cp b
	jr z, .done ; already loaded
	ld a, [wAreaSlots]
	xor 1
	ld c, a
	call BattlerSlotMask
	ld hl, wEmptyBattlerSlots
	and [hl]
	jr nz, .done
	ld a, c
	ld hl, BSLOT_PARTY_INDEX
	call ReadBattlerSlotByte
	cp b
	jr nz, .done
	push bc ; SwapInBattlerSlot clobbers bc (b = the party index, returned in a)
	ld a, c
	call SwapInBattlerSlot
	pop bc
	or $80
	ld [wPartyMonSwap], a
.done
	ld a, b
	pop hl
	pop de
	pop bc
	ret

RestorePartyMonSwap::
; Load back the battler that SwapInPlayerPartyMon replaced, if it swapped. Preserves bc, de and hl.
	ld a, [wPartyMonSwap]
	and a
	ret z
	push bc
	push de
	push hl
	ld b, a
	xor a
	ld [wPartyMonSwap], a
	ld a, b
	and %11
	call SwapInBattlerSlot
	pop hl
	pop de
	pop bc
	ret

IsPlayerMonOnField::
; z if the player's party mon a is on the field: the loaded battler (wCurBattleMon) or,
; in a double battle, any mon in wFieldMons. Preserves a, bc, de and hl.
	push hl
	push bc
	ld hl, wCurBattleMon
	ld bc, wFieldMons
	jr _IsMonOnField

IsEnemyMonOnField::
; z if the enemy's party mon a is on the field (see IsPlayerMonOnField).
	push hl
	push bc
	ld hl, wCurOTMon
	ld bc, wFieldMons + 1
_IsMonOnField:
	cp [hl]
	ld h, a
	jr z, .done
	ld a, [wDoubleBattle]
	and a
	jr z, .not_on_field
	ld a, [bc]
	ld l, h
	inc l
.shift
	dec l
	jr z, .got_bit
	rrca
	jr .shift
.got_bit
	and 1
	xor 1 ; z if the bit was set
	jr .done
.not_on_field
	or 1 ; nz
.done
	ld a, h
	pop bc
	pop hl
	ret

UpdateFieldMons::
; Double battles: wFieldMons = the party mons of the battlers on the field, per side.
; Preserves bc, de and hl.
	ld a, [wDoubleBattle]
	and a
	ret z
	push bc
	push de
	push hl
	xor a
	ld [wFieldMons], a
	ld [wFieldMons + 1], a
	ld c, NUM_BATTLER_SLOTS
.loop
	dec c
	ld a, c
	call BattlerSlotMask
	ld hl, wEmptyBattlerSlots
	and [hl]
	jr nz, .next
	; party index: the live one if this slot is loaded, else the stored one
	ld hl, wAreaSlots
	ld de, wCurBattleMon
	bit BATTLER_SLOT_ENEMY_F, c
	jr z, .got_side
	inc hl
	ld de, wCurOTMon
.got_side
	ld a, [hl]
	cp c
	ld a, [de]
	jr z, .got_index
	ld a, c
	ld hl, BSLOT_PARTY_INDEX
	call ReadBattlerSlotByte
.got_index
	; set bit a in this side's mask
	ld b, a
	inc b
	xor a
	scf
.bit
	rla
	dec b
	jr nz, .bit
	ld hl, wFieldMons
	bit BATTLER_SLOT_ENEMY_F, c
	jr z, .got_mask
	inc hl
.got_mask
	or [hl]
	ld [hl], a
.next
	ld a, c
	and a
	jr nz, .loop
	pop hl
	pop de
	pop bc
	ret

BattlerLeavesField::
; Double battles: the battler in area a (0: the player's, 1: the enemy's) leaves the field,
; or a new one starts fresh there. Its own links (BATTLER_LINK_*) are cleared and its Lock-On
; ends. The other battlers' links to its slot that end when it leaves (trapped by, Mean Look
; by, attracted to, locked on to, last attacker) are cleared, with their effects: a Wrap it
; started, an attraction to it. Seeded by and the chosen targets stay: they go to whoever is
; in that slot. Preserves bc, de and hl.
	push de
	ld e, 0 ; no own links kept
	jr _BattlerLeavesField

BatonPassLeavesField::
; As BattlerLeavesField, for a battler leaving by Baton Pass: the links it passes on stay with
; its slot (the chosen target, seeded by, Mean Look by, locked on to). Preserves bc, de, hl.
	push de
	ld e, 1 << BATTLER_LINK_TARGET | 1 << BATTLER_LINK_SEEDED_BY | 1 << BATTLER_LINK_MEAN_LOOK_BY | 1 << BATTLER_LINK_LOCKED_ON_TO
_BattlerLeavesField:
	ld d, a
	ld a, [wDoubleBattle]
	and a
	jp z, .singles
	push bc
	push hl
	ld hl, wAreaSlots
	ld a, d
	add l
	ld l, a
	adc h
	sub l
	ld h, a
	ld c, [hl] ; c = the leaving slot
	; its Lock-On ends (unless it's passed on): the target's SUBSTATUS_LOCK_ON
	bit BATTLER_LINK_LOCKED_ON_TO, e
	jr nz, .own_links
	ld hl, BSLOT_LINKS + BATTLER_LINK_LOCKED_ON_TO
	call ReadBattlerVar
	call BattlerMaskToSlot
	jr c, .own_links
	push bc
	ld c, a
	ld hl, BSLOT_SUBSTATUS + 4
	ld b, ~(1 << SUBSTATUS_LOCK_ON)
	call AndBattlerVar
	pop bc
.own_links
	ld hl, BSLOT_LINKS
	ld b, 0
	ld d, NUM_BATTLER_LINKS
.own_loop
	srl e
	call nc, AndBattlerVar
	inc hl
	dec d
	jr nz, .own_loop
	; every other battler on the field: d = ~(1 << the leaving slot)
	ld a, c
	call BattlerSlotMask
	cpl
	ld d, a
	ld e, c
	ld c, NUM_BATTLER_SLOTS
.loop
	dec c
	ld a, c
	cp e
	jr z, .next
	call BattlerSlotMask
	ld hl, wEmptyBattlerSlots
	and [hl]
	jr nz, .next
	; trapped by it: the Wrap ends
	ld hl, BSLOT_LINKS + BATTLER_LINK_TRAPPED_BY
	call ReadBattlerVar
	or d
	inc a
	jr nz, .not_trapped
	ld hl, BSLOT_WRAP_COUNT
	ld b, 0
	call AndBattlerVar
.not_trapped
	; attracted to it: the attraction ends
	ld hl, BSLOT_LINKS + BATTLER_LINK_ATTRACTED_TO
	call ReadBattlerVar
	or d
	inc a
	jr nz, .not_attracted
	ld hl, BSLOT_SUBSTATUS
	ld b, ~(1 << SUBSTATUS_IN_LOVE)
	call AndBattlerVar
.not_attracted
	ld hl, BSLOT_LINKS + BATTLER_LINK_TRAPPED_BY
	ld b, d
	call AndBattlerVar ; TRAPPED_BY
	inc hl
	call AndBattlerVar ; MEAN_LOOK_BY
	inc hl
	call AndBattlerVar ; ATTRACTED_TO
	inc hl
	call AndBattlerVar ; LOCKED_ON_TO
	inc hl
	call AndBattlerVar ; LAST_ATTACKER
.next
	ld a, c
	and a
	jr nz, .loop
	pop hl
	pop bc
.singles
	pop de
	ret

	assert BATTLER_LINK_MEAN_LOOK_BY == BATTLER_LINK_TRAPPED_BY + 1
	assert BATTLER_LINK_ATTRACTED_TO == BATTLER_LINK_TRAPPED_BY + 2
	assert BATTLER_LINK_LOCKED_ON_TO == BATTLER_LINK_TRAPPED_BY + 3
	assert BATTLER_LINK_LAST_ATTACKER == BATTLER_LINK_TRAPPED_BY + 4
	assert NUM_BATTLER_LINKS == BATTLER_LINK_LAST_ATTACKER + 1

BattlerMaskToSlot::
; a = the slot of the lowest bit set in mask a; carry if none. Preserves bc, de and hl.
	and a
	scf
	ret z
	push bc
	ld b, -1
.loop
	inc b
	rrca
	jr nc, .loop
	ld a, b
	pop bc
	and a
	ret

BattlerVarAddress:
; hl = the address of field hl (BSLOT_*, a field both sides have) of the battler in slot c:
; its live variable if the slot is loaded, else its slot storage. a = the WRAM bank to map.
; Preserves bc and de.
	push de
	push bc
	ld de, wAreaSlots
	bit BATTLER_SLOT_ENEMY_F, c
	jr z, .got_area
	inc de
.got_area
	ld a, [de]
	cp c
	jr nz, .stored
	; find the BattlerSwapList entry holding the field
	ld e, l ; slots are smaller than 256 bytes
	ld hl, BattlerSwapList
.scan
	ld a, e
	sub [hl]
	jr c, .found
	ld e, a
	inc hl
	inc hl
	inc hl
	inc hl
	inc hl
	jr .scan
.found
	inc hl
	bit BATTLER_SLOT_ENEMY_F, c
	jr z, .got_side
	inc hl
	inc hl
.got_side
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld d, 0
	add hl, de
	ld a, BANK(wEnemyMon) ; the live WRAMX variables
	jr .done
.stored
	ld a, c
	call GetBattlerSlotAddress
	ld a, BANK(wBattlerSlots)
.done
	pop bc
	pop de
	ret

	assert BATTLER_SLOT_SIZE < $100

ReadBattlerVar::
; a = field hl (BSLOT_*) of the battler in slot c (loaded or stored). Preserves bc, de, hl.
	push de
	push hl
	call BattlerVarAddress
	ld d, a
	ldh a, [rSVBK]
	ld e, a
	ld a, d
	ldh [rSVBK], a
	ld d, [hl]
	ld a, e
	ldh [rSVBK], a
	ld a, d
	pop hl
	pop de
	ret

AndBattlerVar::
; Field hl (BSLOT_*) of the battler in slot c &= b (b = 0 clears it). Preserves bc, de, hl.
	push de
	push hl
	call BattlerVarAddress
	ld d, a
	ldh a, [rSVBK]
	ld e, a
	ld a, d
	ldh [rSVBK], a
	ld a, [hl]
	and b
	ld [hl], a
	ld a, e
	ldh [rSVBK], a
	pop hl
	pop de
	ret

SetTargetLink::
; Double battles: link a (BATTLER_LINK_*) of the target (the battler loaded opposite
; hBattleTurn's) = the user's slot. Does nothing in singles. Preserves all registers.
	push hl
	push bc
	ld c, a
	ldh a, [hBattleTurn]
	call _AreaSlotMask ; the user's slot
	ld b, a
	ldh a, [hBattleTurn]
	xor 1
	jr _SetLink

SetUserLink::
; Double battles: link a (BATTLER_LINK_*) of the user (hBattleTurn's battler) = the target's
; slot. Does nothing in singles. Preserves all registers.
	push hl
	push bc
	ld c, a
	ldh a, [hBattleTurn]
	xor 1
	call _AreaSlotMask ; the target's slot
	ld b, a
	ldh a, [hBattleTurn]
_SetLink:
	; a = the area whose links change, b = the mask, c = the link
	ld hl, wPlayerBattlerLinks
	and a
	jr z, .got_links
	ld hl, wEnemyBattlerLinks
.got_links
	ld a, [wDoubleBattle]
	and a
	jr z, .done
	ld a, l
	add c
	ld l, a
	adc h
	sub l
	ld h, a
	ld [hl], b
.done
	ld a, c
	pop bc
	pop hl
	ret

DoublesCheckLockOn::
; Hit check: in a double battle, z unless the target is the one the user locked on to (then
; the user's lock-on is used up, and nz). Always nz in singles. Preserves bc, de and hl.
	ld a, [wDoubleBattle]
	and a
	jr z, .singles
	push hl
	push bc
	ldh a, [hBattleTurn]
	xor 1
	call _AreaSlotMask ; the target's slot
	ld b, a
	ld hl, wPlayerBattlerLinks + BATTLER_LINK_LOCKED_ON_TO
	ldh a, [hBattleTurn]
	and a
	jr z, .got_links
	ld hl, wEnemyBattlerLinks + BATTLER_LINK_LOCKED_ON_TO
.got_links
	ld a, [hl]
	and b
	jr z, .done
	ld [hl], 0
	or 1
.done
	pop bc
	pop hl
	ret

.singles
	inc a ; nz
	ret

DoublesNoteHit::
; A move of the user damages the target (wCurDamage): in a double battle, the target's last
; attacker is the user (BATTLER_LINK_LAST_ATTACKER) and its last damage this turn is
; wCurDamage (Counter, Mirror Coat). Preserves all registers.
	push af
	ld a, [wDoubleBattle]
	and a
	jr z, .done
	push hl
	ld a, BATTLER_LINK_LAST_ATTACKER
	call SetTargetLink
	ld hl, wEnemyLastDamage
	ldh a, [hBattleTurn]
	and a
	jr z, .got_damage
	ld hl, wPlayerLastDamage
.got_damage
	ld a, [wCurDamage]
	ld [hli], a
	ld a, [wCurDamage + 1]
	ld [hl], a
	pop hl
.done
	pop af
	ret

DoublesSetFutureSightTarget::
; The user foresaw an attack: in a double battle, it will hit the target's slot (whoever is
; there then). Preserves all registers.
	push af
	ld a, [wDoubleBattle]
	and a
	jr z, .done
	push bc
	push hl
	ldh a, [hBattleTurn]
	xor 1
	call _AreaSlotMask
	ld b, a
	ld hl, wPlayerFutureSightTarget
	ldh a, [hBattleTurn]
	and a
	jr z, .got_user
	ld hl, wEnemyFutureSightTarget
.got_user
	ld [hl], b
	pop hl
	pop bc
.done
	pop af
	ret

DoublesHazeStored::
; Haze in a double battle: the stat levels of the two battlers that aren't loaded are reset
; too (the move resets the loaded pair itself). Preserves bc, de and hl.
	ld a, [wDoubleBattle]
	and a
	ret z
	push bc
	push de
	push hl
	ld hl, .haze
	call _ForStoredBattlers
	pop hl
	pop de
	pop bc
	ret

.haze
	ld hl, wPlayerStatLevels
	ldh a, [hBattleTurn]
	and a
	jr z, .got_levels
	ld hl, wEnemyStatLevels
.got_levels
	ld a, BASE_STAT_LEVEL
	ld b, NUM_LEVEL_STATS
.fill
	ld [hli], a
	dec b
	jr nz, .fill
	ldh a, [hBattleTurn]
	and a
	jr nz, .enemy
	farjp CalcPlayerStats
.enemy
	farjp CalcEnemyStats

DoublesPerishStored::
; Perish Song in a double battle: the two battlers that aren't loaded hear it too (the move
; handles the loaded pair). a = 1 if it started a count on one of them, else 0 (and in
; singles). Preserves bc, de and hl.
	ld a, [wDoubleBattle]
	and a
	ret z
	push bc
	push de
	push hl
	xor a
	ld [wDoublesTemp], a
	ld hl, .perish
	call _ForStoredBattlers
	pop hl
	pop de
	pop bc
	ld a, [wDoublesTemp]
	ret

.perish
	ld hl, wPlayerSubStatus1
	ld de, wPlayerPerishCount
	ldh a, [hBattleTurn]
	and a
	jr z, .got_vars
	ld hl, wEnemySubStatus1
	ld de, wEnemyPerishCount
.got_vars
	bit SUBSTATUS_PERISH, [hl]
	ret nz
	set SUBSTATUS_PERISH, [hl]
	ld a, 4
	ld [de], a
	ld a, 1
	ld [wDoublesTemp], a
	ret

_ForStoredBattlers:
; Call hl for each battler on the field that isn't loaded, with it swapped in (c = its slot,
; hBattleTurn = its side). The battlers that were loaded are loaded back after each call.
	ldh a, [hBattleTurn]
	push af
	ld c, 0
.loop
	ld a, c
	call BattlerSlotMask
	push hl
	ld hl, wEmptyBattlerSlots
	and [hl]
	jr nz, .skip ; empty
	ld hl, wAreaSlots
	bit BATTLER_SLOT_ENEMY_F, c
	jr z, .got_area
	inc hl
.got_area
	ld a, [hl]
	cp c
	jr z, .skip ; loaded
	pop hl
	push bc
	push hl
	ld a, c
	call SwapInBattlerSlot
	pop hl
	pop bc
	push af ; the slot loaded before
	push bc
	push hl
	ld a, c
	and 1 << BATTLER_SLOT_ENEMY_F
	rrca
	ldh [hBattleTurn], a
	call _hl_
	pop hl
	pop bc
	pop af
	push bc
	push hl
	call SwapInBattlerSlot
	pop hl
	pop bc
	jr .next
.skip
	pop hl
.next
	inc c
	ld a, c
	cp NUM_BATTLER_SLOTS
	jr nz, .loop
	pop af
	ldh [hBattleTurn], a
	ret

_AreaSlotMask:
; a = 1 << the slot loaded in area a. Preserves bc, de.
	ld hl, wAreaSlots
	add l
	ld l, a
	adc h
	sub l
	ld h, a
	ld a, [hl]
	jmp BattlerSlotMask

SaveBattlerSlot::
; Copy the live variables of slot a's side into slot a.
	ld c, a
	jr BattlerSlotCopy

LoadBattlerSlot::
; Copy slot a into the live variables of its side.
	or $80
	ld c, a
	; fallthrough

BattlerSlotCopy:
; c: slot in bits 0-1; bit 7 set: load (slot -> live), else save (live -> slot)
; Live WRAMX variables are in BANK(wEnemyMon); the slots are in BANK(wBattlerSlots).
	ldh a, [rSVBK]
	push af
	ld a, c
	and %11
	ld hl, wBattlerSlots
	ld de, BATTLER_SLOT_SIZE
	jr z, .got_slot
.slot_loop
	add hl, de
	dec a
	jr nz, .slot_loop
.got_slot
	ld d, h
	ld e, l
	ld hl, BattlerSwapList
.entry
	ld a, [hl]
	and a
	jr z, .done
	ld b, a
	push hl
	inc hl
	bit BATTLER_SLOT_ENEMY_F, c
	jr z, .got_side
	inc hl
	inc hl
.got_side
	ld a, [hli]
	ld h, [hl]
	ld l, a
	or h
	jr z, .skip
	bit 7, c
	jr nz, .load
.save
	ld a, BANK(wEnemyMon)
	ldh [rSVBK], a
	ld a, [hli]
	push af
	ld a, BANK(wBattlerSlots)
	ldh [rSVBK], a
	pop af
	ld [de], a
	inc de
	dec b
	jr nz, .save
	jr .next

.load
	ld a, BANK(wBattlerSlots)
	ldh [rSVBK], a
	ld a, [de]
	inc de
if DEF(SWAP_TEST)
	bit 6, c
	jr z, .not_wipe
	ld a, $a5
.not_wipe
endc
	push af
	ld a, BANK(wEnemyMon)
	ldh [rSVBK], a
	pop af
	ld [hli], a
	dec b
	jr nz, .load
	jr .next

.skip
	ld a, e
	add b
	ld e, a
	jr nc, .next
	inc d
.next
	pop hl
	ld a, l
	add BATTLER_SWAP_ENTRY_LENGTH
	ld l, a
	jr nc, .entry
	inc h
	jr .entry

.done
	pop af
	ldh [rSVBK], a
	ret

if DEF(SWAP_TEST)
SwapTest::
; Test builds only (built with -D SWAP_TEST; see the harness README): send both sides through
; all four slots, wiping the live variables in between. Singles must play exactly as without it.
	ld a, BATTLER_SLOT_P1
	call .round_trip
	ld a, BATTLER_SLOT_P2
	call .round_trip
	ld a, BATTLER_SLOT_E1
	call .round_trip
	ld a, BATTLER_SLOT_E2
.round_trip
	push af
	call SaveBattlerSlot
	pop af
	push af
	or $c0 ; load with wipe: fill the live variables with $a5
	ld c, a
	call BattlerSlotCopy
	pop af
	jp LoadBattlerSlot
endc
