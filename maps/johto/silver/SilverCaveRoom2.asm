	object_const_def
	const SILVERCAVEROOM2_POKE_BALL1
	const SILVERCAVEROOM2_POKE_BALL2
	const SILVERCAVEROOM2_POKE_BALL3
	const SILVERCAVEROOM2_MEWTWO

SilverCaveRoom2_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_SPRITES, SilverCaveRoom2MonSpritesCallback

SilverCaveRoom2MonSpritesCallback:
	setmonsprite SPRITE_MON_1, MEWTWO
	endcallback

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

	monpaletteservice .Offerings
	ifequal MONPALSERVICE_DONE, .Done
	writetext MewtwoShrineNoOfferingText
.Done
	waitbutton
	closetext
	end

.Offerings:
	monpal_item SILVER_LEAF, HP_MAX_PSYCHIC, MONPAL_ALIGN, MewtwoShrineAlignedWithPsychicText
	monpal_item GOLD_LEAF, HP_MAX_PSYCHIC, MONPAL_TYPE_COLORS, MewtwoShrinePsionicBlessingText
	monpal_item MARVEL_SCALE, HP_MAX_PSYCHIC, MONPAL_SHINY, MewtwoShrineMewtwoBlessingText
	monpal_end


MewtwoShrineEmptyText:
	text "The shrine is"
	line "empty..."

	para "You sense that it"
	line "awaits an"
	cont "offering..."
	done

MewtwoShrineAlignedWithPsychicText:
	text_ram wStringBuffer1
	text " has"
	line "aligned"
	cont "with Psychic!"
	done

MewtwoShrinePsionicBlessingText:
	text_ram wStringBuffer1
	text " has"
	line "received the"
	cont "Psionic Blessing!"
	done

MewtwoShrineMewtwoBlessingText:
	text_ram wStringBuffer1
	text " has"
	line "received a"
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
	object_event 23, 10, SPRITE_MON_1, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SilverCaveRoom2_Mewtwo , -1
