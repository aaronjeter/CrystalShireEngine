	db 0 ; species ID placeholder
	;BST: 300
	db  40,  80, 100,  20,  30,  30
	evs  0,   0,   1,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db ROCK, GROUND ; type
	db 255 ; catch rate
	db 86 ; base exp
	dw NO_ITEM, EVERSTONE ; items
	db GENDER_F50 ; gender ratio
	db 15 ; step cycles to hatch
	INCBIN "gfx/pokemon/geodude/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_MINERAL, EGG_MINERAL ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, HEADBUTT, ROAR, ROCK_SMASH, SUNNY_DAY, HYPER_BEAM, DIG, MUD_SLAP, FIRE_BLAST, FIRE_PUNCH, ROCK_TOMB, BRICK_BREAK, ANCIENTPOWER, STRENGTH, FLAMETHROWER
	; end
