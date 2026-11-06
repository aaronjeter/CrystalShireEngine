Script_BattleWhiteout::
	callasm BattleBGMap
	sjump Script_Whiteout

OverworldWhiteoutScript::
	reanchormap
	callasm OverworldBGMap

Script_Whiteout:
	writetext .WhitedOutText
	waitbutton
	special FadeOutToWhite
	pause 40
	special HealParty
	checkflag ENGINE_BUG_CONTEST_TIMER
	iftrue .bug_contest
	callasm HalveMoney
	callasm GetWhiteoutSpawn
	farscall Script_AbortBugContest
	special WarpToSpawnPoint
	newloadmap MAPSETUP_WARP
	endall

.bug_contest
	jumpstd BugContestResultsWarpScript

.WhitedOutText:
	text_far _WhitedOutText
	text_end

OverworldBGMap:
	farcall FadeOutToWhite
	xor a
	ldh [hMapAnims], a
	call ClearTilemap
	call ClearSprites
	ld a, CGB_PLAIN
	call GetSGBLayout
	jmp SetDefaultBGPAndOBP

BattleBGMap:
; LostBattle has already turned the battle screen gray. Not again here: the battle has ended
; (hDoublesScreen is clear), so the layout would be the singles one, and a double battle's
; pics in VRAM bank 1 (E2's, P2's) would show as the font's tiles. Only the text box's
; rows get the text palette: this text box starts a row higher than a double battle's,
; over P2's pic.
	hlcoord 0, TEXTBOX_Y, wAttrmap
	ld bc, (SCREEN_HEIGHT - TEXTBOX_Y) * SCREEN_WIDTH
	ld a, PAL_BATTLE_BG_TEXT
	rst ByteFill
	call CopyTilemapAtOnce
	jmp SetDefaultBGPAndOBP

HalveMoney:
; Halve the player's money.
	ld hl, wMoney
	ld a, [hl]
	srl a
	ld [hli], a
	ld a, [hl]
	rra
	ld [hli], a
	ld a, [hl]
	rra
	ld [hl], a
	ret

GetWhiteoutSpawn:
	ld a, [wLastSpawnMapGroup]
	ld d, a
	ld a, [wLastSpawnMapNumber]
	ld e, a
	farcall IsSpawnPoint
	ld a, c
	jr c, .yes
	xor a ; SPAWN_HOME

.yes
	ld [wDefaultSpawnpoint], a
	ret
