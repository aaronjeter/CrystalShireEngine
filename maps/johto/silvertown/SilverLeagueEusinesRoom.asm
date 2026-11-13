	object_const_def
	const SILVERLEAGUEEUSINESROOM_EUSINE

SilverLeagueEusinesRoom_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_TILES, SilverLeagueEusinesRoomDoorsCallback

SilverLeagueEusinesRoomDoorsCallback:
	checkevent EVENT_BEAT_ELITE_4_EUSINE
	iffalse .done
	changeblock 4, 2, $16 ; open door
.done:
	endcallback

SilverLeagueEusinesRoomDoorLocksBehindYouScript:
	applymovement PLAYER, SilverLeagueEusinesRoom_EnterMovement
	reanchormap $86
	playsound SFX_STRENGTH
	earthquake 80
	changeblock 4, 14, $2a ; wall
	refreshmap
	closetext
	waitsfx
	end

SilverLeagueEusinesRoom_EnterMovement:
	step UP
	step UP
	step UP
	step UP
	step_end

SilverLeagueEusinesRoomEusineScript:
	faceplayer
	opendialog MYSTICALMAN
	checkevent EVENT_BEAT_ELITE_4_EUSINE
	iftrue .AfterBattle
	writetext SilverLeagueEusinesRoomBeforeText
	waitbutton
	closedialog
	callstd LeagueRematchCheckScript
	iftrue .Rematch
	winlosstext SilverLeagueEusinesRoomBeatenText, 0
	loadtrainer MYSTICALMAN, EUSINE2
	sjump .Fight

.Rematch:
	winlosstext SilverLeagueEusinesRoomBeatenText, 0
	loadtrainer MYSTICALMAN, EUSINE3
.Fight:
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_ELITE_4_EUSINE
	opendialog MYSTICALMAN
	writetext SilverLeagueEusinesRoomDefeatText
	waitbutton
	closedialog
	playsound SFX_ENTER_DOOR
	changeblock 4, 2, $16 ; open door
	refreshmap
	waitsfx
	special HealParty
	end

.AfterBattle:
	writetext SilverLeagueEusinesRoomDefeatText
	waitbutton
	closedialog
	end

SilverLeagueEusinesRoomBeforeText:
	text "I'm Eusine of the"
	line "Elite Four."

	para "I've chased the"
	line "legends of Johto"
	cont "all my life."

	para "In the end, one"
	line "chose to travel"
	cont "with me."

	para "Let me show you"
	line "what a legend can"
	cont "do!"
	done

SilverLeagueEusinesRoomBeatenText:
	text "Even a legend"
	line "can be surpassed…"
	done

SilverLeagueEusinesRoomDefeatText:
	text "You're writing a"
	line "legend of your"
	cont "own, <PLAYER>."

	para "Go on. Karen is"
	line "waiting."
	done

SilverLeagueEusinesRoom_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 17, SILVER_LEAGUE_LILYS_ROOM, 3
	warp_event  5, 17, SILVER_LEAGUE_LILYS_ROOM, 4
	warp_event  4,  2, SILVER_LEAGUE_KARENS_ROOM, 1
	warp_event  5,  2, SILVER_LEAGUE_KARENS_ROOM, 2

	def_coord_events
	coord_event  4, 16, -1, SilverLeagueEusinesRoomDoorLocksBehindYouScript
	coord_event  5, 16, -1, SilverLeagueEusinesRoomDoorLocksBehindYouScript

	def_bg_events

	def_object_events
	object_event  5,  7, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SilverLeagueEusinesRoomEusineScript, -1
