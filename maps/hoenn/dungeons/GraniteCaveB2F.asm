	object_const_def
	const GRANITECAVEB2F_SHELLDER
	const GRANITECAVEB2F_SANDSHREW
	const GRANITECAVEB2F_ROCK
	const GRANITECAVEB2F_NEVERMELTICE
	const GRANITECAVEB2F_RIME

GraniteCaveB2F_MapScripts:
	def_scene_scripts

	def_callbacks	
	callback MAPCALLBACK_SPRITES, GraniteCaveB2FMonSpritesCallback

GraniteCaveB2FMonSpritesCallback:
	setmonsprite SPRITE_MON_3, SHELLDER
	setmonsprite SPRITE_MON_4, ASANDSHREW
	setmonsprite SPRITE_MON_5, MERCURY
	endcallback

GraniteCaveB2F_Shellder:
	cry SHELLDER
	loadwildmon SHELLDER, 4
	startbattle
	reloadmapafterbattle
	disappear GRANITECAVEB2F_SHELLDER
	end

GraniteCaveB2F_Sandshrew:
	cry SANDSHREW
	loadwildmon ASANDSHREW, 7
	startbattle
	reloadmapafterbattle
	disappear GRANITECAVEB2F_SANDSHREW
	end

GraniteCaveB2FRock:
	jumpstd SmashRockScript

GraniteCaveB2FHiddenNugget1:
	hiddenitem NUGGET, EVENT_GRANITE_CAVE_B2F_NUGGET1

GraniteCaveB2FHiddenNugget2:
	hiddenitem NUGGET, EVENT_GRANITE_CAVE_B2F_NUGGET2

GraniteCaveB2FNeverMeltIce:
	itemball NEVERMELTICE

Djinn_RimeScript:
	cry MERCURY
	opentext
	writetext Djinn_RimeText
	yesorno
	iffalse .Done
	givepoke MERCURY, 15, MYSTIC_WATER, Djinn_RimeName, Djinn_RimeOTName
	setevent EVENT_GOT_RIME
	disappear GRANITECAVEB2F_RIME
	.Done
	closetext	
	end

Djinn_RimeName:
	db "Rime@"

Djinn_RimeOTName:
	db "Mia@" 

Djinn_RimeText:
	text "Oh my gosh, the"
	line "seafood here is"
	cont "AMAZING!"

	para "I hope I didn't"
	line "eat all the clams."

	para "Invite Rime to"
	line "join your party?"
	done

GraniteCaveB2FWildRock:
	jumpstd SmashRockScript

GraniteCaveB2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event  23, 43, GRANITE_CAVE_B1F, 2
	warp_event  23, 29, GRANITE_CAVE_B1F, 3

	warp_event  05, 55, GRANITE_CAVE_B3F, 1

	warp_event  25, 05, ROUTE_105, 1

	def_coord_events

	def_bg_events	
	bg_event  14, 55, BGEVENT_ITEM, GraniteCaveB2FHiddenNugget1
	bg_event  04, 31, BGEVENT_ITEM, GraniteCaveB2FHiddenNugget2

	def_object_events
	object_event  05, 28, SPRITE_MON_3, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GraniteCaveB2F_Shellder, -1
	object_event  17, 13, SPRITE_MON_4, SPRITEMOVEDATA_WILDSPAWN, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GraniteCaveB2F_Sandshrew, -1
	object_event  07, 46, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, GraniteCaveB2FRock, -1
	object_event  13, 26, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, GraniteCaveB2FNeverMeltIce, EVENT_GOT_HOENN_NEVERMELTICE
	object_event  14, 33, SPRITE_MON_5, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Djinn_RimeScript, EVENT_GOT_RIME
	object_event 20, 27, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GraniteCaveB2FWildRock, -1
	object_event 22, 34, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GraniteCaveB2FWildRock, -1
	