	object_const_def
	const MOLTRESLAIR_CHARIZARD
	const MOLTRESLAIR_TYRANITAR
	const MOLTRESLAIR_ENTEI

MoltresLair_MapScripts:
	def_scene_scripts

	def_callbacks	
	callback MAPCALLBACK_SPRITES, MoltresLairMonSpritesCallback
	callback MAPCALLBACK_OBJECTS, MoltresLairEnteiCallback

MoltresLairMonSpritesCallback:
	setmonsprite SPRITE_MON_3, CHARIZARD
	setmonsprite SPRITE_MON_4, TYRANITAR
	setmonsprite SPRITE_MON_1, ENTEI
	endcallback

MoltresLairEnteiCallback:
	checkevent EVENT_RELEASED_THE_BEASTS
	iftrue .Done
	disappear MOLTRESLAIR_ENTEI
.Done:
	endcallback

MoltresLair_Entei:
	cry ENTEI
	opentext
	writetext MoltresLairEnteiText
	closetext
	loadwildmon ENTEI, 15
	loadboss BOSS_ENTEI
	startbattle
	reloadmapafterbattle
	setevent EVENT_GOT_ENTEI
	disappear MOLTRESLAIR_ENTEI
	end

MoltresLairEnteiText:
	text "Entei roars, and"
	line "the air grows"
	cont "hot!"

	para "It accepts your"
	line "challenge!"
	done

MoltresLair_Charizard:
	cry CHARIZARD
	loadwildmon CHARIZARD, 10
	startbattle
	reloadmapafterbattle
	disappear MOLTRESLAIR_CHARIZARD
	end

MoltresLair_Tyranitar:
	cry TYRANITAR
	loadwildmon TYRANITAR, 13
	startbattle
	reloadmapafterbattle
	disappear MOLTRESLAIR_TYRANITAR
	end

MoltresLair_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event 30,  33, MOUNT_MORTAR_2F_INSIDE, 3

	def_coord_events

	def_bg_events	

	def_object_events
	object_event  3,  4, SPRITE_MON_3, SPRITEMOVEDATA_WILDSPAWN, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MoltresLair_Charizard, -1
	object_event 21, 15, SPRITE_MON_4, SPRITEMOVEDATA_WILDSPAWN, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MoltresLair_Tyranitar, -1
	object_event 20,  0, SPRITE_MON_1, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MoltresLair_Entei, EVENT_GOT_ENTEI
