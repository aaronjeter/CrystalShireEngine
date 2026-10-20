	object_const_def
	const TINTOWERROOF_HO_OH

TinTowerRoof_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, TinTowerRoofHoOhCallback
	callback MAPCALLBACK_SPRITES, TinTowerRoofMonSpritesCallback

TinTowerRoofMonSpritesCallback:
	setmonsprite SPRITE_MON_1, HO_OH
	endcallback

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

	monpaletteservice .Offerings
	ifequal MONPALSERVICE_DONE, .Done
	writetext HoOhShrineNoOfferingText
.Done
	waitbutton
	closetext
	end

.Offerings:
	monpal_item SILVER_LEAF, HP_MAX_FIRE, MONPAL_ALIGN, HoOhShrineAlignedWithFireText
	monpal_item GOLD_LEAF, HP_MAX_FIRE, MONPAL_TYPE_COLORS, HoOhShrineFlameBlessingText
	monpal_item MARVEL_SCALE, HP_MAX_FIRE, MONPAL_SHINY, HoOhShrineHoOhBlessingText
	monpal_end


HoOhShrineEmptyText:
	text "The shrine is"
	line "empty..."

	para "You sense that it"
	line "awaits an"
	cont "offering..."
	done

HoOhShrineAlignedWithFireText:
	text_ram wStringBuffer1
	text " has"
	line "aligned"
	cont "with Fire!"
	done

HoOhShrineFlameBlessingText:
	text_ram wStringBuffer1
	text " has"
	line "received the"
	cont "Blessing of Flame!"
	done

HoOhShrineHoOhBlessingText:
	text_ram wStringBuffer1
	text " has"
	line "received a"
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
	object_event  9,  5, SPRITE_MON_1, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TinTowerHoOh, EVENT_TIN_TOWER_ROOF_HO_OH
