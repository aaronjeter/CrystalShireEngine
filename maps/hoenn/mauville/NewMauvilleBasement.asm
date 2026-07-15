	object_const_def
	const MAUVILLEBASEMENT_SCIENTIST1
	const MAUVILLEBASEMENT_SCIENTIST2
	const MAUVILLEBASEMENT_SCIENTIST3
	const MAUVILLEBASEMENT_SCIENTIST4
	const MAUVILLEBASEMENT_ROCKETGIRL1
	const MAUVILLEBASEMENT_ROCKETGIRL2
	const MAUVILLEBASEMENT_ROCKETGIRL3
	const MAUVILLEBASEMENT_ROCKET1
	const MAUVILLEBASEMENT_ROCKET2
	const MAUVILLEBASEMENT_ROCKET3
	const MAUVILLEBASEMENT_ROCKET4


NewMauvilleBasement_MapScripts:
	def_scene_scripts

	def_callbacks

MauvilleAdamScript:
	trainer SCIENTIST, MAUVILLE_ADAM, EVENT_BEAT_MAUVILLE_SCIENTIST1, MauvilleAdamSeenText, MauvilleAdamBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext MauvilleAdamAfterBattleText
	waitbutton
	closetext
	end

MauvilleAdamSeenText:
	text "Huh? Intruder!"
	done

MauvilleAdamBeatenText:
	text "Yikes!"
	done

MauvilleAdamAfterBattleText:
	text "Well, I tried."
	line "You're someone"

	para "else's problem"
	line "now."
	done


MauvilleJamesScript:
	trainer SCIENTIST, MAUVILLE_JAMES, EVENT_BEAT_MAUVILLE_SCIENTIST2, MauvilleJamesSeenText, MauvilleJamesBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext MauvilleJamesAfterBattleText
	waitbutton
	closetext
	end

MauvilleJamesSeenText:
	text "Well now..."
	line "You don't look"

	para "much like a"
	line "Rocket!"
	done

MauvilleJamesBeatenText:
	text "Oh wow. Tough."
	done

MauvilleJamesAfterBattleText:
	text "Ugh. You're good."
	line "They should"

	para "really recruit"
	line "you, kid."
	done


MauvilleJeffreyScript:
	trainer SCIENTIST, MAUVILLE_JEFFREY, EVENT_BEAT_MAUVILLE_SCIENTIST3, MauvilleJeffreySeenText, MauvilleJeffreyBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext MauvilleJeffreyAfterBattleText
	waitbutton
	closetext
	end

MauvilleJeffreySeenText:
	text "Team Rocket"
	line "bought my loyalty"

	para "a long time"
	line "ago. Get Lost!"
	done

MauvilleJeffreyBeatenText:
	text "Dang it."
	line "Not again..."
	done

MauvilleJeffreyAfterBattleText:
	text "Team Rocket"
	line "lets me study"
	cont "whatever I like."

	para "They're a rather"
	line "lovely employer."
	done


MauvilleBruceScript:
	trainer SCIENTIST, MAUVILLE_BRUCE, EVENT_BEAT_MAUVILLE_SCIENTIST4, MauvilleBruceSeenText, MauvilleBruceBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext MauvilleBruceAfterBattleText
	waitbutton
	closetext
	end

MauvilleBruceSeenText:
	text "Hey, watch it!"
	done

MauvilleBruceBeatenText:
	text "Oof."
	done

MauvilleBruceAfterBattleText:
	text "We're lucky"
	line "nothing blew up!"

	para "Bothering me is"
	line "dangerous!"
	done


MauvilleLisaScript:
	trainer GRUNTF, MAUVILLE_GRUNTF1, EVENT_BEAT_MAUVILLE_ROCKETF1, MauvilleLisaSeenText, MauvilleLisaBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext MauvilleLisaAfterBattleText
	waitbutton
	closetext
	end

MauvilleLisaSeenText:
	text "Again with these"
	line "intruders?"
	done

MauvilleLisaBeatenText:
	text "Ugh!"
	done

MauvilleLisaAfterBattleText:
	text "I'm getting sick"
	line "of losing."
	done


MauvilleJamieScript:
	trainer GRUNTF, MAUVILLE_GRUNTF2, EVENT_BEAT_MAUVILLE_ROCKETF2, MauvilleJamieSeenText, MauvilleJamieBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext MauvilleJamieAfterBattleText
	waitbutton
	closetext
	end

MauvilleJamieSeenText:
	text "Intruder!"
	done

MauvilleJamieBeatenText:
	text "Too strong!"
	done

MauvilleJamieAfterBattleText:
	text "You might have"
	line "beaten me, but"

	para "the boss is"
	line "super strong!"
	done


MauvilleJennaScript:
	trainer GRUNTF, MAUVILLE_GRUNTF3, EVENT_BEAT_MAUVILLE_ROCKETF3, MauvilleJennaSeenText, MauvilleJennaBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext MauvilleJennaAfterBattleText
	waitbutton
	closetext
	end

MauvilleJennaSeenText:
	text "Gotcha!"
	done

MauvilleJennaBeatenText:
	text "How...?"
	done

MauvilleJennaAfterBattleText:
	text "Boss is gonna"
	line "kick you to"
	cont "the curb!"
	done


MauvilleRyanScript:
	trainer GRUNTM, MAUVILLE_GRUNT1, EVENT_BEAT_MAUVILLE_ROCKET1, MauvilleRyanSeenText, MauvilleRyanBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext MauvilleRyanAfterBattleText
	waitbutton
	closetext
	end

MauvilleRyanSeenText:
	text "You!"
	line "I never wanted"

	para "To see you"
	line "again!"
	done

MauvilleRyanBeatenText:
	text "I thought I had"
	line "you this time..."
	done

MauvilleRyanAfterBattleText:
	text "You might have"
	line "beaten me, but"

	para "You can't handle"
	line "all of Team"
	cont "Rocket!"
	done


MauvilleAlexScript:
	trainer GRUNTM, MAUVILLE_GRUNT2, EVENT_BEAT_MAUVILLE_ROCKET2, MauvilleAlexSeenText, MauvilleAlexBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext MauvilleAlexAfterBattleText
	waitbutton
	closetext
	end

MauvilleAlexSeenText:
	text "The Boss's plan"
	line "is gonna make us"
	cont "rich!"
	done

MauvilleAlexBeatenText:
	text "Dang it!"
	done

MauvilleAlexAfterBattleText:
	text "The casino is"
	line "just a front,"
	cont "you know."

	para "You can't stop us."
	done


MauvilleJordanScript:
	trainer GRUNTM, MAUVILLE_GRUNT3, EVENT_BEAT_MAUVILLE_ROCKET3, MauvilleJordanSeenText, MauvilleJordanBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext MauvilleJordanAfterBattleText
	waitbutton
	closetext
	end

MauvilleJordanSeenText:
	text "The casino rakes"
	line "in cash!"

	para "We didn't even"
	line "need to rig the"
	cont "games!"
	done

MauvilleJordanBeatenText:
	text "I guess you win!"
	line "This time..."
	done

MauvilleJordanAfterBattleText:
	text "I don't know why"
	line "we bother with"
	cont "evil schemes."

	para "The Game Corner"
	line "already makes us"
	cont "a ton."
	done


MauvilleFrankScript:
	trainer GRUNTM, MAUVILLE_GRUNT4, EVENT_BEAT_MAUVILLE_ROCKET4, MauvilleFrankSeenText, MauvilleFrankBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext MauvilleFrankAfterBattleText
	waitbutton
	closetext
	end

MauvilleFrankSeenText:
	text "PC load letter?"
	line "The ---- does"
	cont "that mean?"

	para "I'm gonna hurt"
	line "the next fool I"
	cont "see!"

	para "Oh look!"
	line "A volunteer!"
	done

MauvilleFrankBeatenText:
	text "AHHRG!"
	done

MauvilleFrankAfterBattleText:
	text "I'm gonna smash"
	line "this stupid"
	cont "thing!"
	done

NewMauvilleBasementMaxRevive:
	itemball MAX_REVIVE

NewMauvilleBasementMaxPotion:
	itemball MAX_POTION
	

NewMauvilleBasement_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  35,  34, NEW_MAUVILLE, 2
	warp_event  05,  04, MAUVILLE_GAME_CORNER, 3

	def_coord_events

	def_bg_events

	def_object_events
	object_event 08, 09, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 0, MauvilleAdamScript, EVENT_BEAT_MAUVILLE_ROCKETS
	object_event 20, 07, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, MauvilleJamesScript, EVENT_BEAT_MAUVILLE_ROCKETS
	object_event 28, 25, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, MauvilleJeffreyScript, EVENT_BEAT_MAUVILLE_ROCKETS
	object_event 30, 23, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 0, MauvilleBruceScript, EVENT_BEAT_MAUVILLE_ROCKETS
	object_event 24, 20, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_TRAINER, 3, MauvilleLisaScript, EVENT_BEAT_MAUVILLE_ROCKETS
	object_event 15, 25, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, MauvilleJamieScript, EVENT_BEAT_MAUVILLE_ROCKETS
	object_event 27, 07, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, MauvilleJennaScript, EVENT_BEAT_MAUVILLE_ROCKETS
	object_event 31, 34, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, MauvilleRyanScript, EVENT_BEAT_MAUVILLE_ROCKETS
	object_event 25, 20, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, MauvilleAlexScript, EVENT_BEAT_MAUVILLE_ROCKETS
	object_event 03, 05, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, MauvilleJordanScript, EVENT_BEAT_MAUVILLE_ROCKETS
	object_event 22, 05, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, MauvilleFrankScript, -1
	object_event 09, 30, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, NewMauvilleBasementMaxRevive, EVENT_NEW_MAUVILLE_MAX_REVIVE
	object_event 29, 10, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, NewMauvilleBasementMaxPotion, EVENT_NEW_MAUVILLE_MAX_POTION


