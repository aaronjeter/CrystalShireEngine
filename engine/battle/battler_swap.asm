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
	ld a, c
	call SwapInBattlerSlot
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
; or a new one starts fresh there. Its own links (BATTLER_LINK_*) are cleared, and so are
; the other battlers' links to its slot that end when it leaves (trapped by, Mean Look by,
; attracted to, locked on to, last attacker). Seeded by and the chosen targets stay: they
; go to whoever is in that slot. Preserves bc, de and hl.
	ld b, a
	ld a, [wDoubleBattle]
	and a
	ret z
	push bc
	push de
	push hl
	; own links
	ld hl, wPlayerBattlerLinks
	ld a, b
	and a
	jr z, .got_own
	ld hl, wEnemyBattlerLinks
.got_own
	xor a
	ld c, NUM_BATTLER_LINKS
.clear_own
	ld [hli], a
	dec c
	jr nz, .clear_own
	; d = ~(1 << the leaving slot)
	ld hl, wAreaSlots
	ld a, b
	add l
	ld l, a
	adc h
	sub l
	ld h, a
	ld a, [hl]
	call BattlerSlotMask
	cpl
	ld d, a
	; every other battler: the live links of the loaded ones, the stored ones' in their slots
	ld c, NUM_BATTLER_SLOTS
.loop
	dec c
	ld a, c
	call BattlerSlotMask
	ld hl, wEmptyBattlerSlots
	and [hl]
	jr nz, .next
	ld hl, wAreaSlots
	ld e, LOW(wPlayerBattlerLinks)
	bit BATTLER_SLOT_ENEMY_F, c
	jr z, .got_area
	inc hl
	ld e, LOW(wEnemyBattlerLinks)
.got_area
	ld a, [hl]
	cp c
	jr nz, .stored
	ld h, HIGH(wPlayerBattlerLinks)
	ld l, e
	call .clear_links
	jr .next
.stored
	ld a, c
	ld hl, BSLOT_LINKS
	call GetBattlerSlotAddress
	ldh a, [rSVBK]
	push af
	ld a, BANK(wBattlerSlots)
	ldh [rSVBK], a
	call .clear_links
	pop af
	ldh [rSVBK], a
.next
	ld a, c
	and a
	jr nz, .loop
	pop hl
	pop de
	pop bc
	ret

.clear_links
; hl = a battler's links; clear the bits in ~d of the links that end when that battler leaves
	push hl
	ld a, l
	add BATTLER_LINK_TRAPPED_BY
	ld l, a
	adc h
	sub l
	ld h, a
	ld a, [hl]
	and d
	ld [hli], a ; TRAPPED_BY
	ld a, [hl]
	and d
	ld [hli], a ; MEAN_LOOK_BY
	ld a, [hl]
	and d
	ld [hli], a ; ATTRACTED_TO
	ld a, [hl]
	and d
	ld [hli], a ; LOCKED_ON_TO
	ld a, [hl]
	and d
	ld [hl], a ; LAST_ATTACKER
	pop hl
	ret

	assert BATTLER_LINK_MEAN_LOOK_BY == BATTLER_LINK_TRAPPED_BY + 1
	assert BATTLER_LINK_ATTRACTED_TO == BATTLER_LINK_TRAPPED_BY + 2
	assert BATTLER_LINK_LOCKED_ON_TO == BATTLER_LINK_TRAPPED_BY + 3
	assert BATTLER_LINK_LAST_ATTACKER == BATTLER_LINK_TRAPPED_BY + 4
	assert HIGH(wPlayerBattlerLinks) == HIGH(wEnemyBattlerLinks + NUM_BATTLER_LINKS - 1)

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
