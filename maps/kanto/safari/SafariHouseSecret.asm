	object_const_def
	const SAFARISECRET_EXECUTIVE
	const SAFARISECRET_WARDEN

SafariHouseSecret_MapScripts:
	def_scene_scripts

	def_callbacks	

SafariRocketBoss:
	trainer EXECUTIVEF, SAFARI_EXECUTIVEF, EVENT_BEAT_SAFARI_ROCKETS, SafariRocketBossSeenText,SafariRocketBossBeatenText, 0, .Script

.Script:
	opentext
	writetext SafariRocketBossAfterBattleText
	waitbutton
	closetext
	special FadeOutToBlack
	disappear SAFARISECRET_EXECUTIVE
	special FadeInFromBlack
	setevent EVENT_BEAT_SAFARI_ROCKETS
	end

SafariRocketBossSeenText:
	text "Interloper..."

	para "You're the one"
	line "my colleagues"
	cont "spoke of..."

	para "Team Rocket will"
	line "rise again."

	para "Our captures here"
	line "will ensure it."

	para "..."

	para "No mercy to those"
	line "in our way."
	done

SafariRocketBossBeatenText:
	text "..."

	para "How...?"
	done

SafariRocketBossAfterBattleText:
	text "Then I have"
	line "failed.."

	para "Giovanni will"
	line "understand."

	para "This enterprise"
	line "is not without"
	cont "its risks..."

	para "Until next time"
	line "then."
	done

SafariWarden:
	faceplayer
	clearevent EVENT_SAFARI_WEST_FAKE_MEW
	clearevent EVENT_SAFARI_EAST_FAKE_MEW
	clearevent EVENT_SAFARI_SOUTH_FAKE_MEW
	clearevent EVENT_CAUGHT_SAFARI_MEW
	opentext

	checkevent GOT_REWARDS_FROM_SAFARI_WARDEN
	iffalse .giveRewards

	
	writetext SafariWardenRarePokemonText
	waitbutton
	sjump .done

.giveRewards
	writetext SafariWardenThanksText
	waitbutton
	writetext SafariWardenGivesRewardsText
	waitbutton
	verbosegiveitem HM_SURF	
	verbosegiveitem KANTOITE_X
	setevent GOT_REWARDS_FROM_SAFARI_WARDEN

.done
	closetext
	end


SafariWardenRarePokemonText:
	text "I've heard rumors"
	line "of a Mythic"

	para "#mon"
	line "somewhere in"
	cont "the park."

	para "Perhaps with"
	line "the Rockets"

	para "gone, it'll"
	line "come back"
	cont "out."
	done

SafariWardenThanksText:
	text "Whew..."

	para "I'm glad that's"
	line "over."

	para "Thank you for"
	line "your assistance."
	done

SafariWardenGivesRewardsText:
	text "Here, you deserve"
	line "a reward."

	para "Even better, I"
	line "can give you two!"

	para "First, the HM for"
	line "Surf: HM03"

	para "This will help"
	line "you cross vast"
	cont "waters."

	para "Secondly..."

	para "That Rocket"
	line "executive had"
	
	para "this in her"
	line "pocket..."

	para "..."

	para "Never should"
	line "have turned her"

	para "back on a"
	line "'harmless' old"
	cont "man. Ha!"
	done


SafariHouseSecret_MapEvents:
	db 0, 0 ; filler

	def_warp_events	

	warp_event  04, 07, SAFARI_ZONE_WEST, 8
	warp_event  05, 07, SAFARI_ZONE_WEST, 8

	def_coord_events

	def_bg_events	

	def_object_events
	object_event  04, 04, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLACK, OBJECTTYPE_TRAINER, 3, SafariRocketBoss, EVENT_BEAT_SAFARI_ROCKETS
	object_event  00, 06, SPRITE_ELDER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, SafariWarden, -1
	