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
; trainers' bosses (boss_mon in their parties)
	const BOSS_TD_SILVER    ; Ursaluna (title defense)
	const BOSS_TD_GREEN     ; Mega Blastoise (title defense)
	const BOSS_TD_WALLY     ; Mega Gardevoir (title defense)
	const BOSS_LANCE        ; Mega Dragonite (League rematch, title defense)
	const BOSS_AGATHA       ; Mega Gengar (League rematch, title defense)
	const BOSS_STEVEN       ; Mega Metagross (League rematch, title defense)
	const BOSS_TD_TATE_LIZA ; Mega Chimecho (title defense)
	const BOSS_TD_KIMONO    ; Sylveon (title defense)
	const BOSS_TD_TWINS     ; Ledian (title defense)
	const BOSS_TD_ACE_DUO   ; Tyranitar (title defense)
	const BOSS_RED          ; Pikachu (Mt. Silver, title defense)
	const BOSS_ARCHER       ; Mega Houndoom (Radio Tower)
	const BOSS_JANE         ; Latias (Desert Shrine)
	const BOSS_ENTEI        ; Entei (Mt. Mortar, the old Moltres Lair)
	const BOSS_TOWER_HEAD   ; Mew (Battle Tower head)
	const BOSS_TD_GIOVANNI  ; Mewtwo (title defense)
	const BOSS_PETRA        ; Absol-X (Safari Zone)
	const BOSS_SILPH_PORYGONZ ; Porygon-Z (Silph Co. 1F)
	const BOSS_TD_MARINA ; Marina's Froslassx (title defense)
	const BOSS_TD_JESS ; Jess's Annihilape (title defense)
	const BOSS_TD_RONALD ; Ronald's Aninetales (title defense)
	const BOSS_TD_KLUTCH ; Klutch's Gyaradosx (title defense)
	const BOSS_TD_AMAYA ; Amaya's Metagrossx (title defense)
	const BOSS_TD_DALORIC ; Daloric's Tyranitarx (title defense)
	const BOSS_TD_CRYSTAL ; Crystal's Noctowl2 (title defense)
	const BOSS_TD_ROSSOLON ; Rossolon's Salamencex (title defense)
	const BOSS_TD_BARTO ; Barto's Azumarill (title defense)
	const BOSS_TD_CHAOS ; Chaos's Mars (title defense)
	const BOSS_TD_EMMY ; Emmy's Gardevoirx (title defense)
	const BOSS_TD_DAVE ; Dave's Alakazamx (title defense)
	const BOSS_TD_ACCAD ; Accad's Kinglerx (title defense)
	const BOSS_TD_JEFF ; Jeff's Akueria (title defense)
	const BOSS_TD_KYLE ; Kyle's Snorlax (title defense)
	const BOSS_TD_AARON ; Aaron's Ironbundle (title defense)
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
DEF BOSS_AI         rb ; WILDAI_* move-choice profile (engine/battle/ai/wild_ai.asm)
DEF BOSS_RECORD_SIZE EQU _RS
