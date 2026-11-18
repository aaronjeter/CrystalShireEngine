	object_const_def
	const CINNABARVOLCANOCRATER_MOLTRES

CinnabarVolcanoCrater_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_SPRITES, CinnabarVolcanoCraterMonSpritesCallback

CinnabarVolcanoCraterMonSpritesCallback:
	setmonsprite SPRITE_MON_1, MOLTRES
	endcallback

CinnabarVolcanoCraterMoltresScript:
	cry MOLTRES
	opentext
	writetext CinnabarVolcanoCraterMoltresText
	closetext
	loadwildmon MOLTRES, 15
	loadboss BOSS_MOLTRES
	startbattle
	reloadmapafterbattle
	setevent EVENT_GOT_MOLTRES
	disappear CINNABARVOLCANOCRATER_MOLTRES
	end

CinnabarVolcanoCraterMoltresText:
	text "Flames swirl"
	line "as Moltres"
	cont "stares at you."

	para "It accepts your"
	line "challenge!"
	done

CinnabarVolcanoCrater_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 10, 15, CINNABAR_VOLCANO, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event 11,  6, SPRITE_MON_1, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CinnabarVolcanoCraterMoltresScript, EVENT_GOT_MOLTRES
