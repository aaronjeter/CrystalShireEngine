	db 0 ; species ID placeholder
	;BST: 510
	db  90,  95,  95,  70,  70,  90
	evs  0,   0,   3,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db WATER, FIGHTING ; type
	db 45 ; catch rate
	db 185 ; base exp
	dw NO_ITEM, KINGS_ROCK ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/poliwrath/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_WATER_1, EGG_WATER_1 ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, HEADBUTT, CURSE, ROCK_SMASH, BLIZZARD, HYPER_BEAM, ICY_WIND, EARTHQUAKE, PSYCHIC_M, MUD_SLAP, ICE_PUNCH, THIEF, ROCK_TOMB, BRICK_BREAK, ROCK_SLIDE, POISON_JAB, SURF, STRENGTH, WHIRLPOOL, WATERFALL, ICE_BEAM
	; end
