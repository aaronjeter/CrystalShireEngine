	object_const_def
	const CHALLENGERLOBBY_FRONTCLERK
	const CHALLENGERLOBBY_TITLECLERK
	const CHALLENGERLOBBY_NURSE
	const CHALLENGERLOBBY_COOLTRAINER_F
	const CHALLENGERLOBBY_SUPER_NERD
	const CHALLENGERLOBBY_BLACK_BELT
	const CHALLENGERLOBBY_BEAUTY
	const CHALLENGERLOBBY_GRAMPS
	const CHALLENGERLOBBY_LASS

WCChallengerLobby_MapScripts:
	def_scene_scripts

	def_callbacks


WCChallengerLobby_ClerkStopsYouScript:
	checkevent EVENT_WORLD_CUP_QUALIFIED
	iftrue .done
	playmusic MUSIC_ROCKET_ENCOUNTER
	showemote EMOTE_SHOCK, CHALLENGERLOBBY_FRONTCLERK, 10
	opentext
	writetext WCChallengerLobby_WaitPlayer
	waitbutton
	closetext
	turnobject PLAYER, DOWN
	opentext
	writetext WCChallengerLobby_NotQualified
	waitbutton
	closetext
	applymovement PLAYER, WCChallengerLobby_StepBackMovement
	special RestartMapMusic
.done
	end

WCChallengerLobby_StepBackMovement:
	step DOWN
	step DOWN
	step_end

WCChallengerLobby_WaitPlayer:
	text "Wait!"
	done

WCChallengerLobby_NotQualified:
	text "I'm sorry, but"
	line "you may not pass."

	para "World Cup"
	line "challengers only"
	cont "past here."
	done


ChallengerLobbyFrontClerkScript:
	faceplayer
	opentext
	writetext ChallengerLobbyFrontClerkText
	promptbutton
	closetext
	end


ChallengerLobbyFrontClerkText:
	text "Hi <PLAY_G>!"

	para "The World Cup"
	line "Challenges are"

	para "right past here."
	done


WCChallengerLobby_TitleDefenseEntranceScript:
	checkevent EVENT_WORLD_CUP_CHAMPION
	iftrue .done
	playmusic MUSIC_ROCKET_ENCOUNTER
	showemote EMOTE_SHOCK, CHALLENGERLOBBY_TITLECLERK, 10
	opentext
	writetext WCChallengerLobby_WaitPlayer
	waitbutton
	closetext
	turnobject PLAYER, DOWN
	opentext
	writetext WCChallengerLobby_NotChampion
	waitbutton
	closetext
	applymovement PLAYER, WCChallengerLobby_StepBackMovement
	special RestartMapMusic
.done
	end

WCChallengerLobby_NotChampion:
	text "I'm sorry, but"
	line "you may not pass."

	para "Only the current"
	line "World Champion"
	cont "may enter."
	done


ChallengerLobbyTitleClerkScript:
	faceplayer
	opentext
	checkevent EVENT_WORLD_CUP_CHAMPION
	iffalse .NotChampion
	writetext ChallengerLobbyTitleClerkText
	yesorno
	iffalse .Declined
	writetext ChallengerLobbyWhichChallengerText
	special TitleDefenseMenu
	iffalse .Declined
	writetext ChallengerLobbyReadyText
	yesorno
	iffalse .Cancel
	special HealParty
	writetext ChallengerLobbyGoodLuckText
	waitbutton
	closetext
	setmapscene WC_FINALS, SCENE_WCFINALS_TITLE_DEFENSE
	warp WC_FINALS, 6, 13
	end

.NotChampion:
	writetext WCChallengerLobby_NotChampion
	waitbutton
	closetext
	end

.Cancel:
	special TitleDefenseCancel
.Declined:
	writetext ChallengerLobbyComeBackText
	waitbutton
	closetext
	end


ChallengerLobbyTitleClerkText:
	text "Hello <PLAY_G>!"

	para "Challengers are"
	line "waiting to face"
	cont "the World"
	cont "Champion."

	para "Will you accept"
	line "a challenge?"
	done

ChallengerLobbyWhichChallengerText:
	text "Which challenger"
	line "will you face?"
	done

ChallengerLobbyReadyText:
	text_ram wStringBuffer3
	text " it is!"

	para "Are you ready to"
	line "enter the arena?"
	done

ChallengerLobbyGoodLuckText:
	text "Your #mon have"
	line "been restored."

	para "Good luck,"
	line "Champion!"
	done

ChallengerLobbyComeBackText:
	text "The challengers"
	line "will be waiting!"
	done

ChallengerLobbyNurseScript:
	jumpstd PokecenterNurseScript


ChallengerLobbyCooltrainerFScript:
	checkevent EVENT_WORLD_CUP_CHAMPION
	iftrue .Champion
	jumptextfaceplayer ChallengerLobbyCooltrainerFText

.Champion
	jumptextfaceplayer ChallengerLobbyCooltrainerFChampionText

ChallengerLobbyCooltrainerFText:
	text "Trainers from"
	line "every region are"
	cont "here!"

	para "I'm so nervous,"
	line "even my #mon"
	cont "can tell."
	done

ChallengerLobbyCooltrainerFChampionText:
	text "You're the World"
	line "Champion?"

	para "Can I shake your"
	line "hand? And maybe"
	cont "your #mon's?"
	done

ChallengerLobbySuperNerdScript:
	checkevent EVENT_WORLD_CUP_CHAMPION
	iftrue .Champion
	jumptextfaceplayer ChallengerLobbySuperNerdText

.Champion
	jumptextfaceplayer ChallengerLobbySuperNerdChampionText

ChallengerLobbySuperNerdText:
	text "I've charted every"
	line "matchup in the"
	cont "bracket."

	para "By my math, I win"
	line "the whole thing..."

	para "...in about twelve"
	line "years."
	done

ChallengerLobbySuperNerdChampionText:
	text "My charts never"
	line "predicted you."

	para "I'm going to need"
	line "a bigger notebook."
	done

ChallengerLobbyBlackBeltScript:
	checkevent EVENT_WORLD_CUP_CHAMPION
	iftrue .Champion
	jumptextfaceplayer ChallengerLobbyBlackBeltText

.Champion
	jumptextfaceplayer ChallengerLobbyBlackBeltChampionText

ChallengerLobbyBlackBeltText:
	text "Hwah! A hundred"
	line "push-ups before"
	cont "every round!"

	para "My #mon do four"
	line "hundred!"
	done

ChallengerLobbyBlackBeltChampionText:
	text "Even the World"
	line "Champion needs"
	cont "push-ups!"

	para "Come on, join us!"
	line "Hwah! Hwah!"
	done

ChallengerLobbyBeautyScript:
	checkevent EVENT_WORLD_CUP_CHAMPION
	iftrue .Champion
	jumptextfaceplayer ChallengerLobbyBeautyText

.Champion
	jumptextfaceplayer ChallengerLobbyBeautyChampionText

ChallengerLobbyBeautyText:
	text "I'm here to win,"
	line "of course."

	para "But I packed three"
	line "outfits for the"
	cont "photos, just in"
	cont "case."
	done

ChallengerLobbyBeautyChampionText:
	text "Your victory photo"
	line "is on every screen"
	cont "in the Resort!"

	para "...I should have"
	line "packed a fourth"
	cont "outfit."
	done

ChallengerLobbyGrampsScript:
	checkevent EVENT_WORLD_CUP_CHAMPION
	iftrue .Champion
	jumptextfaceplayer ChallengerLobbyGrampsText

.Champion
	jumptextfaceplayer ChallengerLobbyGrampsChampionText

ChallengerLobbyGrampsText:
	text "I won a League"
	line "fifty years ago."

	para "Now my grandson is"
	line "in the bracket,"
	cont "and my hands won't"
	cont "stop shaking!"
	done

ChallengerLobbyGrampsChampionText:
	text "We cheered for you"
	line "in the final!"

	para "Well... after my"
	line "grandson lost to"
	cont "you, that is."
	done

ChallengerLobbyLassScript:
	checkevent EVENT_WORLD_CUP_CHAMPION
	iftrue .Champion
	jumptextfaceplayer ChallengerLobbyLassText

.Champion
	jumptextfaceplayer ChallengerLobbyLassChampionText

ChallengerLobbyLassText:
	text "Johto, Kanto and"
	line "Hoenn trainers,"
	cont "all in one hall!"

	para "I've been trading"
	line "tips with everyone"
	cont "I meet."
	done

ChallengerLobbyLassChampionText:
	text "Everyone's asking"
	line "how you built your"
	cont "team."

	para "Any tips for me?"
	line "Pretty please?"
	done

WCChallengerLobby_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event   39, 38, WORLD_CUP_LOBBY, 3
	warp_event   39, 39, WORLD_CUP_LOBBY, 4
	warp_event   08, 14, WC_ROUND_ONE, 1
	warp_event   09, 14, WC_ROUND_ONE, 2

	def_coord_events
	coord_event  30,  30, -1, WCChallengerLobby_ClerkStopsYouScript
	coord_event  31,  30, -1, WCChallengerLobby_ClerkStopsYouScript
	coord_event  30,  16, -1, WCChallengerLobby_TitleDefenseEntranceScript
	coord_event  31,  16, -1, WCChallengerLobby_TitleDefenseEntranceScript

	def_bg_events
	

	def_object_events
	object_event  34, 31, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ChallengerLobbyFrontClerkScript, -1
	object_event  34, 15, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ChallengerLobbyTitleClerkScript, -1
	object_event  03, 15, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, ChallengerLobbyNurseScript, -1
	object_event  27, 35, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ChallengerLobbyCooltrainerFScript, -1
	object_event  36, 36, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ChallengerLobbySuperNerdScript, -1
	object_event  11, 19, SPRITE_BLACK_BELT, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ChallengerLobbyBlackBeltScript, -1
	object_event  01, 19, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, ChallengerLobbyBeautyScript, -1
	object_event  19, 23, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ChallengerLobbyGrampsScript, -1
	object_event  34, 21, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ChallengerLobbyLassScript, -1
