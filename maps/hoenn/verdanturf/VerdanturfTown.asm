	object_const_def
	const VERDANTURF_SICK_KID
	const VERDANTURF_MOTHER
	const VERDANTURF_TUNNEL_FAN
	const VERDANTURF_OLD_MAN
	const VERDANTURF_GARDENER
	const VERDANTURF_LASS
	const VERDANTURF_TWIN

VerdanturfTown_MapScripts:
	def_scene_scripts

	def_callbacks	
	callback MAPCALLBACK_NEWMAP, VerdanturfTownFlypointCallback

VerdanturfTownFlypointCallback:
	setflag ENGINE_FLYPOINT_VERDANTURF
	endcallback

VerdanturfSickKidScript:
	jumptextfaceplayer VerdanturfSickKidText

VerdanturfMotherScript:
	jumptextfaceplayer VerdanturfMotherText

VerdanturfTunnelFanScript:
	jumptextfaceplayer VerdanturfTunnelFanText

VerdanturfOldManScript:
	jumptextfaceplayer VerdanturfOldManText

VerdanturfGardenerScript:
	jumptextfaceplayer VerdanturfGardenerText

VerdanturfLassScript:
	jumptextfaceplayer VerdanturfLassText

VerdanturfTwinScript:
	jumptextfaceplayer VerdanturfTwinText

VerdanturfSickKidText:
	text "I used to get sick"
	line "all the time."

	para "Since we moved"
	line "here, I can play"
	cont "outside every day!"
	done

VerdanturfMotherText:
	text "The mountains keep"
	line "the ash from Mt."
	cont "Chimney away."

	para "That's why the air"
	line "here is so fresh."
	done

VerdanturfTunnelFanText:
	text "Rusturf Tunnel"
	line "leads to Rustboro."

	para "A man dug it by"
	line "hand, just to see"
	cont "the girl he loved!"

	para "Makuhita train in"
	line "there. You can"
	cont "hear them slap"
	cont "the rocks!"
	done

VerdanturfOldManText:
	text "Verdanturf is a"
	line "quiet town."

	para "People come here"
	line "to rest. Even"
	cont "#mon sleep well"
	cont "here."
	done

VerdanturfGardenerText:
	text "These flowers love"
	line "the clean air."

	para "The lady in the"
	line "house next door"
	cont "grows even more!"
	done

VerdanturfLassText:
	text "The old lady in"
	line "the big house"
	cont "teaches moves"
	cont "that protect a"
	cont "whole team."
	done

VerdanturfTwinText:
	text "Tag! You're it!"
	done

VerdanturfTown_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event  9,  7, RUSTURF_TUNNEL, 2
	warp_event 13,  7, VERDANTURF_POKECENTER, 2
	warp_event 17,  7, VERDANTURF_MART, 2
	warp_event 15, 15, VERDANTURF_ROCKSMASH_HOUSE, 2
	warp_event 01, 17, VERDANTURF_TRADE_HOUSE, 2
	warp_event  3,  7, VERDANTURF_TUTOR_HOUSE, 1
	warp_event  9, 15, VERDANTURF_FLOWER_HOUSE, 1

	def_coord_events

	def_bg_events	

	def_object_events
	object_event  6, 10, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VerdanturfSickKidScript, -1
	object_event  7, 10, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, VerdanturfMotherScript, -1
	object_event  9,  9, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, VerdanturfTunnelFanScript, -1
	object_event 17, 10, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VerdanturfOldManScript, -1
	object_event  5, 14, SPRITE_POKEFAN_F, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, VerdanturfGardenerScript, -1
	object_event 13, 13, SPRITE_LASS, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VerdanturfLassScript, -1
	object_event  5, 18, SPRITE_TWIN, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, VerdanturfTwinScript, -1
