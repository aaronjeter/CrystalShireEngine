	object_const_def
	const TINTOWERROOF_HO_OH

TinTowerRoof_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, TinTowerRoofHoOhCallback

TinTowerRoofHoOhCallback:
	checkevent EVENT_FOUGHT_HO_OH
	iftrue .NoAppear
	checkitem RAINBOW_WING
	iftrue .Appear
	sjump .NoAppear

.Appear:
	appear TINTOWERROOF_HO_OH
	endcallback

.NoAppear:
	disappear TINTOWERROOF_HO_OH
	endcallback

TinTowerHoOh:
	faceplayer
	opentext
	writetext HoOhText
	cry HO_OH
	pause 15
	closetext
	setevent EVENT_FOUGHT_HO_OH
	loadvar VAR_BATTLETYPE, BATTLETYPE_FORCEITEM
	loadwildmon HO_OH, 15
	startbattle
	disappear TINTOWERROOF_HO_OH
	reloadmapafterbattle
	setevent EVENT_SET_WHEN_FOUGHT_HO_OH
	end

HoOhText:
	text "Shaoooh!"
	done

HoOhShrineScript:
	opentext
	writetext HoOhShrineEmptyText
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

	writetext HoOhShrineFirstMonText
	waitbutton
	yesorno
	iffalse .No

	takeitem SILVER_LEAF
	loadmem wPartyMon1DVs+0, HP_MAX_FIRE
	loadmem wPartyMon1DVs+1, $aa
	playsound SFX_CAUGHT_MON
	waitsfx
	writetext HoOhShrineAlignedWithFireText
	waitbutton
	sjump .Done

.GoldLeaf
	checkitem GOLD_LEAF
	iffalse .No

	writetext HoOhShrineFirstMonText
	waitbutton
	yesorno
	iffalse .No

	takeitem GOLD_LEAF
	loadmem wPartyMon1DVs+0, HP_MAX_FIRE
	loadmem wPartyMon1DVs+1, $fe
	playsound SFX_CAUGHT_MON
	waitsfx
	writetext HoOhShrineFlameBlessingText
	waitbutton
	sjump .Done

.MarvelScale
	checkitem MARVEL_SCALE
	iffalse .No

	writetext HoOhShrineFirstMonText
	waitbutton
	yesorno
	iffalse .No

	takeitem MARVEL_SCALE
	loadmem wPartyMon1DVs+0, HP_MAX_FIRE
	loadmem wPartyMon1DVs+1, $ff
	playsound SFX_CAUGHT_MON
	waitsfx
	writetext HoOhShrineHoOhBlessingText
	waitbutton
	sjump .Done	

.No
	writetext HoOhShrineNoOfferingText
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

HoOhShrineEmptyText:
	text "The shrine is"
	line "empty..."

	para "You sense that it"
	line "awaits an"
	cont "offering..."
	done

HoOhShrineFirstMonText:
	text "Offer this item"
	line "for your first"
	cont "#mon?"
	done

HoOhShrineAlignedWithFireText:
	text "Your first #mon"
	line "has aligned"
	cont "with Fire!"
	done

HoOhShrineFlameBlessingText:
	text "Your first #mon"
	line "has recieved the"
	cont "Blessing of Flame!"
	done

HoOhShrineHoOhBlessingText:
	text "Your first #mon"
	line "has recieved a"
	cont "Blessing from"
	cont "Ho Oh!"
	done

HoOhShrineNoOfferingText:
	text "You choose not"
	line "to make an"
	cont "offering."
	done

TinTowerRoof_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  9, 13, TIN_TOWER_9F, 4

	def_coord_events

	def_bg_events
	bg_event  8,  8, BGEVENT_UP, HoOhShrineScript

	def_object_events
	object_event  9,  5, SPRITE_HO_OH, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, TinTowerHoOh, EVENT_TIN_TOWER_ROOF_HO_OH
