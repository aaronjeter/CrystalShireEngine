	object_const_def

StevensRoom_MapScripts:
	def_scene_scripts

	def_callbacks

StevenScript_Battle:
	faceplayer
	opentext	
	writetext StevenScript_StevenBeforeText
	waitbutton
	closetext

	readvar VAR_BADGES
	ifgreater 15, .Hard
	sjump .Easy

.Hard
	winlosstext StevenScript_StevenBeatenText, 0
	loadtrainer STEVEN, STEVEN2
	sjump .Fight

.Easy
	winlosstext StevenScript_StevenBeatenText, 0
	loadtrainer STEVEN, STEVEN1
	sjump .Fight

.Fight	
	startbattle
	reloadmapafterbattle

	opentext 
	writetext StevenScript_RoundTwoText
	waitbutton
	closetext
	special HealParty

	winlosstext StevenScript_RoundTwoBeatenText, 0
	loadtrainer STEVEN, STEVEN3
	startbattle
	reloadmapafterbattle

	opentext
	writetext StevenScript_StevenDefeatText
	waitbutton
	closetext
	waitsfx
	special HealParty
	;Give beat elite 4 goodies
	loadmem wEliteFourXpBoost, 1
	setevent EVENT_BEAT_HOENN_LEAGUE
	scall StevensRoomLevelcap

	halloffame
	end

StevensRoomLevelcap:
	jumpstd UpdateWorldLevelsScript
	end

StevenScript_StevenBeforeText:
	text "Well, here we"
	line "are <PLAYER>!"

	para "I've been hearing"
	line "wonderful things"
	cont "about you."

	para "I knew you"
	line "would make it"
	cont "to me eventually."

	para "My name is"
	line "Steven."

	para "Now, show me..."

	para "Show me what"
	line "your journey"

	para "here has taught"
	line "you!"
	done

StevenScript_StevenBeatenText:
	text "Ah, I fall in"
	line "defeat..."
	done

StevenScript_RoundTwoText:
	text "You know..."

	para "I don't much care"
	line "for losing..."

	para "The team you faced"
	line "just now was"

	para "built to test"
	line "trainers such"
	cont "as yourself."

	para "But it isn't"
	line "the best I"
	cont "have to offer..."

	para "You're curious,"
	line "aren't you?"

	para "You didn't come"
	line "to stand before"

	para "me by shirking"
	line "a proper"
	cont "challenge."

	para "So..."

	para "Face a member"
	line "of my true team."

	para "One of the"
	line "#mon you"

	para "would face if"
	line "we meet in the"
	cont "World Cup!"

	para "Prepare yourself"
	line "<PLAYER>!"
	done

StevenScript_RoundTwoBeatenText:
	text "Ahhh..."
	line "Excellent!"
	done

StevenScript_StevenDefeatText:
	text "Well, I'm"
	line "convinced."

	para "You have proven"
	line "yourself entirely."

	para "Let me be the"
	line "first to regard"

	para "you as as"
	line "a Champion"
	cont "of Hoenn!"

	para "Now go forth"
	line "and triumph!"
	done

StevensRoom_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  04, 23, DRAKES_ROOM, 1
	warp_event  05, 23, DRAKES_ROOM, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  05, 03, SPRITE_LANCE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, StevenScript_Battle, -1
