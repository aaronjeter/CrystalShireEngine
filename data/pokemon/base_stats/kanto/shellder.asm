	db 0 ; species ID placeholder
	;BST: 305
	db  30,  65, 100,  40,  45,  25
	evs  0,   0,   1,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db WATER, WATER ; type
	db 190 ; catch rate
	db 97 ; base exp
	dw PEARL, BIG_PEARL ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/shellder/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_WATER_3, EGG_WATER_3 ; egg groups

	; tm/hm learnset
	tmhm CURSE, HYPER_BEAM, ICY_WIND, RAIN_DANCE, SWIFT, HAIL, ICE_FANG, BUBBLEBEAM, LIGHT_SCREEN, REFLECT, SURF, WHIRLPOOL
	; end
