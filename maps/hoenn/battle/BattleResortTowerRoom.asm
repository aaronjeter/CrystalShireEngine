	object_const_def
	const BATTLERESORTTOWERROOM_OPPONENT
	const BATTLERESORTTOWERROOM_ATTENDANT

BattleResortTowerRoom_MapScripts:
	def_scene_scripts
	scene_script BattleResortTowerRoomBattlesScene, SCENE_BATTLERESORTTOWERROOM_BATTLES
	scene_script BattleResortTowerRoomNoopScene,    SCENE_BATTLERESORTTOWERROOM_NOOP

	def_callbacks
	callback MAPCALLBACK_OBJECTS, BattleResortTowerRoomOpponentCallback

BattleResortTowerRoomOpponentCallback:
	setevent EVENT_BATTLE_RESORT_TOWER_OPPONENT
	endcallback

BattleResortTowerRoomBattlesScene:
	sdefer BattleResortTowerRoomBattlesScript
	setscene SCENE_BATTLERESORTTOWERROOM_NOOP
BattleResortTowerRoomNoopScene:
	end

BattleResortTowerRoomBattlesScript:
; A set of TOWER_SET_LENGTH battles (after the lobby's TowerStartSet and
; FacilityStartRun)
	applymovement PLAYER, BattleResortTowerRoomPlayerWalksInMovement
.Battle:
	special TowerPickTrainer
	iftrue .Head
	special LoadUsedSpritesGFX
	appear BATTLERESORTTOWERROOM_OPPONENT
	applymovement BATTLERESORTTOWERROOM_OPPONENT, BattleResortTowerRoomOpponentWalksInMovement
	opentext
	writetext BattleResortTowerRoomOpponentText
	waitbutton
	closetext
	special TowerLoadTrainer
	winlosstext BattleResortTowerRoomOpponentBeatenText, BattleResortTowerRoomOpponentWonText
	sjump .Fight

.Head:
	special LoadUsedSpritesGFX
	appear BATTLERESORTTOWERROOM_OPPONENT
	applymovement BATTLERESORTTOWERROOM_OPPONENT, BattleResortTowerRoomOpponentWalksInMovement
	opentext
	writetext BattleResortTowerRoomHeadText
	waitbutton
	closetext
	special TowerLoadTrainer
	winlosstext BattleResortTowerRoomHeadBeatenText, BattleResortTowerRoomHeadWonText
.Fight:
	setlasttalked BATTLERESORTTOWERROOM_OPPONENT
	startbattle
	reloadmap
	iftrue .Lost
	special TowerWon
	iffalse .SetWon
	applymovement BATTLERESORTTOWERROOM_OPPONENT, BattleResortTowerRoomOpponentWalksOutMovement
	disappear BATTLERESORTTOWERROOM_OPPONENT
	special HealParty
	opentext
	writetext BattleResortTowerRoomNextText
	waitbutton
	closetext
	sjump .Battle

.SetWon:
	applymovement BATTLERESORTTOWERROOM_OPPONENT, BattleResortTowerRoomOpponentWalksOutMovement
	disappear BATTLERESORTTOWERROOM_OPPONENT
	special HealParty
	opentext
	writetext BattleResortTowerRoomSetWonText
	promptbutton
	special TowerSetBP
	special GiveBattlePoints
	writetext BattleResortTowerRoomGotBPText
	playsound SFX_ITEM
	waitsfx
	promptbutton
	special TowerMilestone
	ifequal TOWER_MILESTONE_7_FIRST, .Prize7
	ifequal TOWER_MILESTONE_7, .Bonus7
	ifequal TOWER_MILESTONE_49_FIRST, .Prize49
	ifequal TOWER_MILESTONE_49, .Bonus49
	sjump .NextSet

.Prize7:
	writetext BattleResortTowerRoomPrize7Text
	promptbutton
	setval 5
	scall .GiveBP
.ChoosePrize:
	writetext BattleResortTowerRoomChoosePrizeText
	loadmenu .PrizeMenuHeader
	verticalmenu
	closewindow
	ifequal 1, .LifeOrb
	ifequal 2, .Leftovers
	ifequal 3, .Eviolite
	sjump .ChoosePrize

.LifeOrb:
	verbosegiveitem LIFE_ORB
	sjump .NextSet

.Leftovers:
	verbosegiveitem LEFTOVERS
	sjump .NextSet

.Eviolite:
	verbosegiveitem EVIOLITE
	sjump .NextSet

.Bonus7:
	setval 3
	scall .GiveBP
	sjump .NextSet

.Prize49:
	writetext BattleResortTowerRoomPrize49Text
	promptbutton
	setval 20
	scall .GiveBP
	verbosegiveitem MASTER_BALL
	sjump .NextSet

.Bonus49:
	setval 10
	scall .GiveBP
	sjump .NextSet

.GiveBP:
	special GiveBattlePoints
	writetext BattleResortTowerRoomBonusBPText
	playsound SFX_ITEM
	waitsfx
	promptbutton
	end

.NextSet:
	writetext BattleResortTowerRoomContinueText
	yesorno
	iffalse .AskRest
	closetext
	special TowerStartSet
	sjump .Battle

.AskRest:
	writetext BattleResortTowerRoomRestText
	yesorno
	iffalse .AskRetire
	special FacilityEndRun
	special TowerRest
	special TowerSaveGame
	writetext BattleResortTowerRoomRestedText
	waitbutton
	sjump .Leave

.AskRetire:
	writetext BattleResortTowerRoomRetireText
	yesorno
	iffalse .NextSet
	special TowerEndStreak
	special FacilityEndRun
	writetext BattleResortTowerRoomRetiredText
	waitbutton
	sjump .Leave

.Lost:
	special TowerEndStreak
	special FacilityEndRun
	opentext
	writetext BattleResortTowerRoomLostText
	waitbutton
.Leave:
	closetext
	playsound SFX_ELEVATOR_END
	warp BATTLE_RESORT_TOWER, 9, 7
	end

.PrizeMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 4, 11, TEXTBOX_Y - 1
	dw .PrizeMenuData
	db 1 ; default option

.PrizeMenuData:
	db STATICMENU_CURSOR ; flags
	db 3 ; items
	db "Life Orb@"
	db "Leftovers@"
	db "Eviolite@"

BattleResortTowerRoomPlayerWalksInMovement:
	step UP
	step UP
	step UP
	step UP
	turn_head RIGHT
	step_end

BattleResortTowerRoomOpponentWalksInMovement:
	slow_step DOWN
	slow_step DOWN
	slow_step DOWN
	turn_head LEFT
	step_end

BattleResortTowerRoomOpponentWalksOutMovement:
	turn_head UP
	slow_step UP
	slow_step UP
	slow_step UP
	step_end

BattleResortTowerRoomOpponentText:
	text "Let's have a great"
	line "battle!"
	done

BattleResortTowerRoomOpponentBeatenText:
	text "You're the real"
	line "deal!"
	done

BattleResortTowerRoomOpponentWonText:
	text "That's the Battle"
	line "Tower for you!"
	done

BattleResortTowerRoomHeadText:
	text "So you've won 48"
	line "in a row."

	para "I run this Tower."
	line "Show me what your"
	cont "team can do!"
	done

BattleResortTowerRoomHeadBeatenText:
	text "Splendid! You've"
	line "earned this win."
	done

BattleResortTowerRoomHeadWonText:
	text "Not quite enough!"
	done

BattleResortTowerRoomNextText:
	text "Your team is"
	line "healed. Streak:"
	cont "@"
	text_decimal wTowerNumber, 2, 4
	text " wins."

	para "Here comes the"
	line "next trainer!"
	done

BattleResortTowerRoomSetWonText:
	text "Congratulations!"
	line "You won all 7!"

	para "Your streak is"
	line "@"
	text_decimal wTowerNumber, 2, 4
	text " wins."
	done

BattleResortTowerRoomGotBPText:
	text "<PLAYER>"
	line "received @"
	text_decimal wScriptVar, 1, 2
	text " BP!"
	done

BattleResortTowerRoomBonusBPText:
	text "<PLAYER> gets"
	line "a bonus of @"
	text_decimal wScriptVar, 1, 2
	text " BP!"
	done

BattleResortTowerRoomPrize7Text:
	text "And that's your"
	line "first 7-win"
	cont "streak! Here's a"
	cont "special prize."
	done

BattleResortTowerRoomChoosePrizeText:
	text "Which item would"
	line "you like?"
	done

BattleResortTowerRoomPrize49Text:
	text "You beat the"
	line "Tower's head! A"
	cont "49-win streak!"

	para "Please accept this"
	line "rare prize."
	done

BattleResortTowerRoomContinueText:
	text "Will you go on to"
	line "the next set?"
	done

BattleResortTowerRoomRestText:
	text "Would you like to"
	line "rest? Your streak"
	cont "and team are kept,"
	cont "and I'll save your"
	cont "game."
	done

BattleResortTowerRoomRestedText:
	text "Come back to keep"
	line "your streak going!"
	done

BattleResortTowerRoomRetireText:
	text "Do you want to"
	line "end your streak?"
	done

BattleResortTowerRoomRetiredText:
	text "Your streak ended"
	line "at @"
	text_decimal wTowerNumber, 2, 4
	text " wins."
	done

BattleResortTowerRoomLostText:
	text "Too bad! Your"
	line "streak ended at @"
	text_decimal wTowerNumber, 2, 4
	text "."

	para "Your team is back"
	line "as it was."
	done

BattleResortTowerRoom_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, BATTLE_RESORT_TOWER, 1
	warp_event  4,  7, BATTLE_RESORT_TOWER, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  4,  0, SPRITE_BATTLE_TOWER_OPPONENT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_BATTLE_RESORT_TOWER_OPPONENT
	object_event  1,  6, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
