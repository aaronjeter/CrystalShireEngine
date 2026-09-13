	object_const_def
	const METEORPEAK_RAYQUAZA
	const METEORPEAK_MARVEL_SCALE

MeteorPeak_MapScripts:
	def_scene_scripts

	def_callbacks

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

	writetext RayquazaShrineFirstMonText
	waitbutton
	yesorno
	iffalse .No

	takeitem SILVER_LEAF
	loadmem wPartyMon1DVs+0, HP_MAX_DRAGON
	loadmem wPartyMon1DVs+1, $aa
	playsound SFX_CAUGHT_MON
	waitsfx
	writetext RayquazaShrineAlignedWithDragonsText
	waitbutton
	sjump .Done

.GoldLeaf
	checkitem GOLD_LEAF
	iffalse .No

	writetext RayquazaShrineFirstMonText
	waitbutton
	yesorno
	iffalse .No

	takeitem GOLD_LEAF
	loadmem wPartyMon1DVs+0, HP_MAX_DRAGON
	loadmem wPartyMon1DVs+1, $fe
	playsound SFX_CAUGHT_MON
	waitsfx
	writetext RayquazaShrineDraconicBlessingText
	waitbutton
	sjump .Done

.MarvelScale
	checkitem MARVEL_SCALE
	iffalse .No

	writetext RayquazaShrineFirstMonText
	waitbutton
	yesorno
	iffalse .No

	takeitem MARVEL_SCALE
	loadmem wPartyMon1DVs+0, HP_MAX_DRAGON
	loadmem wPartyMon1DVs+1, $ff
	playsound SFX_CAUGHT_MON
	waitsfx
	writetext RayquazaShrineRayquazaBlessingText
	waitbutton
	sjump .Done	

.No
	writetext RayquazaShrineNoOfferingText
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

RayquazaShrineEmptyText:
	text "The shrine is"
	line "empty..."

	para "You sense that it"
	line "awaits an"
	cont "offering..."
	done

RayquazaShrineFirstMonText:
	text "Offer this item"
	line "for your first"
	cont "#mon?"
	done

RayquazaShrineAlignedWithDragonsText:
	text "Your first #mon"
	line "has aligned"
	cont "with Dragons!"
	done

RayquazaShrineDraconicBlessingText:
	text "Your first #mon"
	line "has recieved the"
	cont "Draconic Blessing!"
	done

RayquazaShrineRayquazaBlessingText:
	text "Your first #mon"
	line "has recieved a"
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
	object_event  42, 18, SPRITE_RAYQUAZA, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RayquazaScript, EVENT_GOT_RAYQUAZA
	object_event  13, 36, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MeteorPeakMarvelScale, EVENT_METEOR_FALLS_MARVEL_SCALE
	