	db 0 ; species ID placeholder
	;BST: 450
	db  95,  95,  95,  35,  65,  65
	evs  2,   0,   0,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db WATER, GROUND ; type
	db 90 ; catch rate
	db 137 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/quagsire/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_WATER_1, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, HEADBUTT, ROLLOUT, ROCK_SMASH, HYPER_BEAM, IRON_TAIL, EARTHQUAKE, DIG, ICE_PUNCH, SLUDGE_BOMB, SANDSTORM, ROCK_TOMB, BUBBLEBEAM, ANCIENTPOWER, ROCK_SLIDE, POISON_JAB, SURF, STRENGTH, FLASH, WHIRLPOOL, ICE_BEAM
	; end
