	object_const_def
	const MAPPETALBURGWOODS_LYLE
	const MAPPETALBURGWOODS_JAMES
	const PETALBURGWOODS_IVY

PetalburgWoods_MapScripts:
	def_scene_scripts

	def_callbacks	

PetalburgWoodsLyleScript:
	trainer BUG_CATCHER, PETALBURGWOODS_LYLE, EVENT_BEAT_PETALBURGWOODS_LYLE, PetalburgWoodsLyleSeenText, PetalburgWoodsLyleBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext PetalburgWoodsLyleBattleText
	waitbutton
	closetext
	end

PetalburgWoodsLyleSeenText:
	text "I caught a whole"
	line "bunch of #mon!"
	done

PetalburgWoodsLyleBeatenText:
	text "It wasn't enough."	
	done

PetalburgWoodsLyleBattleText:
	text "Lots of #mon"
	line "won't cut it."
	done


PetalburgWoodsJamesScript:
	trainer BUG_CATCHER, PETALBURGWOODS_JAMES, EVENT_BEAT_PETALBURGWOODS_JAMES, PetalburgWoodsJamesSeenText, PetalburgWoodsJamesBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext PetalburgWoodsJamesBattleText
	waitbutton
	closetext
	end

PetalburgWoodsJamesSeenText:
	text "I caught a bunch"
	line "of #mon."

	para "Now I'm out"
	line "of balls."
	done

PetalburgWoodsJamesBeatenText:
	text "Oh well."
	done

PetalburgWoodsJamesBattleText:
	text "At least my bug"
	line "#mon make me"
	cont "popular."
	done

Djinn_IvyScript:
	cry VENUS
	opentext
	writetext Djinn_IvyText
	yesorno
	iffalse .Done
	givepoke VENUS, 12, SOFT_SAND, Djinn_IvyName, Djinn_IvyOTName
	setevent EVENT_GOT_IVY
	disappear PETALBURGWOODS_IVY
	.Done
	closetext	
	end

Djinn_IvyName:
	db "Ivy@"

Djinn_IvyOTName:
	db "Felix@" 

Djinn_IvyText:
	text "Hey there kid,"
	line "you look like"
	cont "you're going"
	cont "places."

	para "Mind if I tag"
	line "along? I can pull"
	cont "my weight!"

	para "Invite Ivy to"
	line "join your party?"
	done

PetalburgWoods_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event 10,  0, ROUTE_104, 1
	warp_event 11,  0, ROUTE_104, 2
	warp_event 16, 39, ROUTE_104, 3
	warp_event 17, 39, ROUTE_104, 4
	warp_event 34, 39, ROUTE_104, 5
	warp_event 35, 39, ROUTE_104, 6

	def_coord_events

	def_bg_events	

	def_object_events
	object_event  09, 24, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, PetalburgWoodsLyleScript, -1
	object_event  10, 15, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, PetalburgWoodsJamesScript, -1
	object_event  39, 04, SPRITE_VENUS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Djinn_IvyScript, EVENT_GOT_IVY
	