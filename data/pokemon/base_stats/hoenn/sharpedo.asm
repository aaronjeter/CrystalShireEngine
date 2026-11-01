	db 0 ; species ID placeholder
	;BST: 460
	db  70, 120,  40,  95,  95,  40
	evs  0,   2,   0,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db WATER, DARK ; type
	db 60 ; catch rate
	db 175 ; base exp
	dw WATER_STONE, FANG_FOSSIL ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/sharpedo/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_WATER_2, EGG_WATER_2 ; egg groups

	; tm/hm learnset
	tmhm ROAR, ROCK_SMASH, BLIZZARD, HYPER_BEAM, RAIN_DANCE, TAUNT, EARTHQUAKE, THIEF, SCALD, BUBBLEBEAM, SURF, STRENGTH, ICE_BEAM
	; end
