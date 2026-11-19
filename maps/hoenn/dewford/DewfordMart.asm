	object_const_def
	const DEWFORDMART_CLERK
	const DEWFORDMART_FISHER

DewfordMart_MapScripts:
	def_scene_scripts

	def_callbacks

DewfordMart_Clerk:
	opentext
	pokemart MARTTYPE_STANDARD, MART_STANDARD
	closetext
	end

DewfordMart_FisherScript:
	jumptextfaceplayer DewfordMart_FisherText

DewfordMart_FisherText:
	text "A Mart on Dewford"
	line "at last! No more"
	cont "rowing to the"
	cont "mainland for"
	cont "Potions."
	done

DewfordMart_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  7, DEWFORD_TOWN, 6
	warp_event  5,  7, DEWFORD_TOWN, 6

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  1, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DewfordMart_Clerk, -1
	object_event  2,  4, SPRITE_FISHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, DewfordMart_FisherScript, -1
