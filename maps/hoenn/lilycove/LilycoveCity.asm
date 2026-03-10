	object_const_def
	const LILYCOVECITY_MOSSDEEPGUY

LilycoveCity_MapScripts:
	def_scene_scripts

	def_callbacks	
	callback MAPCALLBACK_NEWMAP, LilycoveCityFlypointCallback

LilycoveCityFlypointCallback:
	setflag ENGINE_FLYPOINT_LILYCOVE	
	endcallback

LilycoveMossdeepGuyScript:
	faceplayer
	opentext
	setflag ENGINE_FLYPOINT_MOSSDEEP
	writetext LilycoveMossdeepGuyText
	promptbutton
	closetext
	end

LilycoveMossdeepGuyText:
	text "You can see"
	line "Mossdeep City"
	cont "from here."

	para "It really doesn't"
	line "look far..."

	para "Your Pokemon"
	line "could probably"

	para "just Fly you"
	line "right over!"

	para "Here, I'll mark"
	line "it on your map."
	done

LilycoveCity_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event 23, 15, LILYCOVE_POKECENTER, 2
	warp_event 53, 17, LILYCOVE_TRADE_HOUSE, 2

	def_coord_events

	def_bg_events	

	def_object_events
	object_event  46,  33, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, LilycoveMossdeepGuyScript, -1
	