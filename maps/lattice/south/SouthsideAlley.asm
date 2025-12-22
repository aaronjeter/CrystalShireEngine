	object_const_def
	const SOUTHSIDEALLEY_DELIBIRD
	const SOUTHSIDEALLEY_YOUNGSTER1
	const SOUTHSIDEALLEY_YOUNGSTER2
	const SOUTHSIDEALLEY_YOUNGSTER3

SouthsideAlley_MapScripts:
	def_scene_scripts

	def_callbacks	

SouthsideAlleyDelibird:
	cry DELIBIRD
	opentext
	writetext SouthsideAlleyDelibirdText	
	yesorno
	iffalse .Done
	givepoke DELIBIRD, 2
	setevent GOT_SOUTHSIDE_DELIBIRD
	disappear SOUTHSIDEALLEY_DELIBIRD
.Done
	closetext
	end	

SouthsideAlleyDelibirdText:
	text "It looks at you"
	line "cheerfully!"

	para "Invite it to"
	line "join you?"
	done

TrainerYoungsterMikey:
	trainer YOUNGSTER, MIKEY, EVENT_BEAT_YOUNGSTER_MIKEY, YoungsterMikeySeenText, YoungsterMikeyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext YoungsterMikeyAfterText
	waitbutton
	closetext
	end

YoungsterMikeySeenText:
	text "You're a #MON"
	line "trainer, right?"

	para "Then you have to"
	line "battle!"
	done

YoungsterMikeyBeatenText:
	text "That's strange."
	line "I won before."
	done

YoungsterMikeyAfterText:
	text "Becoming a good"
	line "trainer is really"
	cont "tough."

	para "I'm going to bat-"
	line "tle other people"
	cont "to get better."
	done


TrainerBugCatcherDon:
	trainer BUG_CATCHER, DON, EVENT_BEAT_BUG_CATCHER_DON, BugCatcherDonSeenText, BugCatcherDonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BugCatcherDonAfterText
	waitbutton
	closetext
	end

BugCatcherDonSeenText:
	text "Instead of a bug"
	line "#MON, I found"
	cont "a trainer!"
	done

BugCatcherDonBeatenText:
	text "Argh! You're too"
	line "strong!"
	done

BugCatcherDonAfterText:
	text "I wish you"
	line "could catch bugs"
	cont "it the city."
	done


TrainerYoungsterGordon:
	trainer YOUNGSTER, GORDON, EVENT_BEAT_YOUNGSTER_GORDON, YoungsterGordonSeenText, YoungsterGordonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext YoungsterGordonAfterText
	waitbutton
	closetext
	end

YoungsterGordonSeenText:
	text "I found some good"
	line "#MON in the"
	cont "grass!"

	para "I think they'll do"
	line "it for me!"
	done

YoungsterGordonBeatenText:
	text "Darn. I thought I"
	line "could win."
	done

YoungsterGordonAfterText:
	text "The alley is full"
	line "of trainers now.."
	done

SouthsideAlley_MapEvents:
	db 0, 0 ; filler


	def_warp_events	
	warp_event  19,  08, CITY_SOUTH, 9
	warp_event  19,  09, CITY_SOUTH, 10

	def_coord_events

	def_bg_events	

	def_object_events
	object_event 04, 06, SPRITE_DELIBIRD, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SouthsideAlleyDelibird, GOT_SOUTHSIDE_DELIBIRD
	object_event 10, 08, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerYoungsterMikey, -1
	object_event 08, 10, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerBugCatcherDon, -1
	object_event 05, 09, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerYoungsterGordon, -1