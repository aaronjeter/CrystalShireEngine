	object_const_def
	const WHIRLISLANDLUGIACHAMBER_LUGIA

WhirlIslandLugiaChamber_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, WhirlIslandLugiaChamberLugiaCallback
	callback MAPCALLBACK_SPRITES, WhirlIslandLugiaChamberMonSpritesCallback

WhirlIslandLugiaChamberMonSpritesCallback:
	setmonsprite SPRITE_MON_1, LUGIA
	endcallback

WhirlIslandLugiaChamberLugiaCallback:
	checkevent EVENT_FOUGHT_LUGIA
	iftrue .NoAppear
	checkitem SILVER_WING
	iftrue .Appear
	sjump .NoAppear

.Appear:
	appear WHIRLISLANDLUGIACHAMBER_LUGIA
	endcallback

.NoAppear:
	disappear WHIRLISLANDLUGIACHAMBER_LUGIA
	endcallback

Lugia:
	faceplayer
	opentext
	writetext LugiaText
	cry LUGIA
	pause 15
	closetext
	setevent EVENT_FOUGHT_LUGIA
	loadvar VAR_BATTLETYPE, BATTLETYPE_FORCEITEM
	loadwildmon LUGIA, 15
	startbattle
	disappear WHIRLISLANDLUGIACHAMBER_LUGIA
	reloadmapafterbattle
	end

LugiaText:
	text "Gyaaas!"
	done


LugiaShrineScript:
	opentext
	writetext LugiaShrineEmptyText
	waitbutton

	monpaletteservice .Offerings
	ifequal MONPALSERVICE_DONE, .Done
	writetext LugiaShrineNoOfferingText
.Done
	waitbutton
	closetext
	end

.Offerings:
	monpal_item SILVER_LEAF, HP_MAX_FLYING, MONPAL_ALIGN, LugiaShrineAlignedWithFlyingText
	monpal_item GOLD_LEAF, HP_MAX_FLYING, MONPAL_TYPE_COLORS, LugiaShrineGaleBlessingText
	monpal_item MARVEL_SCALE, HP_MAX_FLYING, MONPAL_SHINY, LugiaShrineLugiaBlessingText
	monpal_end


LugiaShrineEmptyText:
	text "The shrine is"
	line "empty..."

	para "You sense that it"
	line "awaits an"
	cont "offering..."
	done

LugiaShrineAlignedWithFlyingText:
	text_ram wStringBuffer1
	text " has"
	line "aligned"
	cont "with Flying!"
	done

LugiaShrineGaleBlessingText:
	text_ram wStringBuffer1
	text " has"
	line "received the"
	cont "Gale Blessing!"
	done

LugiaShrineLugiaBlessingText:
	text_ram wStringBuffer1
	text " has"
	line "received a"
	cont "Blessing from"
	cont "Lugia!"
	done

LugiaShrineNoOfferingText:
	text "You choose not"
	line "to make an"
	cont "offering."
	done

WhirlIslandLugiaChamber_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  9, 13, WHIRL_ISLAND_B2F, 3

	def_coord_events

	def_bg_events

	def_object_events
	object_event  9,  5, SPRITE_MON_1, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Lugia, EVENT_WHIRL_ISLAND_LUGIA_CHAMBER_LUGIA
	object_event 11, 12, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, LugiaShrineScript, -1
