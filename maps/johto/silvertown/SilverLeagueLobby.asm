	object_const_def
	const SILVERLEAGUELOBBY_NURSE
	const SILVERLEAGUELOBBY_CLERK

SilverLeagueLobby_MapScripts:
	def_scene_scripts

	def_callbacks

SilverLeagueLobbyNurseScript:
	jumpstd PokecenterNurseScript

SilverLeagueLobbyClerkScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_BLACKTHORN
	closetext
	end

SilverLeagueLobby_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5, 13, SILVER_TOWN, 1
	warp_event  6, 13, SILVER_TOWN, 4
	warp_event  0, 13, POKECENTER_2F, 1
	warp_event 14,  3, SILVER_LEAGUE_WILLS_ROOM, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  7, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SilverLeagueLobbyNurseScript, -1
	object_event 11,  7, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SilverLeagueLobbyClerkScript, -1
