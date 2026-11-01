	db 0 ; species ID placeholder
	;BST: 305
	db  45,  90,  20,  65,  65,  20
	evs  0,   1,   0,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db WATER, DARK ; type
	db 225 ; catch rate
	db 88 ; base exp
	dw WATER_STONE, FANG_FOSSIL ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/carvanha/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_WATER_2, EGG_WATER_2 ; egg groups

	; tm/hm learnset
	tmhm ROAR, ROCK_SMASH, BLIZZARD, HYPER_BEAM, RAIN_DANCE, TAUNT, EARTHQUAKE, THIEF, SCALD, BUBBLEBEAM, SURF, STRENGTH, ICE_BEAM
	; end
