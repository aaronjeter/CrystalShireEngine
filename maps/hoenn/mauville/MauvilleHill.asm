	object_const_def
	const MAUVILLEHILL_RESIDENT
	const MAUVILLEHILL_GIRL

MauvilleHill_MapScripts:
	def_scene_scripts

	def_callbacks

MauvilleHillResidentScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_MAUVILLE_ROCKETS
	iftrue .RocketsGone
	writetext MauvilleHillResidentRocketsText
	waitbutton
	closetext
	end

.RocketsGone:
	writetext MauvilleHillResidentThanksText
	waitbutton
	closetext
	end

MauvilleHillGirlScript:
	jumptextfaceplayer MauvilleHillGirlText

MauvilleHillBookshelf:
	jumpstd MagazineBookshelfScript

MauvilleHillResidentRocketsText:
	text "Welcome to"
	line "Mauville Hill!"

	para "Wattson and I go"
	line "way back. He built"
	cont "New Mauville to"
	cont "power this city."

	para "You reach it from"
	line "the water off"
	cont "Route 110."

	para "Now Team Rocket"
	line "has moved in down"
	cont "there. Wattson is"
	cont "furious!"
	done

MauvilleHillResidentThanksText:
	text "Team Rocket has"
	line "left Mauville!"

	para "Wattson's laughing"
	line "again. I can hear"
	cont "it from up here!"
	cont "Wahahaha!"
	done

MauvilleHillGirlText:
	text "When the lights"
	line "flicker, Grandpa"
	cont "says New Mauville"
	cont "is acting up."
	done

MauvilleHill_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, MAUVILLE_CITY, 8
	warp_event  3,  7, MAUVILLE_CITY, 8

	def_coord_events

	def_bg_events
	bg_event 0,  1, BGEVENT_READ, MauvilleHillBookshelf
	bg_event 1,  1, BGEVENT_READ, MauvilleHillBookshelf

	def_object_events
	object_event 5,  3, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MauvilleHillResidentScript, -1
	object_event 2,  4, SPRITE_TWIN, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MauvilleHillGirlScript, -1
