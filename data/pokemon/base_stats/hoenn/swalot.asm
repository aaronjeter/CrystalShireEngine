	db 0 ; species ID placeholder
	;BST: 467
	db 100,  73,  83,  55,  73,  83
	evs  2,   0,   0,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db POISON, POISON ; type
	db 75 ; catch rate
	db 168 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/swalot/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_INDETERMINATE, EGG_INDETERMINATE ; egg groups

	; tm/hm learnset
	tmhm ROCK_SMASH, SUNNY_DAY, HYPER_BEAM, RAIN_DANCE, GIGA_DRAIN, SOLARBEAM, SHADOW_BALL, ICE_PUNCH, SLUDGE_BOMB, FIRE_PUNCH, BRICK_BREAK, STRENGTH, ICE_BEAM
	; end
