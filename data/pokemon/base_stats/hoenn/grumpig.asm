	db 0 ; species ID placeholder
	;BST: 470
	db  80,  45,  65,  80,  90, 110
	evs  0,   0,   0,   0,   0,   2
	;   hp  atk  def  spd  sat  sdf

	db PSYCHIC_TYPE, PSYCHIC_TYPE ; type
	db 60 ; catch rate
	db 164 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/grumpig/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_FAST ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm SUNNY_DAY, HYPER_BEAM, RAIN_DANCE, TAUNT, IRON_TAIL, ICE_PUNCH, THIEF, FIRE_PUNCH, SHOCK_WAVE, BRICK_BREAK, FLASH
	; end
