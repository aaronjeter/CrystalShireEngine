	db 0 ; species ID placeholder
	;BST: 360
	db  90,  65,  65,  15,  65,  60
	evs  1,   0,   0,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db WATER, PSYCHIC_TYPE ; type
	db 190 ; catch rate
	db 99 ; base exp
	dw NO_ITEM, KINGS_ROCK ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/slowpoke/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_MONSTER, EGG_WATER_1 ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, HEADBUTT, ZAP_CANNON, ROCK_SMASH, SUNNY_DAY, GRASS_KNOT, BLIZZARD, HYPER_BEAM, ICY_WIND, IRON_TAIL, EARTHQUAKE, DIG, SHADOW_BALL, MUD_SLAP, ICE_PUNCH, FIRE_BLAST, SWIFT, DREAM_EATER, CALM_MIND, SCALD, BUBBLEBEAM, ANCIENTPOWER, LIGHT_SCREEN, REFLECT, SURF, STRENGTH, FLASH, FLAMETHROWER, ICE_BEAM
	; end
