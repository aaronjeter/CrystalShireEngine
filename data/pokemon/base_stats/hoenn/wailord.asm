	db 0 ; species ID placeholder

	db 170,  90,  45,  60,  90,  45
	evs  2,   0,   0,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db WATER, WATER ; type
	db 60 ; catch rate
	db 206 ; base exp
	dw NO_ITEM, WATER_STONE ; items
	db GENDER_F50 ; gender ratio
	db 40 ; step cycles to hatch
	INCBIN "gfx/pokemon/wailord/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_GROUND, EGG_WATER_2 ; egg groups

	; tm/hm learnset
	tmhm ROAR, ROCK_SMASH, BLIZZARD, HYPER_BEAM, ICY_WIND, RAIN_DANCE, EARTHQUAKE, SCALD, BRICK_BREAK, SURF, STRENGTH, WATERFALL
	; end
