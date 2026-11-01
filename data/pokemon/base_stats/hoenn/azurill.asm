	db 0 ; species ID placeholder
	;BST: 190
	db  50,  20,  40,  20,  20,  40
	evs  1,   0,   0,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db WATER, FAIRY ; type
	db 150 ; catch rate
	db 33 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_F75 ; gender ratio
	db 10 ; step cycles to hatch
	INCBIN "gfx/pokemon/azurill/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_FAST ; growth rate
	dn EGG_NONE, EGG_NONE ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, HEADBUTT, CURSE, ROCK_SMASH, BODY_SLAM, BLIZZARD, HYPER_BEAM, ICY_WIND, IRON_TAIL, MUD_SLAP, ICE_PUNCH, SWIFT, BRICK_BREAK, SURF, STRENGTH, WHIRLPOOL, WATERFALL, ICE_BEAM
	; end
