	object_const_def
	const LANETTEHOUSE_LANETTE

LanetteHouse_MapScripts:
	def_scene_scripts

	def_callbacks	

LanetteHouseLanetteScript:
	faceplayer
	opentext

	checkevent EVENT_GOT_FLIPPERS
	iftrue LanetteHouseAfterFlippersScript

	writetext LanetteHouseGiveFlippersText
	waitbutton 

	verbosegiveitem FLIPPERS
	setevent EVENT_GOT_FLIPPERS
	waitbutton
	closetext	
	end

LanetteHouseAfterFlippersScript:
	writetext LanetteHouseAlreadyGotFlippersText
	waitbutton
	closetext
	end

LanetteHouseGiveFlippersText:
	text "Hi <PLAY_G>."

	para "The Prof told"
	line "me you might need"

	para "some help getting"
	line "around."

	para "I'm pretty busy"
	line "with my research"
	cont "though..."

	para "..."

	para "Oh, I know!"

	para "Take my Flippers!"

	para "I haven't had any"
	line "time to swim"
	cont "anyways."

	done

LanetteHouseAlreadyGotFlippersText:
	text "I hope your"
	line "exploring goes"
	cont "well!"
	done



LanetteHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event  4, 9, ROUTE_114, 2
	warp_event  5, 9, ROUTE_114, 2

	def_coord_events

	def_bg_events	

	def_object_events
	object_event  08,  02, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, LanetteHouseLanetteScript, -1
	