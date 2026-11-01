	db 0 ; species ID placeholder
	;BST: 430
	db  55,  95,  55, 115,  35,  75
	evs  0,   0,   0,   1,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db DARK, ICE ; type
	db 60 ; catch rate
	db 132 ; base exp
	dw NO_ITEM, QUICK_CLAW ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/sneasel/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, HEADBUTT, CURSE, ROCK_SMASH, BLIZZARD, RAIN_DANCE, IRON_TAIL, DIG, SHADOW_BALL, MUD_SLAP, ICE_PUNCH, SWIFT, DREAM_EATER, THIEF, FURY_CUTTER, HAIL, ICE_FANG, AERIAL_ACE, DRAGON_CLAW, BRICK_BREAK, POISON_JAB, CUT, SURF, STRENGTH, ICE_BEAM
	; end
