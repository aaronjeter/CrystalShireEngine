	object_const_def	

Route123_MapScripts:
	def_scene_scripts

	def_callbacks	

Route123FruitTree1:
	fruittree FRUITTREE_ROUTE_123_1

Route123FruitTree2:
	fruittree FRUITTREE_ROUTE_123_2

Route123FruitTree3:
	fruittree FRUITTREE_ROUTE_123_3

Route123FruitTree4:
	fruittree FRUITTREE_ROUTE_123_4

Route123FruitTree5:
	fruittree FRUITTREE_ROUTE_123_5

Route123FruitTree6:
	fruittree FRUITTREE_ROUTE_123_6


Route123_MapEvents:
	db 0, 0 ; filler

	def_warp_events		

	def_coord_events

	def_bg_events	

	def_object_events
	object_event 32, 06, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route123FruitTree1, -1
	object_event 33, 06, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route123FruitTree2, -1
	object_event 08, 06, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route123FruitTree3, -1
	object_event 09, 06, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route123FruitTree4, -1
	object_event 12, 06, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route123FruitTree5, -1
	object_event 13, 06, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route123FruitTree6, -1
	
