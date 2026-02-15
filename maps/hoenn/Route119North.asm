	object_const_def	

Route119North_MapScripts:
	def_scene_scripts

	def_callbacks	

Route119FruitTree5:
	fruittree FRUITTREE_ROUTE_119_5

Route119FruitTree6:
	fruittree FRUITTREE_ROUTE_119_6


Route119North_MapEvents:
	db 0, 0 ; filler

	def_warp_events		

	def_coord_events

	def_bg_events	

	def_object_events
	object_event 08, 06, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route119FruitTree5, -1
	object_event 09, 06, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route119FruitTree6, -1
	
