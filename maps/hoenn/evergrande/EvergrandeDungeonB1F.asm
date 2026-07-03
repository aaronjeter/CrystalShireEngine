	object_const_def

EvergrandeDungeonB1F_MapScripts:
	def_scene_scripts

	def_callbacks

EvergrandeDungeonB1FEnableBridgeScript:
	;bridge 1
	changeblock 32, 08, $99 ; LeftBridge
	changeblock 34, 08, $98 ; Bridge
	changeblock 36, 08, $98 ; Bridge
	changeblock 38, 08, $9a ; RightBridge

	;bridge 2
	changeblock 44, 24, $99 ; LeftBridge
	changeblock 46, 24, $98 ; Bridge
	changeblock 48, 24, $9a ; RightBridge
	end


EvergrandeDungeonB1FDisableBridgeScript:
	;bridge 1
	changeblock 32, 08, $95 ; LeftBridge
	changeblock 34, 08, $94 ; Bridge
	changeblock 36, 08, $94 ; Bridge
	changeblock 38, 08, $96 ; RightBridge

	;bridge 2
	changeblock 44, 24, $95 ; LeftBridge
	changeblock 46, 24, $94 ; Bridge
	changeblock 48, 24, $96 ; RightBridge
	end



EvergrandeDungeonB1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event 13, 05, EVERGRANDE_DUNGEON, 3
	warp_event 29, 29, EVERGRANDE_DUNGEON, 4

	warp_event 07, 35, EVERGRANDE_DUNGEON_B2F, 1
	warp_event 23, 25, EVERGRANDE_DUNGEON_B2F, 2
	warp_event 39, 35, EVERGRANDE_DUNGEON_B2F, 3
	warp_event 51, 07, EVERGRANDE_DUNGEON_B2F, 4

	def_coord_events
	;enable bridge 1
	coord_event 25, 12, -1, EvergrandeDungeonB1FEnableBridgeScript
	coord_event 43, 10, -1, EvergrandeDungeonB1FEnableBridgeScript

	;disable bridge 1
	coord_event 25, 16, -1, EvergrandeDungeonB1FDisableBridgeScript
	coord_event 43, 14, -1, EvergrandeDungeonB1FDisableBridgeScript

	;enable bridge 2
	coord_event 41, 26, -1, EvergrandeDungeonB1FEnableBridgeScript
	coord_event 53, 30, -1, EvergrandeDungeonB1FEnableBridgeScript

	;disable bridge 2
	coord_event 41, 30, -1, EvergrandeDungeonB1FDisableBridgeScript
	coord_event 53, 34, -1, EvergrandeDungeonB1FDisableBridgeScript

	def_bg_events	

	def_object_events
	