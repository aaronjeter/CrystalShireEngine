	object_const_def
	const REGIROCKLAIR_REGIROCK
	const REGIROCKLAIR_WALL1
	const REGIROCKLAIR_WALL2

RegirockLair_MapScripts:
	def_scene_scripts

	def_callbacks	
	callback MAPCALLBACK_SPRITES, RegirockLairMonSpritesCallback

RegirockLairMonSpritesCallback:
	setmonsprite SPRITE_MON_1, REGIROCK
	endcallback

RegirockScript:
	cry REGIROCK
	loadwildmon REGIROCK, 16
	loadboss BOSS_REGIROCK
	startbattle
	reloadmapafterbattle
	setevent EVENT_GOT_RIGIROCK
	disappear REGIROCKLAIR_REGIROCK
	end

RegirockWallScript:
	opentext
	writetext RegirockWallText
	waitbutton
	setval ROCK
	special RegiLeadType
	iffalse .Nothing
	writetext RegirockWallGlowText
	waitbutton
	closetext
	playsound SFX_STRENGTH
	earthquake 40
	disappear REGIROCKLAIR_WALL1
	disappear REGIROCKLAIR_WALL2
	opentext
	writetext RegirockWallOpenText
	waitbutton
	closetext
	end

.Nothing:
	writetext RegirockWallNothingText
	waitbutton
	closetext
	end

RegirockWallText:
	text "Cracked rocks seal"
	line "the way. Ancient"
	cont "writing reads:"

	para "Lead with one"
	line "born of stone,"
	cont "and the way"
	cont "shall open."
	done

RegirockWallGlowText:
	text "The ancient"
	line "writing glows!"
	done

RegirockWallOpenText:
	text "The rocks crumbled"
	line "away!"
	done

RegirockWallNothingText:
	text "Nothing happened…"
	done

RegirockLair_MapEvents:
	db 0, 0 ; filler

	def_warp_events	

	warp_event  11, 19, DESERT_RUIN_B1F, 4

	def_coord_events

	def_bg_events	

	def_object_events
	object_event 12, 06, SPRITE_MON_1, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RegirockScript, EVENT_GOT_RIGIROCK
	object_event 11, 14, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RegirockWallScript, EVENT_REGIROCK_WALL_OPEN
	object_event 12, 14, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RegirockWallScript, EVENT_REGIROCK_WALL_OPEN
