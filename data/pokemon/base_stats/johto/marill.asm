	db 0 ; species ID placeholder
	;BST: 300
	db  70,  30,  50,  70,  30,  50
	evs  2,   0,   0,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db WATER, FAIRY ; type
	db 190 ; catch rate
	db 58 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/marill/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_FAST ; growth rate
	dn EGG_WATER_1, EGG_FAIRY ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, HEADBUTT, CURSE, ROCK_SMASH, BODY_SLAM, BLIZZARD, HYPER_BEAM, ICY_WIND, IRON_TAIL, MUD_SLAP, ICE_PUNCH, SWIFT, BRICK_BREAK, SURF, STRENGTH, WHIRLPOOL, WATERFALL, ICE_BEAM
	; end
