MACRO title_challenger
; unlock kind, unlock flag or defense count, beaten flag, trainer class, party,
; sprite, partner sprite (0 = alone), BP per win, first-win item, quantity, list name
	db \1
	dw \2
	dw \3
	db \4, \5
	db \6, \7
	db \8
	shift 8
	dw \1
	db \2
	dw \3
ENDM

; TD_* order
TitleDefenseChallengers:
	table_width TITLE_CHALLENGER_LENGTH
	title_challenger TD_UNLOCK_FLAG,      EVENT_WORLD_CUP_CHAMPION,           EVENT_TITLE_DEFENSE_BEAT_SILVER,       RIVAL2,      RIVAL2_TD,    SPRITE_RIVAL,          0,                  TD_WIN_BP, ABILITY_CAPSULE, 1, .Silver
	title_challenger TD_UNLOCK_FLAG,      EVENT_WORLD_CUP_CHAMPION,           EVENT_TITLE_DEFENSE_BEAT_GREEN,        GREEN,       GREEN_TD,     SPRITE_GREEN,          0,                  TD_WIN_BP, EXPERT_BELT,     1, .Green
	title_challenger TD_UNLOCK_FLAG,      EVENT_WORLD_CUP_CHAMPION,           EVENT_TITLE_DEFENSE_BEAT_WALLY,        WALLY,       WALLY_TD,     SPRITE_BUGSY,          0,                  TD_WIN_BP, LUCKY_EGG,       1, .Wally
	title_challenger TD_UNLOCK_FLAG,      EVENT_BEAT_JOHTO_LEAGUE_REMATCH,    EVENT_TITLE_DEFENSE_BEAT_LANCE,        CHAMPION,    LANCE2,       SPRITE_LANCE,          0,                  TD_WIN_BP, LIFE_ORB,        1, .Lance
	title_challenger TD_UNLOCK_FLAG,      EVENT_BEAT_INDIGO_LEAGUE_REMATCH,   EVENT_TITLE_DEFENSE_BEAT_AGATHA,       AGATHA,      AGATHA2,      SPRITE_GRANNY,         0,                  TD_WIN_BP, FOCUS_SASH,      1, .Agatha
	title_challenger TD_UNLOCK_FLAG,      EVENT_BEAT_HOENN_LEAGUE_REMATCH,    EVENT_TITLE_DEFENSE_BEAT_STEVEN,       STEVEN,      STEVEN2,      SPRITE_LANCE,          0,                  TD_WIN_BP, ASSAULT_VEST,    1, .Steven
	title_challenger TD_UNLOCK_FLAG,      EVENT_WORLD_CUP_CHAMPION,           EVENT_TITLE_DEFENSE_BEAT_TATE_LIZA,    TATELIZA,    TATELIZA_TD,   SPRITE_FALKNER,        SPRITE_JANINE,      TD_WIN_BP, ABILITY_PATCH,   1, .TateLiza
	title_challenger TD_UNLOCK_FLAG,      EVENT_WORLD_CUP_CHAMPION,           EVENT_TITLE_DEFENSE_BEAT_KIMONO_GIRLS, KIMONO_GIRL, NAOKOANDZUKI, SPRITE_KIMONO_GIRL,    SPRITE_KIMONO_GIRL, TD_WIN_BP, SACRED_ASH,      1, .KimonoGirls
	title_challenger TD_UNLOCK_FLAG,      EVENT_WORLD_CUP_CHAMPION,           EVENT_TITLE_DEFENSE_BEAT_TWINS,        TWINS,       AMYANDMAY2,   SPRITE_TWIN,           SPRITE_TWIN,        TD_WIN_BP, RARE_CANDY,      3, .Twins
	title_challenger TD_UNLOCK_FLAG,      EVENT_WORLD_CUP_CHAMPION,           EVENT_TITLE_DEFENSE_BEAT_ACE_DUO,      ACE_DUO,     KAIANDRIN,    SPRITE_COOLTRAINER_M,  SPRITE_COOLTRAINER_F, TD_WIN_BP, EXP_CANDY_XL,  3, .AceDuo
	title_challenger TD_UNLOCK_CHAMPIONS, 0,                                    EVENT_TITLE_DEFENSE_BEAT_RED,          RED,         RED1,         SPRITE_RED,            0,                  TD_RED_BP, MASTER_BALL,     1, .Red
	title_challenger TD_UNLOCK_FLAG,      EVENT_CLEARED_RADIO_TOWER,          EVENT_TITLE_DEFENSE_BEAT_ARCHER,       EXECUTIVEM,  ARCHER_TD,    SPRITE_ROCKET,         0,                  TD_WIN_BP, CHOICE_SPECS,    1, .Archer
	title_challenger TD_UNLOCK_FLAG,      EVENT_BEAT_SHRINE_JANE,             EVENT_TITLE_DEFENSE_BEAT_JANE,         EXECUTIVEF,  JANE_TD,      SPRITE_ROCKET_GIRL,    0,                  TD_WIN_BP, CHOICE_SCARF,    1, .Jane
	title_challenger TD_UNLOCK_ROCKETS,   0,                                    EVENT_TITLE_DEFENSE_BEAT_GIOVANNI,     GIOVANNI,    GIOVANNI_TD,  SPRITE_GENTLEMAN,      0,                  TD_GIOVANNI_BP, CHOICE_BAND, 1, .Giovanni
	title_challenger TD_UNLOCK_FLAG,      EVENT_BEAT_SAFARI_ROCKETS,          EVENT_TITLE_DEFENSE_BEAT_PETRA,        EXECUTIVEF,  PETRA_TD,     SPRITE_ROCKET_GIRL,    0,                  TD_WIN_BP, WEAKNESS_POLICY, 1, .Petra
	title_challenger TD_UNLOCK_FLAG,      EVENT_WORLD_CUP_CHAMPION,           EVENT_TITLE_DEFENSE_BEAT_MARINA, COOLTRAINERF, MARINA_TD, SPRITE_COOLTRAINER_F, 0, TD_WIN_BP, WISE_GLASSES, 1, .TDMarina
	title_challenger TD_UNLOCK_FLAG,      EVENT_WORLD_CUP_CHAMPION,           EVENT_TITLE_DEFENSE_BEAT_JESS, TEACHER, JESS_TD, SPRITE_TEACHER, 0, TD_WIN_BP, ROCKY_HELMET, 1, .TDJess
	title_challenger TD_UNLOCK_FLAG,      EVENT_WORLD_CUP_CHAMPION,           EVENT_TITLE_DEFENSE_BEAT_RONALD, YOUNGSTER, RONALD_TD, SPRITE_YOUNGSTER, 0, TD_WIN_BP, LIGHT_CLAY, 1, .TDRonald
	title_challenger TD_UNLOCK_FLAG,      EVENT_WORLD_CUP_CHAMPION,           EVENT_TITLE_DEFENSE_BEAT_KLUTCH, TEACHER, KLUTCH3, SPRITE_TEACHER, 0, TD_WIN_BP, DRAGON_FANG, 1, .TDKlutch
	title_challenger TD_UNLOCK_FLAG,      EVENT_WORLD_CUP_CHAMPION,           EVENT_TITLE_DEFENSE_BEAT_AMAYA, GRUNTF, AMAYA3, SPRITE_ROCKET_GIRL, 0, TD_WIN_BP, TWISTEDSPOON, 1, .TDAmaya
	title_challenger TD_UNLOCK_FLAG,      EVENT_WORLD_CUP_CHAMPION,           EVENT_TITLE_DEFENSE_BEAT_DALORIC, COOLTRAINERM, DALORIC2, SPRITE_COOLTRAINER_M, 0, TD_WIN_BP, MUSCLE_BAND, 1, .TDDaloric
	title_challenger TD_UNLOCK_FLAG,      EVENT_WORLD_CUP_CHAMPION,           EVENT_TITLE_DEFENSE_BEAT_CRYSTAL, COOLTRAINERM, CONTEST_CRYSTAL2, SPRITE_COOLTRAINER_M, 0, TD_WIN_BP, TOXIC_ORB, 1, .TDCrystal
	title_challenger TD_UNLOCK_FLAG,      EVENT_WORLD_CUP_CHAMPION,           EVENT_TITLE_DEFENSE_BEAT_ROSSOLON, COOLTRAINERM, ROSSOLON_TD, SPRITE_COOLTRAINER_M, 0, TD_WIN_BP, SCOPE_LENS, 1, .TDRossolon
	title_challenger TD_UNLOCK_FLAG,      EVENT_WORLD_CUP_CHAMPION,           EVENT_TITLE_DEFENSE_BEAT_BARTO, COOLTRAINERM, BARTO_TD, SPRITE_COOLTRAINER_M, 0, TD_WIN_BP, KINGS_ROCK, 1, .TDBarto
	title_challenger TD_UNLOCK_FLAG,      EVENT_WORLD_CUP_CHAMPION,           EVENT_TITLE_DEFENSE_BEAT_CHAOS, COOLTRAINERM, CHAOS_TD, SPRITE_COOLTRAINER_M, 0, TD_WIN_BP, AIR_BALLOON, 1, .TDChaos
	title_challenger TD_UNLOCK_FLAG,      EVENT_WORLD_CUP_CHAMPION,           EVENT_TITLE_DEFENSE_BEAT_EMMY, COOLTRAINERF, EMMY_TD, SPRITE_COOLTRAINER_F, 0, TD_WIN_BP, SHELL_BELL, 1, .TDEmmy
	title_challenger TD_UNLOCK_FLAG,      EVENT_WORLD_CUP_CHAMPION,           EVENT_TITLE_DEFENSE_BEAT_DAVE, PSYCHIC_T, DAVE_TD, SPRITE_YOUNGSTER, 0, TD_WIN_BP, FOCUS_BAND, 1, .TDDave
	title_challenger TD_UNLOCK_FLAG,      EVENT_WORLD_CUP_CHAMPION,           EVENT_TITLE_DEFENSE_BEAT_ACCAD, SAILOR, ACCAD_TD, SPRITE_SAILOR, 0, TD_WIN_BP, LUM_BERRY, 1, .TDAccad
	title_challenger TD_UNLOCK_FLAG,      EVENT_WORLD_CUP_CHAMPION,           EVENT_TITLE_DEFENSE_BEAT_JEFF, BOARDER, JEFF_TD, SPRITE_ROCKER, 0, TD_WIN_BP, QUICK_CLAW, 1, .TDJeff
	title_challenger TD_UNLOCK_FLAG,      EVENT_WORLD_CUP_CHAMPION,           EVENT_TITLE_DEFENSE_BEAT_KYLE, COOLTRAINERM, KYLE_TD, SPRITE_COOLTRAINER_M, 0, TD_WIN_BP, LEFTOVERS, 1, .TDKyle
	title_challenger TD_UNLOCK_FLAG,      EVENT_WORLD_CUP_CHAMPION,           EVENT_TITLE_DEFENSE_BEAT_AARON, RANGERM, AARON3, SPRITE_COOLTRAINER_M, 0, TD_WIN_BP, BRIGHTPOWDER, 1, .TDAaron
	assert_table_length NUM_TITLE_CHALLENGERS

.Silver:      db "Silver@"
.Green:       db "Green@"
.Wally:       db "Wally@"
.Lance:       db "Lance@"
.Agatha:      db "Agatha@"
.Steven:      db "Steven@"
.TateLiza:    db "Tate & Liza@"
.KimonoGirls: db "Kimono Girls@"
.Twins:       db "Amy & May@"
.AceDuo:      db "Kai & Rin@"
.Red:         db "Red@"
.Archer:      db "Archer@"
.Jane:        db "Jane@"
.Giovanni:    db "Giovanni@"
.Petra:       db "Petra@"
.TDMarina: db "Marina@"
.TDJess: db "Jess@"
.TDRonald: db "Ronald@"
.TDKlutch: db "Klutch@"
.TDAmaya: db "Amaya@"
.TDDaloric: db "Daloric@"
.TDCrystal: db "Crystal@"
.TDRossolon: db "Rossolon@"
.TDBarto: db "Barto@"
.TDChaos: db "Chaos@"
.TDEmmy: db "Emmy@"
.TDDave: db "Dave@"
.TDAccad: db "Accad@"
.TDJeff: db "Jeff@"
.TDKyle: db "Kyle@"
.TDAaron: db "Aaron@"

; The order of the Challenger Lobby menu and the Passport's "Beaten" list
TitleDefenseOrder:
	db TD_SILVER, TD_GREEN, TD_WALLY
	db TD_LANCE, TD_AGATHA, TD_STEVEN
	db TD_TATE_LIZA, TD_KIMONO_GIRLS, TD_TWINS, TD_ACE_DUO
	db TD_RED
	db TD_ARCHER, TD_JANE, TD_PETRA, TD_GIOVANNI
	db TD_MARINA, TD_JESS, TD_RONALD, TD_KLUTCH, TD_AMAYA, TD_DALORIC, TD_CRYSTAL, TD_ROSSOLON
	db TD_BARTO, TD_CHAOS, TD_EMMY, TD_DAVE, TD_ACCAD, TD_JEFF, TD_KYLE, TD_AARON
	db -1
	assert @ - TitleDefenseOrder == NUM_TITLE_CHALLENGERS + 1, "TitleDefenseOrder must list every challenger once"
