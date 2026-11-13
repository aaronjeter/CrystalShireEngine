	object_const_def
	const SILVERLEAGUEKARENSROOM_KAREN

SilverLeagueKarensRoom_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_TILES, SilverLeagueKarensRoomDoorsCallback

SilverLeagueKarensRoomDoorsCallback:
	checkevent EVENT_BEAT_ELITE_4_KAREN
	iffalse .done
	changeblock 4, 2, $16 ; open door
.done:
	endcallback

SilverLeagueKarensRoomDoorLocksBehindYouScript:
	applymovement PLAYER, SilverLeagueKarensRoom_EnterMovement
	reanchormap $86
	playsound SFX_STRENGTH
	earthquake 80
	changeblock 4, 14, $2a ; wall
	refreshmap
	closetext
	waitsfx
	end

SilverLeagueKarensRoom_EnterMovement:
	step UP
	step UP
	step UP
	step UP
	step_end

SilverLeagueKarensRoomKarenScript:
	faceplayer
	opendialog KAREN
	checkevent EVENT_BEAT_ELITE_4_KAREN
	iftrue .AfterBattle
	writetext SilverLeagueKarensRoomBeforeText
	waitbutton
	closedialog
	callstd LeagueRematchCheckScript
	iftrue .Rematch
	winlosstext SilverLeagueKarensRoomBeatenText, 0
	loadtrainer KAREN, KAREN1
	sjump .Fight

.Rematch:
	winlosstext SilverLeagueKarensRoomBeatenText, 0
	loadtrainer KAREN, KAREN2
.Fight:
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_ELITE_4_KAREN
	opendialog KAREN
	writetext SilverLeagueKarensRoomDefeatText
	waitbutton
	closedialog
	playsound SFX_ENTER_DOOR
	changeblock 4, 2, $16 ; open door
	refreshmap
	waitsfx
	special HealParty
	end

.AfterBattle:
	writetext SilverLeagueKarensRoomDefeatText
	waitbutton
	closedialog
	end

SilverLeagueKarensRoomBeforeText:
	text "I am Karen of the"
	line "Elite Four."

	para "You're <PLAYER>?"
	line "How amusing."

	para "I love dark-type"
	line "#mon."

	para "I find their wild,"
	line "tough image to be"

	para "so appealing. And"
	line "they're so strong."

	para "Think you can take"
	line "them? Just try to"
	cont "entertain me."

	para "Let's go."
	done

SilverLeagueKarensRoomBeatenText:
	text "Well, aren't you"
	line "good. I like that"
	cont "in a trainer."
	done

SilverLeagueKarensRoomDefeatText:
	text "Strong #mon."

	para "Weak #mon."

	para "That is only the"
	line "selfish perception"
	cont "of people."

	para "Truly skilled"
	line "trainers should"

	para "try to win with"
	line "their favorites."

	para "I like your style."
	line "You understand"
	cont "what's important."

	para "Go on--the Cham-"
	line "pion is waiting."
	done

SilverLeagueKarensRoom_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 17, SILVER_LEAGUE_EUSINES_ROOM, 3
	warp_event  5, 17, SILVER_LEAGUE_EUSINES_ROOM, 4
	warp_event  4,  2, SILVER_LEAGUE_LANCES_ROOM, 1
	warp_event  5,  2, SILVER_LEAGUE_LANCES_ROOM, 2

	def_coord_events
	coord_event  4, 16, -1, SilverLeagueKarensRoomDoorLocksBehindYouScript
	coord_event  5, 16, -1, SilverLeagueKarensRoomDoorLocksBehindYouScript

	def_bg_events

	def_object_events
	object_event  5,  7, SPRITE_KAREN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SilverLeagueKarensRoomKarenScript, -1
