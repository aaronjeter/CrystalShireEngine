	object_const_def
	const GRANITECAVEB3F_BRAWLY
	const GRANITECAVEB3F_TENTACOOL1
	const GRANITECAVEB3F_TENTACOOL2
	const GRANITECAVEB3F_TENTACOOL3

GraniteCaveB3F_MapScripts:
	def_scene_scripts

	def_callbacks	

GraniteCaveBrawlyScript:
	faceplayer
	opentext
	writetext GraniteCaveBrawlyGivesPickaxeText
	waitbutton
	verbosegiveitem PICKAXE
	setevent EVENT_GOT_PICKAXE
	waitbutton

	writetext GraniteCaveBrawlyLeavesText
	waitbutton
	closetext

	special FadeOutToBlack
	disappear GRANITECAVEB3F_BRAWLY
	special FadeInFromBlack

	end

GraniteCaveBrawlyGivesPickaxeText:
	text "Oh, hey kid."
	line "I didn't think"

	para "anyone would"
	line "find me here."

	para "I come down"
	line "here to train"

	para "in private"
	line "occasionally."

	para "There used to be"
	line "some kind of"

	para "mining operation"
	line "down here way"
	cont "back when."

	para "..."

	para "They got spooked"
	line "and just left"
	cont "their stuff."

	para "You know..."

	para "You don't look"
	line "like you could"

	para "smash rocks with"
	line "your hands..."

	para "You should take"
	line "one of these"
	cont "spare Pickaxes."	
	done

GraniteCaveBrawlyLeavesText:
	text "Hmm. That's not"
	line "why you're here"

	para "though, is it?"

	para "You're a trainer,"
	line "and I'm a Gym"
	cont "Leader..."

	para "It's written on"
	line "your face, kid."

	para "Well, I'd love"
	line "to meet your"
	cont "challenge."

	para "I'll head back"
	line "to my Gym and"
	cont "wait for you."	
	done

GraniteCaveB2F_Tentacool1:
	cry TENTACOOL2
	loadwildmon TENTACOOL2, 7
	startbattle
	reloadmapafterbattle
	disappear GRANITECAVEB3F_TENTACOOL1
	end

GraniteCaveB2F_Tentacool2:
	cry TENTACOOL2
	loadwildmon TENTACOOL2, 5
	startbattle
	reloadmapafterbattle
	disappear GRANITECAVEB3F_TENTACOOL2
	end

GraniteCaveB2F_Tentacool3:
	cry TENTACOOL2
	loadwildmon TENTACOOL2, 10
	startbattle
	reloadmapafterbattle
	disappear GRANITECAVEB3F_TENTACOOL3
	end

GraniteCaveB3F_MapEvents:
	db 0, 0 ; filler

	def_warp_events	

	warp_event  11, 05, GRANITE_CAVE_B2F, 3

	def_coord_events

	def_bg_events	

	def_object_events
	object_event  11, 08, SPRITE_KURT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, GraniteCaveBrawlyScript, EVENT_GOT_PICKAXE
	object_event  09, 13, SPRITE_TENTACOOL, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, GraniteCaveB2F_Tentacool1, -1
	object_event  11, 13, SPRITE_TENTACOOL, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, GraniteCaveB2F_Tentacool2, -1
	object_event  10, 12, SPRITE_TENTACOOL, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLACK, OBJECTTYPE_SCRIPT, 0, GraniteCaveB2F_Tentacool3, -1

