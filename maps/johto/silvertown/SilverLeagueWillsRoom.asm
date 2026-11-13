	object_const_def
	const SILVERLEAGUEWILLSROOM_WILL

SilverLeagueWillsRoom_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_TILES, SilverLeagueWillsRoomDoorsCallback

SilverLeagueWillsRoomDoorsCallback:
	checkevent EVENT_BEAT_ELITE_4_WILL
	iffalse .done
	changeblock 4, 2, $16 ; open door
.done:
	endcallback

SilverLeagueWillsRoomDoorLocksBehindYouScript:
	setevent EVENT_PASSPORT_UNLOCKED
	clearevent EVENT_BEAT_ELITE_4_WILL
	clearevent EVENT_BEAT_ELITE_4_LILY
	clearevent EVENT_BEAT_ELITE_4_EUSINE
	clearevent EVENT_BEAT_ELITE_4_KAREN
	applymovement PLAYER, SilverLeagueWillsRoom_EnterMovement
	reanchormap $86
	playsound SFX_STRENGTH
	earthquake 80
	changeblock 4, 14, $2a ; wall
	refreshmap
	closetext
	waitsfx
	end

SilverLeagueWillsRoom_EnterMovement:
	step UP
	step UP
	step UP
	step UP
	step_end

SilverLeagueWillsRoomWillScript:
	faceplayer
	opendialog WILL
	checkevent EVENT_BEAT_ELITE_4_WILL
	iftrue .AfterBattle
	writetext SilverLeagueWillsRoomBeforeText
	waitbutton
	closedialog
	checkevent EVENT_BEAT_JOHTO_LEAGUE
	iftrue .Rematch
	winlosstext SilverLeagueWillsRoomBeatenText, 0
	loadtrainer WILL, WILL1
	sjump .Fight

.Rematch:
	winlosstext SilverLeagueWillsRoomBeatenText, 0
	loadtrainer WILL, WILL2
.Fight:
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_ELITE_4_WILL
	opendialog WILL
	writetext SilverLeagueWillsRoomDefeatText
	waitbutton
	closedialog
	playsound SFX_ENTER_DOOR
	changeblock 4, 2, $16 ; open door
	refreshmap
	waitsfx
	special HealParty
	end

.AfterBattle:
	writetext SilverLeagueWillsRoomDefeatText
	waitbutton
	closedialog
	end

SilverLeagueWillsRoomBeforeText:
	text "Welcome to #mon"
	line "League, <PLAYER>."

	para "Allow me to intro-"
	line "duce myself. I am"
	cont "Will."

	para "I have trained all"
	line "around the world,"

	para "making my psychic"
	line "#mon powerful."

	para "And, at last, I've"
	line "been accepted into"
	cont "the Elite Four."

	para "I can only keep"
	line "getting better!"

	para "Losing is not an"
	line "option!"
	done

SilverLeagueWillsRoomBeatenText:
	text "I… I can't…"
	line "believe it…"
	done

SilverLeagueWillsRoomDefeatText:
	text "Even though I was"
	line "defeated, I won't"
	cont "change my course."

	para "I will continue"
	line "battling until I"

	para "stand above all"
	line "trainers!"

	para "Now, <PLAYER>, move"
	line "on and experience"

	para "the true ferocity"
	line "of the Elite Four."
	done

SilverLeagueWillsRoom_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5, 17, SILVER_LEAGUE_LOBBY, 4
	warp_event  4,  2, SILVER_LEAGUE_LILYS_ROOM, 1
	warp_event  5,  2, SILVER_LEAGUE_LILYS_ROOM, 2

	def_coord_events
	coord_event  4, 16, -1, SilverLeagueWillsRoomDoorLocksBehindYouScript
	coord_event  5, 16, -1, SilverLeagueWillsRoomDoorLocksBehindYouScript

	def_bg_events

	def_object_events
	object_event  5,  7, SPRITE_WILL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SilverLeagueWillsRoomWillScript, -1
