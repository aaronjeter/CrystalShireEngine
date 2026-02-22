; npctrade struct members (see data/events/npc_trades.asm)
rsreset
DEF NPCTRADE_DIALOG   rb
DEF NPCTRADE_GIVEMON  rw
DEF NPCTRADE_GETMON   rw
DEF NPCTRADE_NICKNAME rb MON_NAME_LENGTH
DEF NPCTRADE_DVS      rw
DEF NPCTRADE_ITEM     rw
DEF NPCTRADE_OT_ID    rw
DEF NPCTRADE_OT_NAME  rb PLAYER_NAME_LENGTH
DEF NPCTRADE_GENDER   rb
                      rb_skip
DEF NPCTRADE_STRUCT_LENGTH EQU _RS

; NPCTrades indexes (see data/events/npc_trades.asm)
	const_def
	const NPC_TRADE_MIKE   ; 0
	const NPC_TRADE_KYLE   ; 1
	const NPC_TRADE_TIM    ; 2
	const NPC_TRADE_EMY    ; 3
	const NPC_TRADE_CHRIS  ; 4
	const NPC_TRADE_KIM    ; 5
	const NPC_TRADE_FOREST ; 6
	const NPC_TRADE_FRANK
	const NPC_TRADE_GREG
	const NPC_TRADE_RYAN
	const NPC_TRADE_LILY
	const NPC_TRADE_JOANNE
	const NPC_TRADE_ROBERT
	const NPC_TRADE_DANI
	const NPC_TRADE_PARKER
	const NPC_TRADE_AARON
	const NPC_TRADE_DAVID
	const NPC_TRADE_MEGAN
	const NPC_TRADE_AMBER
	const NPC_TRADE_JENNA
	const NPC_TRADE_ISAAC
	const NPC_TRADE_MIA
	const NPC_TRADE_ELI
	const NPC_TRADE_GARY
DEF NUM_NPC_TRADES EQU const_value

; trade gender limits
	const_def
	const TRADE_GENDER_EITHER
	const TRADE_GENDER_MALE
	const TRADE_GENDER_FEMALE

; TradeTexts indexes (see engine/events/npc_trade.asm)

; trade dialogs
	const_def
	const TRADE_DIALOG_INTRO
	const TRADE_DIALOG_CANCEL
	const TRADE_DIALOG_WRONG
	const TRADE_DIALOG_COMPLETE
	const TRADE_DIALOG_AFTER

; trade dialog sets
	const_def
	const TRADE_DIALOGSET_COLLECTOR
	const TRADE_DIALOGSET_HAPPY
	const TRADE_DIALOGSET_NEWBIE
	const TRADE_DIALOGSET_GIRL
