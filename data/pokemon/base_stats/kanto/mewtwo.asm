	db 0 ; species ID placeholder
	;BST: 680
	db 106, 110,  90, 130, 154,  90
	evs  0,   0,   0,   0,   3,   0
	;   hp  atk  def  spd  sat  sdf

	db PSYCHIC_TYPE, PSYCHIC_TYPE ; type
	db 3 ; catch rate
	db 220 ; base exp
	dw NO_ITEM, BERSERK_GENE ; items
	db GENDER_UNKNOWN ; gender ratio
	db 120 ; step cycles to hatch
	INCBIN "gfx/pokemon/mewtwo/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_SLOW ; growth rate
	dn EGG_NONE, EGG_NONE ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, HEADBUTT, CURSE, ZAP_CANNON, ROCK_SMASH, SUNNY_DAY, GRASS_KNOT, BLIZZARD, ICY_WIND, RAIN_DANCE, TAUNT, SOLARBEAM, IRON_TAIL, THUNDER, EARTHQUAKE, MUD_SLAP, ICE_PUNCH, FIRE_BLAST, SWIFT, THUNDERPUNCH, DREAM_EATER, ZEN_HEADBUTT, FIRE_PUNCH, CALM_MIND, BRICK_BREAK, LIGHT_SCREEN, REFLECT, ROCK_SLIDE, STRENGTH, FLASH, FLAMETHROWER, THUNDERBOLT, ICE_BEAM
	; end
