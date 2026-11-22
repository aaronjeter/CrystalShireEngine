	object_const_def
	const WCFINALS_TROPHY
	const WCFINALS_OAK
	const WCFINALS_CHALLENGER
	const WCFINALS_PARTNER

WCFinals_MapScripts:
	def_scene_scripts
	scene_script WCFinalsNoopScene,         SCENE_WCFINALS_OAK
	scene_script WCFinalsTitleDefenseScene, SCENE_WCFINALS_TITLE_DEFENSE
	scene_script WCFinalsNoopScene,         SCENE_WCFINALS_DONE

	def_callbacks
	callback MAPCALLBACK_OBJECTS, WCFinalsObjectsCallback

WCFinalsObjectsCallback:
; Oak for the World Cup final; the challenger (and partner) for a title defense
	setevent EVENT_WC_FINALS_CHALLENGER
	setevent EVENT_WC_FINALS_PARTNER
	checkscene
	iftrue .TitleDefense
	clearevent EVENT_WC_FINALS_OAK
	endcallback

.TitleDefense:
	setevent EVENT_WC_FINALS_OAK
	special TitleDefenseSetup
	iffalse .done
	clearevent EVENT_WC_FINALS_CHALLENGER
	ifequal 1, .done
	clearevent EVENT_WC_FINALS_PARTNER
.done
	endcallback

WCFinalsTitleDefenseScene:
	sdefer WCFinalsTitleDefenseScript
	setscene SCENE_WCFINALS_DONE
WCFinalsNoopScene:
	end

WCFinalsTitleDefenseScript:
	applymovement PLAYER, WCFinals_WalkToChallengerMovement
	opentext
	writetext WCFinalsAnnouncerText
	waitbutton
	special TitleDefenseIntro
	waitbutton
	closetext
	special TitleDefenseLoadTrainer
	setlasttalked WCFINALS_CHALLENGER
	startbattle
	reloadmap
	iftrue .Lost
	special HealParty
	special TitleDefenseWon
	opentext
	writetext WCFinalsDefendedText
	promptbutton
	special TitleDefensePrizeQuantity
	iffalse .Done
	ifequal 1, .OneItem
	special TitleDefensePrizeItem
	verbosegiveitem ITEM_FROM_MEM, 3
	iffalse .Done
	sjump .FirstWin

.OneItem:
	special TitleDefensePrizeItem
	verbosegiveitem ITEM_FROM_MEM
	iffalse .Done
.FirstWin:
	special TitleDefenseMarkBeaten
	special TitleDefenseBP
	special GiveBattlePoints
	writetext WCFinalsGotBPText
	playsound SFX_ITEM
	waitsfx
	promptbutton
.Done:
	writetext WCFinalsSeeYouText
	waitbutton
	closetext
	sjump .Leave

.Lost:
	special HealParty
	opentext
	writetext WCFinalsLostText
	waitbutton
	closetext
.Leave:
	special TitleDefenseCancel
	warp WC_CHALLENGER_LOBBY, 34, 17
	end

WCFinals_WalkToChallengerMovement:
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step_end

WCFinalsTrophyScript:
	checkevent EVENT_WORLD_CUP_CHAMPION
	iftrue .Engraved
	sjump WCFinalsEventScript

.Engraved:
	jumptext WCFinalsTrophyText

WCFinalsEventScript:
	opentext
	writetext WCFinalsOakIntroText
	waitbutton
	closetext

	follow WCFINALS_OAK, PLAYER
	applymovement WCFINALS_OAK, WCFinals_WalkUpWithOak
	stopfollow
	turnobject PLAYER, RIGHT

	opentext
	writetext WCFinalsOakChallengeText
	waitbutton
	closetext

	winlosstext WCFinalsOakBeatenText, 0
	loadtrainer OAK, WC_OAK

	startbattle
	reloadmapafterbattle
	special HealParty
	setevent EVENT_DECO_GOLD_TROPHY

	opentext 
	writetext WCFinalsOakAfterBattleText
	waitbutton
	closetext

	setevent EVENT_WORLD_CUP_CHAMPION
	
	halloffame LEAGUE_WORLD_CUP
	end

WCFinals_WalkUpWithOak:
	step UP
	step UP
	step UP
	step UP
	step UP
	step RIGHT
	turn_head LEFT
	step_end


WCFinalsOakIntroText:
	text "<PLAY_G>!"
	line "Congratulations!"

	para "I knew you were"
	line "something special"
	cont "the day we met!"

	para "As the last"
	line "standing challen-"
	cont "ger, you may"
	cont "now face the Cup."

	para "Your skill, your"
	line "training, your"
	cont "unbreakable bond"
	cont "with your #mon"
	cont "bring you here..."

	para "Standing here,"
	line "you join the"
	cont "elite few."

	para "You have won"
	line "renown that will"
	cont "last forever."

	para "Please follow"
	line "me."
	done

WCFinalsOakChallengeText:
	text "You see, the Cup"
	line "belongs to the"
	cont "#mon League"
	cont "World Champion."

	para "Which is to say"
	line "<PLAY_G>..."

	para "You have come to"
	line "to claim MY"
	cont "Trophy!"

	para "I, Samuel Oak,"
	line "Champion of"
	cont "The World #mon"
	cont "League, accept"
	cont "your challenge!"
	done

WCFinalsOakBeatenText:
	text "Extraordinary!"
	done

WCFinalsOakAfterBattleText:
	text "Ah, I'm filled"
	line "with pride to"
	cont "crown a new"
	cont "Champion!"

	para "May your reign"
	line "as Champion be"
	cont "as much a joy"
	cont "as mine!"

	para "Now, claim the"
	line "Cup, and go"
	cont "down in history!"
	done
	

WCFinalsTrophyText:
	text "The World Cup."

	para "<PLAYER>'s name"
	line "is engraved on"
	cont "it!"
	done

WCFinalsAnnouncerText:
	text "Announcer: The"
	line "World Champion,"
	cont "<PLAYER>, defends"
	cont "the title against"
	cont "@"
	text_ram wStringBuffer3
	text "!"
	done

WCFinalsDefendedText:
	text "Announcer: The"
	line "Champion keeps"
	cont "the title!"
	done

WCFinalsGotBPText:
	text "<PLAYER>"
	line "received @"
	text_decimal wScriptVar, 1, 2
	text " BP!"
	done

WCFinalsSeeYouText:
	text "Announcer: Until"
	line "the next title"
	cont "challenge!"
	done

WCFinalsLostText:
	text "Announcer: The"
	line "challenger takes"
	cont "this match!"

	para "The Champion may"
	line "accept a new"
	cont "challenge at any"
	cont "time!"
	done

; TD_* order: the opening line, then the challenger's lines on losing and on
; winning (as winlosstext)
WCFinals_ChallengerTexts::
	table_width 6
	dw WCFinalsSilverText,      WCFinalsSilverBeatenText,      WCFinalsSilverWonText
	dw WCFinalsGreenText,       WCFinalsGreenBeatenText,       WCFinalsGreenWonText
	dw WCFinalsWallyText,       WCFinalsWallyBeatenText,       WCFinalsWallyWonText
	dw WCFinalsLanceText,       WCFinalsLanceBeatenText,       WCFinalsLanceWonText
	dw WCFinalsAgathaText,      WCFinalsAgathaBeatenText,      WCFinalsAgathaWonText
	dw WCFinalsStevenText,      WCFinalsStevenBeatenText,      WCFinalsStevenWonText
	dw WCFinalsTateLizaText,    WCFinalsTateLizaBeatenText,    WCFinalsTateLizaWonText
	dw WCFinalsKimonoGirlsText, WCFinalsKimonoGirlsBeatenText, WCFinalsKimonoGirlsWonText
	dw WCFinalsTwinsText,       WCFinalsTwinsBeatenText,       WCFinalsTwinsWonText
	dw WCFinalsAceDuoText,      WCFinalsAceDuoBeatenText,      WCFinalsAceDuoWonText
	dw WCFinalsRedText,         WCFinalsRedBeatenText,         WCFinalsRedWonText
	dw WCFinalsArcherText, WCFinalsArcherBeatenText, WCFinalsArcherWonText
	dw WCFinalsJaneText, WCFinalsJaneBeatenText, WCFinalsJaneWonText
	dw WCFinalsGiovanniText, WCFinalsGiovanniBeatenText, WCFinalsGiovanniWonText
	assert_table_length NUM_TITLE_CHALLENGERS

WCFinalsSilverText:
	text_far _TDSilverText
	text_end

WCFinalsSilverBeatenText:
	text_far _TDSilverBeatenText
	text_end

WCFinalsSilverWonText:
	text_far _TDSilverWonText
	text_end

WCFinalsGreenText:
	text_far _TDGreenText
	text_end

WCFinalsGreenBeatenText:
	text_far _TDGreenBeatenText
	text_end

WCFinalsGreenWonText:
	text_far _TDGreenWonText
	text_end

WCFinalsWallyText:
	text_far _TDWallyText
	text_end

WCFinalsWallyBeatenText:
	text_far _TDWallyBeatenText
	text_end

WCFinalsWallyWonText:
	text_far _TDWallyWonText
	text_end

WCFinalsLanceText:
	text_far _TDLanceText
	text_end

WCFinalsLanceBeatenText:
	text_far _TDLanceBeatenText
	text_end

WCFinalsLanceWonText:
	text_far _TDLanceWonText
	text_end

WCFinalsAgathaText:
	text_far _TDAgathaText
	text_end

WCFinalsAgathaBeatenText:
	text_far _TDAgathaBeatenText
	text_end

WCFinalsAgathaWonText:
	text_far _TDAgathaWonText
	text_end

WCFinalsStevenText:
	text_far _TDStevenText
	text_end

WCFinalsStevenBeatenText:
	text_far _TDStevenBeatenText
	text_end

WCFinalsStevenWonText:
	text_far _TDStevenWonText
	text_end

WCFinalsTateLizaText:
	text_far _TDTateLizaText
	text_end

WCFinalsTateLizaBeatenText:
	text_far _TDTateLizaBeatenText
	text_end

WCFinalsTateLizaWonText:
	text_far _TDTateLizaWonText
	text_end

WCFinalsKimonoGirlsText:
	text_far _TDKimonoGirlsText
	text_end

WCFinalsKimonoGirlsBeatenText:
	text_far _TDKimonoGirlsBeatenText
	text_end

WCFinalsKimonoGirlsWonText:
	text_far _TDKimonoGirlsWonText
	text_end

WCFinalsTwinsText:
	text_far _TDTwinsText
	text_end

WCFinalsTwinsBeatenText:
	text_far _TDTwinsBeatenText
	text_end

WCFinalsTwinsWonText:
	text_far _TDTwinsWonText
	text_end

WCFinalsAceDuoText:
	text_far _TDAceDuoText
	text_end

WCFinalsAceDuoBeatenText:
	text_far _TDAceDuoBeatenText
	text_end

WCFinalsAceDuoWonText:
	text_far _TDAceDuoWonText
	text_end

WCFinalsRedText:
	text_far _TDRedText
	text_end

WCFinalsRedBeatenText:
	text_far _TDRedBeatenText
	text_end

WCFinalsRedWonText:
	text_far _TDRedWonText
	text_end

WCFinalsArcherText:
	text_far _TDArcherText
	text_end

WCFinalsArcherBeatenText:
	text_far _TDArcherBeatenText
	text_end

WCFinalsArcherWonText:
	text_far _TDArcherWonText
	text_end

WCFinalsJaneText:
	text_far _TDJaneText
	text_end

WCFinalsJaneBeatenText:
	text_far _TDJaneBeatenText
	text_end

WCFinalsJaneWonText:
	text_far _TDJaneWonText
	text_end

WCFinalsGiovanniText:
	text_far _TDGiovanniText
	text_end

WCFinalsGiovanniBeatenText:
	text_far _TDGiovanniBeatenText
	text_end

WCFinalsGiovanniWonText:
	text_far _TDGiovanniWonText
	text_end

WCFinals_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event   06, 13, WC_ROUND_FOUR, 3
	warp_event   07, 13, WC_ROUND_FOUR, 4

	def_coord_events
	coord_event  06,  11, SCENE_WCFINALS_OAK, WCFinalsEventScript
	coord_event  07,  11, SCENE_WCFINALS_OAK, WCFinalsEventScript

	def_bg_events

	def_object_events
	object_event  06, 02, SPRITE_GOLD_TROPHY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WCFinalsTrophyScript, -1
	object_event  06, 10, SPRITE_OAK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WCFinalsEventScript, EVENT_WC_FINALS_OAK
	object_event  06, 05, SPRITE_BATTLE_TOWER_OPPONENT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_DEFAULT, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_WC_FINALS_CHALLENGER
	object_event  07, 05, SPRITE_TITLE_PARTNER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_DEFAULT, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_WC_FINALS_PARTNER
