	object_const_def

OldaleHouse2_MapScripts:
	def_scene_scripts

	def_callbacks	
	callback MAPCALLBACK_SPRITES, OldaleHouse2MonSpritesCallback

OldaleHouse2MonSpritesCallback:
	setmonsprite SPRITE_MON_1, POOCHYENA
	endcallback

OldaleHouse2PoochScript:
	cry POOCHYENA
	end

OldaleHouse2ManScript:
	jumptextfaceplayer OldaleHouse2ManText

OldaleHouse2ManText:
	text "Prof. Birch is"
	line "never in his lab."

	para "He's always out"
	line "in the field,"
	cont "studying how wild"
	cont "#mon live."

	para "Show him your"
	line "#dex now and"
	cont "then. He loves"
	cont "to see it grow!"
	done

OldaleHouse2_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event  2, 7, OLDALE_TOWN, 4
	warp_event  3, 7, OLDALE_TOWN, 4

	def_coord_events

	def_bg_events	

	def_object_events
	
	object_event  4,  1, SPRITE_MON_1, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_WHITE, OBJECTTYPE_SCRIPT, 0, OldaleHouse2PoochScript, -1
	object_event  5,  3, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, OldaleHouse2ManScript, -1
