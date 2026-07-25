	object_const_def
	const TINTOWER5F_POKE_BALL
	const TINTOWER5F_ZEPHYR

TinTower5F_MapScripts:
	def_scene_scripts

	def_callbacks

TinTower5FRareCandy:
	itemball RARE_CANDY

TinTower5FHiddenFullRestore:
	hiddenitem FULL_RESTORE, EVENT_TIN_TOWER_5F_HIDDEN_FULL_RESTORE

TinTower5FHiddenCarbos:
	hiddenitem CARBOS, EVENT_TIN_TOWER_5F_HIDDEN_CARBOS

Djinn_ZephyrScript:
	cry JUPITER
	opentext
	writetext Djinn_ZephyrText
	yesorno
	iffalse .Done
	givepoke JUPITER, 40, SCOPE_LENS, Djinn_ZephyrName, Djinn_ZephyrOTName
	setevent EVENT_GOT_BREEZE
	disappear TINTOWER5F_ZEPHYR
	.Done
	closetext	
	end

Djinn_ZephyrName:
	db "Zephyr@"

Djinn_ZephyrOTName:
	db "Sheba@" 

Djinn_ZephyrText:
	text "Aloha! I love"
	line "these old towers!"

	para "Want to go to"
	line "the top?"

	para "Invite Zephyr to"
	line "join your party?"
	done

TinTower5F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 11, 15, TIN_TOWER_6F, 2
	warp_event  2,  4, TIN_TOWER_4F, 1
	warp_event  2, 14, TIN_TOWER_4F, 3
	warp_event 17, 15, TIN_TOWER_4F, 4

	def_coord_events

	def_bg_events
	bg_event 16, 14, BGEVENT_ITEM, TinTower5FHiddenFullRestore
	bg_event  3, 15, BGEVENT_ITEM, TinTower5FHiddenCarbos

	def_object_events
	object_event  9,  9, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TinTower5FRareCandy, EVENT_TIN_TOWER_5F_RARE_CANDY
	object_event 17, 00, SPRITE_JUPITER, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, Djinn_ZephyrScript, EVENT_GOT_ZEPHYR
