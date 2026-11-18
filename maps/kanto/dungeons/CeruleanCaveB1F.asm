	object_const_def
	const CERULEANCAVEB1F_MEWTWO

CeruleanCaveB1F_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_SPRITES, CeruleanCaveB1FMonSpritesCallback

CeruleanCaveB1FMonSpritesCallback:
	setmonsprite SPRITE_MON_1, MEWTWO
	endcallback

CeruleanCaveB1FMewtwoScript:
	cry MEWTWO
	opentext
	writetext CeruleanCaveB1FMewtwoText
	waitbutton
	closetext
	loadwildmon MEWTWO, 14
	loadboss BOSS_MEWTWO
	startbattle
	reloadmapafterbattle
	setevent EVENT_GOT_MEWTWO
	disappear CERULEANCAVEB1F_MEWTWO
	end

CeruleanCaveB1FMewtwoText:
	text "You feel a"
	line "voice echo in"
	cont "your mind."

	para "A worthy"
	line "challenge!"
	done

CeruleanCaveB1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5, 17, CERULEAN_CAVE_1F, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event 17,  4, SPRITE_MON_1, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeruleanCaveB1FMewtwoScript, EVENT_GOT_MEWTWO
