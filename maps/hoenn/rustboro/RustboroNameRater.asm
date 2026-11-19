	object_const_def
	const RUSTBORONAMERATER_NAME_RATER

RustboroNameRater_MapScripts:
	def_scene_scripts

	def_callbacks

RustboroNameRaterScript:
	faceplayer
	opentext
	special NameRater
	waitbutton
	closetext
	end

RustboroNameRaterBookshelf:
	jumpstd DifficultBookshelfScript

RustboroNameRater_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, RUSTBORO_CITY, 10
	warp_event  3,  7, RUSTBORO_CITY, 10

	def_coord_events

	def_bg_events
	bg_event 0,  1, BGEVENT_READ, RustboroNameRaterBookshelf
	bg_event 1,  1, BGEVENT_READ, RustboroNameRaterBookshelf

	def_object_events
	object_event 2,  4, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RustboroNameRaterScript, -1
