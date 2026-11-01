	db 0 ; species ID placeholder
	;BST: 300
	db  40,  80, 100,  20,  30,  30
	evs  0,   0,   1,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db ROCK, ELECTRIC ; type
	db 250 ; catch rate
	db 86 ; base exp
	dw NO_ITEM, EVERSTONE ; items
	db GENDER_F50 ; gender ratio
	db 15 ; step cycles to hatch
	INCBIN "gfx/pokemon/ageodude/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_MINERAL, EGG_MINERAL ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, HEADBUTT, ROAR, ROCK_SMASH, SUNNY_DAY, HYPER_BEAM, EARTHQUAKE, DIG, MUD_SLAP, SANDSTORM, FIRE_BLAST, THUNDERPUNCH, FIRE_PUNCH, THUNDER_FANG, ROCK_TOMB, SHOCK_WAVE, BRICK_BREAK, ANCIENTPOWER, STRENGTH, FLAMETHROWER, THUNDERBOLT
	; end
