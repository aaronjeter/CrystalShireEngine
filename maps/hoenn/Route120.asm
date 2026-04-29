	object_const_def
	const MAPROUTE120_ROBERT
	const MAPROUTE120_COLIN
	const MAPROUTE120_LEONEL
	const MAPROUTE120_JENNIFER
	const MAPROUTE120_CLARISSA
	const MAPROUTE120_ANGELICA
	const MAPROUTE120_JEFFREY
	const MAPROUTE120_CALLIE
	const MAPROUTE120_RILEY
	const MAPROUTE120_LORENZO
	const MAPROUTE120_KEIGO
	const MAPROUTE120_JENNA
	const MAPROUTE120_CHIP
	const MAPROUTE120_DALE
	const MAPROUTE120_FRUITTREE1
	const MAPROUTE120_FRUITTREE2

Route120_MapScripts:
	def_scene_scripts

	def_callbacks	

Route120RobertScript:
	trainer BIRD_KEEPER, ROUTE120_ROBERT, EVENT_BEAT_ROUTE120_ROBERT, Route120RobertSeenText, Route120RobertBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext Route120RobertAfterBattleText
	waitbutton
	closetext
	end

Route120RobertSeenText:
	text "My #mon are"
	line "strong!"

	para "How about yours?"
	done

Route120RobertBeatenText:
	text "Your #mon"
	line "were stronger!"
	done

Route120RobertAfterBattleText:
	text "A #mon that"
	line "grows steadily is"

	para "one you can"
	line "count on."
	done

Route120ColinScript:
	trainer BIRD_KEEPER, ROUTE120_COLIN, ROUTE120_COLIN, Route120ColinSeenText, Route120ColinBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext Route120ColinAfterBattleText
	waitbutton
	closetext
	end

Route120ColinSeenText:
	text "Do you have any"
	line "moves that can"
	cont "strike birds?"
	done

Route120ColinBeatenText:
	text "You had a rock..."
	done

Route120ColinAfterBattleText:
	text "You soared above"
	line "me!"
	done

Route120LeonelScript:
	trainer COOLTRAINERM, ROUTE120_LEONEL, EVENT_BEAT_ROUTE120_LEONEL, Route120LeonelSeenText, Route120LeonelBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext Route120LeonelAfterBattleText
	waitbutton
	closetext
	end

Route120LeonelSeenText:
	text "Your party"
	line "#mon..."

	para "Do you have"
	line "different types?"
	done

Route120LeonelBeatenText:
	text "I've seen your"
	line "policy in action!"
	done

Route120LeonelAfterBattleText:
	text "I think it's"
	line "awesome you're"
	cont "so strong!"
	done

Route120JenniferScript:
	trainer COOLTRAINERF, ROUTE120_JENNIFER, EVENT_BEAT_ROUTE120_JENNIFER, Route120JenniferSeenText, Route120JenniferBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext Route120JenniferAfterBattleText
	waitbutton
	closetext
	end

Route120JenniferSeenText:
	text "#mon have many"
	line "special abilities."
	done

Route120JenniferBeatenText:
	text "You're obviously"
	line "thinking."
	done

Route120JenniferAfterBattleText:
	text "#mon abilities"
	line "really change"
	cont "things!"
	done

Route120ClarissaScript:
	trainer BEAUTY, ROUTE120_CLARISSA, EVENT_BEAT_ROUTE120_CLARISSA, Route120ClarissaSeenText, Route120ClarissaBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext Route120ClarissaAfterBattleText
	waitbutton
	closetext
	end

Route120ClarissaSeenText:
	text "Show me what"
	line "you've got."
	done

Route120ClarissaBeatenText:
	text "Nice!"
	done

Route120ClarissaAfterBattleText:
	text "Well, that was"
	line "fun!"
	done

Route120AngelicaScript:
	trainer BEAUTY, ROUTE120_ANGELICA, EVENT_BEAT_ROUTE120_ANGELICA, Route120AngelicaSeenText, Route120AngelicaBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext Route120AngelicaAfterBattleText
	waitbutton
	closetext
	end

Route120AngelicaSeenText:
	text "Me and my"
	line "#mon..."
	done

Route120AngelicaBeatenText:
	text "You've completely"
	line "ruined my beauty."
	done

Route120AngelicaAfterBattleText:
	text "Get out of my"
	line "way!"
	done

Route120JeffreyScript:
	trainer POKEMANIAC, ROUTE120_JEFFREY, EVENT_BEAT_ROUTE120_JEFFREY, Route120JeffreySeenText, Route120JeffreyBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext Route120JeffreyAfterBattleText
	waitbutton
	closetext
	end

Route120JeffreySeenText:
	text "..."

	para "..."

	para "..."

	para "..."

	para "Wanna fight?"
	done

Route120JeffreyBeatenText:
	text "Lost it..."
	done

Route120JeffreyAfterBattleText:
	text "..."

	para "..."

	para "..."

	para "..."
	done

Route120CallieScript:
	trainer BATTLE_GIRL, ROUTE120_CALLIE, EVENT_BEAT_ROUTE120_CALLIE, Route120CallieSeenText, Route120CallieBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext Route120CallieAfterBattleText
	waitbutton
	closetext
	end

Route120CallieSeenText:
	text "If you don't pay"
	line "attention, you"
	cont "could get hurt!"
	done

Route120CallieBeatenText:
	text "Ouch!"
	done

Route120CallieAfterBattleText:
	text "At least my"
	line "#mon are"
	cont "cute!"
	done

Route120RileyScript:
	trainer RANGERM, ROUTE120_RILEY, EVENT_BEAT_ROUTE120_RILEY, Route120RileySeenText, Route120RileyBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext Route120RileyAfterBattleText
	waitbutton
	closetext
	end

Route120RileySeenText:
	text "We conceal"
	line "ourselves in"
	cont "nature!"
	done

Route120RileyBeatenText:
	text "I lost!"
	done

Route120RileyAfterBattleText:
	text "I wish I could"
	line "conceal the"
	cont "shame..."
	done

Route120LorenzoScript:
	trainer RANGERM, ROUTE120_LORENZO, EVENT_BEAT_ROUTE120_LORENZO, Route120LorenzoSeenText, Route120LorenzoBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext Route120LorenzoAfterBattleText
	waitbutton
	closetext
	end

Route120LorenzoSeenText:
	text "Let's see if your"
	line "#mon are fit"
	cont "for the wild!"
	done

Route120LorenzoBeatenText:
	text "Yeah, you're"
	line "good!"
	done

Route120LorenzoAfterBattleText:
	text "I just love"
	line "being able to"

	para "go anywhere with"
	line "my #mon!"
	done

Route120KeigoScript:
	trainer RANGERM, ROUTE120_KEIGO, EVENT_BEAT_ROUTE120_KEIGO, Route120KeigoSeenText, Route120KeigoBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext Route120KeigoAfterBattleText
	waitbutton
	closetext
	end

Route120KeigoSeenText:
	text "I like to adopt"
	line "#mon moves"

	para "to create new"
	line "techniques."
	done

Route120KeigoBeatenText:
	text "Ugh..."
	done

Route120KeigoAfterBattleText:
	text "Maybe I need a"
	line "teacher."
	done

Route120JennaScript:
	trainer RANGERF, ROUTE120_JENNA, EVENT_BEAT_ROUTE120_JENNA, Route120JennaSeenText, Route120JennaBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext Route120JennaAfterBattleText
	waitbutton
	closetext
	end

Route120JennaSeenText:
	text "How's your"
	line "fitness?"

	para "Nature is hard"
	line "if you're out"
	cont "shape!"
	done

Route120JennaBeatenText:
	text "I'm totally fit!"

	para "But it wasn't"
	line "enough!"
	done

Route120JennaAfterBattleText:
	text "I love training"
	line "out here with"
	cont "my #mon."
	done

Route120ChipScript:
	trainer EXPLORER, ROUTE120_CHIP, EVENT_BEAT_ROUTE120_CHIP, Route120ChipSeenText, Route120ChipBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext Route120ChipAfterBattleText
	waitbutton
	closetext
	end

Route120ChipSeenText:
	text "Who might you be?"

	para "Are you perhaps"
	line "searching for"

	para "ancient ruins that"
	line "are rumored to"

	para "possibly exist"
	line "according to"
	cont "legend?"
	done

Route120ChipBeatenText:
	text "What a disgraceful"
	line "setback..."
	done

Route120ChipAfterBattleText:
	text "That giant rock..."

	para "I would like to"
	line "believe it may"

	para "indeed contain"
	line "ancient ruins."

	para "But I see no"
	line "entrance."
	done

Route120DaleScript:
	trainer EXPLORER, ROUTE120_DALE, EVENT_BEAT_ROUTE120_DALE, Route120DaleSeenText, Route120DaleBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext Route120DaleAfterBattleText
	waitbutton
	closetext
	end

Route120DaleSeenText:
	text "Hey!"

	para "Don't sneak up"
	line "behind me like"
	cont "that!"
	done

Route120DaleBeatenText:
	text "Drat!"
	done

Route120DaleAfterBattleText:
	text "Exploring is all"
	line "about focus."
	done

Route120FruitTree1:
	fruittree FRUITTREE_ROUTE_120_1

Route120FruitTree2:
	fruittree FRUITTREE_ROUTE_120_2


Route120_MapEvents:
	db 0, 0 ; filler

	def_warp_events		
	warp_event  11, 51, REGISTEEL_LAIR, 1

	def_coord_events

	def_bg_events	

	def_object_events
	object_event 06, 06, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, Route120RobertScript, -1
	object_event 29, 25, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_YELLOW, OBJECTTYPE_TRAINER, 3, Route120ColinScript, -1
	object_event 14, 70, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, Route120LeonelScript, -1
	object_event 14, 64, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, Route120JenniferScript, -1
	object_event 31, 12, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_TRAINER, 3, Route120ClarissaScript, -1
	object_event 04, 25, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_TRAINER, 3, Route120AngelicaScript, -1
	object_event 17, 32, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_TRAINER, 3, Route120JeffreyScript, -1
	object_event 33, 22, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_TRAINER, 3, Route120CallieScript, -1
	object_event 24, 10, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, Route120RileyScript, -1
	object_event 23, 55, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, Route120LorenzoScript, -1
	object_event 33, 38, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, Route120KeigoScript, -1
	object_event 12, 20, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, Route120JennaScript, -1
	object_event 13, 52, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, Route120ChipScript, -1
	object_event 09, 56, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, Route120DaleScript, -1
	object_event 28, 22, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route120FruitTree1, -1
	object_event 29, 22, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route120FruitTree2, -1
	
