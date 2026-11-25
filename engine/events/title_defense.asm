; World Cup title defense: the challenger list in the Challenger Lobby, the
; match in the Finals arena and its rewards (data/events/title_defense.asm).
; wTitleDefenseChallenger (save extension) holds the accepted challenger + 1
; until the match is over.

DEF TITLE_DEFENSE_MARK_TILE EQU $72 ; the "『" slot; in the overworld it holds a tileset tile

; the Challenger Lobby menu's list: a count, the challengers + 1, then -1
DEF wTitleDefenseListCount EQUS "wStringBuffer4"
DEF wTitleDefenseList EQUS "(wStringBuffer4 + 1)"
	assert NUM_TITLE_CHALLENGERS + 2 <= 2 * STRING_BUFFER_LENGTH, \
		"the challenger list doesn't fit in wStringBuffer4 and wStringBuffer5"

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
; carry if challenger a is on the list (never before the World Cup is won)
	push af
	ld de, EVENT_WORLD_CUP_CHAMPION
	call TitleDefenseCheckFlag
	jr nz, .champion
	pop af
	and a
	ret

.champion
	pop af
	call TitleDefenseGetChallenger
	ld a, [hli]
	ld e, [hl]
	inc hl
	ld d, [hl]
	cp TD_UNLOCK_FLAG
	jr z, .flag
	cp TD_UNLOCK_ROCKETS
	jr z, .rockets
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

.rockets
; TD_UNLOCK_ROCKETS: Archer, Jane and Petra beaten in title defenses
	ld de, EVENT_TITLE_DEFENSE_BEAT_ARCHER
	call TitleDefenseCheckFlag
	ret z
	ld de, EVENT_TITLE_DEFENSE_BEAT_JANE
	call TitleDefenseCheckFlag
	ret z
	ld de, EVENT_TITLE_DEFENSE_BEAT_PETRA
	call TitleDefenseCheckFlag
	ret z
	scf
	ret

TitleDefenseIsBeaten:
; nz if challenger a has been beaten before
	ld c, TITLE_CHALLENGER_BEATEN_FLAG
	call TitleDefenseGetField
	ld e, [hl]
	inc hl
	ld d, [hl]
	jp TitleDefenseCheckFlag

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
; wTitleDefenseListCount, wTitleDefenseList = the unlocked challengers + 1 in
; TitleDefenseOrder, then -1
	ld de, wTitleDefenseList
	ld hl, TitleDefenseOrder
.loop
	ld a, [hli]
	cp -1
	jr z, .done
	push hl
	push de
	push af
	call TitleDefenseIsUnlocked
	pop bc
	pop de
	pop hl
	jr nc, .loop
	ld a, b
	inc a
	ld [de], a
	inc de
	jr .loop

.done
	ld [de], a
	ld a, e
	sub LOW(wTitleDefenseList)
	ld [wTitleDefenseListCount], a
	ret

TitleDefenseCountBeaten:
; a = the challengers beaten in a title defense
	ld hl, TitleDefenseOrder
	ld c, 0
.loop
	ld a, [hli]
	cp -1
	jr z, .done
	push hl
	push bc
	call TitleDefenseIsBeaten
	pop bc
	pop hl
	jr z, .loop
	inc c
	jr .loop

.done
	ld a, c
	ret

TitleDefensePassportList::
; The Passport's "Beaten" list. de = the tilemap address of its first row.
; Prints the number beaten 11 tiles right of the row above, then up to
; TD_PASSPORT_ROWS of the challengers beaten, in TitleDefenseOrder, starting
; with the one at wPassportListTop, with an arrow 16 tiles right of the first
; or last row when the list goes on above or below. The number is also kept in
; wPassportListCount.
	push de
	call TitleDefenseCountBeaten
	ld [wPassportListCount], a
	pop hl
	push hl
	ld de, -SCREEN_WIDTH + 11
	add hl, de
	ld de, wPassportListCount
	lb bc, 1, 3
	call PrintNum
	pop de
; the arrows
	ld a, [wPassportListTop]
	and a
	jr z, .no_up
	ld hl, 16
	add hl, de
	ld [hl], "▲"
.no_up
	ld a, [wPassportListTop]
	add TD_PASSPORT_ROWS
	ld b, a
	ld a, [wPassportListCount]
	cp b
	jr c, .no_down
	jr z, .no_down
	ld hl, 16 + (TD_PASSPORT_ROWS - 1) * SCREEN_WIDTH
	add hl, de
	ld [hl], "▼"
.no_down
; the names
	ld a, [wPassportListTop]
	ld b, a ; beaten challengers left to skip
	ld c, TD_PASSPORT_ROWS ; rows left
	ld hl, TitleDefenseOrder
.loop
	ld a, [hli]
	cp -1
	ret z
	push hl
	push de
	push bc
	push af
	call TitleDefenseIsBeaten
	pop hl ; h = the challenger
	pop bc
	pop de
	jr z, .next
	inc b
	dec b
	jr z, .place
	dec b
.next
	pop hl
	jr .loop

.place
	push bc
	push de
	ld a, h
	ld c, TITLE_CHALLENGER_NAME
	call TitleDefenseGetField
	ld a, [hli]
	ld d, [hl]
	ld e, a
	pop hl
	push hl
	rst PlaceString
	pop hl
	ld bc, SCREEN_WIDTH
	add hl, bc
	ld d, h
	ld e, l
	pop bc
	dec c
	pop hl
	jr nz, .loop
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
; back up the whole screen: the menu's frame is drawn around its coords
	call LoadStandardMenuHeader
	ld hl, .MenuHeader
	call CopyMenuHeader
	xor a
	ld [wMenuScrollPosition], a
	ld [wWhichIndexSet], a
	inc a
	ld [wMenuCursorPosition], a
	call InitScrollingMenu
	call UpdateSprites
	call ScrollingMenu
	call CloseWindow
; the mark took a tileset tile: load the tileset's vTiles2 graphics again
	ld a, [wTilesetGFXBank]
	ldh [hTilesetGFXBank], a
	call _LoadTilesetGFX2
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
	jp TitleDefenseCopyName

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
	dbw 0, wTitleDefenseListCount
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

SECTION "Title Defense Text", ROMX

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

_TDArcherText::
	text "Archer: So the"
	line "Champion is the"
	cont "brat who ruined"
	cont "our broadcast."

	para "Team Rocket"
	line "rebuilds, and it"
	cont "starts with your"
	cont "title!"
	done

_TDArcherBeatenText::
	text "Defeated again…"
	line "Giovanni will"
	cont "hear of this."
	done

_TDArcherWonText::
	text "Hmph. The title"
	line "means nothing to"
	cont "Team Rocket."
	done

_TDJaneText::
	text "Jane: The desert"
	line "taught me"
	cont "patience."

	para "Now Latias and I"
	line "take what's left:"
	cont "your crown!"
	done

_TDJaneBeatenText::
	text "Latias… We'll"
	line "be back."
	done

_TDJaneWonText::
	text "The crown suits"
	line "Team Rocket"
	cont "better, no?"
	done

_TDGiovanniText::
	text "Giovanni: So you"
	line "are the one who"
	cont "scattered my"
	cont "Team Rocket."

	para "I've come to see"
	line "that strength for"
	cont "myself."
	done

_TDGiovanniBeatenText::
	text "Remarkable…"
	line "Team Rocket bows"
	cont "to no one, yet"
	cont "I bow to you."
	done

_TDGiovanniWonText::
	text "As I thought."
	line "Power belongs to"
	cont "those who seize"
	cont "it."
	done

_TDPetraText::
	text "Petra: Kanto was"
	line "mine until you"
	cont "came along."

	para "Absol and I have"
	line "sharpened our"
	cont "claws since the"
	cont "Safari Zone."

	para "Your title is"
	line "next!"
	done

_TDPetraBeatenText::
	text "...Impossible."
	line "Again?"
	done

_TDPetraWonText::
	text "Even a Champion"
	line "can be outplanned."
	done

_TDMarinaText::
	text "Marina:"
	line "I've been training"
	cont "since the"
	cont "Qualifiers."

	para "My team's ready"
	line "for a champion!"
	done

_TDMarinaBeatenText::
	text "You're as strong"
	line "as they say!"
	done

_TDMarinaWonText::
	text "The title suits"
	line "me better!"
	done

_TDJessText::
	text "Jess: Class is in"
	line "session!"

	para "Today's lesson:"
	line "how to lose a"
	cont "title!"
	done

_TDJessBeatenText::
	text "Class dismissed..."
	line "You pass."
	done

_TDJessWonText::
	text "Homework for you:"
	line "train harder!"
	done

_TDRonaldText::
	text "Ronald:"
	line "My team's not"
	cont "flashy, but it's"
	cont "tough to crack!"

	para "Let's see you"
	line "break through!"
	done

_TDRonaldBeatenText::
	text "You cracked it!"
	line "Wow!"
	done

_TDRonaldWonText::
	text "Told you! Tough"
	line "to crack!"
	done

_TDKlutchText::
	text "Klutch:"
	line "Dragons don't care"
	cont "about titles."

	para "Neither do I!"
	line "Let's go!"
	done

_TDKlutchBeatenText::
	text "My dragons..."
	line "outclassed?"
	done

_TDKlutchWonText::
	text "Dragons rule!"
	line "Ha ha!"
	done

_TDAmayaText::
	text "Amaya:"
	line "I'm not with Team"
	cont "Rocket! I just"
	cont "like the outfit."

	para "Now hand over"
	line "that title!"
	done

_TDAmayaBeatenText::
	text "Fine, keep it."
	line "...For now!"
	done

_TDAmayaWonText::
	text "The title's mine!"
	line "Told you!"
	done

_TDDaloricText::
	text "Daloric:"
	line "Six Megas, one"
	cont "title. Simple"
	cont "math."

	para "Ready?"
	done

_TDDaloricBeatenText::
	text "The math was"
	line "wrong..."
	done

_TDDaloricWonText::
	text "Six Megas never"
	line "lose!"
	done

_TDCrystalText::
	text "Crystal:"
	line "Noctowl and I"
	cont "have watched you"
	cont "for a while."

	para "Now we strike!"
	done

_TDCrystalBeatenText::
	text "You saw through"
	line "us!"
	done

_TDCrystalWonText::
	text "The night falls"
	line "on your reign!"
	done

_TDRossolonText::
	text "Rossolon:"
	line "Six Mega dragons."
	cont "Every one of them"
	cont "hungry."

	para "Hope you brought"
	line "Ice moves!"
	done

_TDRossolonBeatenText::
	text "Not even dragons"
	line "could do it..."
	done

_TDRossolonWonText::
	text "Dragons are the"
	line "true champions!"
	done

_TDBartoText::
	text "Barto:"
	line "A little bit of"
	cont "everything, and a"
	cont "lot of Azumarill!"

	para "Let's battle!"
	done

_TDBartoBeatenText::
	text "Even Azumarill"
	line "couldn't..."
	done

_TDBartoWonText::
	text "Drum roll for"
	line "the new champ!"
	done

_TDChaosText::
	text "Chaos:"
	line "Ice, fire, and a"
	cont "little chaos."

	para "That's my style!"
	done

_TDChaosBeatenText::
	text "Chaos... tamed?"
	done

_TDChaosWonText::
	text "Pure chaos!"
	line "Ha ha!"
	done

_TDEmmyText::
	text "Emmy:"
	line "My team's ready"
	cont "for anything."

	para "Are you?"
	done

_TDEmmyBeatenText::
	text "You really are"
	line "the champion!"
	done

_TDEmmyWonText::
	text "Gardevoir and I"
	line "make a great team!"
	done

_TDDaveText::
	text "Dave:"
	line "I foresaw this"
	cont "battle..."

	para "...and I foresaw"
	line "my victory!"
	done

_TDDaveBeatenText::
	text "I didn't see that"
	line "coming..."
	done

_TDDaveWonText::
	text "Just as I"
	line "predicted!"
	done

_TDAccadText::
	text "Accad:"
	line "A storm's rolling"
	cont "in, champ!"

	para "Hope you can"
	line "swim!"
	done

_TDAccadBeatenText::
	text "Washed ashore..."
	line "You win."
	done

_TDAccadWonText::
	text "Smooth sailing!"
	line "Har har!"
	done

_TDJeffText::
	text "Jeff:"
	line "Fresh powder,"
	cont "fresh challenger!"

	para "Let's shred!"
	done

_TDJeffBeatenText::
	text "Wiped out..."
	line "Nice run!"
	done

_TDJeffWonText::
	text "Totally rad!"
	line "Champ's mine!"
	done

_TDKyleText::
	text "Kyle:"
	line "Four Megas and a"
	cont "Snorlax. Guess"
	cont "which is the boss?"

	para "Let's find out!"
	done

_TDKyleBeatenText::
	text "Snorlax... wake"
	line "up..."
	done

_TDKyleWonText::
	text "Never doubt"
	line "a Snorlax!"
	done

_TDAaronText::
	text "Aaron:"
	line "So you're the"
	cont "champion everyone"
	cont "talks about."

	para "Let me test that"
	line "myself!"
	done

_TDAaronBeatenText::
	text "Well played."
	line "Truly."
	done

_TDAaronWonText::
	text "Back to the"
	line "drawing board!"
	done
