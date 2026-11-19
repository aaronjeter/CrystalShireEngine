	object_const_def

FortreeHouse1_MapScripts:
	def_scene_scripts

	def_callbacks	
	callback MAPCALLBACK_SPRITES, FortreeHouse1MonSpritesCallback

FortreeHouse1MonSpritesCallback:
	setmonsprite SPRITE_MON_1, TREECKO
	endcallback

FortreeHouse1GentlemanScript:
	jumptextfaceplayer FortreeHouse1GentlemanText

FortreeHouse1GentlemanText:
	text "Fortree is a nice"
	line "place to live..."

	para "The constant rain"
	line "does get old,"
	cont "however."
	done

FortreeTreeckoScript:	
	cry TREECKO
	end

FortreeHouse1KidScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_HOENN_QUICK_CLAW
	iftrue .Got
	writetext FortreeHouse1KidOfferText
	promptbutton
	verbosegiveitem QUICK_CLAW
	iffalse .Done
	setevent EVENT_GOT_HOENN_QUICK_CLAW
.Got:
	writetext FortreeHouse1KidAfterText
	waitbutton
.Done:
	closetext
	end

FortreeHouse1KidAfterText:
	text "A #mon holding"
	line "a Quick Claw can"
	cont "sometimes move"
	cont "first!"
	done

FortreeHouse1KidOfferText:
	text "Bird #mon dive"
	line "at their prey so"
	cont "fast!"

	para "I found this claw"
	line "under our tree."
	cont "You can have it!"
	done

FortreeHouse1_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event  4, 7, FORTREE_CITY, 6
	warp_event  5, 7, FORTREE_CITY, 6

	def_coord_events

	def_bg_events	

	def_object_events
	object_event  7,  4, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, FortreeHouse1GentlemanScript, -1
	object_event  8,  1, SPRITE_MON_1, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FortreeTreeckoScript, -1
	object_event  2,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FortreeHouse1KidScript, -1
