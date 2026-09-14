	object_const_def
	const WHIRLISLANDLUGIACHAMBER_LUGIA

WhirlIslandLugiaChamber_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, WhirlIslandLugiaChamberLugiaCallback

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

	writetext LugiaShrineFirstMonText
	waitbutton
	yesorno
	iffalse .No

	takeitem SILVER_LEAF
	loadmem wPartyMon1DVs+0, HP_MAX_FLYING
	loadmem wPartyMon1DVs+1, $aa
	playsound SFX_CAUGHT_MON
	waitsfx
	writetext LugiaShrineAlignedWithFlyingText
	waitbutton
	sjump .Done

.GoldLeaf
	checkitem GOLD_LEAF
	iffalse .No

	writetext LugiaShrineFirstMonText
	waitbutton
	yesorno
	iffalse .No

	takeitem GOLD_LEAF
	loadmem wPartyMon1DVs+0, HP_MAX_FLYING
	loadmem wPartyMon1DVs+1, $fe
	playsound SFX_CAUGHT_MON
	waitsfx
	writetext LugiaShrineGaleBlessingText
	waitbutton
	sjump .Done

.MarvelScale
	checkitem MARVEL_SCALE
	iffalse .No

	writetext LugiaShrineFirstMonText
	waitbutton
	yesorno
	iffalse .No

	takeitem MARVEL_SCALE
	loadmem wPartyMon1DVs+0, HP_MAX_FLYING
	loadmem wPartyMon1DVs+1, $ff
	playsound SFX_CAUGHT_MON
	waitsfx
	writetext LugiaShrineLugiaBlessingText
	waitbutton
	sjump .Done	

.No
	writetext LugiaShrineNoOfferingText
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

LugiaShrineEmptyText:
	text "The shrine is"
	line "empty..."

	para "You sense that it"
	line "awaits an"
	cont "offering..."
	done

LugiaShrineFirstMonText:
	text "Offer this item"
	line "for your first"
	cont "#mon?"
	done

LugiaShrineAlignedWithFlyingText:
	text "Your first #mon"
	line "has aligned"
	cont "with Flying!"
	done

LugiaShrineGaleBlessingText:
	text "Your first #mon"
	line "has recieved the"
	cont "Gale Blessing!"
	done

LugiaShrineLugiaBlessingText:
	text "Your first #mon"
	line "has recieved a"
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
	object_event  9,  5, SPRITE_LUGIA, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Lugia, EVENT_WHIRL_ISLAND_LUGIA_CHAMBER_LUGIA
	object_event 11, 12, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, LugiaShrineScript, -1
