	db 0 ; species ID placeholder
	;BST: 237
	db  72,  60,  30,  25,  20,  30
	evs  1,   0,   0,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db FIGHTING, FIGHTING ; type
	db 180 ; catch rate
	db 87 ; base exp
	dw NO_ITEM, BLACKBELT_I ; items
	db GENDER_F25 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/makuhita/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_HUMANSHAPE, EGG_HUMANSHAPE ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, ROCK_SMASH, SUNNY_DAY, HYPER_BEAM, RAIN_DANCE, EARTHQUAKE, DIG, ICE_PUNCH, THUNDERPUNCH, FIRE_PUNCH, ROCK_TOMB, ROCK_SLIDE, SURF, STRENGTH
	; end
