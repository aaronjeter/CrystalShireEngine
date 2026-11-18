	object_const_def
	const REGICELAIR_REGICE
	const REGICELAIR_WALL1
	const REGICELAIR_WALL2

RegiceLair_MapScripts:
	def_scene_scripts

	def_callbacks	
	callback MAPCALLBACK_SPRITES, RegiceLairMonSpritesCallback

RegiceLairMonSpritesCallback:
	setmonsprite SPRITE_MON_1, REGICE
	endcallback

RegiceScript:
	cry REGICE
	loadwildmon REGICE, 16
	loadboss BOSS_REGICE
	startbattle
	reloadmapafterbattle
	setevent EVENT_GOT_REGICE
	disappear REGICELAIR_REGICE
	end

RegiceWallScript:
	opentext
	writetext RegiceWallText
	waitbutton
	setval ICE
	special RegiLeadType
	iffalse .Nothing
	writetext RegiceWallGlowText
	waitbutton
	closetext
	playsound SFX_STRENGTH
	earthquake 40
	disappear REGICELAIR_WALL1
	disappear REGICELAIR_WALL2
	opentext
	writetext RegiceWallOpenText
	waitbutton
	closetext
	end

.Nothing:
	writetext RegiceWallNothingText
	waitbutton
	closetext
	end

RegiceWallText:
	text "Cracked rocks seal"
	line "the way. Ancient"
	cont "writing reads:"

	para "Lead with one"
	line "born of ice,"
	cont "and the way"
	cont "shall open."
	done

RegiceWallGlowText:
	text "The ancient"
	line "writing glows!"
	done

RegiceWallOpenText:
	text "The rocks crumbled"
	line "away!"
	done

RegiceWallNothingText:
	text "Nothing happened…"
	done

RegiceLair_MapEvents:
	db 0, 0 ; filler

	def_warp_events	

	warp_event  8, 15, ROUTE_105, 2

	def_coord_events

	def_bg_events	

	def_object_events
	object_event 10, 7, SPRITE_MON_1, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RegiceScript, EVENT_GOT_REGICE
	object_event  7, 12, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RegiceWallScript, EVENT_REGICE_WALL_OPEN
	object_event  8, 12, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RegiceWallScript, EVENT_REGICE_WALL_OPEN
