; Boss battles: a wild Pokémon with extra health bars. A script picks the boss
; with loadboss before startbattle; wBossID = BOSS_NONE is a normal battle.
; Balls bounce off while it has extra bars left; a boss with BOSS_AUTO_CATCH is
; caught when its last bar runs out. The player can't run unless the record has
; BOSS_CAN_FLEE, and the boss never flees.

BossInit::
; At the start of a battle. A wild boss gets wBossBarsLeft = wBossBarsTotal =
; its record's extra bars, plus one in Hard mode, and is free under the Nuzlocke
; rules (like a forced battle). A trainer battle or an unknown ID clears wBossID.
	ld a, [wOtherTrainerClass]
	and a
	jr nz, .no_boss
	ld a, [wBossID]
	and a
	ret z
	cp NUM_BOSSES
	jr nc, .no_boss
	call GetBossRecord
	ld b, [hl] ; BOSS_EXTRA_BARS
	ld a, [wHardMode]
	and a ; 0 = Hard
	jr nz, .got_bars
	inc b
.got_bars
	ld a, b
	ld [wBossBarsLeft], a
	ld [wBossBarsTotal], a
	ld a, NUZLOCKE_FORCED
	ld [wNuzlockeEncounter], a
	ret

.no_boss
	xor a
	ld [wBossID], a
	ret

GetBossRecord::
; hl = wBossID's entry in BossRecords
	ld a, [wBossID]
	dec a
	ld hl, BossRecords
	ld bc, BOSS_RECORD_SIZE
	rst AddNTimes
	ret

BossHUDPips::
; Wild battle HUD: one pip per extra bar the boss has left, two to a tile, on
; the row under its name from column 2.
	ld a, [wBossID]
	and a
	ret z
	ld a, [wBossBarsLeft]
	hlcoord 2, 1
.loop
	and a
	ret z
	ld b, BOSS_PIP_TILE + 1 ; two pips
	sub BOSS_PIPS_PER_TILE
	jr nc, .got_tile
	dec b ; one pip
	xor a
.got_tile
	ld [hl], b
	inc hl
	jr .loop

BossBarBreak::
; The enemy's mon is at 0 HP. A boss with an extra bar left takes it instead of
; fainting: its HP refills, its status and harmful volatile effects end (unless
; its record has BOSS_KEEP_STATUS) and its stat stages stay. On its last bar, a
; BOSS_AUTO_CATCH boss is caught instead (wBattleEnded is set).
; Returns carry if it took a new bar or was caught.
	ld a, [wBossID]
	and a
	ret z
	ld a, [wBossBarsLeft]
	and a
	jr z, .last_bar
	dec a
	ld [wBossBarsLeft], a
	call GetBossRecord
	inc hl ; BOSS_FLAGS
	bit BOSS_KEEP_STATUS_F, [hl]
	call z, BossClearStatus

	ld a, $f
	ld [wCryTracks], a
	ld a, [wEnemyMonSpecies]
	call PlayStereoCry

; the HP bar fills from 0 to max HP (wCurHPAnim* are little-endian)
	ld hl, wEnemyMonMaxHP
	ld a, [hli]
	ld [wEnemyMonHP], a
	ld [wCurHPAnimMaxHP + 1], a
	ld [wCurHPAnimNewHP + 1], a
	ld a, [hl]
	ld [wEnemyMonHP + 1], a
	ld [wCurHPAnimMaxHP], a
	ld [wCurHPAnimNewHP], a
	xor a
	ld [wCurHPAnimOldHP], a
	ld [wCurHPAnimOldHP + 1], a
	ld a, 1 ; the enemy's area
	farcall AnimateAreaHPBar
	farcall UpdateEnemyHUD
	ld a, 1
	ldh [hBGMapMode], a
	call WaitSFX

	ld hl, BossNewBarText
	call BattleTextbox
	call BossPhase
	scf
	ret

.last_bar
	call GetBossRecord
	inc hl ; BOSS_FLAGS
	bit BOSS_AUTO_CATCH_F, [hl]
	ret z ; carry is clear
	jmp BossAutoCatch

BossPhase:
; The phase for the bar just broken: entry BOSS_EXTRA_BARS - wBossBarsLeft - 1
; of the record's phase table. Hard mode's added bar breaks first, with none.
	call GetBossRecord
	ld a, [wBossBarsLeft]
	ld b, a
	ld a, [hli] ; BOSS_EXTRA_BARS
	sub b
	ret c
	ret z
	dec a
	inc hl
	inc hl
	inc hl ; BOSS_PHASES
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld h, d
	ld l, e
	ld c, a
	ld a, h
	or l
	ret z
	ld b, 0
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	or h
	ret z
	jr BossRunCommandsAsEnemy

BossAura::
; At the start of a boss battle, after the wild Pokémon's entrance ability.
; Unless the record has BOSS_CAN_FLEE, a normal or held-item battle becomes a
; BATTLETYPE_TRAP one (no running, Teleport, Roar or Whirlwind; the other
; battle types the bosses use already block them). Then "X's aura flared!" and
; the record's aura commands.
	ld a, [wBossID]
	and a
	ret z
	call GetBossRecord
	inc hl ; BOSS_FLAGS
	bit BOSS_CAN_FLEE_F, [hl]
	jr nz, .aura
	ld a, [wBattleType]
	assert BATTLETYPE_NORMAL == 0
	and a
	jr z, .trap
	cp BATTLETYPE_FORCEITEM
	jr nz, .aura
.trap
	ld a, BATTLETYPE_TRAP
	ld [wBattleType], a
.aura
	call GetBossRecord
	inc hl
	inc hl ; BOSS_AURA
	ld a, [hli]
	ld h, [hl]
	ld l, a
	or h
	ret z
	push hl
	ld de, SFX_SHINE
	call PlaySFX
	ld hl, BossAuraText
	call BattleTextbox
	call WaitSFX
	pop hl
BossRunCommandsAsEnemy:
; BossRunCommands on the enemy's turn (stat changes are the boss's own).
	ldh a, [hBattleTurn]
	push af
	ld a, 1
	ldh [hBattleTurn], a
	call BossRunCommands
	pop af
	ldh [hBattleTurn], a
	ret

BossRunCommands:
; Run the BOSSCMD_* list at hl.
	ld a, [hli]
	and a ; BOSSCMD_END
	ret z
	push hl
	ld hl, .commands
	dec a
	add a
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld b, h
	ld c, l
	pop hl
	push bc
	ret ; jump to the command with hl = its arguments; it returns hl after them

.commands
	assert BOSSCMD_STAT == 1
	dw .Stat
	dw .Weather
	dw .Text

.Stat:
	ld a, [hli]
	ld b, a ; stat
	ld a, [hli]
	ld c, a ; stages
	push hl
.stat_loop
	ld a, c
	and a
	jr z, .stat_done
	push bc
	cp 2
	jr c, .raise
	set 4, b ; two stages
.raise
	farcall HeldItemRaiseStat
	pop bc
	ld a, c
	sub 2
	jr nc, .next
	xor a
.next
	ld c, a
	jr .stat_loop
.stat_done
	pop hl
	jr BossRunCommands

.Weather:
	ld a, [hli]
	ld b, a ; weather
	ld a, [hli]
	ld c, a ; turns
	push hl
	call .SetWeather
	pop hl
	jr BossRunCommands

.SetWeather:
	push bc
	farcall AirLockOnField
	pop bc
	ret c ; Air Lock: no weather changes
	ld a, b
	and a ; WEATHER_NONE
	jr z, .clear
; the same weather lasting until replaced (map weather) isn't shortened
	ld hl, wBattleWeather
	cp [hl]
	jr nz, .start
	ld a, [wWeatherCount]
	inc a
	ret z
	ld a, b
.start
	ld [wBattleWeather], a
	ld a, c
	ld [wWeatherCount], a
	ld a, b
	dec a
	add a
	ld c, a
	ld b, 0
	ld hl, .weather_texts
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jmp StdBattleTextbox

.clear
	ld a, [wBattleWeather]
	and a
	ret z
	xor a
	ld [wBattleWeather], a
	ld [wWeatherCount], a
	ld hl, BossWeatherClearedText
	jmp BattleTextbox

.weather_texts
	assert WEATHER_RAIN == 1 && WEATHER_SUN == 2 && WEATHER_SANDSTORM == 3 && WEATHER_HAIL == 4
	dw DownpourText
	dw SunGotBrightText
	dw SandstormBrewedText
	dw ItStartedToHailText

.Text:
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	push hl
	ld h, d
	ld l, e
	call BattleTextbox
	pop hl
	jmp BossRunCommands

BossBallBounces::
; Carry, after a message, if a ball can't be used: a boss with extra bars left.
	ld a, [wBossID]
	and a
	ret z
	ld a, [wBossBarsLeft]
	and a
	ret z
	ld hl, BossBallBouncedText
	call PrintText
	scf
	ret

BossAutoCatch:
; The boss's last bar ran out: it's left at 1 HP and caught in a Poké Ball, as
; if one was thrown (the ball isn't taken from the Pack). With no room in the
; party or the box, it faints as usual (carry clear).
	ld a, [wPartyCount]
	cp PARTY_LENGTH
	jr c, .room
	farcall NewStorageBoxPointer
	jr nc, .room
	and a
	ret

.room
	xor a
	ld [wEnemyMonHP], a
	inc a
	ld [wEnemyMonHP + 1], a
	ld hl, BossExhaustedText
	call BattleTextbox

	ld hl, POKE_BALL
	call GetItemIDFromIndex
	ld [wCurItem], a
	ld [wBattleAnimParam], a
	ld a, [wEnemyMonSpecies]
	ld [wWildMon], a
	ld de, ANIM_THROW_POKE_BALL
	ld a, e
	ld [wFXAnimID], a
	ld a, d
	ld [wFXAnimID + 1], a
	xor a
	ldh [hBattleTurn], a
	ld [wThrownBallWobbleCount], a
	ld [wNumHits], a
	predef PlayBattleAnim

; PokeBallEffect's caught sequence (Pokédex, nickname, party or box); as a
; BATTLETYPE_DEBUG battle it returns without tossing the ball
	ld a, [wBattleType]
	push af
	ld a, BATTLETYPE_DEBUG
	ld [wBattleType], a
	farcall PokeBallEffect.caught
	pop af
	ld [wBattleType], a

; the battle ends as after a catch (BattleMenu_Pack)
	call ClearBGPalettes
	call ClearTilemap
	xor a
	ld [wWildMon], a
	ld a, [wBattleResult]
	and BATTLERESULT_BITMASK
	ld [wBattleResult], a ; WIN
	call ClearWindowData
	call SetDefaultBGPAndOBP
	ld a, 1
	ld [wBattleEnded], a
	scf
	ret

BossClearStatus:
	xor a
	ld [wEnemyMonStatus], a
	ld [wEnemyConfuseCount], a
	ld [wEnemyToxicCount], a
	ld [wEnemyEncoreCount], a
	ld [wEnemyPerishCount], a
	ld [wEnemyDisableCount], a
	ld [wEnemyDisabledMove], a
	ld [wPlayerWrapCount], a ; the player's Wrap on it
	ld hl, wEnemySubStatus1
	ld a, [hl]
	and ~(1 << SUBSTATUS_NIGHTMARE | 1 << SUBSTATUS_CURSE | 1 << SUBSTATUS_IDENTIFIED | 1 << SUBSTATUS_PERISH | 1 << SUBSTATUS_IN_LOVE)
	ld [hli], a
	ld a, [hl]
	and ~(SUBSTATUS_TAUNT_MASK | SUBSTATUS_YAWN_MASK)
	ld [hli], a
	ld a, [hl]
	and ~(1 << SUBSTATUS_FLINCHED | 1 << SUBSTATUS_CONFUSED)
	ld [hli], a
	ld a, [hl]
	and ~(1 << SUBSTATUS_BINDING_BAND | 1 << SUBSTATUS_LEECH_SEED)
	ld [hli], a
	ld a, [hl]
	and ~(1 << SUBSTATUS_TOXIC | 1 << SUBSTATUS_ENCORED | 1 << SUBSTATUS_LOCK_ON | 1 << SUBSTATUS_DESTINY_BOND | 1 << SUBSTATUS_CANT_RUN)
	ld [hl], a
	assert wEnemySubStatus5 == wEnemySubStatus1 + 4
; the stats without burn or paralysis: CalcEnemyStats applies status to the
; side opposite hBattleTurn after switching turns, so it starts on the enemy's
	ldh a, [hBattleTurn]
	push af
	ld a, 1
	ldh [hBattleTurn], a
	farcall CalcEnemyStats
	pop af
	ldh [hBattleTurn], a
	ret

BossAuraText:
	text "Wild @"
	text_ram wEnemyMonNickname
	text "'s"
	line "aura flared!"
	prompt

BossWeatherClearedText:
	text "The weather"
	line "cleared up!"
	prompt

BossBallBouncedText:
	text "The ball bounced"
	line "off its aura!"
	prompt

BossExhaustedText:
	text "Wild @"
	text_ram wEnemyMonNickname
	text_start
	line "is exhausted!"
	prompt

BossNewBarText:
	text "Wild @"
	text_ram wEnemyMonNickname
	text_start
	line "is still standing!"
	prompt

BossPipsGFX:
INCBIN "gfx/battle/boss_pips.2bpp"
