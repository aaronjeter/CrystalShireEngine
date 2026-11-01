	db 0 ; species ID placeholder
	;BST: 540
	db 255,  10,  10,  55,  75, 135
	evs  3,   0,   0,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, NORMAL ; type
	db 30 ; catch rate
	db 255 ; base exp
	dw NO_ITEM, LUCKY_EGG ; items
	db GENDER_F100 ; gender ratio
	db 40 ; step cycles to hatch
	INCBIN "gfx/pokemon/blissey/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_FAST ; growth rate
	dn EGG_FAIRY, EGG_FAIRY ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, HEADBUTT, CURSE, ROLLOUT, ZAP_CANNON, ROCK_SMASH, SUNNY_DAY, GRASS_KNOT, BLIZZARD, HYPER_BEAM, ICY_WIND, RAIN_DANCE, SOLARBEAM, IRON_TAIL, THUNDER, PSYCHIC_M, SHADOW_BALL, MUD_SLAP, SANDSTORM, FIRE_BLAST, DREAM_EATER, ROCK_TOMB, SHOCK_WAVE, BUBBLEBEAM, BRICK_BREAK, STRENGTH, FLASH, FLAMETHROWER, THUNDERBOLT, ICE_BEAM
	; end
