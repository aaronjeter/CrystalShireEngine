	object_const_def
	const MAPROUTE111_TYRON
	const MAPROUTE111_CELINA
	const MAPROUTE111_BIANCA
	const MAPROUTE111_HAYDEN
	const MAPROUTE111_GABBY
	const MAPROUTE111_IRENE
	const MAPROUTE111_TRAVIS

Route111_MapScripts:
	def_scene_scripts

	def_callbacks	

Route111TyronScript:
	trainer CAMPER, ROUTE111_TYRON, EVENT_BEAT_ROUTE111_TYRON, Route111TyronSeenText, Route111TyronBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext Route111TyronAfterBattleText
	waitbutton
	closetext
	end

Route111TyronSeenText:
	text "This is my"
	line "favorite kind"
	cont "of #mon!"
	done

Route111TyronBeatenText:
	text "Wait!"
	done

Route111TyronAfterBattleText:
	text "Did you get a good"
	line "look at my"
	cont "#mon?"
	done


Route111CelinaScript:
	trainer PICNICKER, ROUTE111_CELINA, EVENT_BEAT_ROUTE111_CELINA, Route111CelinaSeenText, Route111CelinaBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext Route111CelinaAfterBattleText
	waitbutton
	closetext
	end

Route111CelinaSeenText:
	text "Show me something"
	line "exciting!"
	done

Route111CelinaBeatenText:
	text "Oh...my..."
	done

Route111CelinaAfterBattleText:
	text "My pulse is"
	line "still racing!"
	done


Route111BiancaScript:
	trainer PICNICKER, ROUTE111_BIANCA, EVENT_BEAT_ROUTE111_BIANCA, Route111BiancaSeenText, Route111BiancaBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext Route111BiancaAfterBattleText
	waitbutton
	closetext
	end

Route111BiancaSeenText:
	text "Did you come"
	line "from Mauville?"
	done

Route111BiancaBeatenText:
	text "Ooh lala!"
	done

Route111BiancaAfterBattleText:
	text "You have quite"
	line "a ways to travel."
	done


Route111HaydenScript:
	trainer FIREBREATHER, ROUTE111_HAYDEN, EVENT_BEAT_ROUTE111_HAYDEN, Route111HaydenSeenText, Route111HaydenBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext Route111HaydenAfterBattleText
	waitbutton
	closetext
	end

Route111HaydenSeenText:
	text "There's no room"
	line "for pity!"
	done

Route111HaydenBeatenText:
	text "Ugh!"
	done

Route111HaydenAfterBattleText:
	text "My stomach is"
	line "grumbling!"

	para "I wonder if I"
	line "could grill"
	cont "some berries?"
	done


Route111GabbyScript:
	trainer PICNICKER, ROUTE111_GABBY, EVENT_BEAT_ROUTE111_GABBY, Route111GabbySeenText, Route111GabbyBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext Route111GabbyAfterBattleText
	waitbutton
	closetext
	end

Route111GabbySeenText:
	text "Hi there!"
	done

Route111GabbyBeatenText:
	text "Ugh!"
	done

Route111GabbyAfterBattleText:
	text "I think I"
	line "should be alone."
	done


Route111IreneScript:
	trainer PICNICKER, ROUTE111_IRENE, EVENT_BEAT_ROUTE111_IRENE, Route111IreneSeenText, Route111IreneBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext Route111IreneAfterBattleText
	waitbutton
	closetext
	end

Route111IreneSeenText:
	text "I don't know where"
	line "you're going,"

	para "but would you like"
	line "to battle?"
	done

Route111IreneBeatenText:
	text "Oh, you're good!"
	done

Route111IreneAfterBattleText:
	text "The view here is"
	line "so nice!"
	done


Route111TravisScript:
	trainer CAMPER, ROUTE111_TRAVIS, EVENT_BEAT_ROUTE111_TRAVIS, Route111TravisSeenText, Route111TravisBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext Route111TravisAfterBattleText
	waitbutton
	closetext
	end

Route111TravisSeenText:
	text "I'm full of pep!"
	done

Route111TravisBeatenText:
	text "My #mon"
	line "lost its pep."
	done

Route111TravisAfterBattleText:
	text "I can't help it!"
	done

Route111FruitTree1:
	fruittree FRUITTREE_ROUTE_111_1

Route111FruitTree2:
	fruittree FRUITTREE_ROUTE_111_2

Route111HeavyBall:
	itemball HEAVY_BALL

Route111_MapEvents:
	db 0, 0 ; filler

	def_warp_events		
	warp_event  15, 05, LAVARIDGE_DESERT, 1	

	def_coord_events

	def_bg_events	

	def_object_events
	object_event 14, 54, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, Route111TyronScript, -1
	object_event 23, 50, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_TRAINER, 3, Route111CelinaScript, -1
	object_event 19, 34, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, Route111BiancaScript, -1
	object_event 15, 19, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, Route111HaydenScript, -1
	object_event 11, 11, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, Route111GabbyScript, -1
	object_event 18, 12, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, Route111IreneScript, -1
	object_event 12, 11, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, Route111TravisScript, -1
	object_event 04, 22, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route111FruitTree1, -1
	object_event 05, 22, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route111FruitTree2, -1
	object_event 26, 28, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route111HeavyBall, EVENT_ROUTE_111_HEAVY_BALL
