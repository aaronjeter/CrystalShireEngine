	db 0 ; species ID placeholder
	;BST: 300
	db  50,  75,  85,  40,  20,  30
	evs  0,   0,   1,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db GROUND, STEEL ; type
	db 255 ; catch rate
	db 93 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/sandshrew/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, HEADBUTT, CURSE, ROCK_SMASH, SUNNY_DAY, HYPER_BEAM, IRON_TAIL, DIG, MUD_SLAP, SWIFT, THIEF, FURY_CUTTER, POISON_FANG, AERIAL_ACE, DRAGON_CLAW, BRICK_BREAK, POISON_JAB, SHADOW_CLAW, CUT, STRENGTH
	; end
