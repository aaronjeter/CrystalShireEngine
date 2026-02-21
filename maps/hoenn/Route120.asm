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
	text "..."
	done

Route120RobertBeatenText:
	text "..."
	done

Route120RobertAfterBattleText:
	text "..."
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
	text "..."
	done

Route120ColinBeatenText:
	text "..."
	done

Route120ColinAfterBattleText:
	text "..."
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
	text "..."
	done

Route120LeonelBeatenText:
	text "..."
	done

Route120LeonelAfterBattleText:
	text "..."
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
	text "..."
	done

Route120JenniferBeatenText:
	text "..."
	done

Route120JenniferAfterBattleText:
	text "..."
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
	text "..."
	done

Route120ClarissaBeatenText:
	text "..."
	done

Route120ClarissaAfterBattleText:
	text "..."
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
	text "..."
	done

Route120AngelicaBeatenText:
	text "..."
	done

Route120AngelicaAfterBattleText:
	text "..."
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
	done

Route120JeffreyBeatenText:
	text "..."
	done

Route120JeffreyAfterBattleText:
	text "..."
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
	text "..."
	done

Route120CallieBeatenText:
	text "..."
	done

Route120CallieAfterBattleText:
	text "..."
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
	text "..."
	done

Route120RileyBeatenText:
	text "..."
	done

Route120RileyAfterBattleText:
	text "..."
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
	text "..."
	done

Route120LorenzoBeatenText:
	text "..."
	done

Route120LorenzoAfterBattleText:
	text "..."
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
	text "..."
	done

Route120KeigoBeatenText:
	text "..."
	done

Route120KeigoAfterBattleText:
	text "..."
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
	text "..."
	done

Route120JennaBeatenText:
	text "..."
	done

Route120JennaAfterBattleText:
	text "..."
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
	text "..."
	done

Route120ChipBeatenText:
	text "..."
	done

Route120ChipAfterBattleText:
	text "..."
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
	text "..."
	done

Route120DaleBeatenText:
	text "..."
	done

Route120DaleAfterBattleText:
	text "..."
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
	
