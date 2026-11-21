Route23_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, Route23FlypointCallback

Route23FlypointCallback:
	setflag ENGINE_FLYPOINT_INDIGO_PLATEAU
	endcallback

IndigoPlateauSign:
	jumptext IndigoPlateauSignText

IndigoPlateauSignText:
	text "Indigo Plateau"

	para "The Ultimate Goal"
	line "for Trainers!"

	para "#mon League HQ"
	done

Route23FruitTree:
	fruittree FRUITTREE_ROUTE_23

Route23_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  9,  5, INDIGO_PLATEAU_POKECENTER_1F, 1
	warp_event 10,  5, INDIGO_PLATEAU_POKECENTER_1F, 2
	warp_event  9, 13, VICTORY_ROAD, 10
	warp_event 10, 13, VICTORY_ROAD, 10

	def_coord_events

	def_bg_events
	bg_event 11,  7, BGEVENT_READ, IndigoPlateauSign

	def_object_events
	object_event  7,  9, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route23FruitTree, -1
