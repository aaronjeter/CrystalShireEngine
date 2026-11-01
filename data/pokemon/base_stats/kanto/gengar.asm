	db 0 ; species ID placeholder
	;BST: 500
	db  60,  65,  60, 110, 130,  75
	evs  0,   0,   0,   0,   3,   0
	;   hp  atk  def  spd  sat  sdf

	db GHOST, POISON ; type
	db 45 ; catch rate
	db 190 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/gengar/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_INDETERMINATE, EGG_INDETERMINATE ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, HEADBUTT, ZAP_CANNON, ROCK_SMASH, SUNNY_DAY, HYPER_BEAM, ICY_WIND, RAIN_DANCE, GIGA_DRAIN, THUNDER, PSYCHIC_M, ICE_PUNCH, THUNDERPUNCH, THIEF, FIRE_PUNCH, WILLOWISP, STRENGTH, THUNDERBOLT
	; end
