	db 0 ; species ID placeholder

	db  80,  80,  90, 110, 110, 130
	evs  0,   0,   0,   0,   0,   3
	;   hp  atk  def  spd  sat  sdf

	db DRAGON, PSYCHIC_TYPE ; type
	db 3 ; catch rate
	db 211 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_F100 ; gender ratio
	db 120 ; step cycles to hatch
	INCBIN "gfx/pokemon/latias/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_SLOW ; growth rate
	dn EGG_NONE, EGG_NONE ; egg groups

	; tm/hm learnset
	tmhm ROAR, SUNNY_DAY, GRASS_KNOT, HYPER_BEAM, ICY_WIND, RAIN_DANCE, SOLARBEAM, THUNDER, EARTHQUAKE, SHADOW_BALL, SANDSTORM, STEEL_WING, SHOCK_WAVE, AERIAL_ACE, BUBBLEBEAM, DRAGON_CLAW, CUT, FLY, SURF, FLASH, WATERFALL, THUNDERBOLT, ICE_BEAM
	; end
