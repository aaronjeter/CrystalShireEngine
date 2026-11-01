	db 0 ; species ID placeholder
	;BST: 360
	db  80,  85,  95,  25,  30,  45
	evs  0,   0,   1,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db DRAGON, ROCK ; type
	db 120 ; catch rate
	db 135 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/rhyhorn/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_SLOW ; growth rate
	dn EGG_MONSTER, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, HEADBUTT, CURSE, ROLLOUT, ROCK_SMASH, SUNNY_DAY, BLIZZARD, HYPER_BEAM, ICY_WIND, IRON_TAIL, THUNDER, DIG, MUD_SLAP, SANDSTORM, FIRE_BLAST, THUNDERPUNCH, FIRE_PUNCH, FIRE_FANG, ICE_FANG, THUNDER_FANG, BUBBLEBEAM, BRICK_BREAK, POISON_JAB, SHADOW_CLAW, SURF, STRENGTH, FLAMETHROWER, THUNDERBOLT, ICE_BEAM
	; end
