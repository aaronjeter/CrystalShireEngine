	db 0 ; species ID placeholder
	;BST: 580
	db 100,  75, 115,  85,  90, 115
	evs  0,   0,   1,   0,   0,   2
	;   hp  atk  def  spd  sat  sdf

	db WATER, WATER ; type
	db 7 ; catch rate
	db 215 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_UNKNOWN ; gender ratio
	db 80 ; step cycles to hatch
	INCBIN "gfx/pokemon/suicune/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_SLOW ; growth rate
	dn EGG_NONE, EGG_NONE ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, ROCK_SMASH, SUNNY_DAY, HYPER_BEAM, ICY_WIND, IRON_TAIL, DIG, SHADOW_BALL, MUD_SLAP, SWIFT, SCALD, REFLECT, CUT, SURF, WHIRLPOOL, WATERFALL, ICE_BEAM
	; end
