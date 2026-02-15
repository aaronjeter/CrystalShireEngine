	object_const_def

Route114_MapScripts:
	def_scene_scripts

	def_callbacks	

Route114Sign:
	jumptext Route114SignText

Route114SignText:
	text "Route 114"

	para "North: Fallarbor"
	line "South: Meteor"
	cont "Falls"
	done

Route114LanettesHouseSign:
	jumptext Route114LanettesHouseSignText

Route114LanettesHouseSignText:
	text "Lanette's House"
	done

Route114FruitTree1:
	fruittree FRUITTREE_ROUTE_114_1

Route114FruitTree2:
	fruittree FRUITTREE_ROUTE_114_2

Route114_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event  09, 69, METEOR_FALLS, 1

	def_coord_events

	def_bg_events	
	bg_event  17, 37, BGEVENT_READ, Route114Sign
	bg_event  25, 37, BGEVENT_READ, Route114LanettesHouseSign

	def_object_events
	object_event 32, 42, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route114FruitTree1, -1
	object_event 33, 42, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route114FruitTree2, -1
	