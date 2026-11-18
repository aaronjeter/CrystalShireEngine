	object_const_def
	const SOOTOPOLISLEGENDHOUSE_TELLER

SootopolisLegendHouse_MapScripts:
	def_scene_scripts

	def_callbacks

SootopolisLegendHouseTellerScript:
	jumptextfaceplayer SootopolisLegendHouseTellerText

SootopolisLegendHouseTellerText:
	text "When Kyogre and"
	line "Groudon fought,"

	para "a green dragon"
	line "came down from the"
	cont "sky to calm them."

	para "Rayquaza..."

	para "It's said to rest"
	line "on Meteor Peak,"
	cont "high above Meteor"
	cont "Falls."
	done

SootopolisLegendHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, SOOTOPOLIS_CITY, 7
	warp_event  3,  7, SOOTOPOLIS_CITY, 7

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  3, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SootopolisLegendHouseTellerScript, -1
