	object_const_def
	const ROUTE14_POKEFAN_M1
	const ROUTE14_YOUNGSTER
	const ROUTE14_POKEFAN_M2
	const ROUTE14_KIM

Route14_MapScripts:
	def_scene_scripts

	def_callbacks

Kim:
	faceplayer
	opentext
	trade NPC_TRADE_KIM
	waitbutton
	closetext
	end

TrainerPokefanmCarter:
	trainer POKEFANS, VICANDCAT, EVENT_BEAT_POKEFANS_VIC_CAT, PokefansVicCatSeenText, PokefansVicCatBeatenText, 0, .Script

.Script:
	trainerafter PokefansVicCatAfterBattleText

TrainerBirdKeeperRoy:
	trainer BIRD_KEEPER, ROY, EVENT_BEAT_BIRD_KEEPER_ROY, BirdKeeperRoySeenText, BirdKeeperRoyBeatenText, 0, .Script

.Script:
	trainerafter BirdKeeperRoyAfterBattleText

TrainerPokefanmTrevor:
	trainer POKEFANS, VICANDCAT, EVENT_BEAT_POKEFANS_VIC_CAT, PokefansVicCatSeenText, PokefansVicCatBeatenText, 0, .Script

.Script:
	trainerafter PokefansVicCatAfterBattleText

BirdKeeperRoySeenText:
	text "My dream is to fly"
	line "with my beloved"
	cont "bird #mon."
	done

BirdKeeperRoyBeatenText:
	text "I can dream, but I"
	line "can't ever fly…"
	done

BirdKeeperRoyAfterBattleText:
	text "You have #mon"
	line "that know the HM"

	para "move Fly, don't"
	line "you? I envy you."
	done

PokefansVicCatSeenText:
	text "Cat: Our starters"
	line "are all grown up!"

	para "Vic: Aren't they"
	line "precious?"
	done

PokefansVicCatBeatenText:
	text "Vic: Our babies!"
	done

PokefansVicCatAfterBattleText:
	text "Cat: We raised"
	line "them from tiny"
	cont "little things."
	done

Route14_MapEvents:
	db 0, 0 ; filler

	def_warp_events

	def_coord_events

	def_bg_events

	def_object_events
	object_event 11, 15, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerPokefanmCarter, -1
	object_event 11, 27, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBirdKeeperRoy, -1
	object_event 11, 16, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerPokefanmTrevor, -1
	object_event  7,  5, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 4, Kim, -1
