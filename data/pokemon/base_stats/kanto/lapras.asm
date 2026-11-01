	db 0 ; species ID placeholder
	;BST: 535
	db 130,  85,  80,  60,  85,  95
	evs  2,   0,   0,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db WATER, ICE ; type
	db 45 ; catch rate
	db 219 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 40 ; step cycles to hatch
	INCBIN "gfx/pokemon/lapras/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_SLOW ; growth rate
	dn EGG_MONSTER, EGG_WATER_1 ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, ZAP_CANNON, ROCK_SMASH, HYPER_BEAM, ICY_WIND, RAIN_DANCE, IRON_TAIL, THUNDER, PSYCHIC_M, HYPER_VOICE, DREAM_EATER, SHOCK_WAVE, SCALD, DRAGON_CLAW, ANCIENTPOWER, SURF, STRENGTH, WHIRLPOOL, THUNDERBOLT
	; end
