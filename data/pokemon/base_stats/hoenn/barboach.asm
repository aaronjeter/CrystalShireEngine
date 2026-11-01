	db 0 ; species ID placeholder
	;BST: 288
	db  50,  48,  43,  60, 46,  41	
	evs  0,   0,   0,   1,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db WATER, GROUND ; type
	db 190 ; catch rate
	db 73 ; base exp
	dw NO_ITEM, WATER_STONE ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/barboach/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_WATER_3, EGG_WATER_3 ; egg groups

	; tm/hm learnset
	tmhm CURSE, ROCK_SMASH, BLIZZARD, ICY_WIND, DIG, SANDSTORM, THIEF, SCALD, BUBBLEBEAM, ROCK_SLIDE, SURF, STRENGTH, WHIRLPOOL, ICE_BEAM
	; end
