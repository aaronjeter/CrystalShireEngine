	db 0 ; species ID placeholder
	;BST: 490
	db  95,  80, 105, 100,  40,  70
	evs  0,   0,   2,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, NORMAL ; type
	db 45 ; catch rate
	db 200 ; base exp
	dw MOOMOO_MILK, MOOMOO_MILK ; items
	db GENDER_F100 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/miltank/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_SLOW ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, CURSE, ZAP_CANNON, ROCK_SMASH, SUNNY_DAY, BLIZZARD, HYPER_BEAM, ICY_WIND, RAIN_DANCE, IRON_TAIL, THUNDER, SHADOW_BALL, MUD_SLAP, ICE_PUNCH, SANDSTORM, THUNDERPUNCH, FIRE_PUNCH, ROCK_TOMB, SHOCK_WAVE, BUBBLEBEAM, BRICK_BREAK, ROCK_SLIDE, SURF, STRENGTH, THUNDERBOLT, ICE_BEAM
	; end
