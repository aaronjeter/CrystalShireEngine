; World Cup title defense: the challenger list in the Challenger Lobby, the
; match in the Finals arena and its rewards (data/events/title_defense.asm).
; wTitleDefenseChallenger (save extension) holds the accepted challenger + 1
; until the match is over.

DEF TITLE_DEFENSE_MARK_TILE EQU $72 ; the unused "『" slot of the text tiles

TitleDefenseGetChallenger:
; hl = the TitleDefenseChallengers entry of challenger a
	ld hl, TitleDefenseChallengers
	ld bc, TITLE_CHALLENGER_LENGTH
	rst AddNTimes
	ret

TitleDefenseGetField:
; hl = field c of challenger a's entry
	push bc
	call TitleDefenseGetChallenger
	pop bc
	ld b, 0
	add hl, bc
	ret

TitleDefenseCheckFlag:
; nz if event flag de is set (carry cleared)
	ld b, CHECK_FLAG
	call EventFlagAction
	ld a, c
	and a
	ret

TitleDefenseGetPending:
; a = wTitleDefenseChallenger
	ldh a, [rSVBK]
	push af
	ld a, BANK(wTitleDefenseChallenger)
	ldh [rSVBK], a
	ld a, [wTitleDefenseChallenger]
	ld b, a
	pop af
	ldh [rSVBK], a
	ld a, b
	ret

TitleDefenseSetPending:
; wTitleDefenseChallenger = a
	ld b, a
	ldh a, [rSVBK]
	push af
	ld a, BANK(wTitleDefenseChallenger)
	ldh [rSVBK], a
	ld a, b
	ld [wTitleDefenseChallenger], a
	pop af
	ldh [rSVBK], a
	ret

TitleDefenseIsUnlocked:
; carry if challenger a is on the list
	call TitleDefenseGetChallenger
	ld a, [hli]
	ld e, [hl]
	inc hl
	ld d, [hl]
	cp TD_UNLOCK_FLAG
	jr z, .flag
	cp TD_UNLOCK_NOT_FLAG
	jr z, .not_flag
	cp TD_UNLOCK_NOT_JOHTO
	jr z, .not_johto
; TD_UNLOCK_CHAMPIONS: Lance, Agatha and Steven beaten in title defenses
	ld de, EVENT_TITLE_DEFENSE_BEAT_LANCE
	call TitleDefenseCheckFlag
	ret z
	ld de, EVENT_TITLE_DEFENSE_BEAT_AGATHA
	call TitleDefenseCheckFlag
	ret z
	ld de, EVENT_TITLE_DEFENSE_BEAT_STEVEN
	call TitleDefenseCheckFlag
	ret z
	scf
	ret

.flag
	call TitleDefenseCheckFlag
	ret z
	scf
	ret

.not_flag
	call TitleDefenseCheckFlag
	ret nz
	scf
	ret

.not_johto
	ld de, EVENT_START_KANTO
	call TitleDefenseCheckFlag
	jr nz, .yes
	ld de, EVENT_START_HOENN
	call TitleDefenseCheckFlag
	ret z
.yes
	scf
	ret

TitleDefenseIsBeaten:
; nz if challenger a has been beaten before
	ld c, TITLE_CHALLENGER_BEATEN_FLAG
	call TitleDefenseGetField
	ld e, [hl]
	inc hl
	ld d, [hl]
	jr TitleDefenseCheckFlag

TitleDefenseCopyName:
; wStringBuffer3 = challenger a's name
	ld c, TITLE_CHALLENGER_NAME
	call TitleDefenseGetField
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, wStringBuffer3
.loop
	ld a, [hli]
	ld [de], a
	inc de
	cp "@"
	jr nz, .loop
	ret

TitleDefenseBuildList:
; wCurMartCount, wCurMartItems = the unlocked challengers + 1, then -1
	ld hl, wCurMartItems
	ld c, 0
.loop
	ld a, c
	cp NUM_TITLE_CHALLENGERS
	jr nc, .done
	push hl
	push bc
	call TitleDefenseIsUnlocked
	pop bc
	pop hl
	jr nc, .next
	ld a, c
	inc a
	ld [hli], a
.next
	inc c
	jr .loop

.done
	ld [hl], -1
	ld a, l
	sub LOW(wCurMartItems)
	ld [wCurMartCount], a
	ret

TitleDefenseMenu::
; The unlocked challengers in a scrolling list, a mark on those beaten before.
; wScriptVar = the challenger picked + 1, also kept in wTitleDefenseChallenger
; (its name in wStringBuffer3), or 0 for none.
	call TitleDefenseBuildList
	ld de, TitleDefenseMarkGFX
	ld hl, vTiles2 tile TITLE_DEFENSE_MARK_TILE
	lb bc, BANK(TitleDefenseMarkGFX), 1
	call Get2bpp
	ld hl, .MenuHeader
	call LoadMenuHeader
	xor a
	ld [wMenuScrollPosition], a
	ld [wWhichIndexSet], a
	inc a
	ld [wMenuCursorPosition], a
	call InitScrollingMenu
	call UpdateSprites
	call ScrollingMenu
	call CloseWindow
	ld a, [wMenuJoypad]
	cp B_BUTTON
	jr z, .cancel
	ld a, [wMenuSelection]
	cp -1
	jr z, .cancel
	ld [wScriptVar], a
	call TitleDefenseSetPending
	ld a, [wScriptVar]
	dec a
	jr TitleDefenseCopyName

.cancel
	xor a
	ld [wScriptVar], a
	ret

.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 1, 1, 16, 9
	dw .MenuData
	db 1 ; default option

.MenuData:
	db SCROLLINGMENU_DISPLAY_ARROWS ; flags
	db 4, 13 ; rows, columns
	db SCROLLINGMENU_ITEMS_NORMAL ; item format
	dbw 0, wCurMartCount
	dba .PlaceName
	dba .PlaceMark
	dbw 0, 0

.PlaceName:
	push de
	ld a, [wMenuSelection]
	dec a
	ld c, TITLE_CHALLENGER_NAME
	call TitleDefenseGetField
	ld a, [hli]
	ld d, [hl]
	ld e, a
	pop hl
	rst PlaceString
	ret

.PlaceMark:
	push de
	ld a, [wMenuSelection]
	dec a
	call TitleDefenseIsBeaten
	pop hl
	ret z
	ld [hl], TITLE_DEFENSE_MARK_TILE
	ret

TitleDefenseCancel::
; No challenge pending
	xor a
	jmp TitleDefenseSetPending

TitleDefenseSetup::
; For the Finals arena: wScriptVar = 0 with no challenge pending, else 1 for a
; challenger alone or 2 with a partner. Their sprites go on
; SPRITE_BATTLE_TOWER_OPPONENT and SPRITE_TITLE_PARTNER, the name in
; wStringBuffer3.
	call TitleDefenseGetPending
	ld [wScriptVar], a
	and a
	ret z
	dec a
	push af
	call TitleDefenseCopyName
	pop af
	ld c, TITLE_CHALLENGER_SPRITE
	call TitleDefenseGetField
	ld a, [hli]
	ld [wVariableSprites + SPRITE_BATTLE_TOWER_OPPONENT - SPRITE_VARS], a
	ld b, 1
	ld a, [hl]
	and a
	jr z, .done
	ld [wVariableSprites + SPRITE_TITLE_PARTNER - SPRITE_VARS], a
	inc b
.done
	ld a, b
	ld [wScriptVar], a
	ret

TitleDefenseIntro::
; Print the pending challenger's opening line (WCFinals_ChallengerTexts)
	xor a
	call TitleDefenseGetText
	ld a, BANK(WCFinals_ChallengerTexts)
	jmp FarPrintText

TitleDefenseGetText:
; hl = text a (0 intro, 1 beaten, 2 won) of the pending challenger
	push af
	call TitleDefenseGetPending
	dec a
	ld l, a
	ld h, 0
	ld c, l
	ld b, h
	add hl, hl
	add hl, bc
	add hl, hl ; × 6
	pop af
	add a
	ld c, a
	ld b, 0
	add hl, bc
	ld bc, WCFinals_ChallengerTexts
	add hl, bc
	ld a, BANK(WCFinals_ChallengerTexts)
	jmp GetFarWord

TitleDefenseLoadTrainer::
; The pending challenger, as loadtrainer, loadvar VAR_BATTLETYPE,
; BATTLETYPE_CANLOSE and winlosstext do
	ld a, (1 << 7) | 1
	ld [wBattleScriptFlags], a
	call TitleDefenseGetPending
	dec a
	ld c, TITLE_CHALLENGER_CLASS
	call TitleDefenseGetField
	ld a, [hli]
	ld [wOtherTrainerClass], a
	ld a, [hl]
	ld [wOtherTrainerID], a
	ld a, BATTLETYPE_CANLOSE
	ld [wBattleType], a
	ld a, 1
	call TitleDefenseGetText
	ld a, l
	ld [wWinTextPointer], a
	ld a, h
	ld [wWinTextPointer + 1], a
	ld a, 2
	call TitleDefenseGetText
	ld a, l
	ld [wLossTextPointer], a
	ld a, h
	ld [wLossTextPointer + 1], a
	ret

TitleDefenseWon::
; After a win: wTitleDefenses + 1 (up to 65535)
	ldh a, [rSVBK]
	push af
	ld a, BANK(wTitleDefenses)
	ldh [rSVBK], a
	ld hl, wTitleDefenses + 1
	inc [hl]
	jr nz, .counted
	dec hl
	inc [hl]
	jr nz, .counted
	ld a, $ff
	ld [hli], a
	ld [hl], a
.counted
	pop af
	ldh [rSVBK], a
	ret

TitleDefenseBP::
; wScriptVar = the pending challenger's BP for a first win
	call TitleDefenseGetPending
	dec a
	ld c, TITLE_CHALLENGER_BP
	call TitleDefenseGetField
	ld a, [hl]
	ld [wScriptVar], a
	ret

TitleDefensePrizeQuantity::
; wScriptVar = how many of the first-win item are due, 0 if the challenger was
; beaten before
	call TitleDefenseGetPending
	dec a
	push af
	call TitleDefenseIsBeaten
	pop bc
	ld a, 0
	jr nz, .done
	ld a, b
	ld c, TITLE_CHALLENGER_QUANTITY
	call TitleDefenseGetField
	ld a, [hl]
.done
	ld [wScriptVar], a
	ret

TitleDefensePrizeItem::
; wScriptVar = the first-win item's ID (for verbosegiveitem ITEM_FROM_MEM)
	call TitleDefenseGetPending
	dec a
	ld c, TITLE_CHALLENGER_ITEM
	call TitleDefenseGetField
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call GetItemIDFromIndex
	ld [wScriptVar], a
	ret

TitleDefenseMarkBeaten::
; Set the pending challenger's beaten flag
	call TitleDefenseGetPending
	dec a
	ld c, TITLE_CHALLENGER_BEATEN_FLAG
	call TitleDefenseGetField
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld b, SET_FLAG
	jmp EventFlagAction

TitleDefenseMarkGFX:
INCBIN "gfx/title_defense/beaten.2bpp"

INCLUDE "data/events/title_defense.asm"

; the challengers' lines (text_far from WCFinals_ChallengerTexts)

_TDSilverText::
	text "Silver: So the"
	line "World Champion"
	cont "is you."

	para "A title just"
	line "makes you a"
	cont "bigger target."
	done

_TDSilverBeatenText::
	text "…Tch. Fine."
	line "I'll be back."
	done

_TDSilverWonText::
	text "Is that all the"
	line "Champion's got?"
	done

_TDGreenText::
	text "Green: Hey,"
	line "Champ!"

	para "Mind if I take a"
	line "shot at that"
	cont "title of yours?"
	done

_TDGreenBeatenText::
	text "Ha! You really"
	line "earned that Cup."
	done

_TDGreenWonText::
	text "Looks like I'm"
	line "the stronger one!"
	done

_TDWallyText::
	text "Wally: <PLAYER>!"
	line "I've trained every"
	cont "day to stand here."

	para "Please battle me!"
	done

_TDWallyBeatenText::
	text "Not there yet…"
	line "But soon!"
	done

_TDWallyWonText::
	text "I… I did it!"
	line "I won!"
	done

_TDLanceText::
	text "Lance: The World"
	line "Champion…"

	para "Show me the power"
	line "that won the Cup!"
	done

_TDLanceBeatenText::
	text "Your bond with"
	line "#mon is true."
	done

_TDLanceWonText::
	text "A Champion must"
	line "never falter."
	done

_TDAgathaText::
	text "Agatha: Hah!"
	line "Still strutting"
	cont "with that title?"

	para "Let an old lady"
	line "show you how!"
	done

_TDAgathaBeatenText::
	text "Hmph. Not bad"
	line "for a youngster."
	done

_TDAgathaWonText::
	text "Fifty years too"
	line "early, kid!"
	done

_TDStevenText::
	text "Steven: I came to"
	line "see how far you"
	cont "have come."

	para "Let's have a real"
	line "battle!"
	done

_TDStevenBeatenText::
	text "Splendid! You"
	line "shine like a gem."
	done

_TDStevenWonText::
	text "You still have"
	line "rough edges."
	done

_TDTateLizaText::
	text "Tate: We saw"
	line "this coming!"

	para "Liza: And we'll"
	line "win together!"
	done

_TDTateLizaBeatenText::
	text "Tate: Our minds…"
	line "Liza: …came apart!"
	done

_TDTateLizaWonText::
	text "Tate & Liza: Just"
	line "as we foresaw!"
	done

_TDKimonoGirlsText::
	text "Naoko: We danced"
	line "all the way here…"

	para "Zuki: …to see"
	line "your #mon"
	cont "dance!"
	done

_TDKimonoGirlsBeatenText::
	text "Naoko: Graceful…"
	line "Zuki: Beautiful."
	done

_TDKimonoGirlsWonText::
	text "Zuki: Our dance"
	line "was a step ahead!"
	done

_TDTwinsText::
	text "Amy: We're the"
	line "challengers!"

	para "May: We came all"
	line "this way for you!"
	done

_TDTwinsBeatenText::
	text "Amy: Aww…"
	line "May: Next time!"
	done

_TDTwinsWonText::
	text "Amy & May: We're"
	line "the Champions!"
	done

_TDAceDuoText::
	text "Kai: We beat every"
	line "Ace in the world."

	para "Rin: You're the"
	line "last one left!"
	done

_TDAceDuoBeatenText::
	text "Rin: So that's a"
	line "World Champion…"
	done

_TDAceDuoWonText::
	text "Kai: Too slow,"
	line "Champion!"
	done

_TDRedText::
	text "Red: …"

	para "……"

	para "……!"
	done

_TDRedBeatenText::
	text "…"
	done

_TDRedWonText::
	text "……"
	done
