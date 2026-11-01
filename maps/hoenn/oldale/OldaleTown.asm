	object_const_def
	const OLDALETOWN_NERD
	const OLDALETOWN_GUIDE

OldaleTown_MapScripts:
	def_scene_scripts

	def_callbacks	
	callback MAPCALLBACK_NEWMAP, OldaleTownFlypointCallback

OldaleTownFlypointCallback:
	setflag ENGINE_FLYPOINT_OLDALE
	endcallback

OldaleTown_PokedexCheckScript:
	checkflag ENGINE_POKEDEX
	iftrue .done
	opentext
	writetext OldaleTown_PokedexCheckText
	waitbutton
	closetext
	applymovement PLAYER, OldaleTown_StepRightMovement

.done
	end

OldaleTown_PokedexCheckText:
	text "I shouldn't go"
	line "this way yet."

	para "I'm still doing"
	line "a job for Prof."
	cont "Birch."
	done

OldaleTown_StepRightMovement:
	step RIGHT
	step RIGHT
	step_end

OldaleTownGuideScript:
; Gives the Map Card to players who don't have one yet (Hoenn starts),
; after a short tour like Cherrygrove's guide.
	faceplayer
	opentext
	checkflag ENGINE_MAP_CARD
	iftrue .HaveMapCard
	writetext OldaleGuideIntroText
	yesorno
	iffalse .No
	writetext OldaleGuideTourText
	waitbutton
	closetext
	playmusic MUSIC_SHOW_ME_AROUND
	follow OLDALETOWN_GUIDE, PLAYER
	applymovement OLDALETOWN_GUIDE, OldaleGuideMovement1
	opentext
	writetext OldaleGuidePokecenterText
	waitbutton
	closetext
	applymovement OLDALETOWN_GUIDE, OldaleGuideMovement2
	turnobject PLAYER, UP
	opentext
	writetext OldaleGuideMartText
	waitbutton
	closetext
	applymovement OLDALETOWN_GUIDE, OldaleGuideMovement3
	turnobject PLAYER, UP
	opentext
	writetext OldaleGuideRoute103Text
	waitbutton
	closetext
	applymovement OLDALETOWN_GUIDE, OldaleGuideMovement4
	turnobject PLAYER, LEFT
	opentext
	writetext OldaleGuideRoute102Text
	waitbutton
	closetext
	pause 30
	turnobject OLDALETOWN_GUIDE, RIGHT
	opentext
	writetext OldaleGuideGiftText
	promptbutton
	getstring STRING_BUFFER_4, .mapcardname
	scall .ReceiveItem
	setflag ENGINE_MAP_CARD
	writetext OldaleGuideGotMapCardText
	promptbutton
	writetext OldaleGuidePokegearText
	waitbutton
	closetext
	stopfollow
	special RestartMapMusic
	turnobject PLAYER, UP
	applymovement OLDALETOWN_GUIDE, OldaleGuideMovement5
	playsound SFX_ENTER_DOOR
	disappear OLDALETOWN_GUIDE
	waitsfx
	end

.ReceiveItem:
	jumpstd ReceiveItemScript
	end

.mapcardname
	db "Map Card@"

.No:
	writetext OldaleGuideNoText
	waitbutton
	closetext
	end

.HaveMapCard:
	writetext OldaleGuideHaveMapCardText
	waitbutton
	closetext
	end

OldaleGuideMovement1: ; to the Pokémon Center
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	turn_head UP
	step_end

OldaleGuideMovement2: ; to the Mart
	step DOWN
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step RIGHT
	step RIGHT
	step RIGHT
	step UP
	turn_head UP
	step_end

OldaleGuideMovement3: ; to Route 103
	step LEFT
	step LEFT
	step UP
	step UP
	turn_head UP
	step_end

OldaleGuideMovement4: ; to his house, by the way to Route 102
	step LEFT
	step LEFT
	step DOWN
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	turn_head LEFT
	step_end

OldaleGuideMovement5: ; into his house
	step UP
	step_end

OldaleGuideIntroText:
	text "Oh! I haven't seen"
	line "you around here."

	para "Just starting out"
	line "as a trainer?"

	para "Oldale's a small"
	line "town, but it has"
	cont "what you need."

	para "Want me to show"
	line "you around?"
	done

OldaleGuideTourText:
	text "Wonderful!"
	line "Follow me!"
	done

OldaleGuidePokecenterText:
	text "This is a #mon"
	line "Center."

	para "They'll heal your"
	line "#mon for free,"
	cont "any time at all."

	para "You'll find one in"
	line "almost every town."
	done

OldaleGuideMartText:
	text "And this is the"
	line "#mart."

	para "You can buy #"
	line "Balls, Potions and"
	cont "other handy items."
	done

OldaleGuideRoute103Text:
	text "North of town is"
	line "Route 103."

	para "Trainers like to"
	line "battle along the"
	cont "shore up there."
	done

OldaleGuideRoute102Text:
	text "West of here is"
	line "Route 102."

	para "Keep going and"
	line "you'll reach"
	cont "Petalburg City."
	done

OldaleGuideGiftText:
	text "And this is my"
	line "house!"

	para "Thanks for keeping"
	line "an old man company."

	para "Here, take this"
	line "for your journey."
	done

OldaleGuideGotMapCardText:
	text "<PLAYER>'s #gear"
	line "now has a Map!"
	done

OldaleGuidePokegearText:
	text "With that, you'll"
	line "always know where"
	cont "you are."

	para "Good luck out"
	line "there!"
	done

OldaleGuideNoText:
	text "Oh… All right."

	para "Come find me if"
	line "you change your"
	cont "mind."
	done

OldaleGuideHaveMapCardText:
	text "Oldale's small,"
	line "but everyone here"
	cont "is friendly!"
	done

OldaleTownSign:
	jumptext OldaleTownSignText

OldaleTownSignText:
	text "Oldale Town"

	para "Where things "
	line "start off scare."
	done

OldaleNerdScript:
	jumptextfaceplayer OldaleNerdText

OldaleNerdText:
	text "This town is"
	line "a dump..."

	para "One day I'm"
	line "gonna move to"
	cont "Rustboro!"
	done

OldaleTown_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event  5, 15, OLDALE_POKECENTER, 2
	warp_event 13,  7, OLDALE_MART, 2
	warp_event 05, 07, OLDALE_HOUSE1, 2
	warp_event 13, 15, OLDALE_HOUSE2, 2

	def_coord_events
	coord_event  01,  08, -1, OldaleTown_PokedexCheckScript
	coord_event  01,  09, -1, OldaleTown_PokedexCheckScript

	def_bg_events	
	bg_event  9, 18, BGEVENT_READ, OldaleTownSign

	def_object_events
	object_event  07, 10, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, OldaleNerdScript, -1
	object_event 10, 16, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, OldaleTownGuideScript, -1
