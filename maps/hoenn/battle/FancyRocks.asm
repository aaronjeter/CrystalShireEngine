	object_const_def

FancyRocks_MapScripts:
	def_scene_scripts

	def_callbacks

FancyRocks_Clerk:
	opentext

	readvar VAR_BADGES
	ifgreater 15, .OpenShop
	sjump .CloseShop
	
	.OpenShop
	pokemart MARTTYPE_STANDARD, MART_MEGAMART
	sjump .end

	.CloseShop
	writetext FancyRocksUnworthyText
	waitbutton

	.end
	closetext
	end

FancyRocksUnworthyText:
	text "Shoo!"

	para "I don't do"
	line "busisness with"
	cont "riff-raff."

	para "Come back when"
	line "you've done"
	cont "something with"
	cont "your life."
	done

FancyRocks_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  04, 05, BATTLE_RESORT, 10
	warp_event  05, 05, BATTLE_RESORT, 10

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  1, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FancyRocks_Clerk, -1
