	object_const_def
	const CHALLENGERLOBBY_FRONTCLERK
	const CHALLENGERLOBBY_TITLECLERK
	const CHALLENGERLOBBY_NURSE

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
	writetext ChallengerLobbyTitleClerkText
	promptbutton
	closetext
	end


ChallengerLobbyTitleClerkText:
	text "Hello <PLAY_G>!"

	para "The World Champion"
	line "may accept title"
	cont "challenges here."
	done

ChallengerLobbyNurseScript:
	jumpstd PokecenterNurseScript


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
	object_event  33, 15, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ChallengerLobbyTitleClerkScript, -1
	object_event  03, 15, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, ChallengerLobbyNurseScript, -1
