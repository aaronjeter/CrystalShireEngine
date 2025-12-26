	object_const_def
	const LATTICEROOF_MARINA
	const LATTICEROOF_YOUNGSTER
	const LATTICEROOF_JESS
	const LATTICEROOF_KLUTCH
	const LATTICEROOF_AMAYA
	const LATTICEROOF_DANCER

LatticeApartmentRoof_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerCooltrainerFMarina:
	trainer COOLTRAINERF, MARINA1, EVENT_BEAT_ILEX_MARINA, TrainerCooltrainerFMarinaSeenText, TrainerCooltrainerFMarinaBeatenText, 0, .Script

.Script:	
	opentext
	writetext TrainerCooltrainerFMarinaAfterBattleText
	waitbutton
	closetext
	disappear LATTICEROOF_MARINA
	end

TrainerCooltrainerFMarinaSeenText:
	text "I heard there's"
	line "tournament coming"

	para "up soon."
	line "I'll be ready!"
	done

TrainerCooltrainerFMarinaBeatenText:
	text "Well Fought!"
	line "I needed a "
	cont "good challenge."	
	done

TrainerCooltrainerFMarinaAfterBattleText:
	text "I'm training"
	line "to take on the"
	cont "Judges."

	para "Maybe we'll "
	line "meet again!"
	done


TrainerYoungsterRonald:
	trainer YOUNGSTER, RONALD1, EVENT_BEAT_ILEX_RONALD, TrainerYoungsterRonaldSeenText, TrainerYoungsterRonaldBeatenText, 0, .Script

.Script:	
	opentext
	writetext TrainerYoungsterRonaldAfterBattleText
	waitbutton
	closetext
	disappear LATTICEROOF_YOUNGSTER
	end

TrainerYoungsterRonaldSeenText:
	text "I'm gonna win"
	line "the cup!"
	done

TrainerYoungsterRonaldBeatenText:
	text "Yikes!"
	line "You're really "
	cont "strong."	
	done

TrainerYoungsterRonaldAfterBattleText:
	text "I'm training"
	line "for the"
	cont "Lattice Cup."

	para "You should "
	line "compete!"
	done


TrainerTeacherJess:
	trainer TEACHER, JESS1, EVENT_BEAT_LATTICE_ROOF_JESS, TrainerTeacherJessSeenText, TrainerTeacherJessBeatenText, 0, .Script

.Script:	
	opentext
	writetext TrainerTeacherJessAfterBattleText
	waitbutton
	closetext
	disappear LATTICEROOF_JESS
	end

TrainerTeacherJessSeenText:
	text "I'm going to"
	line "be ready for"

	para "the tournament."
	done

TrainerTeacherJessBeatenText:
	text "Exciting!"

	para "I still have"
	line "a lot of work"
	cont "to do."	
	done

TrainerTeacherJessAfterBattleText:
	text "Good fight."

	para "Let's do it"
	line "again sometime."
	done


TrainerTeacherKlutch:
	trainer TEACHER, KLUTCH1, EVENT_BEAT_LATTICE_ROOF_KLUTCH, TrainerTeacherKlutchSeenText, TrainerTeacherKlutchBeatenText, 0, .Script

.Script:	
	opentext
	writetext TrainerTeacherKlutchAfterBattleText
	waitbutton
	closetext
	disappear LATTICEROOF_KLUTCH
	end

TrainerTeacherKlutchSeenText:
	text "I'm going to"
	line "be a Judge"

	para "one day."
	done

TrainerTeacherKlutchBeatenText:
	text "Yikes!"
	done

TrainerTeacherKlutchAfterBattleText:
	text "One of these"
	line "days..."

	para "Might be a"
	line "while!"
	done


TrainerRocketAmaya:
	trainer GRUNTF, AMAYA1, EVENT_BEAT_LATTICE_ROOF_AMAYA, TrainerRocketAmayaSeenText, TrainerRocketAmayaBeatenText, 0, .Script

.Script:	
	opentext
	writetext TrainerRocketAmayaAfterBattleText
	waitbutton
	closetext
	disappear LATTICEROOF_AMAYA
	end

TrainerRocketAmayaSeenText:
	text "I need to beat"
	line "dozens of chumps"

	para "like you to"
	line "be ready!"
	done

TrainerRocketAmayaBeatenText:
	text "Dang it!"
	done

TrainerRocketAmayaAfterBattleText:
	text "One of these"
	line "days..."

	para "You better"
	line "watch your step!"
	done

LatticeRoofDancer:

	checkevent EVENT_BEAT_ILEX_MARINA
	iffalse .Help
	checkevent EVENT_BEAT_ILEX_RONALD
	iffalse .Help
	checkevent EVENT_BEAT_LATTICE_ROOF_JESS
	iffalse .Help
	checkevent EVENT_BEAT_LATTICE_ROOF_KLUTCH
	iffalse .Help
	checkevent EVENT_BEAT_LATTICE_ROOF_AMAYA
	iffalse .Help

	opentext
	writetext LatticeRoofDancerThanksText
	waitbutton	
	setevent HELPED_LATTICEROOF_DANCER
	givepoke UNOWN, 5
	closetext
	disappear LATTICEROOF_DANCER
	end
	

.Help
	opentext
	writetext LatticeRoofDancerHelpText
	waitbutton
	closetext
	end

LatticeRoofDancerHelpText:
	text "Could you please"
	line "help get rid"
	
	para "of these guys"
	line "training on the"
	cont "roof?"

	para "I can't sleep"
	line "with all this"
	cont "noise."
	done


LatticeRoofDancerThanksText:
	text "Thanks!"

	para "What to do"
	line "about a reward?"

	para "....."

	para "I know!"

	para "Take this little"
	line "fellow."

	para "I'm sure he'd"
	line "rather live"

	para "with a proper"
	line "trainer."
	done


LatticeApartmentRoof_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  6,  1, LATTICE_APARTMENT_3F, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event 00, 01, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerCooltrainerFMarina, EVENT_BEAT_ILEX_MARINA
	object_event 00, 08, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerYoungsterRonald, EVENT_BEAT_ILEX_RONALD
	object_event 04, 03, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerTeacherJess, EVENT_BEAT_LATTICE_ROOF_JESS
	object_event 04, 05, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerTeacherKlutch, EVENT_BEAT_LATTICE_ROOF_KLUTCH
	object_event 00, 04, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerRocketAmaya, EVENT_BEAT_LATTICE_ROOF_AMAYA
	object_event 07, 02, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_AZURE, OBJECTTYPE_SCRIPT, 0, LatticeRoofDancer, HELPED_LATTICEROOF_DANCER
