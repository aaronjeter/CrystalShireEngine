	object_const_def
	const ROUTE101_POOCHYENA
	const ROUTE101_ZIGZAGOON

Route101_MapScripts:
	def_scene_scripts

	def_callbacks	
	callback MAPCALLBACK_OBJECTS, Route101MonSpritesCallback

Route101MonSpritesCallback:
	setmonsprite SPRITE_MON_1, POOCHYENA
	setmonsprite SPRITE_MON_2, ZIGZAGOON
	endcallback

Route101_Poochyena:
	cry POOCHYENA
	loadwildmon POOCHYENA, 1
	startbattle
	reloadmapafterbattle
	disappear ROUTE101_POOCHYENA
	end

Route101_Zigzagoon:
	cry ZIGZAGOON
	loadwildmon ZIGZAGOON, 2
	startbattle
	reloadmapafterbattle
	disappear ROUTE101_ZIGZAGOON
	end

Route101Sign:
	jumptext Route101SignText

Route101SignText:
	text "Route 101"

	para "North: Oldale"
	line "South: Littleroot"
	done

Route101_MapEvents:
	db 0, 0 ; filler

	def_warp_events	

	def_coord_events

	def_bg_events	
	bg_event  9,  8, BGEVENT_READ, Route101Sign

	def_object_events
	object_event  6, 10, SPRITE_MON_1, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route101_Poochyena, -1
	object_event  4,  4, SPRITE_MON_2, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route101_Zigzagoon, -1
	