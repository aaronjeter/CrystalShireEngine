ConsumeHeldItem:
	push hl
	push de
	push bc
	ldh a, [hBattleTurn]
	and a
	ld hl, wOTPartyMon1Item
	ld de, wEnemyMonItem
	ld a, [wCurOTMon]
	jr z, .theirturn
	ld hl, wPartyMon1Item
	ld de, wBattleMonItem
	ld a, [wCurBattleMon]

.theirturn
	push hl
	push af
	ld a, [de]
	ld b, a
	farcall GetItemHeldEffect
	ld hl, ConsumableEffects
.loop
	ld a, [hli]
	cp b
	jr z, .ok
	inc a
	jr nz, .loop
	pop af
	pop hl
	jmp PopBCDEHL

.ok
; Only the battle copy is cleared: the party struct keeps the item, so it's back after the
; battle (like Knock Off; wKnockedOffMons keeps it away if the mon switches back in).
	xor a
	ld [de], a
	pop af
	pop hl
	farcall SuppressOpponentItem
	jmp PopBCDEHL

INCLUDE "data/battle/held_consumables.asm"
