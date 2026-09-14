	object_const_def
	const SILVERCAVEROOM2_POKE_BALL1
	const SILVERCAVEROOM2_POKE_BALL2
	const SILVERCAVEROOM2_POKE_BALL3
	const SILVERCAVEROOM2_MEWTWO

SilverCaveRoom2_MapScripts:
	def_scene_scripts

	def_callbacks

SilverCaveRoom2GoldLeaf:
	itemball GOLD_LEAF

SilverCaveRoom2UltraBall:
	itemball ULTRA_BALL

SilverCaveRoom2MarvelScale:
	itemball MARVEL_SCALE

SilverCaveRoom2HiddenMaxPotion:
	hiddenitem MAX_POTION, EVENT_SILVER_CAVE_ROOM_2_HIDDEN_MAX_POTION

SilverCaveRoom2MewtwoText:
	text "You feel a"
	line "voice echo in"
	cont "your mind."

	para "A worthy"
	line "challenge!"
	done

SilverCaveRoom2_Mewtwo:
	cry MEWTWO
	opentext
	writetext SilverCaveRoom2MewtwoText
	waitbutton
	closetext
	loadwildmon MEWTWO, 14
	startbattle
	reloadmapafterbattle
	disappear SILVERCAVEROOM2_MEWTWO
	end

MewtwoShrineScript:
	opentext
	writetext MewtwoShrineEmptyText
	waitbutton

	loadmenu .ShrineMenuHeader
	verticalmenu
	closewindow
	ifequal 1, .SilverLeaf
	ifequal 2, .GoldLeaf
	ifequal 3, .MarvelScale

	sjump .No

.SilverLeaf
	checkitem SILVER_LEAF
	iffalse .No

	writetext MewtwoShrineFirstMonText
	waitbutton
	yesorno
	iffalse .No

	takeitem SILVER_LEAF
	loadmem wPartyMon1DVs+0, HP_MAX_PSYCHIC
	loadmem wPartyMon1DVs+1, $aa
	playsound SFX_CAUGHT_MON
	waitsfx
	writetext MewtwoShrineAlignedWithPsychicText
	waitbutton
	sjump .Done

.GoldLeaf
	checkitem GOLD_LEAF
	iffalse .No

	writetext MewtwoShrineFirstMonText
	waitbutton
	yesorno
	iffalse .No

	takeitem GOLD_LEAF
	loadmem wPartyMon1DVs+0, HP_MAX_PSYCHIC
	loadmem wPartyMon1DVs+1, $fe
	playsound SFX_CAUGHT_MON
	waitsfx
	writetext MewtwoShrinePsionicBlessingText
	waitbutton
	sjump .Done

.MarvelScale
	checkitem MARVEL_SCALE
	iffalse .No

	writetext MewtwoShrineFirstMonText
	waitbutton
	yesorno
	iffalse .No

	takeitem MARVEL_SCALE
	loadmem wPartyMon1DVs+0, HP_MAX_PSYCHIC
	loadmem wPartyMon1DVs+1, $ff
	playsound SFX_CAUGHT_MON
	waitsfx
	writetext MewtwoShrineMewtwoBlessingText
	waitbutton
	sjump .Done	

.No
	writetext MewtwoShrineNoOfferingText
	waitbutton
.Done
	closetext
	end

.ShrineMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 15, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 3 ; items	
	db "Silver Leaf@"
	db "Gold Leaf@"	
	db "Marvel Scale@"

MewtwoShrineEmptyText:
	text "The shrine is"
	line "empty..."

	para "You sense that it"
	line "awaits an"
	cont "offering..."
	done

MewtwoShrineFirstMonText:
	text "Offer this item"
	line "for your first"
	cont "#mon?"
	done

MewtwoShrineAlignedWithPsychicText:
	text "Your first #mon"
	line "has aligned"
	cont "with Psychic!"
	done

MewtwoShrinePsionicBlessingText:
	text "Your first #mon"
	line "has recieved the"
	cont "Psionic Blessing!"
	done

MewtwoShrineMewtwoBlessingText:
	text "Your first #mon"
	line "has recieved a"
	cont "Blessing from"
	cont "Mewtwo!"
	done

MewtwoShrineNoOfferingText:
	text "You choose not"
	line "to make an"
	cont "offering."
	done

SilverCaveRoom2_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 17, 31, SILVER_CAVE_ROOM_1, 2
	warp_event 11,  5, SILVER_CAVE_ROOM_3, 1
	warp_event 13, 21, SILVER_CAVE_ITEM_ROOMS, 1
	warp_event 23,  3, SILVER_CAVE_ITEM_ROOMS, 2

	def_coord_events

	def_bg_events
	bg_event 14, 31, BGEVENT_ITEM, SilverCaveRoom2HiddenMaxPotion
	bg_event 19, 04, BGEVENT_UP, MewtwoShrineScript

	def_object_events
	object_event 18,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SilverCaveRoom2GoldLeaf, EVENT_SILVER_CAVE_ROOM_2_GOLD_LEAF
	object_event 22, 24, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SilverCaveRoom2UltraBall, EVENT_SILVER_CAVE_ROOM_2_ULTRA_BALL
	object_event  4, 20, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SilverCaveRoom2MarvelScale, EVENT_SILVER_CAVE_ROOM_2_MARVEL_SCALE
	object_event 23, 10, SPRITE_MEWTWO, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, SilverCaveRoom2_Mewtwo , -1
