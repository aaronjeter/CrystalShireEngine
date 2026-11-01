	db 0 ; species ID placeholder
	;BST: 390
	db  55,  95, 115,  35,  45,  45
	evs  0,   0,   2,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db ROCK, GROUND ; type
	db 120 ; catch rate
	db 134 ; base exp
	dw NO_ITEM, EVERSTONE ; items
	db GENDER_F50 ; gender ratio
	db 15 ; step cycles to hatch
	INCBIN "gfx/pokemon/graveler/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_MINERAL, EGG_MINERAL ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, HEADBUTT, ROAR, ROCK_SMASH, SUNNY_DAY, HYPER_BEAM, DIG, MUD_SLAP, FIRE_BLAST, FIRE_PUNCH, ROCK_TOMB, BRICK_BREAK, ANCIENTPOWER, STRENGTH, FLAMETHROWER
	; end
