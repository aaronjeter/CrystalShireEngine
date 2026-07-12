	db 0 ; species ID placeholder

	db 110,  80,  90,  65,  95,  90
	evs  3,   0,   0,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db ICE, WATER ; type
	db 45 ; catch rate
	db 192 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/walrein/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_WATER_1, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm ROAR, TOXIC, HAIL, HIDDEN_POWER, ICE_BEAM, BLIZZARD, HYPER_BEAM, RAIN_DANCE, FRUSTRATION, IRON_TAIL, EARTHQUAKE, RETURN, ROCK_TOMB, REST, ATTRACT, SURF, STRENGTH, ROCK_SMASH, WATERFALL, HAIL
	; end
