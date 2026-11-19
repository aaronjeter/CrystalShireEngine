	object_const_def

OldaleHouse1_MapScripts:
	def_scene_scripts

	def_callbacks	
	callback MAPCALLBACK_SPRITES, OldaleHouse1MonSpritesCallback

OldaleHouse1MonSpritesCallback:
	setmonsprite SPRITE_MON_1, VULPIX
	endcallback

OldaleHouse1VulpixScript:
	cry VULPIX
	end

OldaleHouse1WomanScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_OLDALE_POKE_BALLS
	iftrue .Got
	writetext OldaleHouse1WomanOfferText
	promptbutton
	verbosegiveitem POKE_BALL, 5
	iffalse .Done
	setevent EVENT_GOT_OLDALE_POKE_BALLS
.Got:
	writetext OldaleHouse1WomanText
	waitbutton
.Done:
	closetext
	end

OldaleHouse1WomanOfferText:
	text "Just starting your"
	line "journey?"

	para "Then take these."
	line "You'll need them!"
	done

OldaleHouse1WomanText:
	text "Throw a # Ball"
	line "at a weakened wild"
	cont "#mon to catch"
	cont "it."

	para "My Vulpix came"
	line "home that way!"
	done

OldaleHouse1_MapEvents:
	db 0, 0 ; filler

	def_warp_events	
	warp_event  2, 7, OLDALE_TOWN, 3
	warp_event  3, 7, OLDALE_TOWN, 3

	def_coord_events

	def_bg_events	

	def_object_events
	object_event  4,  1, SPRITE_MON_1, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_WHITE, OBJECTTYPE_SCRIPT, 0, OldaleHouse1VulpixScript, -1
	object_event  5,  3, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OldaleHouse1WomanScript, -1
