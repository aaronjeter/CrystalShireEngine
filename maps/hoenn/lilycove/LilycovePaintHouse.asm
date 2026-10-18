	object_const_def
	const LILYCOVEPAINTHOUSE_CLEA

LilycovePaintHouse_MapScripts:
	def_scene_scripts

	def_callbacks	

LilycovePaintHouse_Clea:
	faceplayer
	opentext
	writetext LilycoveCleaWelcomeText
	waitbutton

	checkitem MARVEL_SCALE
	iftrue .MarvelScale
	
	closetext
	end
.MarvelScale
	writetext LilycoveCleaOfferScaleText
	yesorno
	iffalse .Done
	monpaletteservice .Service
	ifequal MONPALSERVICE_CANCELLED, .Done
	waitbutton

.Done
	closetext
	end

.Service:
	monpal_item MARVEL_SCALE, HP_MAX_DARK, MONPAL_SHINY, LilycoveCleaPaintsText
	monpal_end

LilycoveCleaWelcomeText:
	text "Hi, welcome to"
	line "my Paint Shop!"

	para "I love to Paint"
	line "Pokemon, but..."

	para "I'm out of Ink."
	done

LilycoveCleaOfferScaleText:
	text "You have a"
	line "Marvel Scale!"

	para "I could make Ink"
	line "with that!"

	para "Give it to me,"
	line "and I'll make"

	para "one of your"
	line "#mon GLOW!"
	done

LilycoveCleaPaintsText:
	text "She grinds up"
	line "the Scale and"
	cont "makes Ink..."

	para "Then she artfully"
	line "paints @"
	text_ram wStringBuffer1
	text "!"
	done

LilycovePaintHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event  2, 7, LILYCOVE_CITY, 3
	warp_event  3, 7, LILYCOVE_CITY, 3

	def_coord_events

	def_bg_events	

	def_object_events
	object_event  02,  04, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, LilycovePaintHouse_Clea, -1
	