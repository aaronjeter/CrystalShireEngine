	object_const_def
	const FALLARBORREMINDERHOUSE_REMINDER

FallarborReminderHouse_MapScripts:
	def_scene_scripts

	def_callbacks

FallarborMoveReminder:
	faceplayer
	opentext
	special MoveReminder
	waitbutton
	closetext
	end


FallarborReminderHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, FALLARBOR_TOWN, 3
	warp_event  3,  7, FALLARBOR_TOWN, 3

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  3, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FallarborMoveReminder, -1
