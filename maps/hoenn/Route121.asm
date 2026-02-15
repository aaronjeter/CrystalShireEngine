	object_const_def	

Route121_MapScripts:
	def_scene_scripts

	def_callbacks	

Route121FruitTree1:
	fruittree FRUITTREE_ROUTE_121_1

Route121FruitTree2:
	fruittree FRUITTREE_ROUTE_121_2


Route121_MapEvents:
	db 0, 0 ; filler

	def_warp_events		

	def_coord_events

	def_bg_events	

	def_object_events
	object_event 12, 08, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route121FruitTree1, -1
	object_event 13, 08, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route121FruitTree2, -1
	
