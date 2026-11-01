	db 0 ; species ID placeholder
	;BST: 460
	db  90,  55,  65,  70,  95,  85
	evs  0,   0,   0,   0,   2,   0
	;   hp  atk  def  spd  sat  sdf

	db ROCK, PSYCHIC_TYPE ; type
	db 45 ; catch rate
	db 150 ; base exp
	dw MOON_STONE, MOON_STONE ; items
	db GENDER_UNKNOWN ; gender ratio
	db 25 ; step cycles to hatch
	INCBIN "gfx/pokemon/lunatone/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_FAST ; growth rate
	dn EGG_MINERAL, EGG_MINERAL ; egg groups

	; tm/hm learnset
	tmhm GRASS_KNOT, HYPER_BEAM, ICY_WIND, RAIN_DANCE, EARTHQUAKE, SHADOW_BALL, SANDSTORM, ROCK_TOMB, WILLOWISP, FLASH
	; end
