	db 0 ; species ID placeholder

	db 100, 100, 100, 100, 100, 100
	evs  3,   0,   0,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db STEEL, PSYCHIC_TYPE ; type
	db 3 ; catch rate
	db 215 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_UNKNOWN ; gender ratio
	db 120 ; step cycles to hatch
	INCBIN "gfx/pokemon/jirachi/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_SLOW ; growth rate
	dn EGG_NONE, EGG_NONE ; egg groups

	; tm/hm learnset
	tmhm SUNNY_DAY, GRASS_KNOT, HYPER_BEAM, ICY_WIND, RAIN_DANCE, THUNDER, SHADOW_BALL, ICE_PUNCH, SANDSTORM, DRAIN_PUNCH, THUNDERPUNCH, FIRE_PUNCH, SHOCK_WAVE, AERIAL_ACE, LIGHT_SCREEN, REFLECT, FLASH, THUNDERBOLT
	; end
