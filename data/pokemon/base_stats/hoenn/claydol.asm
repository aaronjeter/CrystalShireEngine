	db 0 ; species ID placeholder

	db  60,  70, 105,  75,  70, 120
	evs  0,   0,   0,   0,   0,   2
	;   hp  atk  def  spd  sat  sdf

	db GROUND, PSYCHIC_TYPE ; type
	db 90 ; catch rate
	db 189 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_UNKNOWN ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/claydol/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_MINERAL, EGG_MINERAL ; egg groups

	; tm/hm learnset
	tmhm ROCK_SMASH, SUNNY_DAY, GRASS_KNOT, HYPER_BEAM, RAIN_DANCE, SOLARBEAM, EARTHQUAKE, DIG, SHADOW_BALL, ZEN_HEADBUTT, ROCK_SLIDE, STRENGTH, FLASH, ICE_BEAM
	; end
