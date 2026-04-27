MACRO npctrade
; dialog set, requested mon, offered mon, nickname, dvs, item, OT ID, OT name, gender requested
	db \1
	dw \2, \3
	db \4, \5, \6
	dw \7
	shift
	dw \7
	db \8, \9
	db 0
ENDM

NPCTrades:
; entries correspond to NPCTRADE_* constants
	table_width NPCTRADE_STRUCT_LENGTH
	npctrade TRADE_DIALOGSET_COLLECTOR, ABRA,       DUSKULL,    "Reaper@@@@@", $ff, $ff, MARVEL_SCALE, 37460, "Mike@@@@", TRADE_GENDER_EITHER
	npctrade TRADE_DIALOGSET_COLLECTOR, BELLSPROUT, LUNATONE,   "Luna@@@@@@@", $ff, $ff, MARVEL_SCALE, 48926, "Kyle@@@@", TRADE_GENDER_EITHER
	npctrade TRADE_DIALOGSET_HAPPY,     KRABBY,     SOLROCK,    "Sol@@@@@@@@", $ff, $ff, MARVEL_SCALE, 29189, "Tim@@@@@", TRADE_GENDER_EITHER
	npctrade TRADE_DIALOGSET_GIRL,      DRAGONAIR,  GOREBYSS,   "Doris@@@@@@", $ff, $ff, SMOKE_BALL,   00283, "Emy@@@@@", TRADE_GENDER_FEMALE
	npctrade TRADE_DIALOGSET_NEWBIE,    DODUO,      HVOLTORB,   "Woody@@@@@@", $ff, $ff, MARVEL_SCALE, 15616, "Chris@@@", TRADE_GENDER_EITHER
	npctrade TRADE_DIALOGSET_GIRL,      CHANSEY,    AERODACTYL, "Aeroy@@@@@@", $ff, $ff, MARVEL_SCALE, 26491, "Kim@@@@@", TRADE_GENDER_EITHER
	npctrade TRADE_DIALOGSET_COLLECTOR, DUGTRIO,    HUNTAIL,    "Maggie@@@@@", $ff, $ff, METAL_COAT,   50082, "Forest@@", TRADE_GENDER_EITHER
	
	npctrade TRADE_DIALOGSET_HAPPY,     ROSELIA,    HITMONCHAN, "Jackie@@@@@", $ff, $ff, LUCKY_PUNCH,  50082, "Frank@@@", TRADE_GENDER_EITHER
	npctrade TRADE_DIALOGSET_HAPPY,     NINCADA,    LUVDISC,    "Valentine@@", $ff, $ff, MYSTIC_WATER, 50081, "Greg@@@@", TRADE_GENDER_EITHER
	npctrade TRADE_DIALOGSET_COLLECTOR, SHROOMISH,  PILOSWINE,  "Mook@@@@@@@", $ff, $ff, SOFT_SAND,    50083, "Ryan@@@@", TRADE_GENDER_EITHER
	npctrade TRADE_DIALOGSET_GIRL,      PLUSLE,     AVULPIX,    "Lily@@@@@@@", $ff, $ff, NEVERMELTICE, 50084, "Lily@@@@", TRADE_GENDER_EITHER
	npctrade TRADE_DIALOGSET_COLLECTOR, MINUN,      AGRAVELER,  "Pyrite@@@@@", $ff, $ff, MAGNET,       50085, "Joanne@@", TRADE_GENDER_EITHER
	npctrade TRADE_DIALOGSET_COLLECTOR, TROPIUS,    HANAMOLE,   "Hanna@@@@@@", $ff, $ff, LUCKY_EGG,    50086, "Robert@@", TRADE_GENDER_EITHER
	npctrade TRADE_DIALOGSET_GIRL,      CHIMECHO,   CORSOLA,    "Cora@@@@@@@", $ff, $ff, LEFTOVERS,    50087, "Dani@@@@", TRADE_GENDER_EITHER
	npctrade TRADE_DIALOGSET_COLLECTOR, ABSOL,      ASHIBOMB,   "Ashi@@@@@@@", $ff, $ff, MARVEL_SCALE, 50088, "Parker@@", TRADE_GENDER_EITHER
	
	npctrade TRADE_DIALOGSET_COLLECTOR, DELIBIRD,   IRONBUNDLE, "Rust@@@@@@@", $ff, $ff, AMULET_COIN,  50082, "Aaron@@@", TRADE_GENDER_EITHER
	npctrade TRADE_DIALOGSET_COLLECTOR, KADABRA,    MR__MIME,   "Mister@@@@@", $ff, $ff, MARVEL_SCALE, 50081, "David@@@", TRADE_GENDER_EITHER
	npctrade TRADE_DIALOGSET_GIRL,      UNOWN,      HITMONLEE,  "Bruce@@@@@@", $ff, $ff, BLACKBELT_I,  50083, "Megan@@@", TRADE_GENDER_EITHER
	npctrade TRADE_DIALOGSET_GIRL,      HERACROSS,  KLEAVOR,    "Blade@@@@@@", $ff, $ff, MARVEL_SCALE, 50084, "Amber@@@", TRADE_GENDER_EITHER
	npctrade TRADE_DIALOGSET_GIRL,      RAITORA,    VOLTORB2,   "Bob-omb@@@@", $ff, $ff, METAL_COAT,   50085, "Jenna@@@", TRADE_GENDER_EITHER
	npctrade TRADE_DIALOGSET_COLLECTOR, FEEBAS,     EXEGGCUTE2, "Piranha@@@@", $ff, $ff, LUCKY_EGG,    50086, "Isaac@@@", TRADE_GENDER_EITHER
	npctrade TRADE_DIALOGSET_GIRL,      LARVITAR,   BELDUM,     "Platinum@@@", $ff, $ff, SCOPE_LENS,   50087, "Mia@@@@@", TRADE_GENDER_EITHER
	npctrade TRADE_DIALOGSET_COLLECTOR, LUVDISC,    DITTO,      "Eve@@@@@@@@", $ff, $ff, MARVEL_SCALE, 50088, "Eli@@@@@", TRADE_GENDER_EITHER
	npctrade TRADE_DIALOGSET_COLLECTOR, RELICANTH,  HANEEI,     "Mirage@@@@@", $ff, $ff, MYSTIC_WATER, 50088, "Gary@@@@", TRADE_GENDER_EITHER
	
	assert_table_length NUM_NPC_TRADES
