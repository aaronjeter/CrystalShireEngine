; Trainer Passport counters (save extension, WRAMX bank of wPassportStats).
; Every entry point preserves all registers.

PassportBattleWon::
; A battle ended in a win.
	push af
	ld a, PASSPORT_BATTLES
	call PassportAddStat
	pop af
	ret

PassportTrainerBeaten::
	push af
	ld a, PASSPORT_TRAINERS
	call PassportAddStat
	pop af
	ret

PassportCaughtMon::
; A Pokémon was caught: caught +1, and shinies +1 if wEnemyMonDVs are shiny.
	push af
	push bc
	push hl
	ld a, PASSPORT_CAUGHT
	call PassportAddStat
	ld bc, wEnemyMonDVs
	farcall CheckShininess
	jr nc, .done
	ld a, PASSPORT_SHINIES
	call PassportAddStat
.done
	pop hl
	pop bc
	pop af
	ret

PassportEggHatched::
	push af
	ld a, PASSPORT_EGGS
	call PassportAddStat
	pop af
	ret

PassportMonFainted::
; One of the player's Pokémon fainted in battle.
	push af
	ld a, PASSPORT_FAINTED
	call PassportAddStat
	pop af
	ret

PassportMonFallen::
; Nuzlocke mode buried or released a fainted Pokémon. Preserves all registers.
	push af
	push de
	push hl
	ld hl, wPassportFallen
	call PassportIncWord
	pop hl
	pop de
	pop af
	ret

PassportAddStat:
; Adds 1 to the PASSPORT_* counter in a, up to 65535. Preserves all registers.
	push af
	push de
	push hl
	ld e, a
	ld d, 0
	ld hl, wPassportStats
	add hl, de
	add hl, de
	call PassportIncWord
	pop hl
	pop de
	pop af
	ret

PassportIncWord:
; Adds 1 to the big-endian word at hl in the save extension, up to 65535.
; Clobbers a, hl.
	ldh a, [rSVBK]
	push af
	ld a, BANK(wPassportStats)
	ldh [rSVBK], a
	inc hl
	inc [hl]
	jr nz, .done
	dec hl
	inc [hl]
	jr nz, .done
	dec [hl]
	inc hl
	dec [hl]
.done
	pop af
	ldh [rSVBK], a
	ret

ASSERT BANK(wPassportFallen) == BANK(wPassportStats)

PassportCountStep::
; Steps +1, up to $ffffff.
	push af
	push hl
	ldh a, [rSVBK]
	push af
	ld a, BANK(wPassportSteps)
	ldh [rSVBK], a
	ld hl, wPassportSteps + 2
	inc [hl]
	jr nz, .done
	dec hl
	inc [hl]
	jr nz, .done
	dec hl
	inc [hl]
	jr nz, .done
	ld a, $ff
	ld [hli], a
	ld [hli], a
	ld [hl], a
.done
	pop af
	ldh [rSVBK], a
	pop hl
	pop af
	ret

PassportHallOfFame::
; Hall of Fame count +1 for the League in wHallOfFameLeague, up to 255.
	push af
	push de
	push hl
	ld a, [wHallOfFameLeague]
	ld e, a
	ld d, 0
	ldh a, [rSVBK]
	push af
	ld a, BANK(wHallOfFameCounts)
	ldh [rSVBK], a
	ld hl, wHallOfFameCounts
	add hl, de
	inc [hl]
	jr nz, .done
	dec [hl]
.done
	pop af
	ldh [rSVBK], a
	pop hl
	pop de
	pop af
	ret

PassportUnlock::
; Sets EVENT_PASSPORT_UNLOCKED. Preserves all registers.
	push af
	push bc
	push de
	push hl
	ld de, EVENT_PASSPORT_UNLOCKED
	ld b, SET_FLAG
	call EventFlagAction
	pop hl
	pop de
	pop bc
	pop af
	ret

CheckPassportUnlocked::
; Returns nz if the Start menu should show the Passport: its flag, a League
; already beaten, or a facility challenge already cleared (older saves).
	ld hl, .Flags
	jr Passport_AnyFlagSet

.Flags:
	dw EVENT_PASSPORT_UNLOCKED
	dw EVENT_BEAT_INDIGO_LEAGUE
	dw EVENT_BEAT_JOHTO_LEAGUE
	dw EVENT_BEAT_HOENN_LEAGUE
	dw EVENT_FACILITY_INTRO_KANTO
	dw EVENT_FACILITY_INTRO_JOHTO
	dw EVENT_FACILITY_INTRO_HOENN
	dw -1

CheckWorldCupEligible::
; Returns nz if the player has at least 16 badges and has beaten a League.
	ld hl, wBadges
	ld b, wHoennBadges - wBadges + (NUM_HOENN_BADGES + 7) / 8
	call CountSetBits
	cp 16
	jr nc, .badges
	xor a
	ret

.badges
	ld hl, .Leagues
	jr Passport_AnyFlagSet

.Leagues:
	dw EVENT_BEAT_INDIGO_LEAGUE
	dw EVENT_BEAT_JOHTO_LEAGUE
	dw EVENT_BEAT_HOENN_LEAGUE
	dw -1

CheckWorldCupEligibleScript::
; wScriptVar = TRUE if CheckWorldCupEligible returns nz
	call CheckWorldCupEligible
	ld a, FALSE
	jr z, .done
	inc a
.done
	ld [wScriptVar], a
	ret

CheckWorldCupStarted::
; Returns nz if the player is eligible for the World Cup or already registered.
	ld hl, .Flags
	call Passport_AnyFlagSet
	ret nz
	jr CheckWorldCupEligible

.Flags:
	dw EVENT_WORLD_CUP_REGISTERED
	dw EVENT_WORLD_CUP_QUALIFIED
	dw EVENT_WORLD_CUP_CHAMPION
	dw -1

Passport_AnyFlagSet:
; hl = list of event flags ending with -1; returns nz if any of them is set
.loop
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	and e
	inc a
	ret z ; end of list: a = 0
	push hl
	ld b, CHECK_FLAG
	call EventFlagAction
	pop hl
	ld a, c
	and a
	jr z, .loop
	ret

