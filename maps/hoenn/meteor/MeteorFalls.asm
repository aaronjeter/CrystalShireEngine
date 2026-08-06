	object_const_def
	const METEORFALLS_MOON_STONE
	const METEORFALLS_SUN_STONE
	const METEORFALLS_LUNATONE
	const METEORFALLS_SOLROCK
	const METEORFALLS_CLEFAIRY
	const METEORFALLS_AURORA

MeteorFalls_MapScripts:
	def_scene_scripts

	def_callbacks	

MeteorFallsEnableBridgeScript:
	;bridge 1
	changeblock 16, 20, $c0 ; LeftBridge
	changeblock 18, 20, $98 ; Bridge
	changeblock 20, 20, $98 ; Bridge
	changeblock 22, 20, $c1 ; RightBridge
	end


MeteorFallsDisableBridgeScript:
	;bridge 1
	changeblock 16, 20, $bc ; LeftBridge
	changeblock 18, 20, $c2 ; Bridge
	changeblock 20, 20, $c2 ; Bridge
	changeblock 22, 20, $bd ; RightBridge
	end

MeteorFallsMoonStone:
	itemball MOON_STONE

MeteorFallsSunStone:
	itemball SUN_STONE

MeteorFallsLunatone:
	cry LUNATONE
	loadwildmon LUNATONE, 5
	startbattle
	reloadmapafterbattle
	disappear METEORFALLS_LUNATONE
	end

MeteorFallsSolrock:
	cry SOLROCK
	loadwildmon SOLROCK, 5
	startbattle
	reloadmapafterbattle
	disappear METEORFALLS_SOLROCK
	end

MeteorFallsClefairy:
	cry CLEFAIRY
	loadwildmon CLEFAIRY, 2
	startbattle
	reloadmapafterbattle
	disappear METEORFALLS_CLEFAIRY
	end

Djinn_AuroraScript:
	cry MARS
	opentext
	writetext Djinn_AuroraText
	yesorno
	iffalse .Done
	givepoke MARS, 40, BRIGHTPOWDER, Djinn_AuroraName, Djinn_AuroraOTName
	setevent EVENT_GOT_AURORA
	disappear METEORFALLS_AURORA
	.Done
	closetext	
	end

Djinn_AuroraName:
	db "Aurora@"

Djinn_AuroraOTName:
	db "Jenna@" 

Djinn_AuroraText:
	text "Beautiful place,"
	line "isn't this!"

	para "And so much trea-"
	line "sure to find!"

	para "Invite Aurora to"
	line "join your party?"
	done

MeteorFalls_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event 29, 25, ROUTE_114, 1
	warp_event 09, 41, ROUTE_115, 1
	warp_event 27, 29, METEOR_TUNNEL_CENTER, 1
	warp_event 13, 05, METEOR_PEAK, 1
	warp_event 05, 03, METEOR_PEAK, 2

	def_coord_events
	;enable bridge 1
	coord_event 29, 22, -1, MeteorFallsEnableBridgeScript
	coord_event 10, 20, -1, MeteorFallsEnableBridgeScript

	;disable bridge 1
	coord_event 29, 24, -1, MeteorFallsDisableBridgeScript
	coord_event 10, 22, -1, MeteorFallsDisableBridgeScript

	def_bg_events	

	def_object_events
	object_event 03, 11, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MeteorFallsMoonStone, EVENT_METEOR_FALLS_MOON_STONE
	object_event 29, 04, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MeteorFallsSunStone, EVENT_METEOR_FALLS_SUN_STONE
	object_event 10, 11, SPRITE_LUNATONE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, MeteorFallsLunatone, -1
	object_event 29, 33, SPRITE_SOLROCK, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MeteorFallsSolrock, -1
	object_event 06, 34, SPRITE_CLEFAIRY, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, MeteorFallsClefairy, -1
	object_event 06, 05, SPRITE_MARS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Djinn_AuroraScript, EVENT_GOT_AURORA
