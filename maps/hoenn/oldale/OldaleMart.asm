	object_const_def
	const OLDALEMART_CLERK
	const OLDALEMART_YOUNGSTER
	const OLDALEMART_COOLTRAINER_M

OldaleMart_MapScripts:
	def_scene_scripts

	def_callbacks

OldaleMart_Clerk:
	opentext
	pokemart MARTTYPE_STANDARD, MART_CHERRYGROVE_DEX
	closetext
	end

OldaleMartYoungsterScript:
	jumptextfaceplayer OldaleMartYoungsterText

OldaleMartYoungsterText:
	text "When I was walking"
	line "in the grass, a"

	para "bug #mon poi-"
	line "soned my #mon!"

	para "I just kept going,"
	line "but then my"
	cont "#mon fainted."

	para "You should keep an"
	line "Antidote with you."
	done


OldaleMartCooltrainerScript:
	jumptextfaceplayer OldaleMartCooltrainerText

OldaleMartCooltrainerText:
	text "# Balls are in"
	line "stock! Now I can"
	cont "catch #mon!"
	done

OldaleMart_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  7, OLDALE_TOWN, 2
	warp_event  5,  7, OLDALE_TOWN, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  1, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OldaleMart_Clerk, -1
	object_event  6,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, OldaleMartYoungsterScript, -1
	object_event  1,  2, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OldaleMartCooltrainerScript, -1
