	object_const_def
	const MRBRINEYHOUSE_MRBRINEY

MrBrineyHouse_MapScripts:
	def_scene_scripts

	def_callbacks	

MrBrineyHouseMrBrineyScript:
	faceplayer
	opentext
	writetext MrBrineyHouseIntroText
	yesorno
	iffalse MrBrineyHouseNotRidingScript
	writetext MrBrineyHouseSailingText
	promptbutton
	closetext
	special FadeOutToWhite
	waitsfx
	warp DEWFORD_TOWN, 17, 24
	end

MrBrineyHouseNotRidingScript:
	writetext MrBrineyHouseNotRidingText
	waitbutton
	closetext
	end

MrBrineyHouseIntroText:
	text "Hey <PLAY_G>!"

	para "The Prof told"
	line "me you might need"

	para "some help getting"
	line "around."

	para "I can sail you"
	line "to Dewford"
	cont "if you like?"
	done

MrBrineyHouseNotRidingText:
	text "OK."
	line "Have a nice day!"
	done

MrBrineyHouseSailingText:
	text "Alright, let's"
	line "get sailing!"
	done

MrBrineyHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event  4, 7, ROUTE_104, 7
	warp_event  5, 7, ROUTE_104, 7

	def_coord_events

	def_bg_events	

	def_object_events
	object_event  06,  02, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MrBrineyHouseMrBrineyScript, -1
	