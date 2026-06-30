	object_const_def

DesertRuinB1F_MapScripts:
	def_scene_scripts

	def_callbacks	

DesertRuinB1FKingsRock:
	itemball KINGS_ROCK

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
