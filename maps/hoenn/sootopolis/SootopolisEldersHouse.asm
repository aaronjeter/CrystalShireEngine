	object_const_def
	const SOOTOPOLISELDERSHOUSE_ELDER

SootopolisEldersHouse_MapScripts:
	def_scene_scripts

	def_callbacks

SootopolisEldersHouseElderScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_KYOGRE
	iffalse .Legend
	checkevent EVENT_GOT_GROUDON
	iffalse .Legend
	writetext SootopolisElderMetBothText
	waitbutton
	closetext
	end

.Legend:
	writetext SootopolisElderLegendText
	waitbutton
	closetext
	end

SootopolisElderLegendText:
	text "Long ago, Kyogre"
	line "raised the seas"

	para "and Groudon raised"
	line "the land."

	para "Their battle shook"
	line "all of Hoenn."

	para "Kyogre sleeps in"
	line "the Cave of Origin"
	cont "here in our city."

	para "Groudon sleeps in"
	line "the depths of"
	cont "Mt. Chimney."

	para "Only those with"
	line "our Gym's badge"
	cont "may enter them."
	done

SootopolisElderMetBothText:
	text "You have faced"
	line "both Kyogre and"
	cont "Groudon?"

	para "Then the old tale"
	line "lives on in you."

	para "Treat them with"
	line "respect, young"
	cont "one."
	done

SootopolisEldersHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, SOOTOPOLIS_CITY, 6
	warp_event  3,  7, SOOTOPOLIS_CITY, 6

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  3, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, SootopolisEldersHouseElderScript, -1
