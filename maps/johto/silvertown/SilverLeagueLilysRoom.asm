	object_const_def
	const SILVERLEAGUELILYSROOM_LILY

SilverLeagueLilysRoom_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_TILES, SilverLeagueLilysRoomDoorsCallback

SilverLeagueLilysRoomDoorsCallback:
	checkevent EVENT_BEAT_ELITE_4_LILY
	iffalse .done
	changeblock 4, 2, $16 ; open door
.done:
	endcallback

SilverLeagueLilysRoomDoorLocksBehindYouScript:
	applymovement PLAYER, SilverLeagueLilysRoom_EnterMovement
	reanchormap $86
	playsound SFX_STRENGTH
	earthquake 80
	changeblock 4, 14, $2a ; wall
	refreshmap
	closetext
	waitsfx
	end

SilverLeagueLilysRoom_EnterMovement:
	step UP
	step UP
	step UP
	step UP
	step_end

SilverLeagueLilysRoomLilyScript:
	faceplayer
	opendialog LILY
	checkevent EVENT_BEAT_ELITE_4_LILY
	iftrue .AfterBattle
	writetext SilverLeagueLilysRoomBeforeText
	waitbutton
	closedialog
	callstd LeagueRematchCheckScript
	iftrue .Rematch
	winlosstext SilverLeagueLilysRoomBeatenText, 0
	loadtrainer LILY, LILY1
	sjump .Fight

.Rematch:
	winlosstext SilverLeagueLilysRoomBeatenText, 0
	loadtrainer LILY, LILY2
.Fight:
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_ELITE_4_LILY
	opendialog LILY
	writetext SilverLeagueLilysRoomDefeatText
	waitbutton
	closedialog
	playsound SFX_ENTER_DOOR
	changeblock 4, 2, $16 ; open door
	refreshmap
	waitsfx
	special HealParty
	end

.AfterBattle:
	writetext SilverLeagueLilysRoomDefeatText
	waitbutton
	closedialog
	end

SilverLeagueLilysRoomBeforeText:
	text "Welcome. I am"
	line "Lily of the Elite"
	cont "Four."

	para "My sisters and I"
	line "danced in Ecruteak"

	para "with #mon that"
	line "were once Eevee."

	para "I am the eldest,"
	line "and the strongest."

	para "Now, let our dance"
	line "begin!"
	done

SilverLeagueLilysRoomBeatenText:
	text "Beautiful! The"
	line "dance is yours."
	done

SilverLeagueLilysRoomDefeatText:
	text "Each Eevee chooses"
	line "its own path, as"
	cont "you chose yours."

	para "Go on. The next"
	line "room awaits you."
	done

SilverLeagueLilysRoom_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 17, SILVER_LEAGUE_WILLS_ROOM, 2
	warp_event  5, 17, SILVER_LEAGUE_WILLS_ROOM, 3
	warp_event  4,  2, SILVER_LEAGUE_EUSINES_ROOM, 1
	warp_event  5,  2, SILVER_LEAGUE_EUSINES_ROOM, 2

	def_coord_events
	coord_event  4, 16, -1, SilverLeagueLilysRoomDoorLocksBehindYouScript
	coord_event  5, 16, -1, SilverLeagueLilysRoomDoorLocksBehindYouScript

	def_bg_events

	def_object_events
	object_event  5,  7, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SilverLeagueLilysRoomLilyScript, -1
