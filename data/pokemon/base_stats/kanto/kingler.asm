	db 0 ; species ID placeholder
	;BST: 475
	db  55, 130, 115,  75,  50,  50
	evs  0,   2,   0,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db WATER, STEEL ; type
	db 60 ; catch rate
	db 206 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/kingler/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_WATER_3, EGG_WATER_3 ; egg groups

	; tm/hm learnset
	tmhm BLIZZARD, HYPER_BEAM, ICY_WIND, RAIN_DANCE, MUD_SLAP, THIEF, FURY_CUTTER, BUBBLEBEAM, BRICK_BREAK, ROCK_SLIDE, CUT, SURF, STRENGTH, WHIRLPOOL, ICE_BEAM
	; end
