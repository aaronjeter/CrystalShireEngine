	object_const_def
	const METEORPEAK_RAYQUAZA
	const METEORPEAK_MARVEL_SCALE

MeteorPeak_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_SPRITES, MeteorPeakMonSpritesCallback

MeteorPeakMonSpritesCallback:
	setmonsprite SPRITE_MON_1, RAYQUAZA
	endcallback

RayquazaScript:
	cry RAYQUAZA
	loadwildmon RAYQUAZA, 11
	startbattle
	reloadmapafterbattle
	setevent EVENT_GOT_RAYQUAZA
	disappear METEORPEAK_RAYQUAZA
	end

MeteorPeakMarvelScale:
	itemball MARVEL_SCALE

RayquazaShrineScript:
	opentext
	writetext RayquazaShrineEmptyText
	waitbutton

	monpaletteservice .Offerings
	ifequal MONPALSERVICE_DONE, .Done
	writetext RayquazaShrineNoOfferingText
.Done
	waitbutton
	closetext
	end

.Offerings:
	monpal_item SILVER_LEAF, HP_MAX_DRAGON, MONPAL_ALIGN, RayquazaShrineAlignedWithDragonsText
	monpal_item GOLD_LEAF, HP_MAX_DRAGON, MONPAL_TYPE_COLORS, RayquazaShrineDraconicBlessingText
	monpal_item MARVEL_SCALE, HP_MAX_DRAGON, MONPAL_SHINY, RayquazaShrineRayquazaBlessingText
	monpal_end


RayquazaShrineEmptyText:
	text "The shrine is"
	line "empty..."

	para "You sense that it"
	line "awaits an"
	cont "offering..."
	done

RayquazaShrineAlignedWithDragonsText:
	text_ram wStringBuffer1
	text " has"
	line "aligned"
	cont "with Dragons!"
	done

RayquazaShrineDraconicBlessingText:
	text_ram wStringBuffer1
	text " has"
	line "received the"
	cont "Draconic Blessing!"
	done

RayquazaShrineRayquazaBlessingText:
	text_ram wStringBuffer1
	text " has"
	line "received a"
	cont "Blessing from"
	cont "Rayquaza!"
	done

RayquazaShrineNoOfferingText:
	text "You choose not"
	line "to make an"
	cont "offering."
	done

MeteorPeak_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event 51, 53, METEOR_FALLS, 4
	warp_event 09, 53, METEOR_FALLS, 5

	def_coord_events

	def_bg_events	
	bg_event 41, 20, BGEVENT_UP, RayquazaShrineScript

	def_object_events
	object_event  42, 18, SPRITE_MON_1, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RayquazaScript, EVENT_GOT_RAYQUAZA
	object_event  13, 36, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MeteorPeakMarvelScale, EVENT_METEOR_FALLS_MARVEL_SCALE
	