	object_const_def
	const MTMOONPOKECENTER_NURSE
	const MTMOONPOKECENTER_FISHER
	const MTMOONPOKECENTER_LASS
	const MTMOONPOKECENTER_JIGGLYPUFF

MtMoonPokecenter_MapScripts:
	def_scene_scripts

	def_callbacks

MtMoonPokecenterNurseScript:
	jumpstd PokecenterNurseScript

MtMoonFisherScript:
	faceplayer
	opentext
	checkevent EVENT_BOUGHT_MT_MOON_FEEBAS
	iftrue MtMoonFisher_AfterBuying

.SellFeebas:
	opentext
	writetext MtMoonFisherBuyAFishText
	special PlaceMoneyTopRight
	yesorno
	iffalse .Refused
	checkmoney YOUR_MONEY, 1000
	ifequal HAVE_LESS, .NotEnoughMoney
	givepoke FEEBAS, 5
	setevent EVENT_BOUGHT_MT_MOON_FEEBAS
	waitsfx
	playsound SFX_TRANSACTION
	takemoney YOUR_MONEY, 1000
	special PlaceMoneyTopRight
	writetext MtMoonFisher_AfterBuyingText
	waitbutton
	closetext
	end

.NotEnoughMoney:
	writetext MtMoonFisher_NotEnoughMoneyText
	waitbutton
	closetext
	end

.Refused:
	writetext MtMoonFisher_RefusedText
	waitbutton
	closetext
	end

MtMoonFisher_AfterBuying:
	writetext MtMoonFisher_AfterBuyingText
	waitbutton
	closetext
	end

MtMoonFisherBuyAFishText:
	text "Hey kid, wanna"
	line "buy a rare #-"
	cont "mon?"

	para "Only a thousand"
	line "#bucks!"
	done

MtMoonFisher_AfterBuyingText:
	text "No takebacks,"
	line "sucker!" 
	done

MtMoonFisher_NotEnoughMoneyText:
	text "You don't have"
	line "enough money."
	done

MtMoonFisher_RefusedText:
	text "Oh, fine then."
	done

MtMoonLassScript:
	jumptextfaceplayer MtMoonLassText

MtMoonJigglypuffScript:
	opentext
	writetext MtMoonJigglypuffText
	cry JIGGLYPUFF
	waitbutton
	closetext
	end

MtMoonLassText:
	text "I caught most of"
	line "my #mon in"
	cont "Mt Moon."

	para "Jigglypuff here"
	line "is my best friend"
	cont "now!"
	done

MtMoonJigglypuffText:
	text "Jiig-uhh-lee-puff!"
	done

MtMoonPokecenter_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, ROUTE_3, 2
	warp_event  4,  7, ROUTE_3, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MtMoonPokecenterNurseScript, -1
	object_event  2,  5, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, MtMoonFisherScript, -1
	object_event  7,  7, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MtMoonLassScript, -1
	object_event  8,  7, SPRITE_JIGGLYPUFF, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, MtMoonJigglypuffScript, -1
