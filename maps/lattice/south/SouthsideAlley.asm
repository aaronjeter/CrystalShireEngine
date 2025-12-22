	object_const_def
	const SOUTHSIDEALLEY_DELIBIRD

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

SouthsideAlley_MapEvents:
	db 0, 0 ; filler


	def_warp_events	
	warp_event  19,  08, CITY_SOUTH, 9
	warp_event  19,  09, CITY_SOUTH, 10

	def_coord_events

	def_bg_events	

	def_object_events
	object_event 04,  06,  SPRITE_DELIBIRD, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SouthsideAlleyDelibird, GOT_SOUTHSIDE_DELIBIRD
	