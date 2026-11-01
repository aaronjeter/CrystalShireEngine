	db 0 ; species ID placeholder

	db  40,  40,  55,  55,  40,  70
	evs  0,   0,   0,   0,   0,   1
	;   hp  atk  def  spd  sat  sdf

	db GROUND, PSYCHIC_TYPE ; type
	db 255 ; catch rate
	db 58 ; base exp
	dw NO_ITEM, SOFT_SAND ; items
	db GENDER_UNKNOWN ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/baltoy/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_MINERAL, EGG_MINERAL ; egg groups

	; tm/hm learnset
	tmhm ROCK_SMASH, SUNNY_DAY, GRASS_KNOT, HYPER_BEAM, RAIN_DANCE, SOLARBEAM, EARTHQUAKE, DIG, SHADOW_BALL, ZEN_HEADBUTT, ROCK_SLIDE, STRENGTH, FLASH, ICE_BEAM
	; end
