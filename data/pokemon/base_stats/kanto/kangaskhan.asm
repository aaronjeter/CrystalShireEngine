	db 0 ; species ID placeholder
	;BST: 490
	db 105,  95,  80,  90,  40,  80
	evs  2,   0,   0,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, NORMAL ; type
	db 45 ; catch rate
	db 175 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_F100 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/kangaskhan/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_MONSTER, EGG_MONSTER ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, ROAR, ZAP_CANNON, ROCK_SMASH, SUNNY_DAY, BODY_SLAM, BLIZZARD, HYPER_BEAM, ICY_WIND, RAIN_DANCE, IRON_TAIL, THUNDER, EARTHQUAKE, DIG, SHADOW_BALL, MUD_SLAP, ICE_PUNCH, SANDSTORM, FIRE_BLAST, THUNDERPUNCH, FIRE_PUNCH, BUBBLEBEAM, DRAGON_CLAW, BRICK_BREAK, ROCK_SLIDE, SHADOW_CLAW, SURF, STRENGTH, FLAMETHROWER, THUNDERBOLT, ICE_BEAM
	; end
