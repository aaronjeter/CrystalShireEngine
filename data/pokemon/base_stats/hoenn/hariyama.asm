	db 0 ; species ID placeholder
	;BST: 474
	db 144, 120,  60,  50,  40,  60
	evs  2,   0,   0,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db FIGHTING, FIGHTING ; type
	db 200 ; catch rate
	db 184 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_F25 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/hariyama/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_HUMANSHAPE, EGG_HUMANSHAPE ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, ROCK_SMASH, SUNNY_DAY, HYPER_BEAM, RAIN_DANCE, EARTHQUAKE, DIG, ICE_PUNCH, THUNDERPUNCH, FIRE_PUNCH, ROCK_TOMB, ROCK_SLIDE, SURF, STRENGTH
	; end
