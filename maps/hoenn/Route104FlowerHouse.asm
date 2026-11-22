	object_const_def
	const ROUTE104FLOWERHOUSE_FLORIST
	const ROUTE104FLOWERHOUSE_TWIN

Route104FlowerHouse_MapScripts:
	def_scene_scripts

	def_callbacks

Route104FlowerHouseFloristScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_ROUTE_104_SITRUS_BERRY
	iftrue .Shop
	writetext Route104FlowerHouseFirstVisitText
	promptbutton
	verbosegiveitem SITRUS_BERRY
	iffalse .Shop
	setevent EVENT_GOT_ROUTE_104_SITRUS_BERRY
.Shop:
	writetext Route104FlowerHouseShopText
	waitbutton
	pokemart MARTTYPE_STANDARD, MART_ROUTE_104_FLOWER_HOUSE
	closetext
	end

Route104FlowerHouseTwinScript:
	jumptextfaceplayer Route104FlowerHouseTwinText

Route104FlowerHouseFirstVisitText:
	text "Welcome to the"
	line "Pretty Petal"
	cont "Flower Shop!"

	para "It's your first"
	line "visit, isn't it?"

	para "Here, a Berry from"
	line "our garden. It's"
	cont "on the house!"
	done

Route104FlowerHouseShopText:
	text "We grow Berries"
	line "too. Would you"
	cont "like some?"
	done

Route104FlowerHouseTwinText:
	text "My sister picks"
	line "the Berries every"
	cont "morning."

	para "A Pokémon holding"
	line "one eats it when"
	cont "it's in trouble!"
	done

Route104FlowerHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2, 7, ROUTE_104, 8
	warp_event  3, 7, ROUTE_104, 8

	def_coord_events

	def_bg_events

	def_object_events
	object_event  2,  4, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route104FlowerHouseFloristScript, -1
	object_event  5,  5, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route104FlowerHouseTwinScript, -1
