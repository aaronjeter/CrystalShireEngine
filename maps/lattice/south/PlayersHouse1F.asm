	object_const_def
	const PLAYERSHOUSE1F_MOM1
	const PLAYERSHOUSE1F_MOM2
	const PLAYERSHOUSE1F_MOM3
	const PLAYERSHOUSE1F_MOM4
	const PLAYERSHOUSE1F_POKEFAN_F

PlayersHouse1F_MapScripts:
	def_scene_scripts
	scene_script PlayersHouse1FNoop1Scene, SCENE_PLAYERSHOUSE1F_MEET_MOM
	scene_script PlayersHouse1FNoop2Scene, SCENE_PLAYERSHOUSE1F_NOOP

	def_callbacks

PlayersHouse1FNoop1Scene:
	end

PlayersHouse1FNoop2Scene:
	end

MeetMomLeftScript:
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1

MeetMomRightScript:
	playmusic MUSIC_MOM
	showemote EMOTE_SHOCK, PLAYERSHOUSE1F_MOM1, 15
	turnobject PLAYER, LEFT
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .OnRight
	applymovement PLAYERSHOUSE1F_MOM1, MomTurnsTowardPlayerMovement
	sjump MeetMomScript

.OnRight:
	applymovement PLAYERSHOUSE1F_MOM1, MomWalksToPlayerMovement
MeetMomScript:
	opentext
	;getstring STRING_BUFFER_4, PokegearName
	;scall PlayersHouse1FReceiveItemStd
	setflag ENGINE_POKEGEAR
	setflag ENGINE_PHONE_CARD
	verbosegiveitem COIN_CASE
	addcellnum PHONE_MOM
	setscene SCENE_PLAYERSHOUSE1F_NOOP
	setevent EVENT_PLAYERS_HOUSE_MOM_1
	clearevent EVENT_PLAYERS_HOUSE_MOM_2
	;writetext MomGivesPokegearText
	;promptbutton
	special SetDayOfWeek
.SetDayOfWeek:
	;writetext IsItDSTText
	;yesorno
	;iffalse .WrongDay
	special InitialClearDSTFlag
	;yesorno
	;iffalse .SetDayOfWeek
	sjump .DayOfWeekDone

.WrongDay:
	special InitialClearDSTFlag
	yesorno
	iffalse .SetDayOfWeek
.DayOfWeekDone:
	;writetext ComeHomeForDSTText
	promptbutton

;generate party
	scall PlayersHouseGenerateTeamScript	

	closetext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue .FromRight
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iffalse .FromLeft
	sjump .Finish

.FromRight:
	applymovement PLAYERSHOUSE1F_MOM1, MomTurnsBackMovement
	sjump .Finish

.FromLeft:
	applymovement PLAYERSHOUSE1F_MOM1, MomWalksBackMovement
; fallthrough
.Finish:
	special RestartMapMusic
	turnobject PLAYERSHOUSE1F_MOM1, LEFT
	end

MeetMomTalkedScript:
	playmusic MUSIC_MOM
	sjump MeetMomScript

PokegearName:
	db "#GEAR@"

PlayersHouse1FReceiveItemStd:
	jumpstd ReceiveItemScript
	end

MomScript:
	faceplayer
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	checkscene
	iffalse MeetMomTalkedScript ; SCENE_PLAYERSHOUSE1F_MEET_MOM
	opentext
	checkevent EVENT_FIRST_TIME_BANKING_WITH_MOM
	iftrue .FirstTimeBanking
	checkevent EVENT_TALKED_TO_MOM_AFTER_MYSTERY_EGG_QUEST
	iftrue .BankOfMom
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue .GaveMysteryEgg
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue .GotAPokemon
	writetext HurryUpElmIsWaitingText
	waitbutton
	closetext
	end

.GotAPokemon:
	writetext SoWhatWasProfElmsErrandText
	waitbutton
	closetext
	end

.FirstTimeBanking:
	writetext ImBehindYouText
	waitbutton
	closetext
	end

.GaveMysteryEgg:
	setevent EVENT_FIRST_TIME_BANKING_WITH_MOM
.BankOfMom:
	setevent EVENT_TALKED_TO_MOM_AFTER_MYSTERY_EGG_QUEST
	special BankOfMom
	waitbutton
	closetext
	end

NeighborScript:
	faceplayer
	opentext
	checktime MORN
	iftrue .MornScript
	checktime DAY
	iftrue .DayScript
	checktime EVE | NITE
	iftrue .NiteScript

.MornScript:
	writetext NeighborMornIntroText
	promptbutton
	sjump .Main

.DayScript:
	writetext NeighborDayIntroText
	promptbutton
	sjump .Main

.NiteScript:
	writetext NeighborNiteIntroText
	promptbutton
; fallthrough
.Main:
	writetext NeighborText
	waitbutton
	closetext
	turnobject PLAYERSHOUSE1F_POKEFAN_F, RIGHT
	end

PlayersHouse1FTVScript:
	jumptext PlayersHouse1FTVText

PlayersHouse1FStoveScript:
	jumptext PlayersHouse1FStoveText

PlayersHouse1FSinkScript:
	jumptext PlayersHouse1FSinkText

PlayersHouse1FFridgeScript:
	jumptext PlayersHouse1FFridgeText

MomTurnsTowardPlayerMovement:
	turn_head RIGHT
	step_end

MomWalksToPlayerMovement:
	slow_step RIGHT
	step_end

MomTurnsBackMovement:
	turn_head LEFT
	step_end

MomWalksBackMovement:
	slow_step LEFT
	step_end

ElmsLookingForYouText:
	text "Oh, <PLAYER>…! Our"
	line "neighbor, Prof."

	para "Elm, was looking"
	line "for you."

	para "He said he wanted"
	line "you to do some-"
	cont "thing for him."

	para "Oh! I almost for-"
	line "got! Your #mon"

	para "gear is back from"
	line "the repair shop."

	para "Here you go!"
	done

MomGivesPokegearText:
	text "Oh, the day of the"
	line "week isn't set."
	done

IsItDSTText:
	text "Is it Daylight"
	line "Saving Time now?"
	done

ComeHomeForDSTText:
	text "Come home to"
	line "adjust your clock"

	para "for Daylight"
	line "Saving Time."
	done


InstructionsNextText:
	text "Phone numbers are"
	line "stored in memory."

	para "Just choose a name"
	line "you want to call."

	para "Gee, isn't that"
	line "convenient?"
	done

HurryUpElmIsWaitingText:
	text "Prof.Elm is wait-"
	line "ing for you."

	para "Hurry up, baby!"
	done

SoWhatWasProfElmsErrandText:
	text "So, what was Prof."
	line "Elm's errand?"

	para "…"

	para "That does sound"
	line "challenging."

	para "But, you should be"
	line "proud that people"
	cont "rely on you."
	done

ImBehindYouText:
	text "<PLAYER>, do it!"

	para "I'm behind you all"
	line "the way!"
	done

NeighborMornIntroText:
	text "Good morning,"
	line "<PLAY_G>!"

	para "I'm visiting!"
	done

NeighborDayIntroText:
	text "Hello, <PLAY_G>!"
	line "I'm visiting!"
	done

NeighborNiteIntroText:
	text "Good evening,"
	line "<PLAY_G>!"

	para "I'm visiting!"
	done

NeighborText:
	text "<PLAY_G>, have you"
	line "heard?"

	para "My daughter is"
	line "adamant about"

	para "becoming Prof."
	line "Elm's assistant."

	para "She really loves"
	line "#mon!"
	done

PlayersHouse1FStoveText:
	text "Mom's specialty!"

	para "Cinnabar Volcano"
	line "Burger!"
	done

PlayersHouse1FSinkText:
	text "The sink is spot-"
	line "less. Mom likes it"
	cont "clean."
	done

PlayersHouse1FFridgeText:
	text "Let's see what's"
	line "in the fridge…"

	para "Fresh Water and"
	line "tasty Lemonade!"
	done

PlayersHouse1FTVText:
	text "There's a movie on"
	line "TV: Stars dot the"

	para "sky as two boys"
	line "ride on a train…"

	para "I'd better get"
	line "rolling too!"
	done

PlayersHouseGetPokemonText:
	text "Hey <PLAY_G>,"
	line "I got your"

	para "#mon back"
	line "from the vet!"
	done

PlayersHouseGenerateTeamScript:
	writetext PlayersHouseGetPokemonText
	promptbutton
	
	;scall PlayersHouseGetStarter
	;scall PlayersHouseGetBaby
	scall PlayersHouseGetKantoMon
	scall PlayersHouseGetJohtoMon
	scall PlayersHouseGetHoennMon
	;scall PlayersHouseGetAltMon
	
	end

PlayersHouseGetStarter:	
	random 12
	ifequal 0, .Charmander
	ifequal 1, .Squirtle
	ifequal 2, .Bulbasaur
	ifequal 3, .Chikorita
	ifequal 4, .Cyndaquil
	ifequal 5, .Totodile
	ifequal 6, .Treecko
	ifequal 7, .Torchic
	ifequal 8, .Mudkip
	ifequal 9, .Honobea
	ifequal 10, .Kurusu
	ifequal 11, .Eevee
	ifequal 12, .Pikachu

.Charmander
	givepoke CHARMANDER, 2
	end
.Squirtle
	givepoke SQUIRTLE, 2
	end
.Bulbasaur
	givepoke BULBASAUR, 2
	end
.Chikorita
	givepoke CHIKORITA, 2
	end
.Cyndaquil
	givepoke CYNDAQUIL, 2
	end
.Totodile
	givepoke TOTODILE, 2
	end
.Treecko
	givepoke TREECKO, 2
	end
.Torchic
	givepoke TORCHIC, 2
	end
.Mudkip
	givepoke MUDKIP, 2
	end
.Honobea
	givepoke HONOBEA, 2
	end
.Kurusu
	givepoke KURUSU, 2
	end
.Eevee
	givepoke EEVEE, 2
	end
.Pikachu
	givepoke PIKACHU, 2
	end

PlayersHouseGetBaby:
	random 10
	ifequal 0, .Pichu
	ifequal 1, .Cleffa
	ifequal 2, .Igglybuff
	ifequal 3, .Togepi
	ifequal 4, .Tyrogue
	ifequal 5, .Smoochum
	ifequal 6, .Elekid
	ifequal 7, .Magby
	ifequal 8, .Azurill
	ifequal 9, .Wynaut
	ifequal 10, .Munchlax

.Pichu
	givepoke PICHU, 0
	end
.Cleffa
	givepoke CLEFFA, 0
	end
.Igglybuff
	givepoke IGGLYBUFF, 0
	end
.Togepi
	givepoke TOGEPI, 0
	end
.Tyrogue
	givepoke TYROGUE, 0
	end
.Smoochum
	givepoke SMOOCHUM, 0
	end
.Elekid
	givepoke ELEKID, 0
	end
.Magby
	givepoke MAGBY, 0
	end
.Azurill
	givepoke AZURILL, 0
	end
.Wynaut
	givepoke WYNAUT, 0
	end
.Munchlax
	givepoke MUNCHLAX, 0
	end

PlayersHouseGetKantoMon:
	random 15
	ifequal 0, .Caterpie
	ifequal 1, .Weedle
	ifequal 2, .Rattata
	ifequal 3, .Pidgey
	ifequal 4, .Spearow
	ifequal 5, .Ekans
	ifequal 6, .Sandshrew
	ifequal 7, .Zubat
	ifequal 8, .Oddish
	ifequal 9, .Paras
	ifequal 10, .Venonat
	ifequal 11, .Diglett
	ifequal 12, .Psyduck
	ifequal 13, .Mankey
	ifequal 14, .Tentacool
	ifequal 15, .Slowpoke

.Caterpie
	givepoke CATERPIE, 0
	end
.Weedle
	givepoke WEEDLE, 0
	end
.Rattata
	givepoke RATTATA, 0
	end
.Pidgey
	givepoke PIDGEY, 0
	end
.Spearow
	givepoke SPEAROW, 0
	end
.Ekans
	givepoke EKANS, 0
	end
.Sandshrew
	givepoke SANDSHREW, 0
	end
.Zubat
	givepoke ZUBAT, 0
	end
.Oddish
	givepoke ODDISH, 0
	end
.Paras
	givepoke PARAS, 0
	end
.Venonat
	givepoke VENONAT, 0
	end
.Diglett
	givepoke DIGLETT, 0
	end
.Psyduck
	givepoke PSYDUCK, 0
	end
.Mankey
	givepoke MANKEY, 0
	end
.Tentacool
	givepoke TENTACOOL, 0
	end
.Slowpoke
	givepoke SLOWPOKE, 0
	end


PlayersHouseGetJohtoMon:
	random 15
	ifequal 0, .Sentret
	ifequal 1, .Hoothoot
	ifequal 2, .Ledyba
	ifequal 3, .Spinarak
	ifequal 4, .Chinchou
	ifequal 5, .Natu
	ifequal 6, .Mareep
	ifequal 7, .Hoppip
	ifequal 8, .Sunkern
	ifequal 9, .Wooper
	ifequal 10, .Pineco
	ifequal 11, .Teddiursa
	ifequal 12, .Slugma
	ifequal 13, .Swinub
	ifequal 14, .Houndour
	ifequal 15, .Phanpy

.Sentret
	givepoke SENTRET, 0
	end
.Hoothoot
	givepoke HOOTHOOT, 0
	end
.Ledyba
	givepoke LEDYBA, 0
	end
.Spinarak
	givepoke SPINARAK, 0
	end
.Chinchou
	givepoke CHINCHOU, 0
	end
.Natu
	givepoke NATU, 0
	end
.Mareep
	givepoke MAREEP, 0
	end
.Hoppip
	givepoke HOPPIP, 0
	end
.Sunkern
	givepoke SUNKERN, 0
	end
.Wooper
	givepoke WOOPER, 0
	end
.Pineco
	givepoke PINECO, 0
	end
.Teddiursa
	givepoke TEDDIURSA, 0
	end
.Slugma
	givepoke SLUGMA, 0
	end
.Swinub
	givepoke SWINUB, 0
	end
.Houndour
	givepoke HOUNDOUR, 0
	end
.Phanpy
	givepoke PHANPY, 0
	end


PlayersHouseGetHoennMon:
	random 15
	ifequal 0, .Poochyena
	ifequal 1, .Zigzagoon
	ifequal 2, .Wurmple
	ifequal 3, .Lotad
	ifequal 4, .Seedot
	ifequal 5, .Taillow
	ifequal 6, .Wingull
	ifequal 7, .Surskit
	ifequal 8, .Shroomish
	ifequal 9, .Nincada
	ifequal 10, .Whismur
	ifequal 11, .Makuhita
	ifequal 12, .Skitty
	ifequal 13, .Aron
	ifequal 14, .Meditite
	ifequal 15, .Electrike

.Poochyena
	givepoke POOCHYENA, 0
	end
.Zigzagoon
	givepoke ZIGZAGOON, 0
	end
.Wurmple
	givepoke WURMPLE, 0
	end
.Lotad
	givepoke LOTAD, 0
	end
.Seedot
	givepoke SEEDOT, 0
	end
.Taillow
	givepoke TAILLOW, 0
	end
.Wingull
	givepoke WINGULL, 0
	end
.Surskit
	givepoke SURSKIT, 0
	end
.Shroomish
	givepoke SHROOMISH, 0
	end
.Nincada
	givepoke NINCADA, 0
	end
.Whismur
	givepoke WHISMUR, 0
	end
.Makuhita
	givepoke MAKUHITA, 0
	end
.Skitty
	givepoke SKITTY, 0
	end
.Aron
	givepoke ARON, 0
	end
.Meditite
	givepoke MEDITITE, 0
	end
.Electrike
	givepoke ELECTRIKE, 0
	end


PlayersHouseGetAltMon:
	random 11
	ifequal 0, .Agrimer
	ifequal 1, .Asandshrew
	ifequal 2, .Avulpix
	ifequal 3, .Ageodude
	ifequal 4, .Hvoltorb
	ifequal 5, .Voltorb2
	ifequal 6, .Exeggcute2
	ifequal 7, .Tentacool2
	ifequal 8, .Totodile2
	ifequal 9, .Cyndaquil2
	ifequal 10, .Sunbou
	ifequal 11, .Kotora

.Agrimer
	givepoke AGRIMER, 0
	end
.Asandshrew
	givepoke ASANDSHREW, 0
	end
.Avulpix
	givepoke AVULPIX, 0
	end
.Ageodude
	givepoke AGEODUDE, 0
	end
.Hvoltorb
	givepoke HVOLTORB, 0
	end
.Voltorb2
	givepoke VOLTORB2, 0
	end
.Exeggcute2
	givepoke EXEGGCUTE2, 0
	end
.Tentacool2
	givepoke TENTACOOL2, 0
	end
.Totodile2
	givepoke TOTODILE2, 0
	end
.Cyndaquil2
	givepoke CYNDAQUIL2, 0
	end
.Sunbou
	givepoke SUNBOU, 0
	end
.Kotora
	givepoke KOTORA, 0
	end

PlayersHouse1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  6,  7, CITY_SOUTH, 1
	warp_event  7,  7, CITY_SOUTH, 1
	warp_event  9,  0, PLAYERS_HOUSE_2F, 1

	def_coord_events
	coord_event  8,  4, SCENE_PLAYERSHOUSE1F_MEET_MOM, MeetMomLeftScript
	coord_event  9,  4, SCENE_PLAYERSHOUSE1F_MEET_MOM, MeetMomRightScript

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, PlayersHouse1FStoveScript
	bg_event  1,  1, BGEVENT_READ, PlayersHouse1FSinkScript
	bg_event  2,  1, BGEVENT_READ, PlayersHouse1FFridgeScript
	bg_event  4,  1, BGEVENT_READ, PlayersHouse1FTVScript

	def_object_events
	object_event  7,  4, SPRITE_MOM, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MomScript, EVENT_PLAYERS_HOUSE_MOM_1
	object_event  2,  2, SPRITE_MOM, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, MORN, 0, OBJECTTYPE_SCRIPT, 0, MomScript, EVENT_PLAYERS_HOUSE_MOM_2
	object_event  7,  4, SPRITE_MOM, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, DAY, 0, OBJECTTYPE_SCRIPT, 0, MomScript, EVENT_PLAYERS_HOUSE_MOM_2
	object_event  4,  3, SPRITE_MOM, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, EVE, 0, OBJECTTYPE_SCRIPT, 0, MomScript, EVENT_PLAYERS_HOUSE_MOM_2
	object_event  0,  2, SPRITE_MOM, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, NITE, 0, OBJECTTYPE_SCRIPT, 0, MomScript, EVENT_PLAYERS_HOUSE_MOM_2
	object_event  4,  4, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, NeighborScript, EVENT_PLAYERS_HOUSE_1F_NEIGHBOR
