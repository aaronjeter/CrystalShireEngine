	db 0 ; species ID placeholder
	;BST: 300
	db  50,  75,  90,  40,  10,  35
	evs  0,   0,   1,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db ICE, STEEL ; type
	db 250 ; catch rate
	db 93 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/asandshrew/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, HEADBUTT, CURSE, ROLLOUT, ROCK_SMASH, HYPER_BEAM, IRON_TAIL, DIG, MUD_SLAP, SWIFT, THIEF, FURY_CUTTER, ICE_FANG, AERIAL_ACE, DRAGON_CLAW, BRICK_BREAK, POISON_JAB, SHADOW_CLAW, CUT, STRENGTH
	; end
