	object_const_def
	const FALLARBORPOKECENTER_NURSE
	const FALLARBORPOKECENTER_CHANSEY
	const FALLARBORPOKECENTER_GURU
	const FALLARBORPOKECENTER_FARMER
	const FALLARBORPOKECENTER_HIKER

FallarborPokecenter_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_SPRITES, FallarborPokecenterMonSpritesCallback

FallarborPokecenterMonSpritesCallback:
	setmonsprite SPRITE_MON_1, CHANSEY
	endcallback

FallarborPokecenterNurseScript:
	jumpstd PokecenterNurseScript

FallarborPokecenterChanseyScript:
	cry CHANSEY
	end

FallarborPokecenterGuruScript:
	jumptextfaceplayer FallarborPokecenterGuruText

FallarborPokecenterGuruText:
	text "My #mon"
	line "forgot some of"
	cont "their best moves."

	para "The Move Relearner"
	line "should be able"
	cont "to fix that."

	para "For a price..."
	done

FallarborPokecenterFarmerScript:
	jumptextfaceplayer FallarborPokecenterFarmerText

FallarborPokecenterFarmerText:
	text "Ash from Mt."
	line "Chimney blows in"
	cont "on Route 113."

	para "It makes the soil"
	line "around town rich."
	cont "My crops love it!"
	done

FallarborPokecenterHikerScript:
	jumptextfaceplayer FallarborPokecenterHikerText

FallarborPokecenterHikerText:
	text "I'm off to Meteor"
	line "Falls, west along"
	cont "Route 114."

	para "They say the falls"
	line "hide tunnels full"
	cont "of old fossils!"
	done

FallarborPokecenter_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5,  7, FALLARBOR_TOWN, 1
	warp_event  6,  7, FALLARBOR_TOWN, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, FallarborPokecenterNurseScript, -1
	object_event  6,  1, SPRITE_MON_1, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FallarborPokecenterChanseyScript, -1
	object_event  1,  4, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_ORANGE, OBJECTTYPE_SCRIPT, 0, FallarborPokecenterGuruScript, -1
	object_event 11,  4, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, FallarborPokecenterFarmerScript, -1
	object_event  9,  6, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, FallarborPokecenterHikerScript, -1
