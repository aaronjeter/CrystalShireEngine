	object_const_def	

Route120_MapScripts:
	def_scene_scripts

	def_callbacks	

Route120FruitTree1:
	fruittree FRUITTREE_ROUTE_120_1

Route120FruitTree2:
	fruittree FRUITTREE_ROUTE_120_2


Route120_MapEvents:
	db 0, 0 ; filler

	def_warp_events		
	warp_event  11, 51, REGISTEEL_LAIR, 1

	def_coord_events

	def_bg_events	

	def_object_events
	object_event 28, 22, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route120FruitTree1, -1
	object_event 29, 22, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route120FruitTree2, -1
	
