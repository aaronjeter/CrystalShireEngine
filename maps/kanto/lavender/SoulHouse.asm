	object_const_def
	const SOULHOUSE_MRFUJI
	const SOULHOUSE_TEACHER
	const SOULHOUSE_LASS
	const SOULHOUSE_GRANNY

SoulHouse_MapScripts:
	def_scene_scripts

	def_callbacks

MrFuji:
	jumptextfaceplayer MrFujiText

SoulHouseTeacherScript:
	jumptextfaceplayer SoulHouseTeacherText

SoulHouseLassScript:
	jumptextfaceplayer SoulHouseLassText

SoulHouseGrannyScript:
	jumptextfaceplayer SoulHouseGrannyText

MrFujiText:
	text "Mr.Fuji: Welcome."

	para "Hmm… You appear to"
	line "be raising your"

	para "#mon in a kind"
	line "and loving manner."

	para "#mon lovers"
	line "come here to pay"

	para "their respects to"
	line "departed #mon."

	para "Please offer con-"
	line "dolences for the"

	para "souls of the de-"
	line "parted #mon."

	para "I'm sure that will"
	line "make them happy."
	done

SoulHouseTeacherText:
	text "There are other"
	line "graves of #mon"
	cont "here, I think."

	para "There are many"
	line "chambers that only"
	cont "Mr.Fuji may enter."
	done

SoulHouseLassText:
	text "I came with my mom"
	line "to visit #mon"
	cont "graves…"
	done

SoulHouseGrannyText:
	text "The #mon that"
	line "lived with me…"

	para "I loved them like"
	line "my grandchildren…"
	done

SoulGuyScript:
	opentext
	writetext SoulGuyOfferingText
	waitbutton

	loadmenu .ShrineMenuHeader
	verticalmenu
	closewindow
	ifequal 1, .SilverLeaf
	ifequal 2, .GoldLeaf

	sjump .No

.SilverLeaf
	checkitem SILVER_LEAF
	iffalse .No

	writetext SoulGuyFirstMonText
	waitbutton
	yesorno
	iffalse .No

	takeitem SILVER_LEAF
	loadmem wPartyMon1DVs+0, HP_MAX_GHOST
	loadmem wPartyMon1DVs+1, $aa
	playsound SFX_CAUGHT_MON
	waitsfx
	writetext SoulGuyAlignedWithGhostsText
	waitbutton
	sjump .Done

.GoldLeaf
	checkitem GOLD_LEAF
	iffalse .No

	writetext SoulGuyFirstMonText
	waitbutton
	yesorno
	iffalse .No

	takeitem GOLD_LEAF
	loadmem wPartyMon1DVs+0, HP_MAX_GHOST
	loadmem wPartyMon1DVs+1, $fe
	playsound SFX_CAUGHT_MON
	waitsfx
	writetext SoulGuyEtherialBlessingText
	waitbutton
	sjump .Done

.No
	writetext SoulGuyNoOfferingText
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
	db 2 ; items	
	db "Silver Leaf@"
	db "Gold Leaf@"	

SoulGuyOfferingText:
	text "Many graves lie"
	line "unadorned..."

	para "Would you help"
	line "me honor them?"
	done

SoulGuyFirstMonText:
	text "Offer this item"
	line "for your first"
	cont "#mon?"
	done

SoulGuyAlignedWithGhostsText:
	text "Your first #mon"
	line "has aligned"
	cont "with Ghosts!"
	done

SoulGuyEtherialBlessingText:
	text "Your first #mon"
	line "has recieved the"
	cont "Etherial Blessing!"
	done

SoulGuyNoOfferingText:
	text "There is no shame"
	line "in honoring the"
	cont "past with empty-"
	cont "hands."
	done

SoulHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  7, LAVENDER_TOWN, 6
	warp_event  5,  7, LAVENDER_TOWN, 6

	def_coord_events

	def_bg_events

	def_object_events
	object_event  4,  2, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, MrFuji, -1
	object_event  7,  3, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SoulHouseTeacherScript, -1
	object_event  2,  5, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SoulHouseLassScript, -1
	object_event  1,  3, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SoulHouseGrannyScript, -1
	object_event  7,  5, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, SoulGuyScript, -1
