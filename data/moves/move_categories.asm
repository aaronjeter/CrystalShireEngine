;Moves with additional categories

PunchMoves::
	dw COMET_PUNCH
	dw MEGA_PUNCH
	dw FIRE_PUNCH
	dw ICE_PUNCH
	dw THUNDERPUNCH
	dw DIZZY_PUNCH
	dw MACH_PUNCH
	dw DYNAMICPUNCH
	dw FOCUS_PUNCH
	dw SHADOW_PUNCH
	dw BULLET_PUNCH
	dw -1

FangMoves::
	dw BITE
	dw HYPER_FANG
	dw CRUNCH
	dw POISON_FANG
	dw THUNDER_FANG
	dw ICE_FANG
	dw FIRE_FANG
	dw -1

SharpMoves::
	dw CUT
	dw SLASH
	dw FALSE_SWIPE
	dw FURY_CUTTER
	dw LEAF_BLADE
	dw PSYCHO_CUT
	dw RAZORSHELL
	dw AIR_CUTTER
	dw AERIAL_ACE
	dw NIGHT_SLASH
	dw -1

; Contact moves -------------------------------------------------------------
; Physical moves make contact unless listed in NonContactPhysicalMoves.
; Special moves never make contact unless listed in ContactSpecialMoves.
; Status moves never make contact.

NonContactPhysicalMoves::
	dw PAY_DAY
	dw SAND_ATTACK
	dw POISON_STING
	dw TWINEEDLE
	dw ACID
	dw ROCK_THROW
	dw EARTHQUAKE
	dw FISSURE
	dw SELFDESTRUCT
	dw EXPLOSION
	dw SLUDGE
	dw SLUDGE_BOMB
	dw BONE_CLUB
	dw BONEMERANG
	dw BONE_RUSH
	dw SWIFT
	dw SPIKE_CANNON
	dw BARRAGE
	dw ROCK_SLIDE
	dw SNORE
	dw PRESENT
	dw SACRED_FIRE
	dw MAGNITUDE
	dw NATURE_POWER
	dw ROCK_TOMB
	dw BULLET_SEED
	dw ICICLE_SPEAR
	dw ROCK_BLAST
	dw ICICLE_CRASH
	dw VOLT_SWITCH
	dw -1

ContactSpecialMoves::
	dw LEECH_LIFE
	dw SUPER_FANG
	dw BIDE
	dw REVERSAL
	dw SPARK
	dw FOCUS_PUNCH
	dw SUPERPOWER
	dw DRAININGKISS
	dw -1
