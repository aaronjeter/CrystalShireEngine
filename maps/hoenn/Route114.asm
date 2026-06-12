	object_const_def
	const MAPROUTE114_STEVE
	const MAPROUTE114_NOLAN
	const MAPROUTE114_KAI
	const MAPROUTE114_CLAUDE
	const MAPROUTE114_LUCAS
	const MAPROUTE114_LENNY
	const MAPROUTE114_BERNIE
	const MAPROUTE114_CHARLOTTE
	const MAPROUTE114_NANCY
	const MAPROUTE114_ANGELINA
	const MAPROUTE114_SHANE
	const MAPROUTE114_FRUITTREE1
	const MAPROUTE114_FRUITTREE2

Route114_MapScripts:
	def_scene_scripts

	def_callbacks	

Route114SteveScript:
	trainer POKEMANIAC, ROUTE114_STEVE, EVENT_BEAT_ROUTE114_STEVE, Route114SteveSeenText, Route114SteveBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext Route114SteveAfterBattleText
	waitbutton
	closetext
	end

Route114SteveSeenText:
	text "Yo, check out"
	line "my #mon!"
	done

Route114SteveBeatenText:
	text "Awww..."
	done

Route114SteveAfterBattleText:
	text "My #mon"
	line "are awesome!"
	done


Route114NolanScript:
	trainer FISHER, ROUTE114_NOLAN, EVENT_BEAT_ROUTE114_NOLAN, Route114NolanSeenText, Route114NolanBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext Route114NolanAfterBattleText
	waitbutton
	closetext
	end

Route114NolanSeenText:
	text "Nothing is biting."
	line "Wanna fight?"
	done

Route114NolanBeatenText:
	text "Ha, I needed"
	line "that."
	done

Route114NolanAfterBattleText:
	text "I just needed"
	line "a break."
	done

Route114KaiScript:
	trainer FISHER, ROUTE114_KAI, EVENT_BEAT_ROUTE114_KAI, Route114KaiSeenText, Route114KaiBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext Route114KaiAfterBattleText
	waitbutton
	closetext
	end

Route114KaiSeenText:
	text "Hey!"

	para "You scared off"
	line "the fish!"
	done

Route114KaiBeatenText:
	text "No fish... "
	line "can't win..."
	cont "still hungry..."
	done

Route114KaiAfterBattleText:
	text "Here fishy fishy."

	para "Heeeree fishiie!"
	done

Route114ClaudeScript:
	trainer FISHER, ROUTE114_CLAUDE, EVENT_BEAT_ROUTE114_CLAUDE, Route114ClaudeSeenText, Route114ClaudeBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext Route114ClaudeAfterBattleText
	waitbutton
	closetext
	end

Route114ClaudeSeenText:
	text "So, what's your"
	line "favorite fish?"
	done

Route114ClaudeBeatenText:
	text "Gosh I'm hungry."
	done

Route114ClaudeAfterBattleText:
	text "Barboach are kinda"
	line "muddy, but they"
	cont "fry up great!"
	done

Route114LucasScript:
	trainer HIKER, ROUTE114_LUCAS, EVENT_BEAT_ROUTE114_LUCAS, Route114LucasSeenText, Route114LucasBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext Route114LucasAfterBattleText
	waitbutton
	closetext
	end

Route114LucasSeenText:
	text "Meteor Falls is"
	line "beautiful!"
	done

Route114LucasBeatenText:
	text "I love a good"
	line "battle! Well done!"
	done

Route114LucasAfterBattleText:
	text "I just got out"
	line "of the falls."
	done

Route114LennyScript:
	trainer HIKER, ROUTE114_LENNY, EVENT_BEAT_ROUTE114_LENNY, Route114LennySeenText, Route114LennyBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext Route114LennyAfterBattleText
	waitbutton
	closetext
	end

Route114LennySeenText:
	text "Ugh, I'm tired."
	done

Route114LennyBeatenText:
	text "..."
	done

Route114LennyAfterBattleText:
	text "I still need"
	line "to walk home too."
	done

Route114BernieScript:
	trainer FIREBREATHER, ROUTE114_BERNIE, EVENT_BEAT_ROUTE114_BERNIE, Route114BernieSeenText, Route114BernieBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext Route114BernieAfterBattleText
	waitbutton
	closetext
	end

Route114BernieSeenText:
	text "Burn!"
	done

Route114BernieBeatenText:
	text "You're fireproof!"
	done

Route114BernieAfterBattleText:
	text "I just like"
	line "fire!"
	done

Route114CharlotteScript:
	trainer PICNICKER, ROUTE114_CHARLOTTE, EVENT_BEAT_ROUTE114_CHARLOTTE, Route114CharlotteSeenText, Route114CharlotteBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext Route114CharlotteAfterBattleText
	waitbutton
	closetext
	end

Route114CharlotteSeenText:
	text "I'm hungry!"
	line "Time to stop!"
	done

Route114CharlotteBeatenText:
	text "Now I'm REALLY"
	line "hungry."
	done

Route114CharlotteAfterBattleText:
	text "You should always"
	line "bring snacks."
	done


Route114NancyScript:
	trainer PICNICKER, ROUTE114_NANCY, EVENT_BEAT_ROUTE114_NANCY, Route114NancySeenText, Route114NancyBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext Route114NancyAfterBattleText
	waitbutton
	closetext
	end

Route114NancySeenText:
	text "It's quite a"
	line "walk, but the"
	cont "Falls are lovely."
	done

Route114NancyBeatenText:
	text "Huff...huff"
	done

Route114NancyAfterBattleText:
	text "I guess they'll"
	line "still be pretty"
	cont "when I get there."
	done


Route114AngelinaScript:
	trainer PICNICKER, ROUTE114_ANGELINA, EVENT_BEAT_ROUTE114_ANGELINA, Route114AngelinaSeenText, Route114AngelinaBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext Route114AngelinaAfterBattleText
	waitbutton
	closetext
	end

Route114AngelinaSeenText:
	text "Don't you just"
	line "love nature?"
	done

Route114AngelinaBeatenText:
	text "I suppose it"
	line "was natural for"
	cont "you to win..."
	done

Route114AngelinaAfterBattleText:
	text "I just love"
	line "getting out to"
	cont "explore."
	done


Route114ShaneScript:
	trainer CAMPER, ROUTE114_SHANE, EVENT_BEAT_ROUTE114_SHANE, Route114ShaneSeenText, Route114ShaneBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext Route114ShaneAfterBattleText
	waitbutton
	closetext
	end

Route114ShaneSeenText:
	text "Yawn."

	para "I think you"
	line "woke me up."
	done

Route114ShaneBeatenText:
	text "Yawn."
	done

Route114ShaneAfterBattleText:
	text "I think I need"
	line "another nap."
	done



Route114Sign:
	jumptext Route114SignText

Route114SignText:
	text "Route 114"

	para "North: Fallarbor"
	line "South: Meteor"
	cont "Falls"
	done

Route114LanettesHouseSign:
	jumptext Route114LanettesHouseSignText

Route114LanettesHouseSignText:
	text "Lanette's House"
	done

Route114FruitTree1:
	fruittree FRUITTREE_ROUTE_114_1

Route114FruitTree2:
	fruittree FRUITTREE_ROUTE_114_2

Route114RareCandy:
	itemball RARE_CANDY

Route114Stardust:
	itemball STARDUST

Route114_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event  09, 69, METEOR_FALLS, 1
	warp_event  27, 37, LANETTE_HOUSE, 1

	def_coord_events

	def_bg_events	
	bg_event  17, 37, BGEVENT_READ, Route114Sign
	bg_event  25, 37, BGEVENT_READ, Route114LanettesHouseSign

	def_object_events
	object_event 10, 43, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_TRAINER, 3, Route114SteveScript, -1
	object_event 10, 24, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, Route114NolanScript, -1
	object_event 19, 13, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, Route114KaiScript, -1
	object_event 21, 29, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_YELLOW, OBJECTTYPE_TRAINER, 1, Route114ClaudeScript, -1
	object_event 07, 75, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, Route114LucasScript, -1
	object_event 25, 57, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, Route114LennyScript, -1
	object_event 08, 40, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, Route114BernieScript, -1
	object_event 18, 65, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, Route114CharlotteScript, -1
	object_event 27, 21, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, Route114NancyScript, -1
	object_event 30, 68, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, Route114AngelinaScript, -1
	object_event 27, 50, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_TRAINER, 0, Route114ShaneScript, -1
	object_event 32, 42, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route114FruitTree1, -1
	object_event 33, 42, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route114FruitTree2, -1
	object_event 33, 46, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route114RareCandy, EVENT_ROUTE_114_RARE_CANDY
	object_event 10, 14, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route114Stardust, EVENT_ROUTE_114_STARDUST
	