	object_const_def
	const VIRIDIANCITY_GRAMPS1
	const VIRIDIANCITY_GRAMPS2
	const VIRIDIANCITY_FISHER
	const VIRIDIANCITY_YOUNGSTER
	const VIRIDIANCITY_SLEET
	const VIRIDIANCITY_GUIDE

ViridianCity_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, ViridianCityFlypointCallback
	callback MAPCALLBACK_SPRITES, ViridianCityMonSpritesCallback

ViridianCityMonSpritesCallback:
	setmonsprite SPRITE_MON_1, MERCURY
	endcallback

ViridianCityFlypointCallback:
	setflag ENGINE_FLYPOINT_VIRIDIAN
	endcallback

ViridianCityCoffeeGramps:
	faceplayer
	opentext
	writetext ViridianCityCoffeeGrampsQuestionText
	yesorno
	iffalse .no
	writetext ViridianCityCoffeeGrampsBelievedText
	waitbutton
	closetext
	end

.no:
	writetext ViridianCityCoffeeGrampsDoubtedText
	waitbutton
	closetext
	end

ViridianCityGrampsNearGym:
	faceplayer
	opentext
	checkevent EVENT_BLUE_IN_CINNABAR
	iftrue .BlueReturned
	writetext ViridianCityGrampsNearGymText
	waitbutton
	closetext
	end

.BlueReturned:
	writetext ViridianCityGrampsNearGymBlueReturnedText
	waitbutton
	closetext
	end

ViridianCityDreamEaterFisher:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM42_DREAM_EATER
	iftrue .GotDreamEater
	writetext ViridianCityDreamEaterFisherText
	promptbutton
	verbosegiveitem TM_DREAM_EATER
	iffalse .NoRoomForDreamEater
	setevent EVENT_GOT_TM42_DREAM_EATER
.GotDreamEater:
	writetext ViridianCityDreamEaterFisherGotDreamEaterText
	waitbutton
.NoRoomForDreamEater:
	closetext
	end

ViridianCityGuideScript:
; Gives the Map Card to players who don't have one yet (Kanto starts),
; after a short tour like Cherrygrove's guide.
	faceplayer
	opentext
	checkflag ENGINE_MAP_CARD
	iftrue .HaveMapCard
	writetext ViridianGuideIntroText
	yesorno
	iffalse .No
	writetext ViridianGuideTourText
	waitbutton
	closetext
	playmusic MUSIC_SHOW_ME_AROUND
	follow VIRIDIANCITY_GUIDE, PLAYER
	applymovement VIRIDIANCITY_GUIDE, ViridianGuideMovement1
	turnobject PLAYER, UP
	opentext
	writetext ViridianGuideMartText
	waitbutton
	closetext
	applymovement VIRIDIANCITY_GUIDE, ViridianGuideMovement2
	opentext
	writetext ViridianGuidePokecenterText
	waitbutton
	closetext
	applymovement VIRIDIANCITY_GUIDE, ViridianGuideMovement3
	turnobject PLAYER, LEFT
	opentext
	writetext ViridianGuideRoute22Text
	waitbutton
	closetext
	applymovement VIRIDIANCITY_GUIDE, ViridianGuideMovement4
	turnobject PLAYER, UP
	opentext
	writetext ViridianGuideRoute2Text
	waitbutton
	closetext
	applymovement VIRIDIANCITY_GUIDE, ViridianGuideMovement5
	turnobject PLAYER, UP
	opentext
	writetext ViridianGuideGymText
	waitbutton
	closetext
	pause 30
	turnobject VIRIDIANCITY_GUIDE, LEFT
	turnobject PLAYER, RIGHT
	opentext
	writetext ViridianGuideGiftText
	promptbutton
	getstring STRING_BUFFER_4, .mapcardname
	scall .ReceiveItem
	setflag ENGINE_MAP_CARD
	writetext ViridianGuideGotMapCardText
	promptbutton
	writetext ViridianGuidePokegearText
	waitbutton
	closetext
	stopfollow
	special RestartMapMusic
	turnobject PLAYER, UP
	applymovement VIRIDIANCITY_GUIDE, ViridianGuideMovement6
	playsound SFX_ENTER_DOOR
	disappear VIRIDIANCITY_GUIDE
	waitsfx
	end

.ReceiveItem:
	jumpstd ReceiveItemScript
	end

.mapcardname
	db "Map Card@"

.No:
	writetext ViridianGuideNoText
	waitbutton
	closetext
	end

.HaveMapCard:
	writetext ViridianGuideHaveMapCardText
	waitbutton
	closetext
	end

ViridianGuideMovement1: ; to the Mart
	step UP
	step UP
	step UP
	step UP
	step RIGHT
	step UP
	turn_head UP
	step_end

ViridianGuideMovement2: ; to the Pokémon Center
	step LEFT
	step LEFT
	step LEFT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	turn_head UP
	step_end

ViridianGuideMovement3: ; to the road west, Route 22
	step LEFT
	step LEFT
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	turn_head LEFT
	step_end

ViridianGuideMovement4: ; to the road north, Route 2
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	turn_head LEFT
	step_end

ViridianGuideMovement5: ; to the Gym
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	turn_head UP
	step_end

ViridianGuideMovement6: ; into the Gym
	step UP
	step UP
	step UP
	step_end

ViridianGuideIntroText:
	text "Hey there! You're"
	line "a new trainer,"
	cont "aren't you?"

	para "Everyone passes"
	line "through Viridian"
	cont "at the start."

	para "Want me to show"
	line "you around town?"
	done

ViridianGuideTourText:
	text "Great! This way!"
	done

ViridianGuideMartText:
	text "This is the"
	line "#mart."

	para "Stock up on #"
	line "Balls and Potions"
	cont "before you go."
	done

ViridianGuidePokecenterText:
	text "And here's the"
	line "#mon Center."

	para "Your #mon get"
	line "healed for free."

	para "Come back here"
	line "whenever they're"
	cont "worn out."
	done

ViridianGuideRoute22Text:
	text "That road west is"
	line "Route 22."

	para "It leads to the"
	line "#mon League."

	para "Only the toughest"
	line "trainers go that"
	cont "way!"
	done

ViridianGuideRoute2Text:
	text "This road north is"
	line "Route 2."

	para "It goes through"
	line "Viridian Forest"
	cont "to Pewter City."
	done

ViridianGuideGymText:
	text "And this is the"
	line "Viridian Gym."

	para "Its Leader is very"
	line "strong. Leave it"
	cont "for later!"
	done

ViridianGuideGiftText:
	text "That's the tour!"

	para "Thanks for coming"
	line "along. Here's a"
	cont "little gift."
	done

ViridianGuideGotMapCardText:
	text "<PLAYER>'s #gear"
	line "now has a Map!"
	done

ViridianGuidePokegearText:
	text "Now you won't get"
	line "lost out there."

	para "I'm going to go"
	line "watch the Gym."
	cont "Good luck!"
	done

ViridianGuideNoText:
	text "Oh, OK."

	para "I'll be around if"
	line "you change your"
	cont "mind."
	done

ViridianGuideHaveMapCardText:
	text "Viridian's always"
	line "full of trainers"
	cont "passing through!"
	done

ViridianCityYoungsterScript:
	jumptextfaceplayer ViridianCityYoungsterText

ViridianCitySign:
	jumptext ViridianCitySignText

ViridianGymSign:
	jumptext ViridianGymSignText

ViridianCityWelcomeSign:
	jumptext ViridianCityWelcomeSignText

TrainerHouseSign:
	jumptext TrainerHouseSignText

ViridianCityPokecenterSign:
	jumpstd PokecenterSignScript

ViridianCityMartSign:
	jumpstd MartSignScript

ViridianCityCoffeeGrampsQuestionText:
	text "Hey, kid! I just"
	line "had a double shot"

	para "of espresso, and"
	line "I am wired!"

	para "I need to talk to"
	line "someone, so you'll"
	cont "have to do!"

	para "I might not look"
	line "like much now, but"

	para "I was an expert at"
	line "catching #mon."

	para "Do you believe me?"
	done

ViridianCityCoffeeGrampsBelievedText:
	text "Good, good. Yes, I"
	line "was something out"

	para "of the ordinary,"
	line "let me tell you!"
	done

ViridianCityCoffeeGrampsDoubtedText:
	text "What? You little"
	line "whelp!"

	para "If I were just a"
	line "bit younger, I'd"

	para "show you a thing"
	line "or two. Humph!"
	done

ViridianCityGrampsNearGymText:
	text "This Gym didn't"
	line "have a Leader"
	cont "until recently."

	para "A young man from"
	line "Pallet became the"

	para "Leader, but he's"
	line "often away."
	done

ViridianCityGrampsNearGymBlueReturnedText:
	text "Are you going to"
	line "battle the Leader?"

	para "Good luck to you."
	line "You'll need it."
	done

ViridianCityDreamEaterFisherText:
	text "Yawn!"

	para "I must have dozed"
	line "off in the sun."

	para "…I had this dream"
	line "about a Drowzee"

	para "eating my dream."
	line "Weird, huh?"

	para "Huh?"
	line "What's this?"

	para "Where did this TM"
	line "come from?"

	para "This is spooky!"
	line "Here, you can have"
	cont "this TM."
	done

ViridianCityDreamEaterFisherGotDreamEaterText:
	text "TM42 contains"
	line "Dream Eater…"

	para "…Zzzzz…"
	done

ViridianCityYoungsterText:
	text "I heard that there"
	line "are many items on"

	para "the ground in"
	line "Viridian Forest."
	done

ViridianCitySignText:
	text "Viridian City"

	para "The Eternally"
	line "Green Paradise"
	done

ViridianGymSignText:
	text "Viridian City"
	line "#mon Gym"
	cont "Leader: …"

	para "The rest of the"
	line "text is illegible…"
	done

ViridianCityWelcomeSignText:
	text "Welcome to"
	line "Viridian City,"

	para "The Gateway to"
	line "Indigo Plateau"
	done

TrainerHouseSignText:
	text "Trainer House"

	para "The Club for Top"
	line "Trainer Battles"
	done

Djinn_SleetScript:
	cry MERCURY
	opentext
	writetext Djinn_SleetText
	yesorno
	iffalse .Done
	givepoke MERCURY, 15, MYSTIC_WATER, Djinn_SleetName, Djinn_SleetOTName
	setevent EVENT_GOT_SLEET
	disappear VIRIDIANCITY_SLEET
	.Done
	closetext	
	end

Djinn_SleetName:
	db "Sleet@"

Djinn_SleetOTName:
	db "Mia@" 

Djinn_SleetText:
	text "Ha, these fish are"
	line "tasty! I can't get"
	cont "enough!"

	para "Invite Sleet to"
	line "join your party?"
	done

ViridianCity_PokedexCheckScript:
	checkflag ENGINE_POKEDEX
	iftrue .done
	opentext
	writetext ViridianCity_PokedexCheckText
	waitbutton
	closetext
	applymovement PLAYER, ViridianCity_StepDownMovement

.done
	end

ViridianCity_PokedexCheckText:
	text "I shouldn't go"
	line "this way yet."

	para "I'm still doing"
	line "a job for Prof."
	cont "Oak."
	done

ViridianCity_StepDownMovement:
	step DOWN
	step_end

ViridianCity_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 32,  7, VIRIDIAN_GYM, 1
	warp_event 21,  9, VIRIDIAN_NICKNAME_SPEECH_HOUSE, 1
	warp_event 23, 15, TRAINER_HOUSE_1F, 1
	warp_event 29, 19, VIRIDIAN_MART, 2
	warp_event 23, 23, VIRIDIAN_POKECENTER_1F, 1

	def_coord_events
	coord_event  17,  01, -1, ViridianCity_PokedexCheckScript
	coord_event  18,  01, -1, ViridianCity_PokedexCheckScript

	def_bg_events
	bg_event 17, 17, BGEVENT_READ, ViridianCitySign
	bg_event 34, 10, BGEVENT_READ, ViridianGymSign
	bg_event 19,  1, BGEVENT_READ, ViridianCityWelcomeSign
	bg_event 21, 15, BGEVENT_READ, TrainerHouseSign
	bg_event 24, 23, BGEVENT_READ, ViridianCityPokecenterSign
	bg_event 30, 19, BGEVENT_READ, ViridianCityMartSign

	def_object_events
	object_event 18,  5, SPRITE_GRAMPS, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ViridianCityCoffeeGramps, -1
	object_event 33,  8, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ViridianCityGrampsNearGym, -1
	object_event  6, 23, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ViridianCityDreamEaterFisher, -1
	object_event 17, 21, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 3, 3, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ViridianCityYoungsterScript, -1
	object_event 07, 26, SPRITE_MON_1, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Djinn_SleetScript, EVENT_GOT_SLEET
	object_event 28, 25, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ViridianCityGuideScript, -1
