	db 0 ; species ID placeholder
	;BST: 390
	db 135, 85,  40,  05,  40, 85
	evs  2,   0,   0,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, NORMAL ; type
	db 50 ; catch rate
	db 94 ; base exp
	dw LEFTOVERS, LEFTOVERS ; items
	db GENDER_F12_5 ; gender ratio
	db 40 ; step cycles to hatch
	INCBIN "gfx/pokemon/munchlax/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_SLOW ; growth rate
	dn EGG_NONE, EGG_NONE ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, CURSE, ROLLOUT, ZAP_CANNON, ROCK_SMASH, SUNNY_DAY, BLIZZARD, HYPER_BEAM, ICY_WIND, RAIN_DANCE, SOLARBEAM, THUNDER, PSYCHIC_M, SHADOW_BALL, MUD_SLAP, ICE_PUNCH, SANDSTORM, FIRE_BLAST, THUNDERPUNCH, FIRE_PUNCH, BUBBLEBEAM, ROCK_SLIDE, SURF, STRENGTH, FLAMETHROWER, THUNDERBOLT, ICE_BEAM
	; end
