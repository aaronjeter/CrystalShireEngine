	db 0 ; species ID placeholder
	;BST: 314
	db  50,  65,  64,  43,  44,  48
	evs  0,   1,   0,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db WATER, WATER ; type
	db 45 ; catch rate
	db 66 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_F12_5 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/totodile/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_MONSTER, EGG_WATER_1 ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, HEADBUTT, CURSE, ROAR, ROCK_SMASH, BLIZZARD, HYPER_BEAM, ICY_WIND, RAIN_DANCE, IRON_TAIL, EARTHQUAKE, DIG, MUD_SLAP, ICE_PUNCH, FIRE_FANG, THUNDER_FANG, POISON_FANG, DRAGON_CLAW, BRICK_BREAK, ANCIENTPOWER, SHADOW_CLAW, CUT, SURF, STRENGTH, WHIRLPOOL, ICE_BEAM
	; end
