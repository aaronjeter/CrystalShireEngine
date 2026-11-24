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

; The order of the Challenger Lobby menu and the Passport's "Beaten" list
TitleDefenseOrder:
	db TD_SILVER, TD_GREEN, TD_WALLY
	db TD_LANCE, TD_AGATHA, TD_STEVEN
	db TD_TATE_LIZA, TD_KIMONO_GIRLS, TD_TWINS, TD_ACE_DUO
	db TD_RED
	db TD_ARCHER, TD_JANE, TD_PETRA, TD_GIOVANNI
	db -1
	assert @ - TitleDefenseOrder == NUM_TITLE_CHALLENGERS + 1, "TitleDefenseOrder must list every challenger once"
