	object_const_def
	const FORTREEPOKECENTER_NURSE
	const FORTREEPOKECENTER_CHANSEY
	const FORTREEPOKECENTER_TWIN
	const FORTREEPOKECENTER_HIKER

FortreePokecenter_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_SPRITES, FortreePokecenterMonSpritesCallback

FortreePokecenterMonSpritesCallback:
	setmonsprite SPRITE_MON_1, CHANSEY
	endcallback

FortreePokecenterNurseScript:
	jumpstd PokecenterNurseScript

FortreePokecenterChanseyScript:
	cry CHANSEY
	end

FortreePokecenterTwinScript:
	jumptextfaceplayer FortreePokecenterTwinText

FortreePokecenterTwinText:
	text "Our house is way"
	line "up in a tree!"

	para "Don't look down!"
	line "Hehe!"
	done

FortreePokecenterHikerScript:
	jumptextfaceplayer FortreePokecenterHikerText

FortreePokecenterHikerText:
	text "On the routes"
	line "near Fortree, the"
	cont "grass hides odd"
	cont "#mon."

	para "Kecleon change"
	line "color to blend"
	cont "in. And Absol"
	cont "show up before"
	cont "bad weather."
	done

FortreePokecenter_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  7, FORTREE_CITY, 1
	warp_event  5,  7, FORTREE_CITY, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, FortreePokecenterNurseScript, -1
	object_event  7,  1, SPRITE_MON_1, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FortreePokecenterChanseyScript, -1
	object_event  1,  4, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, FortreePokecenterTwinScript, -1
	object_event 11,  4, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, FortreePokecenterHikerScript, -1
