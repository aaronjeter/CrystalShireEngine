MACRO badge_mart_item
; min badges (| BADGEMART_NEEDS_DEX), max badges (shown while total badges <= max), item
	db \1, \2
	dw \3
ENDM

BuildBadgeMart:
; If the current mart is MART_STANDARD, build its list in wBadgeMartList
; from the total badge count (all regions) and the Pokédex flag.
	ld hl, wMartPointer
	ld a, [hli]
	cp LOW(wBadgeMartList)
	ret nz
	ld a, [hl]
	cp HIGH(wBadgeMartList)
	ret nz
	ld hl, wBadges
	ld b, wTMsHMs - wBadges ; all three regions' badge bytes
	call CountSetBits
	ld b, a ; total badges
	ld c, 0 ; item count
	ld hl, BadgeMartItems
	ld de, wBadgeMartList + 1
.loop
	ld a, [hli]
	cp -1
	jr z, .done
	bit 7, a ; BADGEMART_NEEDS_DEX
	jr z, .check_min
	ld a, [wStatusFlags]
	bit STATUSFLAGS_POKEDEX_F, a
	jr z, .skip_max
	dec hl
	ld a, [hli]
	and ~BADGEMART_NEEDS_DEX
.check_min
	; skip unless min <= badges
	cp b
	jr z, .check_max
	jr nc, .skip_max
.check_max
	; skip if max < badges
	ld a, [hli]
	cp b
	jr c, .skip_item
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	inc c
	jr .loop

.skip_max
	inc hl
.skip_item
	inc hl
	inc hl
	jr .loop

.done
	ld a, c
	ld [wBadgeMartList], a
	ret

BadgeMartItems:
; menu order; at most MAX_MART_ITEMS may show at once
	badge_mart_item 0 | BADGEMART_NEEDS_DEX, 255, POKE_BALL
	badge_mart_item 3, 255, GREAT_BALL
	badge_mart_item 5, 255, ULTRA_BALL
	badge_mart_item 0, 255, POTION
	badge_mart_item 2, 255, SUPER_POTION
	badge_mart_item 5, 255, HYPER_POTION
	badge_mart_item 7, 255, MAX_POTION
	badge_mart_item 8, 255, FULL_RESTORE
	badge_mart_item 4, 255, REVIVE
	badge_mart_item 0,   2, ANTIDOTE
	badge_mart_item 0,   2, PARLYZ_HEAL
	badge_mart_item 0,   2, AWAKENING
	badge_mart_item 1,   2, BURN_HEAL
	badge_mart_item 1,   2, ICE_HEAL
	badge_mart_item 3, 255, FULL_HEAL
	badge_mart_item 1, 255, ESCAPE_ROPE
	badge_mart_item 1, 255, REPEL
	badge_mart_item 3, 255, SUPER_REPEL
	badge_mart_item 5, 255, MAX_REPEL
	db -1

	; the prices must not reach the map event union (wMartType...)
	assert wMartItem1BCD + MAX_MART_ITEMS * 3 <= wMartType
