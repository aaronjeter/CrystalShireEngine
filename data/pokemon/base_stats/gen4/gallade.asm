	db 0 ; species ID placeholder
	;BST: 518
	db  68,  125,  65,  80, 65, 115
	evs  0,   3,   0,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db PSYCHIC_TYPE, FIGHTING ; type
	db 45 ; catch rate
	db 240 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/gallade/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_SLOW ; growth rate
	dn EGG_HUMANSHAPE, EGG_INDETERMINATE ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, ROCK_SMASH, SUNNY_DAY, HYPER_BEAM, RAIN_DANCE, PSYCHIC_M, SHADOW_BALL, ICE_PUNCH, THUNDERPUNCH, THIEF, FIRE_PUNCH, WILLOWISP, CALM_MIND, BRICK_BREAK, LIGHT_SCREEN, REFLECT, ROCK_SLIDE, POISON_JAB, FLASH, THUNDERBOLT
	; end
