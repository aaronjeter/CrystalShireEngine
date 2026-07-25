	object_const_def
	const MOUNTMORTAR2FINSIDE_POKE_BALL1
	const MOUNTMORTAR2FINSIDE_POKE_BALL2
	const MOUNTMORTAR2FINSIDE_POKE_BALL3
	const MOUNTMORTAR2FINSIDE_POKE_BALL4
	const MOUNTMORTAR2FINSIDE_POKE_BALL5
	const MOUNTMORTAR2FINSIDE_POKE_BALL6
	const MOUNTMORTAR2FINSIDE_SUPER_NERD
	const MOUNTMORTAR2FINSIDE_FEVER

MountMortar2FInside_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerSupernerdHugh:
	trainer SUPER_NERD, HUGH, EVENT_BEAT_SUPER_NERD_HUGH, SupernerdHughSeenText, SupernerdHughBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SupernerdHughAfterBattleText
	waitbutton
	closetext
	end

MountMortar2FInsideMaxPotion:
	itemball MAX_POTION

MountMortar2FInsideRareCandy:
	itemball RARE_CANDY

MountMortar2FInsideTMDefenseCurl:
	itemball TM_DEFENSE_CURL

MountMortar2FInsideDragonScale:
	itemball DRAGON_SCALE

MountMortar2FInsideElixer:
	itemball ELIXER

MountMortar2FInsideEscapeRope:
	itemball ESCAPE_ROPE

MountMortar2FInsideHiddenFullRestore:
	hiddenitem FULL_RESTORE, EVENT_MOUNT_MORTAR_2F_INSIDE_HIDDEN_FULL_RESTORE

SupernerdHughSeenText:
	text "Yo! Markus!"
	done

SupernerdHughBeatenText:
	text "Sorry, my mistake."
	done

SupernerdHughAfterBattleText:
	text "I'm investigating"
	line "Mt.Mortar, but my"
	cont "pal's gone AWOL."

	para "Have you seen a"
	line "trainer who has a"

	para "Slowpoke that can"
	line "use Strength?"
	done

Djinn_FeverScript:
	cry MARS
	opentext
	writetext Djinn_FeverText
	yesorno
	iffalse .Done
	givepoke MARS, 40, QUICK_CLAW, Djinn_FeverName, Djinn_FeverOTName
	setevent EVENT_GOT_FEVER
	disappear MOUNTMORTAR2FINSIDE_FEVER
	.Done
	closetext	
	end

Djinn_FeverName:
	db "Fever@"

Djinn_FeverOTName:
	db "Garet@" 

Djinn_FeverText:
	text "I'll be honest,"
	line "this place is a"
	cont "dissapointment."

	para "A place named"
	line "Mt Mortar ought"
	cont "to be on fire,"
	cont "you know?"

	para "Invite Fever to"
	line "join your party?"
	done

MountMortar2FInside_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 17, 33, MOUNT_MORTAR_1F_OUTSIDE, 4
	warp_event  3,  5, MOUNT_MORTAR_1F_INSIDE, 6
	warp_event  3, 33, MOLTRES_LAIR, 1

	def_coord_events

	def_bg_events
	bg_event 24,  8, BGEVENT_ITEM, MountMortar2FInsideHiddenFullRestore

	def_object_events
	object_event 28, 22, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MountMortar2FInsideMaxPotion, EVENT_MOUNT_MORTAR_2F_INSIDE_MAX_POTION
	object_event  2, 33, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MountMortar2FInsideRareCandy, EVENT_MOUNT_MORTAR_2F_INSIDE_RARE_CANDY
	object_event 19, 17, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MountMortar2FInsideTMDefenseCurl, EVENT_MOUNT_MORTAR_2F_INSIDE_TM_DEFENSE_CURL
	object_event 16,  5, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MountMortar2FInsideDragonScale, EVENT_MOUNT_MORTAR_2F_INSIDE_DRAGON_SCALE
	object_event  9, 11, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MountMortar2FInsideElixer, EVENT_MOUNT_MORTAR_2F_INSIDE_ELIXER
	object_event 28,  5, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MountMortar2FInsideEscapeRope, EVENT_MOUNT_MORTAR_2F_INSIDE_ESCAPE_ROPE
	object_event 13, 26, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerSupernerdHugh, -1
	object_event 35, 23, SPRITE_MARS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Djinn_FeverScript, EVENT_GOT_FEVER
