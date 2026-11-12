	object_const_def
	const BATTLERESORTTOWER_RECEPTIONIST
	const BATTLERESORTTOWER_COSMETICS
	const BATTLERESORTTOWER_CLERK1
	const BATTLERESORTTOWER_CLERK2
	const BATTLERESORTTOWER_CLERK3
	const BATTLERESORTTOWER_CLERK4
	const BATTLERESORTTOWER_GENTLEMAN
	const BATTLERESORTTOWER_COOLTRAINER

BattleResortTower_MapScripts:
	def_scene_scripts

	def_callbacks

BattleResortTowerReceptionistScript:
; The elite challenge facility (FACILITY_ELITE): doubles, 4 Pokémon locked for
; a streak, sets of 7 battles in the battle room
	faceplayer
	opentext
	checkevent EVENT_FACILITY_HARD_KANTO
	iffalse .Locked
	checkevent EVENT_FACILITY_HARD_JOHTO
	iffalse .Locked
	checkevent EVENT_FACILITY_HARD_HOENN
	iffalse .Locked
	special TowerCheck
	ifequal TOWER_RESUME, .Resume
	ifequal TOWER_NO_STREAK, .NewStreak
	writetext BattleResortTowerInterruptedText
	waitbutton
.NewStreak:
	writetext BattleResortTowerIntroText
	yesorno
	iffalse .Declined
	setval FACILITY_ELITE
	special FacilitySetup
	ifless FACILITY_TEAM_SIZE, .NotEnough
	scall .PrizeRoom
	iffalse .PackFull
	writetext BattleResortTowerChooseText
	waitbutton
	special FacilityChooseTeam
	iffalse .Declined
	writetext BattleResortTowerSaveText
	yesorno
	iffalse .Declined
	special TowerBeginStreak
	special TowerStartSet
	special TowerSaveGame
	iffalse .NotSavedNew
	sjump .GoUp

.Resume:
	writetext BattleResortTowerResumeText
	yesorno
	iffalse .AskRetire
	setval FACILITY_ELITE
	special FacilitySetup
	special TowerResumeTeam
	iffalse .TeamMissing
	scall .PrizeRoom
	iffalse .PackFull
	writetext BattleResortTowerSaveText
	yesorno
	iffalse .Declined
	special TowerStartSet
	special TowerSaveGame
	iffalse .NotSaved
.GoUp:
	writetext BattleResortTowerGoText
	waitbutton
	closetext
	special FacilityStartRun
	setmapscene BATTLE_RESORT_TOWER_ROOM, SCENE_BATTLERESORTTOWERROOM_BATTLES
	playsound SFX_ELEVATOR_END
	warp BATTLE_RESORT_TOWER_ROOM, 3, 7
	end

.AskRetire:
	writetext BattleResortTowerRetireText
	yesorno
	iffalse .Declined
	special TowerEndStreak
	writetext BattleResortTowerRetiredText
	waitbutton
	closetext
	end

.PrizeRoom:
; wScriptVar = FALSE if the Pack has no room for a first-time prize the next
; set can give
	special TowerPrizeDue
	ifequal 1, .ItemRoom
	ifequal 2, .BallRoom
	setval TRUE
	end

.ItemRoom:
	giveitem LEFTOVERS
	iffalse .NoRoom
	takeitem LEFTOVERS
	setval TRUE
	end

.BallRoom:
	giveitem MASTER_BALL
	iffalse .NoRoom
	takeitem MASTER_BALL
	setval TRUE
	end

.NoRoom:
	setval FALSE
	end

.NotSavedNew:
	special TowerEndStreak
	sjump .Declined

.NotSaved:
	special TowerRest
.Declined:
	writetext BattleResortTowerDeclinedText
	waitbutton
	closetext
	end

.Locked:
	writetext BattleResortTowerLockedText
	waitbutton
	closetext
	end

.NotEnough:
	writetext BattleResortTowerNotEnoughText
	waitbutton
	closetext
	end

.PackFull:
	writetext BattleResortTowerPackFullText
	waitbutton
	closetext
	end

.TeamMissing:
	writetext BattleResortTowerTeamMissingText
	waitbutton
	closetext
	end

BattleResortTowerCosmeticsScript:
	faceplayer
	opentext
	writetext BattleResortTowerCosmeticsText
	waitbutton
	setval BPSHOP_COSMETIC
	special BPShop
	sjump BattleResortTowerClerkBye

BattleResortTowerClerk1Script:
	setval BPSHOP_TIER1
	sjump BattleResortTowerClerk

BattleResortTowerClerk2Script:
	setval BPSHOP_TIER2
	sjump BattleResortTowerClerk

BattleResortTowerClerk3Script:
	setval BPSHOP_TIER3
	sjump BattleResortTowerClerk

BattleResortTowerClerk4Script:
	setval BPSHOP_TIER4
BattleResortTowerClerk:
	faceplayer
	opentext
	writetext BattleResortTowerClerkText
	waitbutton
	special BPShop
BattleResortTowerClerkBye:
	writetext BattleResortTowerClerkByeText
	waitbutton
	closetext
	end

BattleResortTowerGentlemanScript:
	faceplayer
	opentext
	special TowerShowBest
	writetext BattleResortTowerGentlemanText
	waitbutton
	closetext
	end

BattleResortTowerCooltrainerScript:
	jumptextfaceplayer BattleResortTowerCooltrainerText

BattleResortTowerLockedText:
	text "Welcome to the"
	line "Battle Tower!"

	para "Only trainers who"
	line "have cleared every"
	cont "region's hardest"
	cont "Challenge Hall"
	cont "may enter."

	para "Please come back"
	line "after clearing the"
	cont "halls in Saffron,"
	cont "Route 40 and"
	cont "Lilycove!"
	done

BattleResortTowerInterruptedText:
	text "Your last set"
	line "wasn't finished,"
	cont "so your streak"
	cont "ended at @"
	text_decimal wTowerNumber, 2, 4
	text "."
	done

BattleResortTowerIntroText:
	text "Welcome to the"
	line "Battle Tower!"

	para "Enter 4 #mon"
	line "and battle sets of"
	cont "7 top trainers in"
	cont "double battles."

	para "Your team stays"
	line "the same for your"
	cont "whole streak."

	para "Win a set to earn"
	line "BP, and keep your"
	cont "streak going for"
	cont "special prizes!"

	para "Will you take the"
	line "challenge?"
	done

BattleResortTowerChooseText:
	text "Pick your 4"
	line "#mon in the"
	cont "order they should"
	cont "go."
	done

BattleResortTowerResumeText:
	text "Welcome back! Your"
	line "streak is @"
	text_decimal wTowerNumber, 2, 4
	text " wins."

	para "Will you continue"
	line "with the same"
	cont "team?"
	done

BattleResortTowerRetireText:
	text "Do you want to"
	line "end your streak"
	cont "instead?"
	done

BattleResortTowerRetiredText:
	text "Your streak ended"
	line "at @"
	text_decimal wTowerNumber, 2, 4
	text " wins."

	para "Come back for a"
	line "new one any time!"
	done

BattleResortTowerSaveText:
	text "Before you go up,"
	line "I'll save your"
	cont "game. OK?"
	done

BattleResortTowerGoText:
	text "No Pack items, no"
	line "Exp. Your team is"
	cont "healed after each"
	cont "battle."

	para "If a set isn't"
	line "finished, your"
	cont "streak ends."

	para "Right this way!"
	done

BattleResortTowerDeclinedText:
	text "Come back when"
	line "you're ready!"
	done

BattleResortTowerNotEnoughText:
	text "You'll need at"
	line "least 4 #mon"
	cont "that aren't Eggs."
	done

BattleResortTowerPackFullText:
	text "Your Pack is too"
	line "full for this"
	cont "set's prize."

	para "Please make some"
	line "room first!"
	done

BattleResortTowerTeamMissingText:
	text "Your streak's team"
	line "isn't all in your"
	cont "party."

	para "Please bring the"
	line "same 4 #mon!"
	done

BattleResortTowerCosmeticsText:
	text "I trade BP for"
	line "items that change"
	cont "a #mon's look!"
	done

BattleResortTowerClerkText:
	text "This is the BP"
	line "counter. Trade"
	cont "your BP for"
	cont "prizes!"
	done

BattleResortTowerClerkByeText:
	text "Come again!"
	done

BattleResortTowerGentlemanText:
	text "Your best Battle"
	line "Tower streak is"
	cont "@"
	text_decimal wTowerNumber, 2, 4
	text " wins."

	para "Keep at it!"
	done

BattleResortTowerCooltrainerText:
	text "They say the"
	line "Tower's head waits"
	cont "at the 49th"
	cont "battle!"
	done

BattleResortTower_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 13, 11, BATTLE_RESORT, 11
	warp_event 14, 11, BATTLE_RESORT, 13

	def_coord_events

	def_bg_events

	def_object_events
	object_event  9,  6, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BattleResortTowerReceptionistScript, -1
	object_event 11,  5, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BattleResortTowerCosmeticsScript, -1
	object_event 20,  5, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BattleResortTowerClerk1Script, -1
	object_event 22,  5, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BattleResortTowerClerk2Script, -1
	object_event 24,  5, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BattleResortTowerClerk3Script, -1
	object_event 26,  5, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BattleResortTowerClerk4Script, -1
	object_event  4,  9, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BattleResortTowerGentlemanScript, -1
	object_event 27,  9, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BattleResortTowerCooltrainerScript, -1
