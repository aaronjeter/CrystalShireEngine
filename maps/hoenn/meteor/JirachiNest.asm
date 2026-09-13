	object_const_def
	const JIRACHINEST_JIRACHI

JirachiNest_MapScripts:
	def_scene_scripts

	def_callbacks

JirachiScript:
	cry JIRACHI
	loadwildmon JIRACHI, 2
	startbattle
	reloadmapafterbattle
	setevent EVENT_GOT_JIRACHI
	disappear JIRACHINEST_JIRACHI
	end

JirachiShrineScript:
	opentext
	writetext JirachiShrineEmptyText
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

	writetext JirachiShrineFirstMonText
	waitbutton
	yesorno
	iffalse .No

	takeitem SILVER_LEAF
	loadmem wPartyMon1DVs+0, HP_MAX_STEEL
	loadmem wPartyMon1DVs+1, $aa
	playsound SFX_CAUGHT_MON
	waitsfx
	writetext JirachiShrineAlignedWithSteelText
	waitbutton
	sjump .Done

.GoldLeaf
	checkitem GOLD_LEAF
	iffalse .No

	writetext JirachiShrineFirstMonText
	waitbutton
	yesorno
	iffalse .No

	takeitem GOLD_LEAF
	loadmem wPartyMon1DVs+0, HP_MAX_STEEL
	loadmem wPartyMon1DVs+1, $fe
	playsound SFX_CAUGHT_MON
	waitsfx
	writetext JirachiShrineSteelBlessingText
	waitbutton
	sjump .Done

.MarvelScale
	checkitem MARVEL_SCALE
	iffalse .No

	writetext JirachiShrineFirstMonText
	waitbutton
	yesorno
	iffalse .No

	takeitem MARVEL_SCALE
	loadmem wPartyMon1DVs+0, HP_MAX_STEEL
	loadmem wPartyMon1DVs+1, $ff
	playsound SFX_CAUGHT_MON
	waitsfx
	writetext JirachiShrineJirachiBlessingText
	waitbutton
	sjump .Done	

.No
	writetext JirachiShrineNoOfferingText
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

JirachiShrineEmptyText:
	text "The shrine is"
	line "empty..."

	para "You sense that it"
	line "awaits an"
	cont "offering..."
	done

JirachiShrineFirstMonText:
	text "Offer this item"
	line "for your first"
	cont "#mon?"
	done

JirachiShrineAlignedWithSteelText:
	text "Your first #mon"
	line "has aligned"
	cont "with Steel!"
	done

JirachiShrineSteelBlessingText:
	text "Your first #mon"
	line "has recieved the"
	cont "Blessing of Steel!"
	done

JirachiShrineJirachiBlessingText:
	text "Your first #mon"
	line "has recieved a"
	cont "Blessing from"
	cont "Jirachi!"
	done

JirachiShrineNoOfferingText:
	text "You choose not"
	line "to make an"
	cont "offering."
	done

JirachiNest_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event 05, 13, METEOR_TUNNEL_EAST, 2

	def_coord_events

	def_bg_events
	bg_event 05, 00, BGEVENT_UP, JirachiShrineScript

	def_object_events
	object_event  04,  00, SPRITE_JIRACHI, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_GRAY, OBJECTTYPE_SCRIPT, 0, JirachiScript, EVENT_GOT_JIRACHI
	