	object_const_def

WCRoundFour_MapScripts:
	def_scene_scripts

	def_callbacks

WCRoundFourDoorLocksBehindYouScript:
	applymovement PLAYER, WCRoundFour_EnterMovement
	reanchormap $86
	playsound SFX_STRENGTH
	earthquake 80
	changeblock 6, 08, $2e ; Dragon Door
	refreshmap
	closetext
	waitsfx
	end

WCRoundFour_EnterMovement:
	step UP
	step UP
	step_end


WCRoundFour_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event   06, 15, WC_ROUND_THREE, 3
	warp_event   07, 15, WC_ROUND_THREE, 4

	def_coord_events
	coord_event  06,  09, -1, WCRoundFourDoorLocksBehindYouScript
	coord_event  07,  09, -1, WCRoundFourDoorLocksBehindYouScript

	def_bg_events

	def_object_events
	;object_event  7,  7, SPRITE_RIVAL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, WCSilverScript, -1
