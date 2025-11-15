	object_const_def
	const MAPROUTE112_FRUIT_TREE_1
	const MAPROUTE112_FRUIT_TREE_2

Route112_MapScripts:
	def_scene_scripts

	def_callbacks	

Route112FruitTree1:
	fruittree FRUITTREE_ROUTE_112_1

Route112FruitTree2:
	fruittree FRUITTREE_ROUTE_112_2

Route112_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event  13, 31, FIERY_PATH, 1
	warp_event   5,  9, FIERY_PATH, 2

	def_coord_events

	def_bg_events	

	def_object_events
	object_event  22,  4, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route112FruitTree1, -1
	object_event  23,  4, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route112FruitTree2, -1
	