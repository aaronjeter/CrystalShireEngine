	object_const_def
	const REGISTEELLAIR_REGISTEEL
	const REGISTEELLAIR_WALL1
	const REGISTEELLAIR_WALL2

RegisteelLair_MapScripts:
	def_scene_scripts

	def_callbacks	
	callback MAPCALLBACK_SPRITES, RegisteelLairMonSpritesCallback

RegisteelLairMonSpritesCallback:
	setmonsprite SPRITE_MON_1, REGISTEEL
	endcallback

RegisteelScript:
	cry REGISTEEL
	loadwildmon REGISTEEL, 16
	loadboss BOSS_REGISTEEL
	startbattle
	reloadmapafterbattle
	setevent EVENT_GOT_REGISTEEL
	disappear REGISTEELLAIR_REGISTEEL
	end

RegisteelWallScript:
	opentext
	writetext RegisteelWallText
	waitbutton
	setval STEEL
	special RegiPartyMoveType
	iffalse .Nothing
	writetext RegisteelWallGlowText
	waitbutton
	closetext
	playsound SFX_STRENGTH
	earthquake 40
	disappear REGISTEELLAIR_WALL1
	disappear REGISTEELLAIR_WALL2
	opentext
	writetext RegisteelWallOpenText
	waitbutton
	closetext
	end

.Nothing:
	writetext RegisteelWallNothingText
	waitbutton
	closetext
	end

RegisteelWallText:
	text "Cracked rocks seal"
	line "the way. Ancient"
	cont "writing reads:"

	para "Bring one who"
	line "wields the power"
	cont "of steel, and the"
	cont "way shall open."
	done

RegisteelWallGlowText:
	text "The ancient"
	line "writing glows!"
	done

RegisteelWallOpenText:
	text "The rocks crumbled"
	line "away!"
	done

RegisteelWallNothingText:
	text "Nothing happened…"
	done

RegisteelLair_MapEvents:
	db 0, 0 ; filler

	def_warp_events	

	warp_event  11, 19, ROUTE_120, 1

	def_coord_events

	def_bg_events	

	def_object_events
	object_event 11, 05, SPRITE_MON_1, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RegisteelScript, EVENT_GOT_REGISTEEL
	object_event 10,  7, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RegisteelWallScript, EVENT_REGISTEEL_WALL_OPEN
	object_event 11,  7, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RegisteelWallScript, EVENT_REGISTEEL_WALL_OPEN
