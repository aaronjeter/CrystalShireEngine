	db 0 ; species ID placeholder
	;BST: 470
	db 100, 100,  80,  50,  60,  80
	evs  3,   0,   0,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db WATER, FAIRY ; type
	db 75 ; catch rate
	db 153 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/azumarill/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_FAST ; growth rate
	dn EGG_WATER_1, EGG_FAIRY ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, HEADBUTT, CURSE, ROCK_SMASH, BODY_SLAM, BLIZZARD, HYPER_BEAM, ICY_WIND, IRON_TAIL, MUD_SLAP, ICE_PUNCH, SWIFT, BRICK_BREAK, SURF, STRENGTH, WHIRLPOOL, WATERFALL, ICE_BEAM
	; end
