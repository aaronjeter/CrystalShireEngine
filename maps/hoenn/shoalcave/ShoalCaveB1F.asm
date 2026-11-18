ShoalCaveB1F_MapScripts:
	def_scene_scripts

	def_callbacks

ShoalCaveB1FKent:
	trainer BOARDER, SHOAL_CAVE_KENT, EVENT_BEAT_SHOAL_CAVE_KENT, ShoalCaveB1FKentSeenText, ShoalCaveB1FKentBeatenText, 0, .Script

.Script:
	trainerafter ShoalCaveB1FKentAfterBattleText

ShoalCaveB1FKentSeenText:
	text "I came for the"
	line "ice, but I'll take"
	cont "a battle too!"
	done

ShoalCaveB1FKentBeatenText:
	text "Wiped out!"
	done

ShoalCaveB1FKentAfterBattleText:
	text "Watch your step on"
	line "the ice. You won't"
	cont "stop till you hit"
	cont "something!"
	done

ShoalCaveB1FNeverMeltIce:
	itemball NEVERMELTICE

ShoalCaveB1FUltraBall:
	itemball ULTRA_BALL

ShoalCaveB1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 25,  5, SHOAL_CAVE_1F, 2
	warp_event  5, 23, SHOAL_CAVE_B2F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event 12, 10, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, ShoalCaveB1FKent, -1
	object_event  6,  5, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, ShoalCaveB1FNeverMeltIce, EVENT_SHOAL_CAVE_B1F_NEVERMELTICE
	object_event 17, 12, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, ShoalCaveB1FUltraBall, EVENT_SHOAL_CAVE_B1F_ULTRA_BALL
