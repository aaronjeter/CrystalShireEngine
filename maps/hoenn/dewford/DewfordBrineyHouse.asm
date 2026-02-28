	object_const_def
	const DEWFORDBRINEYHOUSE_MRBRINEY

DewfordBrineyHouse_MapScripts:
	def_scene_scripts

	def_callbacks	

DewfordBrineyHouseMrBrineyScript:
	faceplayer
	opentext
	writetext DewfordBrineyHouseIntroText
	yesorno
	iffalse DewfordBrineyHouseNotRidingScript
	writetext DewfordBrineyHouseSailingText
	promptbutton
	closetext
	special FadeOutToWhite
	waitsfx
	warp ROUTE_104, 11, 44
	end

DewfordBrineyHouseNotRidingScript:
	writetext DewfordBrineyHouseNotRidingText
	waitbutton
	closetext
	end

DewfordBrineyHouseIntroText:
	text "Hey <PLAY_G>!"

	para "Are you ready to"
	line "head back?"
	done

DewfordBrineyHouseNotRidingText:
	text "OK."
	line "I'll just be here."
	done

DewfordBrineyHouseSailingText:
	text "Alright, let's"
	line "get sailing!"
	done

DewfordBrineyHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event  4, 7, DEWFORD_TOWN, 4
	warp_event  5, 7, DEWFORD_TOWN, 4

	def_coord_events

	def_bg_events	

	def_object_events
	object_event  06,  02, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DewfordBrineyHouseMrBrineyScript, -1
	