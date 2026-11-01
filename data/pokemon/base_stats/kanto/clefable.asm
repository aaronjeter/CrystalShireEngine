	db 0 ; species ID placeholder
	;BST: 483
	db  95,  70,  73,  60,  95,  90
	evs  3,   0,   0,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db FAIRY, FAIRY ; type
	db 25 ; catch rate
	db 129 ; base exp
	dw LEPPA_BERRY, MOON_STONE ; items
	db GENDER_F75 ; gender ratio
	db 10 ; step cycles to hatch
	INCBIN "gfx/pokemon/clefable/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_FAST ; growth rate
	dn EGG_FAIRY, EGG_FAIRY ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, HEADBUTT, CURSE, ROLLOUT, ZAP_CANNON, SUNNY_DAY, BLIZZARD, HYPER_BEAM, ICY_WIND, RAIN_DANCE, SOLARBEAM, IRON_TAIL, THUNDER, PSYCHIC_M, SHADOW_BALL, MUD_SLAP, ICE_PUNCH, FIRE_BLAST, SWIFT, THUNDERPUNCH, DREAM_EATER, FIRE_PUNCH, SHOCK_WAVE, BUBBLEBEAM, BRICK_BREAK, STRENGTH, FLASH, FLAMETHROWER, THUNDERBOLT, ICE_BEAM
	; end
