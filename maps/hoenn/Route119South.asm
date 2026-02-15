	object_const_def	

Route119South_MapScripts:
	def_scene_scripts

	def_callbacks	

Route119FruitTree1:
	fruittree FRUITTREE_ROUTE_119_1

Route119FruitTree2:
	fruittree FRUITTREE_ROUTE_119_2

Route119FruitTree3:
	fruittree FRUITTREE_ROUTE_119_3

Route119FruitTree4:
	fruittree FRUITTREE_ROUTE_119_4


Route119South_MapEvents:
	db 0, 0 ; filler

	def_warp_events		

	def_coord_events

	def_bg_events	

	def_object_events
	object_event 10, 28, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route119FruitTree1, -1
	object_event 11, 28, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route119FruitTree2, -1
	object_event 07, 21, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route119FruitTree3, -1
	object_event 26, 14, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route119FruitTree4, -1
	