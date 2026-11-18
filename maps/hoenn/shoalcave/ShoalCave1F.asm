ShoalCave1F_MapScripts:
	def_scene_scripts

	def_callbacks

ShoalCave1FStella:
	trainer SKIER, SHOAL_CAVE_STELLA, EVENT_BEAT_SHOAL_CAVE_STELLA, ShoalCave1FStellaSeenText, ShoalCave1FStellaBeatenText, 0, .Script

.Script:
	trainerafter ShoalCave1FStellaAfterBattleText

ShoalCave1FStellaSeenText:
	text "Brr! This cave is"
	line "the coolest spot"
	cont "in Hoenn!"
	done

ShoalCave1FStellaBeatenText:
	text "I'm frozen solid!"
	done

ShoalCave1FStellaAfterBattleText:
	text "The ice down below"
	line "is great for"
	cont "skating."
	done

ShoalCave1FIceHeal:
	itemball ICE_HEAL

ShoalCave1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 14, 23, ROUTE_125, 1
	warp_event 25,  5, SHOAL_CAVE_B1F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event 20, 18, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, ShoalCave1FStella, -1
	object_event  6, 13, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, ShoalCave1FIceHeal, EVENT_SHOAL_CAVE_1F_ICE_HEAL
