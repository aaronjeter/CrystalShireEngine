	object_const_def
	const ZAPDOSROOST_ZAPDOS

ZapdosRoost_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_SPRITES, ZapdosRoostMonSpritesCallback

ZapdosRoostMonSpritesCallback:
	setmonsprite SPRITE_MON_1, ZAPDOS
	endcallback

ZapdosRoostZapdosScript:
	cry ZAPDOS
	opentext
	writetext ZapdosRoostZapdosText
	closetext
	loadwildmon ZAPDOS, 15
	loadboss BOSS_ZAPDOS
	startbattle
	reloadmapafterbattle
	setevent EVENT_GOT_ZAPDOS
	disappear ZAPDOSROOST_ZAPDOS
	end

ZapdosRoostZapdosText:
	text "Thunder rolls as"
	line "Zapdos spreads"
	cont "its wings."

	para "It accepts your"
	line "challenge!"
	done

ZapdosRoost_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  6,  3, ZAPDOS_ROOST_CAVE, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event 13,  6, SPRITE_MON_1, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ZapdosRoostZapdosScript, EVENT_GOT_ZAPDOS
