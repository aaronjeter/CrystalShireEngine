	object_const_def
	const DIGLETTSCAVE_POKEFAN_M

DiglettsCave_MapScripts:
	def_scene_scripts

	def_callbacks

DiglettsCavePokefanMScript:
	jumptextfaceplayer DiglettsCavePokefanMText

DiglettsCaveHiddenMaxRevive:
	hiddenitem MAX_REVIVE, EVENT_DIGLETTS_CAVE_HIDDEN_MAX_REVIVE

DiglettsCavePokefanMText:
	text "A bunch of Diglett"
	line "popped out of the"

	para "ground! That was"
	line "shocking."
	done

DiglettGuyScript:
	faceplayer
	opentext

	writetext DiglettGuyOfferServiceText
	yesorno
	iffalse .Refused
	checkitem GOLD_LEAF
	iffalse .NotEnoughMoney

	loadmem wPartyMon1DVs+0, HP_MAX_GROUND
	loadmem wPartyMon1DVs+1, $fe

	waitsfx
	playsound SFX_TRANSACTION
	takeitem GOLD_LEAF
	writetext DiglettGuyAfterServiceText
	waitbutton
	closetext
	end

.NotEnoughMoney:
	writetext DiglettGuyNoMoneyText
	waitbutton
	closetext
	end

.Refused:
	writetext DiglettGuyRefusedText
	waitbutton
	closetext
	end

DiglettGuyOfferServiceText:
	text "I love Digletts!"
	line "Do you?"

	para "I can fill your"
	line "first #mon"
	cont "with the power of"
	cont "the Earth!"

	para "They'll even look"
	line "more like Diglett!"

	para "I just need a"
	line "Gold Leaf. Got"
	cont "one for me?"
	done


DiglettGuyAfterServiceText:
	text "And...it is"
	line "complete!"

	para "Your #mon is"
	line "filled with Hidden"
	cont "Ground Power."

	para "And has taken on"
	line "a lovely shade as"
	cont "well..."
	done
	
DiglettGuyNoMoneyText:
	text "Yeah, that isn't"
	line "a Gold Leaf..."
	done

DiglettGuyRefusedText:
	text "Oh, alright."
	line "It isn't for"
	cont "just anyone."
	done

DiglettsCave_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3, 33, VERMILION_CITY, 10
	warp_event  5, 31, DIGLETTS_CAVE, 5
	warp_event 15,  5, ROUTE_2, 5
	warp_event 17,  3, DIGLETTS_CAVE, 6
	warp_event 17, 33, DIGLETTS_CAVE, 2
	warp_event  3,  3, DIGLETTS_CAVE, 4

	def_coord_events

	def_bg_events
	bg_event  6, 11, BGEVENT_ITEM, DiglettsCaveHiddenMaxRevive

	def_object_events
	object_event  3, 31, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DiglettsCavePokefanMScript, -1
	object_event 12, 17, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, DiglettGuyScript, -1
