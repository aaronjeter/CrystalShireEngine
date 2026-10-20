	object_const_def
	const JIRACHINEST_JIRACHI

JirachiNest_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_SPRITES, JirachiNestMonSpritesCallback

JirachiNestMonSpritesCallback:
	setmonsprite SPRITE_MON_1, JIRACHI
	endcallback

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

	monpaletteservice .Offerings
	ifequal MONPALSERVICE_DONE, .Done
	writetext JirachiShrineNoOfferingText
.Done
	waitbutton
	closetext
	end

.Offerings:
	monpal_item SILVER_LEAF, HP_MAX_STEEL, MONPAL_ALIGN, JirachiShrineAlignedWithSteelText
	monpal_item GOLD_LEAF, HP_MAX_STEEL, MONPAL_TYPE_COLORS, JirachiShrineSteelBlessingText
	monpal_item MARVEL_SCALE, HP_MAX_STEEL, MONPAL_SHINY, JirachiShrineJirachiBlessingText
	monpal_end


JirachiShrineEmptyText:
	text "The shrine is"
	line "empty..."

	para "You sense that it"
	line "awaits an"
	cont "offering..."
	done

JirachiShrineAlignedWithSteelText:
	text_ram wStringBuffer1
	text " has"
	line "aligned"
	cont "with Steel!"
	done

JirachiShrineSteelBlessingText:
	text_ram wStringBuffer1
	text " has"
	line "received the"
	cont "Blessing of Steel!"
	done

JirachiShrineJirachiBlessingText:
	text_ram wStringBuffer1
	text " has"
	line "received a"
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
	object_event  04,  00, SPRITE_MON_1, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, JirachiScript, EVENT_GOT_JIRACHI
	