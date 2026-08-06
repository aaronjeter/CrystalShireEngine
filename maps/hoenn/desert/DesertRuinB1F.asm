	object_const_def
	const DESERTRUINB1F_KINGS_ROCK
	const DESERTRUINB1F_ROOT_FOSSIL
	const DESERTRUINB1F_CLAW_FOSSIL
	const DESERTRUINB1F_OLD_AMBER

DesertRuinB1F_MapScripts:
	def_scene_scripts

	def_callbacks	

DesertRuinB1FKingsRock:
	itemball KINGS_ROCK

DesertRuinB1FRootFossil:
	itemball ROOT_FOSSIL

DesertRuinB1FClawFossil:
	itemball CLAW_FOSSIL

DesertRuinB1FOldAmber:
	itemball OLD_AMBER

DesertRuinB1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events	

	warp_event  51, 09, DESERT_RUIN_1F, 2
	warp_event  51, 19, DESERT_RUIN_1F, 3
	warp_event  07, 05, DESERT_SHRINE, 1
	warp_event  21, 05, REGIROCK_LAIR, 1

	def_coord_events

	def_bg_events	

	def_object_events
	object_event 05, 27, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, DesertRuinB1FKingsRock, EVENT_GOT_HOENN_KINGS_ROCK
	object_event 24, 24, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, DesertRuinB1FRootFossil, EVENT_GOT_FOSSIL_ROOT_DESERT
	object_event 38, 04, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, DesertRuinB1FClawFossil, EVENT_GOT_FOSSIL_CLAW_DESERT
	object_event 13, 16, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, DesertRuinB1FOldAmber, EVENT_GOT_DESERT_OLD_AMBER
