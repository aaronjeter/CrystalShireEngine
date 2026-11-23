	object_const_def
	const SAFARISECRET_EXECUTIVE
	const SAFARISECRET_WARDEN

SafariHouseSecret_MapScripts:
	def_scene_scripts

	def_callbacks	

SafariRocketBoss:
	trainer EXECUTIVEF, SAFARI_EXECUTIVEF, EVENT_BEAT_SAFARI_ROCKETS, SafariRocketBossSeenText,SafariRocketBossBeatenText, 0, .Script

.Script:
	opentrainerdialog
	writetext SafariRocketBossAfterBattleText
	waitbutton
	closedialog
	special FadeOutToBlack
	disappear SAFARISECRET_EXECUTIVE
	special FadeInFromBlack
	setevent EVENT_BEAT_SAFARI_ROCKETS
	end

SafariRocketBossSeenText:
	text "So you're the pest"
	line "my grunts keep"
	cont "crying about."

	para "I'm Petra. Team"
	line "Rocket's business"
	cont "in Kanto is mine."

	para "While Silph Co."
	line "chases its loose"
	cont "Porygon, this park"
	cont "and its #mon"
	cont "belong to us."

	para "No one is coming"
	line "to save you."
	done

SafariRocketBossBeatenText:
	text "...Impossible."
	done

SafariRocketBossAfterBattleText:
	text "The Power Plant"
	line "job should have"
	cont "left Saffron in"
	cont "the dark."

	para "When that failed,"
	line "I opened Silph's"
	cont "labs myself."

	para "Their Porygon kept"
	line "Sabrina and Green"
	cont "busy, just as I"
	cont "planned..."

	para "Only you got in"
	line "the way."

	para "Giovanni will"
	line "hear of you."
	done

SafariWarden:
	faceplayer
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
	line "of a Mythical"
	cont "#mon somewhere"
	cont "in the park."

	para "Perhaps with the"
	line "Rockets gone, "
	line "it'll come out."
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

	para "That Petra woman"
	line "had this in her"
	cont "pocket..."

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
	