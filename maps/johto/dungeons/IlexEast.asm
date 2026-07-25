	object_const_def	
	const ILEXEAST_MR_MIME
	const ILEXEAST_VENOMOTH
	const ILEXEAST_FORGE

IlexEast_MapScripts:
	def_scene_scripts

	def_callbacks	

IlexEastWaterShrineScript:
	opentext
	checkevent EVENT_GOT_CELEBI_EGG
	iftrue .GotEgg
	checkevent EVENT_DEFEATED_CELEBI_GUARDIAN_MR_MIME
	iftrue .DefeatedMrMime	
	writetext IlexEastMrMimeNotDefeatedText
	waitbutton
	closetext
	end

.GotEgg
	writetext IlexEastWaterShrineEmptyText
	waitbutton
	closetext
	end

.DefeatedMrMime
	checkevent EVENT_DEFEATED_CELEBI_GUARDIAN_SUNFLORA
	iftrue .DefeatedSunflora
	writetext IlexEastVenomothNotDefeatedText
	waitbutton
	closetext
	end

.DefeatedSunflora
	checkevent EVENT_DEFEATED_CELEBI_GUARDIAN_HYPNO
	iftrue .DefeatedHypno
	writetext IlexEastVenomothNotDefeatedText
	waitbutton
	closetext

.DefeatedHypno
	checkevent EVENT_DEFEATED_CELEBI_GUARDIAN_VENOMOTH
	iftrue .DefeatedVenomoth
	writetext IlexEastVenomothNotDefeatedText
	waitbutton
	closetext

.DefeatedVenomoth
	writetext IlexEastTakeEggText
	yesorno
	iftrue .TakeEgg
	closetext
	end

.TakeEgg
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFull
	giveegg CELEBI, EGG_LEVEL
	setevent EVENT_GOT_CELEBI_EGG
	closetext
	end

.PartyFull:
	writetext IlexEastPartyFullText
	waitbutton
	closetext
	end

IlexEastPartyFullText:
	text "Your party is"
	line "full. You leave"
	cont "the egg."
	done

IlexEastWaterShrineEmptyText:
	text "The shrine is"
	line "empty..."
	done

IlexEastMrMimeNotDefeatedText:
	text "You see an egg"
	line "nestled within."

	para "It's protected"
	line "by a very power-"
	cont "full barrier."
	done

IlexEastVenomothNotDefeatedText:
	text "You see an egg"
	line "nestled within."

	para "It's protected"
	line "by a power-"
	cont "full barrier."
	done

IlexEastTakeEggText:
	text "You see an egg"
	line "nestled within."

	para "Take the egg?"
	done

IlexEastBarrierWeakenedText:
	text "You feel the"
	line "shadows shift."
	done

IlexEast_MrMime:
	cry MR__MIME
	loadvar VAR_BATTLETYPE, BATTLETYPE_TRAP
	loadwildmon MR__MIME, 10
	startbattle
	reloadmapafterbattle
	setevent EVENT_DEFEATED_CELEBI_GUARDIAN_MR_MIME
	disappear ILEXEAST_MR_MIME
	opentext
	writetext IlexEastBarrierWeakenedText
	waitbutton
	closetext
	end

IlexEast_Venomoth:
	cry VENOMOTH
	loadvar VAR_BATTLETYPE, BATTLETYPE_TRAP
	loadwildmon VENOMOTH, 10
	startbattle
	reloadmapafterbattle
	setevent EVENT_DEFEATED_CELEBI_GUARDIAN_VENOMOTH
	disappear ILEXEAST_VENOMOTH
	opentext
	writetext IlexEastBarrierWeakenedText
	waitbutton
	closetext
	end


Djinn_ForgeScript:
	cry MARS
	opentext
	writetext Djinn_ForgeText
	yesorno
	iffalse .Done
	givepoke MARS, 12, FIRE_STONE, Djinn_ForgeName, Djinn_ForgeOTName
	setevent EVENT_GOT_FORGE
	disappear ILEXEAST_FORGE
	.Done
	closetext	
	end

Djinn_ForgeName:
	db "Forge@"

Djinn_ForgeOTName:
	db "Jenna@" 

Djinn_ForgeText:
	text "I'm so freaking"
	line "lost! I'm gonna"
	cont "burn this stupid"
	cont "forest down!"

	para "Or...maybe you"
	line "could show me the"
	cont "way out?"

	para "Invite Forge to"
	line "join your party?"
	done

IlexEast_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event  0, 26, ILEX_FOREST, 6
	warp_event  0, 27, ILEX_FOREST, 7

	def_coord_events

	def_bg_events	
	bg_event 20, 24, BGEVENT_UP, IlexEastWaterShrineScript

	def_object_events
	object_event 21,  4, SPRITE_MR__MIME, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, IlexEast_MrMime, EVENT_DEFEATED_CELEBI_GUARDIAN_MR_MIME
	object_event 38, 10, SPRITE_VENOMOTH, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_PURPLE, OBJECTTYPE_SCRIPT, 0, IlexEast_Venomoth, EVENT_DEFEATED_CELEBI_GUARDIAN_VENOMOTH
	object_event 30, 30, SPRITE_MARS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Djinn_ForgeScript, EVENT_GOT_FORGE
