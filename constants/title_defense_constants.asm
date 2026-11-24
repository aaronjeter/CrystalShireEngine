; World Cup title defense (engine/events/title_defense.asm, data/events/title_defense.asm)

; TitleDefenseChallengers indexes
	const_def
	const TD_SILVER
	const TD_GREEN
	const TD_WALLY
	const TD_LANCE
	const TD_AGATHA
	const TD_STEVEN
	const TD_TATE_LIZA
	const TD_KIMONO_GIRLS
	const TD_TWINS
	const TD_ACE_DUO
	const TD_RED
	const TD_ARCHER
	const TD_JANE
	const TD_GIOVANNI
	const TD_PETRA
DEF NUM_TITLE_CHALLENGERS EQU const_value

; unlock kinds
	const_def
	const TD_UNLOCK_FLAG      ; the event flag is set
	const TD_UNLOCK_CHAMPIONS ; Lance, Agatha and Steven beaten in title defenses
	const TD_UNLOCK_ROCKETS   ; Archer, Jane and Petra beaten in title defenses

DEF TD_WIN_BP EQU 5
DEF TD_RED_BP EQU 10
DEF TD_GIOVANNI_BP EQU 10

; challengers shown at once in the Passport's "Beaten" list
DEF TD_PASSPORT_ROWS EQU 7

; the challenger's partner sprite shares the link trainer's variable sprite
DEF SPRITE_TITLE_PARTNER EQU SPRITE_LINK_TRAINER

; TitleDefenseChallengers fields
rsreset
DEF TITLE_CHALLENGER_UNLOCK_KIND  rb
DEF TITLE_CHALLENGER_UNLOCK_PARAM rw
DEF TITLE_CHALLENGER_BEATEN_FLAG  rw
DEF TITLE_CHALLENGER_CLASS        rb
DEF TITLE_CHALLENGER_PARTY        rb
DEF TITLE_CHALLENGER_SPRITE       rb
DEF TITLE_CHALLENGER_PARTNER      rb
DEF TITLE_CHALLENGER_BP           rb
DEF TITLE_CHALLENGER_ITEM         rw
DEF TITLE_CHALLENGER_QUANTITY     rb
DEF TITLE_CHALLENGER_NAME         rw
DEF TITLE_CHALLENGER_LENGTH EQU _RS
