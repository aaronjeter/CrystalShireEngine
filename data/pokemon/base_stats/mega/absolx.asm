	db 0 ; species ID placeholder
	;bst 580
	db  65, 150,  60,  130,  115,  60
	evs  0,   2,   0,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db DARK, DARK ; type
	db 30 ; catch rate
	db 174 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 25 ; step cycles to hatch
	INCBIN "gfx/pokemon/absolx/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_INDETERMINATE, EGG_INDETERMINATE ; egg groups

	; tm/hm learnset
	tmhm WATER_PULSE, CALM_MIND, TOXIC, HAIL, HIDDEN_POWER, SUNNY_DAY, ICE_BEAM, BLIZZARD, HYPER_BEAM, RAIN_DANCE, FRUSTRATION, IRON_TAIL, THUNDERBOLT, THUNDER, RETURN, SHADOW_BALL, SHOCK_WAVE, FLAMETHROWER, SANDSTORM, FIRE_BLAST, AERIAL_ACE, REST, ATTRACT, THIEF, CUT, STRENGTH, FLASH, ROCK_SMASH
	; end
