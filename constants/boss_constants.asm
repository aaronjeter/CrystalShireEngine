; Boss battles (engine/battle/boss.asm, data/battle/bosses.asm)

DEF BOSS_MAX_EXTRA_BARS EQU 3 ; in a boss record; Hard mode adds one more

DEF BOSS_PIP_TILE EQU $5e ; 2 battle BG tiles: one pip, two pips (LoadHPBar)
DEF BOSS_PIPS_PER_TILE EQU 2

; wBossID values; BOSS_NONE is a normal battle
	const_def
	const BOSS_NONE
	const BOSS_RED_GYARADOS
	const BOSS_UNOWN_X
	const BOSS_ARTICUNO
	const BOSS_ZAPDOS
	const BOSS_MOLTRES
	const BOSS_REGIROCK
	const BOSS_REGICE
	const BOSS_REGISTEEL
	const BOSS_MEWTWO
	const BOSS_KYOGRE
	const BOSS_GROUDON
	const BOSS_RAYQUAZA
	const BOSS_HO_OH
	const BOSS_LUGIA
DEF NUM_BOSSES EQU const_value

; boss record flags
	const_def
	const BOSS_AUTO_CATCH_F  ; caught when its last bar runs out
	const BOSS_CAN_FLEE_F    ; the player may run
	const BOSS_KEEP_STATUS_F ; status and volatile effects stay on a new bar
DEF BOSS_AUTO_CATCH  EQU 1 << BOSS_AUTO_CATCH_F
DEF BOSS_CAN_FLEE    EQU 1 << BOSS_CAN_FLEE_F
DEF BOSS_KEEP_STATUS EQU 1 << BOSS_KEEP_STATUS_F

; aura and phase commands (BossRunCommands)
	const_def
	const BOSSCMD_END     ; boss_end
	const BOSSCMD_STAT    ; boss_stat STAT, stages (1-6)
	const BOSSCMD_WEATHER ; boss_weather WEATHER_*, turns (255: until replaced); WEATHER_NONE clears it
	const BOSSCMD_TEXT    ; boss_text TextLabel (in the "Boss Battles" section)

; boss record layout (BossRecords)
rsreset
DEF BOSS_EXTRA_BARS rb ; extra health bars (1 to BOSS_MAX_EXTRA_BARS)
DEF BOSS_FLAGS      rb ; BOSS_* flags
DEF BOSS_AURA       rw ; aura entry, or 0
DEF BOSS_PHASES     rw ; phase table (one command list or 0 per extra bar, in break order), or 0
DEF BOSS_RECORD_SIZE EQU _RS
