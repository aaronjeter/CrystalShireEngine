	object_const_def

EvergrandeDungeonB2F_MapScripts:
	def_scene_scripts

	def_callbacks

EvergrandeDungeonB2FEnableBridgeScript:
	;bridge 1
	changeblock 14, 24, $99 ; LeftBridge
	changeblock 16, 24, $98 ; Bridge
	changeblock 18, 24, $98 ; Bridge
	changeblock 20, 24, $9a ; RightBridge

	;bridge 2
	changeblock 38, 26, $99 ; LeftBridge
	changeblock 40, 26, $98 ; Bridge
	changeblock 42, 26, $9a ; RightBridge
	end


EvergrandeDungeonB2FDisableBridgeScript:
	;bridge 1
	changeblock 14, 24, $95 ; LeftBridge
	changeblock 16, 24, $94 ; Bridge
	changeblock 18, 24, $94 ; Bridge
	changeblock 20, 24, $96 ; RightBridge

	;bridge 2
	changeblock 38, 26, $95 ; LeftBridge
	changeblock 40, 26, $94 ; Bridge
	changeblock 42, 26, $96 ; RightBridge
	end



EvergrandeDungeonB2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event 07, 35, EVERGRANDE_DUNGEON_B1F, 3
	warp_event 23, 17, EVERGRANDE_DUNGEON_B1F, 4
	warp_event 39, 35, EVERGRANDE_DUNGEON_B1F, 5
	warp_event 53, 15, EVERGRANDE_DUNGEON_B1F, 6

	def_coord_events
	;enable bridge 1
	coord_event 07, 24, -1, EvergrandeDungeonB2FEnableBridgeScript

	;disable bridge 1
	coord_event 07, 20, -1, EvergrandeDungeonB2FDisableBridgeScript

	;enable bridge 2
	coord_event 50, 28, -1, EvergrandeDungeonB2FEnableBridgeScript

	;disable bridge 2
	coord_event 50, 34, -1, EvergrandeDungeonB2FDisableBridgeScript

	def_bg_events	

	def_object_events
	