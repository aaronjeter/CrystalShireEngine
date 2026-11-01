	db 0 ; species ID placeholder
	;BST: 550
	db  95,  65, 150,  40, 120,  80
	evs  0,   0,   2,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db WATER, PSYCHIC_TYPE ; type
	db 75 ; catch rate
	db 164 ; base exp
	dw NO_ITEM, KINGS_ROCK ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/slowbrox/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_MONSTER, EGG_WATER_1 ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, HEADBUTT, ZAP_CANNON, ROCK_SMASH, SUNNY_DAY, GRASS_KNOT, BLIZZARD, HYPER_BEAM, ICY_WIND, IRON_TAIL, EARTHQUAKE, DIG, SHADOW_BALL, MUD_SLAP, ICE_PUNCH, FIRE_BLAST, SWIFT, DREAM_EATER, CALM_MIND, SCALD, BUBBLEBEAM, ANCIENTPOWER, LIGHT_SCREEN, REFLECT, SURF, STRENGTH, FLASH, FLAMETHROWER, ICE_BEAM
	; end
