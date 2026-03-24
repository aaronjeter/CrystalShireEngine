	object_const_def
	const PLAYERSHOUSE2F_CONSOLE
	const PLAYERSHOUSE2F_DOLL_1
	const PLAYERSHOUSE2F_DOLL_2
	const PLAYERSHOUSE2F_BIG_DOLL
	const PLAYERHOUSE2F_RANDOMTESTGUY

PlayersHouse2F_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, PlayersHouse2FInitializeRoomCallback
	callback MAPCALLBACK_TILES, PlayersHouse2FSetUpTileDecorationsCallback

PlayersHouse2FInitializeRoomCallback:
	special ToggleDecorationsVisibility
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_8
	checkevent EVENT_INITIALIZED_EVENTS
	iftrue .SkipInitialization
	jumpstd InitializeEventsScript
	endcallback

.SkipInitialization:
	endcallback

PlayersHouse2FSetUpTileDecorationsCallback:
	special ToggleMaptileDecorations
	endcallback

	db 0, 0, 0 ; unused

PlayersHouseDoll1Script::
	describedecoration DECODESC_LEFT_DOLL

PlayersHouseDoll2Script:
	describedecoration DECODESC_RIGHT_DOLL

PlayersHouseBigDollScript:
	describedecoration DECODESC_BIG_DOLL

PlayersHouseGameConsoleScript:
	describedecoration DECODESC_CONSOLE

PlayersHousePosterScript:
	conditional_event EVENT_PLAYERS_ROOM_POSTER, .Script

.Script:
	describedecoration DECODESC_POSTER

PlayersHouseRadioScript:
if DEF(_DEBUG)
	opentext
	; full pokegear
	setflag ENGINE_POKEGEAR
	setflag ENGINE_PHONE_CARD
	setflag ENGINE_MAP_CARD
	setflag ENGINE_RADIO_CARD
	setflag ENGINE_EXPN_CARD
	; pokedex
	setflag ENGINE_POKEDEX
	; useful items
	giveitem RARE_CANDY, 99
	giveitem PROTEIN, 99
	giveitem CARBOS, 99
	giveitem MAX_REPEL, 99
	giveitem MASTER_BALL, 99
	giveitem BICYCLE
	giveitem GOOD_ROD
	giveitem THUNDERSTONE, 10
	giveitem FIRE_STONE, 10
	giveitem WATER_STONE, 10
	giveitem LEAF_STONE, 10
	giveitem MOON_STONE, 10
	giveitem SUN_STONE, 10
	giveitem DAWN_STONE, 10
	giveitem ICE_STONE, 10
	giveitem BERRY, 10
	giveitem GOLD_BERRY, 10
	giveitem MINT_BERRY, 10
	giveitem MYSTERYBERRY, 10
	giveitem QUICK_CLAW
	giveitem KINGS_ROCK
	giveitem METAL_COAT, 10
	giveitem DRAGON_SCALE, 10
	giveitem DRAGON_FANG
	giveitem SCOPE_LENS
	giveitem BIRD_WHISTLE
	giveitem LANTERN
	giveitem COIN_CASE
	giveitem KANTOITE_X, 10
	giveitem KANTOITE_Y, 10
	giveitem JOHTOITE_X, 10
	giveitem HOENNITE_X, 10

	giveitem RAZOR_BERRY, 10
	giveitem IRON_BERRY, 10
	giveitem HASTE_BERRY, 10
	giveitem FOCUS_BERRY, 10
	giveitem WARD_BERRY, 10
	giveitem MARVEL_SCALE, 10

	giveitem HM_CUT
	giveitem HM_SURF
	giveitem HM_WHIRLPOOL
	giveitem HM_WATERFALL
	giveitem HM_FLASH
	giveitem HM_STRENGTH
	giveitem TM_ROCK_SMASH

	giveitem HATCHET
	;giveitem PICKAXE
	giveitem FLIPPERS

	; all badges
	setflag ENGINE_ZEPHYRBADGE
	setflag ENGINE_HIVEBADGE
	setflag ENGINE_PLAINBADGE
	setflag ENGINE_FOGBADGE
	setflag ENGINE_STORMBADGE
	setflag ENGINE_MINERALBADGE
	setflag ENGINE_GLACIERBADGE
	setflag ENGINE_RISINGBADGE
	setflag ENGINE_BOULDERBADGE
	setflag ENGINE_CASCADEBADGE
	setflag ENGINE_THUNDERBADGE
	setflag ENGINE_RAINBOWBADGE
	setflag ENGINE_MARSHBADGE
	setflag ENGINE_SOULBADGE
	setflag ENGINE_VOLCANOBADGE
	setflag ENGINE_EARTHBADGE
	setevent EVENT_BEAT_FALKNER
	setevent EVENT_BEAT_BUGSY
	setevent EVENT_BEAT_WHITNEY
	setevent EVENT_BEAT_MORTY
	setevent EVENT_BEAT_CHUCK
	setevent EVENT_BEAT_JASMINE
	setevent EVENT_BEAT_PRYCE
	setevent EVENT_BEAT_CLAIR
	setevent EVENT_BEAT_BROCK
	setevent EVENT_BEAT_MISTY
	setevent EVENT_BEAT_LTSURGE
	setevent EVENT_BEAT_ERIKA
	setevent EVENT_BEAT_JANINE
	setevent EVENT_BEAT_SABRINA
	setevent EVENT_BEAT_BLAINE
	setevent EVENT_BEAT_BLUE
	setevent EVENT_BEAT_ELITE_FOUR

	setevent EVENT_GOT_A_POKEMON_FROM_ELM

	;clearevent EVENT_OLIVINE_GYM_JASMINE
	;setevent EVENT_MAHOGANY_TOWN_POKEFAN_M_BLOCKS_GYM

	setevent EVENT_DEFEATED_CELEBI_GUARDIAN_MR_MIME
	setevent EVENT_DEFEATED_CELEBI_GUARDIAN_SUNFLORA
	setevent EVENT_DEFEATED_CELEBI_GUARDIAN_HYPNO
	setevent EVENT_DEFEATED_CELEBI_GUARDIAN_VENOMOTH


	; fly anywhere
	setflag ENGINE_FLYPOINT_NEW_BARK
	setflag ENGINE_FLYPOINT_CHERRYGROVE
	setflag ENGINE_FLYPOINT_VIOLET
	setflag ENGINE_FLYPOINT_AZALEA
	setflag ENGINE_FLYPOINT_GOLDENROD
	setflag ENGINE_FLYPOINT_ECRUTEAK
	setflag ENGINE_FLYPOINT_OLIVINE
	setflag ENGINE_FLYPOINT_CIANWOOD
	setflag ENGINE_FLYPOINT_MAHOGANY
	setflag ENGINE_FLYPOINT_LAKE_OF_RAGE
	setflag ENGINE_FLYPOINT_BLACKTHORN
	setflag ENGINE_FLYPOINT_SILVER_CAVE
	setflag ENGINE_FLYPOINT_INDIGO_PLATEAU
	setflag ENGINE_FLYPOINT_PALLET
	setflag ENGINE_FLYPOINT_VIRIDIAN
	setflag ENGINE_FLYPOINT_PEWTER
	setflag ENGINE_FLYPOINT_CERULEAN
	setflag ENGINE_FLYPOINT_VERMILION
	setflag ENGINE_FLYPOINT_CELADON
	setflag ENGINE_FLYPOINT_ROCK_TUNNEL
	setflag ENGINE_FLYPOINT_LAVENDER
	setflag ENGINE_FLYPOINT_FUCHSIA
	setflag ENGINE_FLYPOINT_SAFFRON
	setflag ENGINE_FLYPOINT_CINNABAR

	setflag ENGINE_FLYPOINT_LITTLEROOT
	setflag ENGINE_FLYPOINT_OLDALE
	setflag ENGINE_FLYPOINT_PETALBURG
	setflag ENGINE_FLYPOINT_RUSTBORO
	setflag ENGINE_FLYPOINT_DEWFORD
	setflag ENGINE_FLYPOINT_SLATEPORT
	setflag ENGINE_FLYPOINT_MAUVILLE
	setflag ENGINE_FLYPOINT_VERDANTURF
	setflag ENGINE_FLYPOINT_LAVARIDGE
	setflag ENGINE_FLYPOINT_FALLARBOR
	setflag ENGINE_FLYPOINT_FORTREE
	setflag ENGINE_FLYPOINT_LILYCOVE
	setflag ENGINE_FLYPOINT_MOSSDEEP
	setflag ENGINE_FLYPOINT_SOOTOPOLIS
	; post-e4
	setflag ENGINE_CREDITS_SKIP
	; good party
	givepoke MEW, 200

	loadmem wPartyMon1DVs+0, $ff
	loadmem wPartyMon1DVs+1, $ff
	loadmem wPartyMon1DVs+2, $ff
	; hm slaves
	givepoke SWALOT, 80, SACRED_ASH 
	givepoke FLYGON, 80, ITEM_91
	givepokemove FLY,        wPartyMon2, 0
	givepokemove SURF,       wPartyMon2, 1
	givepokemove HAIL,		 wPartyMon2, 2
	givepokemove CUT,        wPartyMon2, 3
	givepokemove FLASH,      wPartyMon3, 0
	;givepokemove ROCK_SMASH, wPartyMon3, 1
	givepokemove HEADBUTT,   wPartyMon3, 2
	givepokemove WATERFALL,  wPartyMon3, 3
	; misc pokemon for testing
	givepoke GOROCHU, 99, LIGHT_BALL
	givepoke CHIMECHO, 99, POLKADOT_BOW
	givepoke TENTACOOL2, 99, MIRAGE_MAIL
	; intro events
	addcellnum PHONE_MOM
	setmapscene PLAYERS_HOUSE_1F, $1
	setevent EVENT_PLAYERS_HOUSE_MOM_1
	clearevent EVENT_PLAYERS_HOUSE_MOM_2

	setevent EVENT_BEAT_RIVAL_IN_MT_MOON
	scall PHLevelcap
	;jumpstd UpdateWorldLevelsScript

	closetext
	end
else

	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue .NormalRadio
	checkevent EVENT_LISTENED_TO_INITIAL_RADIO
	iftrue .AbbreviatedRadio
	playmusic MUSIC_POKEMON_TALK
	opentext
	writetext PlayersRadioText1
	pause 45
	writetext PlayersRadioText2
	pause 45
	writetext PlayersRadioText3
	pause 45
	musicfadeout MUSIC_NEW_BARK_TOWN, 16
	writetext PlayersRadioText4
	pause 45
	closetext
	setevent EVENT_LISTENED_TO_INITIAL_RADIO
	end

.NormalRadio:
	jumpstd Radio1Script

.AbbreviatedRadio:
	opentext
	writetext PlayersRadioText4
	pause 45
	closetext
	end

endc

PlayersHouseBookshelfScript:
	jumpstd PictureBookshelfScript

PlayersHousePCScript:
	opentext
	special PlayersHousePC
	iftrue .Warp
	closetext
	end
.Warp:
	warp NONE, 0, 0
	end

PHLevelcap:
	jumpstd UpdateWorldLevelsScript
	end

PlayersRadioText1:
	text "PROF.OAK'S #MON"
	line "TALK! Please tune"
	cont "in next time!"
	done

PlayersRadioText2:
	text "#MON CHANNEL!"
	done

PlayersRadioText3:
	text "This is DJ MARY,"
	line "your co-host!"
	done

PlayersRadioText4:
	text "#MON!"
	line "#MON CHANNEL…"
	done


Playerhouse_RandomTestTrainer:
	faceplayer
	winlosstext PlayersRadioText1, 0
	loadtrainer EXPLORER, RANDOM_TEST
	startbattle
	reloadmapafterbattle
	end

PlayersHouse2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  7,  0, PLAYERS_HOUSE_1F, 3
	warp_event  7,  4, LITTLEROOT_TOWN, 1

	def_coord_events

	def_bg_events
	bg_event  2,  1, BGEVENT_UP, PlayersHousePCScript
	bg_event  3,  1, BGEVENT_READ, PlayersHouseRadioScript
	bg_event  5,  1, BGEVENT_READ, PlayersHouseBookshelfScript
	bg_event  6,  0, BGEVENT_IFSET, PlayersHousePosterScript

	def_object_events
	object_event  4,  2, SPRITE_CONSOLE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PlayersHouseGameConsoleScript, EVENT_PLAYERS_HOUSE_2F_CONSOLE
	object_event  4,  4, SPRITE_DOLL_1, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PlayersHouseDoll1Script, EVENT_PLAYERS_HOUSE_2F_DOLL_1
	object_event  5,  4, SPRITE_DOLL_2, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PlayersHouseDoll2Script, EVENT_PLAYERS_HOUSE_2F_DOLL_2
	object_event  0,  1, SPRITE_BIG_DOLL, SPRITEMOVEDATA_BIGDOLL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PlayersHouseBigDollScript, EVENT_PLAYERS_HOUSE_2F_BIG_DOLL
	;object_event 02, 04, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Playerhouse_RandomTestTrainer, -1
	