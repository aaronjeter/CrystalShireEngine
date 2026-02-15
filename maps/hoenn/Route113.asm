	object_const_def

Route113_MapScripts:
	def_scene_scripts

	def_callbacks	

Route113FruitTree1:
	fruittree FRUITTREE_ROUTE_113_1

Route113FruitTree2:
	fruittree FRUITTREE_ROUTE_113_2

Route113_MapEvents:
	db 0, 0 ; filler

	def_warp_events		
	warp_event  93, 11, LAVARIDGE_DESERT, 3

	def_coord_events

	def_bg_events	

	def_object_events
	object_event 92, 04, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route113FruitTree1, -1
	object_event 93, 04, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route113FruitTree2, -1
	