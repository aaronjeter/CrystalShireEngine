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
