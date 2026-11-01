	db 0 ; species ID placeholder

	db 130,  70,  35,  60,  70,  35
	evs  1,   0,   0,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db WATER, WATER ; type
	db 125 ; catch rate
	db 137 ; base exp
	dw NO_ITEM, WATER_STONE ; items
	db GENDER_F50 ; gender ratio
	db 40 ; step cycles to hatch
	INCBIN "gfx/pokemon/wailmer/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_GROUND, EGG_WATER_2 ; egg groups

	; tm/hm learnset
	tmhm ROAR, ROCK_SMASH, BLIZZARD, HYPER_BEAM, ICY_WIND, RAIN_DANCE, EARTHQUAKE, SCALD, BRICK_BREAK, SURF, STRENGTH, WATERFALL
	; end
