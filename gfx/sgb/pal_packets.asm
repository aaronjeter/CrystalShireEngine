; four predef palettes per layout (see PredefPals)

MACRO pal_set
	dw PREDEFPAL_\1, PREDEFPAL_\2, PREDEFPAL_\3, PREDEFPAL_\4
ENDM

PalPacket_MagnetTrain:
	pal_set BETA_SHINY_GREENMON, CGB_BADGE, RB_BROWNMON, ROUTES

PalPacket_UnownPuzzle:
	pal_set UNOWN_PUZZLE, UNOWN_PUZZLE, UNOWN_PUZZLE, UNOWN_PUZZLE

PalPacket_Pack:
	pal_set PACK, ROUTES, ROUTES, ROUTES

PalPacket_BetaPikachuMinigame:
	pal_set GS_INTRO_JIGGLYPUFF_PIKACHU_OB, ROUTES, ROUTES, ROUTES

PalPacket_PartyMenu:
	pal_set PARTY_ICON, HP_GREEN, HP_YELLOW, HP_RED

PalPacket_BattleGrayscale:
	pal_set BLACKOUT, BLACKOUT, BLACKOUT, BLACKOUT

PalPacket_BetaTitleScreen:
	pal_set BETA_LOGO_1, BETA_LOGO_2, DIPLOMA, RB_PURPLEMON

PalPacket_Diploma:
	pal_set DIPLOMA, ROUTES, ROUTES, ROUTES

PalPacket_TradeTube:
	pal_set TRADE_TUBE, ROUTES, ROUTES, ROUTES
