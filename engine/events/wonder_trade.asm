; Wonder Trade: give any party Pokémon (not an Egg, not the last one that isn't
; an Egg) and get a random one back at the same level, evolved along level
; evolutions to fit, with better DVs (never shiny), a 1 in 10 hidden ability and
; a 1 in 4 held item, from a random OT. The trade itself is DoNPCTrade, reading
; these values through GetTradeAttr (see WonderTradeDoTrade). Closed in
; Nuzlocke mode.

DEF WONDER_TRADE_HIDDEN_CHANCE EQU 10 percent
DEF WONDER_TRADE_ITEM_CHANCE EQU 25 percent

	const_def
	const WONDERTRADE_CANCEL  ; 0
	const WONDERTRADE_OK      ; 1
	const WONDERTRADE_OK_ITEM ; 2: the Pokémon holds an item
	const WONDERTRADE_EGG     ; 3
	const WONDERTRADE_LAST    ; 4

WonderTradeScript::
	opentext
	callasm WonderTradeCheckNuzlocke
	iftrue .nuzlocke
	writetext WonderTradeIntroText
	yesorno
	iffalse .cancel
	callasm WonderTradeChooseMon
	ifequal WONDERTRADE_CANCEL, .cancel
	ifequal WONDERTRADE_EGG, .egg
	ifequal WONDERTRADE_LAST, .last
	ifequal WONDERTRADE_OK_ITEM, .with_item
	writetext WonderTradeConfirmText
	sjump .confirm

.with_item
	writetext WonderTradeConfirmItemText
.confirm
	yesorno
	iffalse .cancel
	writetext WonderTradeSendText
	waitbutton
	callasm WonderTradeExecute
	writetext WonderTradeAfterText
	waitbutton
	closetext
	end

.cancel
	writetext WonderTradeCancelText
	waitbutton
	closetext
	end

.egg
	writetext WonderTradeEggText
	waitbutton
	closetext
	end

.last
	writetext WonderTradeLastText
	waitbutton
	closetext
	end

.nuzlocke
	writetext WonderTradeNuzlockeText
	waitbutton
	closetext
	end

WonderTradeCheckNuzlocke:
	ld a, [wOptions2]
	and 1 << NUZLOCKE_ON
	ld [wScriptVar], a
	ret

WonderTradeChooseMon:
; The party menu; wScriptVar = WONDERTRADE_*. For a Pokémon that can go:
; wStringBuffer3 = its nickname, wStringBuffer4 = its item's name.
	ld b, PARTYMENUACTION_GIVE_MON
	farcall SelectTradeOrDayCareMon
	ld a, WONDERTRADE_CANCEL
	jr c, .done
	ld a, [wCurPartySpecies]
	cp EGG
	ld a, WONDERTRADE_EGG
	jr z, .done
	; another Pokémon that isn't an Egg must stay
	ld hl, wPartySpecies
	ld a, [wCurPartyMon]
	ld c, a
	ld b, 0 ; index
.others
	ld a, [hli]
	cp -1
	ld a, WONDERTRADE_LAST
	jr z, .done
	ld a, b
	inc b
	cp c
	jr z, .others
	dec hl
	ld a, [hli]
	cp EGG
	jr z, .others

	ld a, [wCurPartyMon]
	ld hl, wPartyMonNicknames
	call GetNickname
	ld hl, wStringBuffer1
	ld de, wStringBuffer3
	ld bc, MON_NAME_LENGTH
	rst CopyBytes
	ld a, [wCurPartyMon]
	ld hl, wPartyMon1Item
	ld bc, PARTYMON_STRUCT_LENGTH
	rst AddNTimes
	ld a, [hl]
	and a
	ld a, WONDERTRADE_OK
	jr z, .done
	ld a, [hl]
	ld [wNamedObjectIndex], a
	call GetItemName
	ld hl, wStringBuffer1
	ld de, wStringBuffer4
	ld bc, ITEM_NAME_LENGTH
	rst CopyBytes
	ld a, WONDERTRADE_OK_ITEM
.done
	ld [wScriptVar], a
	ret

WonderTradeExecute:
; Rolls the Pokémon to give and trades it for the chosen one.
	ld a, [wCurPartyMon]
	ld hl, wPartyMon1Level
	ld bc, PARTYMON_STRUCT_LENGTH
	rst AddNTimes
	ld c, [hl]
	call WonderTradeDrawSpecies
	call GetPokemonIDFromIndex
	ld l, LOCKED_MON_ID_TRADE_RECEIVE
	call LockPokemonID
	ld a, [wCurPartyMon]
	ld c, a
	ld b, 0
	ld hl, wPartySpecies
	add hl, bc
	ld a, [hl]
	ld l, LOCKED_MON_ID_TRADE_SEND
	call LockPokemonID

; DVs: each the higher of two rolls; Speed and Special both 15 (shiny) are rolled again
	call .DVPair
	ld [wWonderTradeDVs], a
.speed_special
	call .DVPair
	cp $ff
	jr z, .speed_special
	ld [wWonderTradeDVs + 1], a

; ability: hidden 1 in 10, else slot 1 or 2
	call Random
	cp WONDER_TRADE_HIDDEN_CHANCE
	ld a, ABILITY_SLOT_HIDDEN + 1
	jr c, .got_ability
	call Random
	and 1
	add ABILITY_SLOT_1 + 1
.got_ability
	ld [wWonderTradeAbility], a

; held item: 1 in 4
	ld hl, NO_ITEM
	call Random
	cp WONDER_TRADE_ITEM_CHANCE
	jr nc, .got_item
	ld hl, WonderTradeItems
	ld a, [hli]
	call RandomRange
	add a
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
.got_item
	ld a, l
	ld [wWonderTradeItem], a
	ld a, h
	ld [wWonderTradeItem + 1], a

; OT ID and name (the second half of the names are girls')
	call Random
	ld [wWonderTradeOTID], a
	call Random
	ld [wWonderTradeOTID + 1], a
	ld a, NUM_WONDER_TRADE_OT_NAMES
	call RandomRange
	push af
	cp NUM_WONDER_TRADE_OT_NAMES / 2
	ld a, TRADE_DIALOGSET_COLLECTOR
	jr c, .got_dialog
	ld a, TRADE_DIALOGSET_GIRL
.got_dialog
	ld [wWonderTradeDialog], a
	pop af
	ld [wWonderTradeOTName], a

	farcall WonderTradeDoTrade

	; the new Pokémon's OT name for the closing text
	ld a, [wPartyCount]
	dec a
	ld hl, wPartyMonOTs
	ld bc, NAME_LENGTH
	rst AddNTimes
	ld d, h
	ld e, l
	ld hl, wStringBuffer3
	call CopyName2 ; de to hl

	xor a
	ld l, LOCKED_MON_ID_TRADE_SEND
	call LockPokemonID
	xor a
	ld l, LOCKED_MON_ID_TRADE_RECEIVE
	jmp LockPokemonID

.DVPair:
; a = two DVs (high and low nibble), each the higher of two rolls
	call .DV
	swap a
	ld b, a
	call .DV
	or b
	ret

.DV:
	call Random
	and $f
	ld e, a
	call Random
	and $f
	cp e
	ret nc
	ld a, e
	ret

WonderTradeDrawSpecies:
; hl = a random species from WonderTradePool, evolved along its level
; evolutions as far as level c allows (a random one where there are several).
	ld hl, WonderTradePool
	ld a, [hli]
	inc hl
	call RandomRange
	add a
	ld e, a
	ld d, 0
	jr nc, .no_carry
	inc d
.no_carry
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
.evolve
; de = the species so far: b = how many level evolutions it has at level c or below
	ld b, 0
	ld hl, WonderTradeLevelEvos
.count
	call .NextEvo
	jr c, .counted
	jr nz, .count
	inc b
	jr .count

.counted
	ld a, b
	and a
	jr z, .done
	call RandomRange
	ld b, a
	ld hl, WonderTradeLevelEvos
.pick
	call .NextEvo
	jr nz, .pick
	ld a, b
	and a
	jr z, .picked
	dec b
	jr .pick

.picked
	; hl points past the entry: its evolved species is the last word
	dec hl
	ld d, [hl]
	dec hl
	ld e, [hl]
	jr .evolve

.done
	ld h, d
	ld l, e
	ret

.NextEvo:
; Reads the entry at hl and moves hl past it. Carry at the end of the table;
; else z if it evolves de at level c or below.
	ld a, [hli]
	or [hl]
	jr nz, .entry
	scf
	ret

.entry
	dec hl
	ld a, [hli]
	cp e
	jr nz, .no_match_1
	ld a, [hli]
	cp d
	jr nz, .no_match_2
	ld a, [hli] ; level
	inc hl
	inc hl
	dec a
	cp c ; level - 1 < c: z won't do, so compare the other way
	jr nc, .too_high
	xor a ; z, nc
	ret

.too_high
	or 1 ; nz, nc
	ret

.no_match_1
	inc hl
.no_match_2
	inc hl
	inc hl
	inc hl
	or 1 ; nz (a is never 0 here... set it anyway), nc
	ret

WonderTradeGetOTName::
; wOTTrademonOTName = name wWonderTradeOTName (GetTradeAttr's NPCTRADE_OT_NAME)
	ld a, [wWonderTradeOTName]
	ld hl, WonderTradeOTNames
	call GetNthString
	ld d, h
	ld e, l
	ld hl, wOTTrademonOTName
	jmp CopyName2 ; de to hl

WonderTradeItems:
	db 18
	dw SITRUS_BERRY, LUM_BERRY, LEPPA_BERRY
	dw FIRE_STONE, WATER_STONE, THUNDERSTONE, LEAF_STONE, MOON_STONE, SUN_STONE
	dw METAL_COAT, KINGS_ROCK, DRAGON_SCALE, UP_GRADE
	dw LEFTOVERS, QUICK_CLAW, SCOPE_LENS, SHELL_BELL, MIRACLE_SEED

DEF NUM_WONDER_TRADE_OT_NAMES EQU 16
WonderTradeOTNames:
; boys, then girls
	db "Kenta@"
	db "Marco@"
	db "Tobias@"
	db "Yusuf@"
	db "Liam@"
	db "Hiro@"
	db "Dmitri@"
	db "Felipe@"
	db "Aiko@"
	db "Sofia@"
	db "Nadia@"
	db "Emma@"
	db "Mei@"
	db "Lucia@"
	db "Hana@"
	db "Ingrid@"

INCLUDE "data/events/wonder_trade_pool.asm"

WonderTradeIntroText:
	text "Wonder Trade!"
	line "Send one #mon"
	cont "and get a surprise"
	cont "in return!"

	para "Want to trade?"
	done

WonderTradeConfirmText:
	text "Send @"
	text_ram wStringBuffer3
	text "?"
	done

WonderTradeConfirmItemText:
	text "Send @"
	text_ram wStringBuffer3
	text_start
	line "and its @"
	text_ram wStringBuffer4
	text "?"
	done

WonderTradeSendText:
	text "Off it goes!"
	line "Let's see who you"
	cont "get back…"
	done

WonderTradeAfterText:
	text "It came from"
	line "@"
	text_ram wStringBuffer3
	text "!"

	para "Come back anytime"
	line "for another one!"
	done

WonderTradeCancelText:
	text "Come back anytime!"
	done

WonderTradeEggText:
	text "An Egg can't go"
	line "on a Wonder Trade."
	done

WonderTradeLastText:
	text "That's your last"
	line "#mon! You"
	cont "should keep it."
	done

WonderTradeNuzlockeText:
	text "Wonder Trade!"
	line "…Oh, a Nuzlocke"
	cont "run? Then you"

	para "can't take a"
	line "surprise #mon."
	cont "Rules are rules!"
	done
