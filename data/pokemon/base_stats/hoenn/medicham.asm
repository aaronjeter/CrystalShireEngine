	db 0 ; species ID placeholder
	;BST: 470
	db  60,  120,  75,  80,  60,  75
	evs  0,   0,   0,   2,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db FIGHTING, PSYCHIC_TYPE ; type
	db 90 ; catch rate
	db 153 ; base exp
	dw FOCUS_BAND, BLACKBELT_I ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/medicham/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_HUMANSHAPE, EGG_HUMANSHAPE ; egg groups

	; tm/hm learnset
	tmhm ROCK_SMASH, SUNNY_DAY, HYPER_BEAM, RAIN_DANCE, SHADOW_BALL, CALM_MIND, BRICK_BREAK, LIGHT_SCREEN, REFLECT, ROCK_SLIDE, STRENGTH, FLASH
	; end
