	object_const_def
	const SEAFOAMISLANDSB1F_ARTICUNO

SeafoamIslandsB1F_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_SPRITES, SeafoamIslandsB1FMonSpritesCallback

SeafoamIslandsB1FMonSpritesCallback:
	setmonsprite SPRITE_MON_1, ARTICUNO
	endcallback

SeafoamIslandsB1FArticunoScript:
	cry ARTICUNO
	opentext
	writetext SeafoamIslandsB1FArticunoText
	closetext
	loadwildmon ARTICUNO, 14
	loadboss BOSS_ARTICUNO
	startbattle
	reloadmapafterbattle
	setevent EVENT_GOT_ARTICUNO
	disappear SEAFOAMISLANDSB1F_ARTICUNO
	end

SeafoamIslandsB1FArticunoText:
	text "The great bird"
	line "regards you"
	cont "pensively."

	para "It accepts your"
	line "challenge!"
	done

SeafoamIslandsB1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 19, 19, SEAFOAM_ISLANDS_1F, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  5, SPRITE_MON_1, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SeafoamIslandsB1FArticunoScript, EVENT_GOT_ARTICUNO
