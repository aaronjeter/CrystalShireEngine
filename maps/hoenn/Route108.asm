	object_const_def
	const MAPROUTE108_DENISE
	const MAPROUTE108_TONY
	const MAPROUTE108_LISA
	const MAPROUTE108_RIA
	const MAPROUTE108_DARRIN
	const MAPROUTE108_BETH
	const MAPROUTE108_CAMRON

Route108_MapScripts:
	def_scene_scripts

	def_callbacks	

Route108DeniseScript:
	trainer SWIMMERF, ROUTE108_DENISE, EVENT_BEAT_ROUTE108_DENISE, Route108DeniseSeenText, Route108DeniseBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext Route108DeniseAfterBattleText
	waitbutton
	closetext
	end

Route108DeniseSeenText:
	text "Ever been to"
	line "Dewford?"
	done

Route108DeniseBeatenText:
	text "I hate this!"
	done

Route108DeniseAfterBattleText:
	text "Dewford is kinda"
	line "lame these days."
	done


Route108TonyScript:
	trainer SWIMMERM, ROUTE108_TONY, EVENT_BEAT_ROUTE108_TONY, Route108TonySeenText, Route108TonyBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext Route108TonyAfterBattleText
	waitbutton
	closetext
	end

Route108TonySeenText:
	text "The sea is like"
	line "my backyard."

	para "Let's battle!"
	done

Route108TonyBeatenText:
	text "I lost on my home"
	line "field..."
	done

Route108TonyAfterBattleText:
	text "I swim the seas"
	line "with a heart"
	cont "full of dreams."
	done


Route108LisaRiaScript:
	trainer TWINS, ROUTE108_LISARIA, EVENT_BEAT_ROUTE108_LISARIA, Route108LisaRiaSeenText, Route108LisaRiaBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext Route108LisaRiaAfterBattleText
	waitbutton
	closetext
	end

Route108LisaRiaSeenText:
	text "We challenge you!"
	done

Route108LisaRiaBeatenText:
	text "Awesome!"

	para "You're tough!"
	done

Route108LisaRiaAfterBattleText:
	text "We love going"
	line "around together!"
	done


Route108DarrinScript:
	trainer SWIMMERM, ROUTE108_DARRIN, EVENT_BEAT_ROUTE108_DARRIN, Route108DarrinSeenText, Route108DarrinBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext Route108DarrinAfterBattleText
	waitbutton
	closetext
	end

Route108DarrinSeenText:
	text "Yawn!"

	para "I must have"
	line "drifted off."
	done

Route108DarrinBeatenText:
	text "Ahaha!"
	line "I lost..."
	done

Route108DarrinAfterBattleText:
	text "Floating is nice."
	done


Route10BethScript:
	trainer SWIMMERF, ROUTE108_BETH, EVENT_BEAT_ROUTE108_BETH, Route10BethSeenText, Route10BethBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext Route10BethAfterBattleText
	waitbutton
	closetext
	end

Route10BethSeenText:
	text "Shall we fight?"
	done

Route10BethBeatenText:
	text "I wasn't good"
	line "enough for you."
	done

Route10BethAfterBattleText:
	text "I think you're"
	line "going to keep"
	cont "getting better."
	done


Route108CamronScript:
	trainer CAMPER, ROUTE108_CAMRON, EVENT_BEAT_ROUTE108_CAMRON, Route108CamronSeenText, Route108CamronBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext Route108CamronAfterBattleText
	waitbutton
	closetext
	end

Route108CamronSeenText:
	text "I'm nowhere near"
	line "tired!"
	done

Route108CamronBeatenText:
	text "That exhausted me!"
	done

Route108CamronAfterBattleText:
	text "Am I going to"
	line "be okay?"
	done

Route108_MapEvents:
	db 0, 0 ; filler

	def_warp_events		

	def_coord_events

	def_bg_events	

	def_object_events
	object_event 17, 14, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_TRAINER, 3, Route108DeniseScript, -1
	object_event 18, 14, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_TRAINER, 3, Route108TonyScript, -1
	object_event 37, 13, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_TRAINER, 1, Route108LisaRiaScript, -1
	object_event 38, 13, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_TRAINER, 1, Route108LisaRiaScript, -1
	object_event 46, 05, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_TRAINER, 3, Route108DarrinScript, -1
	object_event 47, 05, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_TRAINER, 3, Route10BethScript, -1
	object_event 26, 05, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_TRAINER, 3, Route108CamronScript, -1
	