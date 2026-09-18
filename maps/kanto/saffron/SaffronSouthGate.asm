	object_const_def
	const SAFFRONSOUTHGATE_OFFICER

SaffronSouthGate_MapScripts:
	def_scene_scripts
	scene_script Route6SaffronGateNoopScene ; unusable

	def_callbacks

Route6SaffronGateNoopScene:
	end

SaffronSouthGateGuardScript:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedPart
	writetext SaffronSouthGateGuardWelcomeText
	waitbutton
	closetext
	end

.ReturnedPart:
	writetext SaffronSouthGateGuardMagnetTrainText
	waitbutton
	closetext
	end

SaffronSouthGateGuardWelcomeText:
	text "Welcome to Saffron"
	line "City, home of the"
	cont "Magnet Train!"

	para "…That's what I'd"
	line "normally say, but"

	para "the Magnet Train"
	line "isn't running now."

	para "It's not getting"
	line "any electricity"

	para "because there's"
	line "something wrong"

	para "with the Power"
	line "Plant."
	done

SaffronSouthGateGuardMagnetTrainText:
	text "The Magnet Train"
	line "is the most famous"

	para "thing about Saf-"
	line "fron."
	done


SaffronSouthGateOfficerBlocksText:
	text "I'm sorry, but"
	line "Saffron City is"
	cont "currently on"
	cont "lockdown."

	para "It sounds like"
	line "something from"
	cont "Silph Co broke"
	cont "containment."

	para "Sounds kind of"
	line "scary, actually..."
	done

SaffronSouthGateBlockScript:
	checkevent EVENT_SAFFRON_CITY_OPEN
	iftrue .done

	showemote EMOTE_SHOCK, SAFFRONSOUTHGATE_OFFICER, 10

	opentext
	writetext SaffronSouthGateOfficerBlocksText
	waitbutton
	closetext

	turnobject PLAYER, DOWN
	applymovement PLAYER, SaffronSouthGate_StepDownMovement
	
	.done 
	end

SaffronSouthGate_StepDownMovement:
	step DOWN
	step DOWN
	step_end


SaffronSouthGate_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  0, SAFFRON_CITY, 12
	warp_event  5,  0, SAFFRON_CITY, 13
	warp_event  4,  7, ROUTE_6, 2
	warp_event  5,  7, ROUTE_6, 2

	def_coord_events
	coord_event  02, 04, -1, SaffronSouthGateBlockScript
	coord_event  03, 04, -1, SaffronSouthGateBlockScript
	coord_event  04, 04, -1, SaffronSouthGateBlockScript
	coord_event  05, 04, -1, SaffronSouthGateBlockScript
	coord_event  06, 04, -1, SaffronSouthGateBlockScript
	coord_event  07, 04, -1, SaffronSouthGateBlockScript

	def_bg_events

	def_object_events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SaffronSouthGateGuardScript, -1
