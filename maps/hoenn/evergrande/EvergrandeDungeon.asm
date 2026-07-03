	object_const_def

EvergrandeDungeon_MapScripts:
	def_scene_scripts

	def_callbacks

EvergrandeBridge1Script:
	end

EvergrandeDungeonEnableBridgeScript:
	;bridge 1
	changeblock 18, 46, $99 ; LeftBridge
	changeblock 20, 46, $98 ; Bridge
	changeblock 22, 46, $98 ; Bridge
	changeblock 24, 46, $9a ; RightBridge

	;bridge 2
	changeblock 10, 36, $99 ; LeftBridge
	changeblock 12, 36, $98 ; Bridge
	changeblock 14, 36, $9a ; RightBridge

	;bridge 3
	changeblock 30, 36, $99 ; LeftBridge
	changeblock 32, 36, $98 ; Bridge
	changeblock 34, 36, $98 ; Bridge
	changeblock 36, 36, $9a ; RightBridge

	;bridge 4
	changeblock 26, 28, $99 ; LeftBridge
	changeblock 28, 28, $98 ; Bridge
	changeblock 30, 28, $98 ; Bridge
	changeblock 32, 28, $9a ; RightBridge

	;bridge 5
	changeblock 36, 28, $99 ; LeftBridge
	changeblock 38, 28, $98 ; Bridge
	changeblock 40, 28, $9a ; RightBridge

	end


EvergrandeDungeonDisableBridgeScript:
	;bridge 1
	changeblock 18, 46, $95 ; LeftBridge
	changeblock 20, 46, $94 ; Bridge
	changeblock 22, 46, $94 ; Bridge
	changeblock 24, 46, $96 ; RightBridge

	;bridge 2
	changeblock 10, 36, $95 ; LeftBridge
	changeblock 12, 36, $94 ; Bridge
	changeblock 14, 36, $96 ; RightBridge

	;bridge 3
	changeblock 30, 36, $95 ; LeftBridge
	changeblock 32, 36, $94 ; Bridge
	changeblock 34, 36, $94 ; Bridge
	changeblock 36, 36, $96 ; RightBridge

	;bridge 4
	changeblock 26, 28, $95 ; LeftBridge
	changeblock 28, 28, $94 ; Bridge
	changeblock 30, 28, $94 ; Bridge
	changeblock 32, 28, $96 ; RightBridge

	;bridge 5
	changeblock 36, 28, $95 ; LeftBridge
	changeblock 38, 28, $94 ; Bridge
	changeblock 40, 28, $96 ; RightBridge
	end



EvergrandeDungeon_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event 21, 53, EVERGRANDE_CITY, 3
	warp_event 51, 17, EVERGRANDE_CITY, 4
	warp_event 15, 25, EVERGRANDE_DUNGEON_B1F, 1
	warp_event 27, 41, EVERGRANDE_DUNGEON_B1F, 2


	def_coord_events
	;enable bridge 1
	coord_event 13, 47, -1, EvergrandeDungeonEnableBridgeScript
	coord_event 31, 47, -1, EvergrandeDungeonEnableBridgeScript

	;disable bridge 1
	coord_event 13, 50, -1, EvergrandeDungeonDisableBridgeScript
	coord_event 31, 50, -1, EvergrandeDungeonDisableBridgeScript

	;enable bridge 2
	coord_event 19, 37, -1, EvergrandeDungeonEnableBridgeScript
	coord_event 09, 29, -1, EvergrandeDungeonEnableBridgeScript

	;disable bridge 2
	coord_event 19, 40, -1, EvergrandeDungeonDisableBridgeScript

	;enable bridge 3
	coord_event 25, 37, -1, EvergrandeDungeonEnableBridgeScript
	coord_event 41, 37, -1, EvergrandeDungeonEnableBridgeScript

	;disable bridge 3
	coord_event 41, 40, -1, EvergrandeDungeonDisableBridgeScript

	;enable bridge 4
	coord_event 21, 29, -1, EvergrandeDungeonEnableBridgeScript
	coord_event 49, 29, -1, EvergrandeDungeonEnableBridgeScript

	;disable bridge 4
	coord_event 21, 32, -1, EvergrandeDungeonDisableBridgeScript
	coord_event 49, 32, -1, EvergrandeDungeonDisableBridgeScript

	def_bg_events	

	def_object_events
	