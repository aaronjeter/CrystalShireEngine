	db 0 ; species ID placeholder
	;BST: 300
	db  75,  65,  65,  15,  35,  45
	evs  1,   0,   0,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db WATER, GROUND ; type
	db 255 ; catch rate
	db 52 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/wooper/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_WATER_1, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, HEADBUTT, ROLLOUT, ROCK_SMASH, HYPER_BEAM, IRON_TAIL, EARTHQUAKE, DIG, ICE_PUNCH, SLUDGE_BOMB, SANDSTORM, ROCK_TOMB, BUBBLEBEAM, ANCIENTPOWER, ROCK_SLIDE, POISON_JAB, SURF, STRENGTH, FLASH, WHIRLPOOL, ICE_BEAM
	; end
