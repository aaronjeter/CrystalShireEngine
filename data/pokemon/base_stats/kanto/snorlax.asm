	db 0 ; species ID placeholder
	;BST: 540
	db 160, 110,  65,  30,  65, 110
	evs  2,   0,   0,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, NORMAL ; type
	db 25 ; catch rate
	db 154 ; base exp
	dw LEFTOVERS, LEFTOVERS ; items
	db GENDER_F12_5 ; gender ratio
	db 40 ; step cycles to hatch
	INCBIN "gfx/pokemon/snorlax/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_SLOW ; growth rate
	dn EGG_MONSTER, EGG_MONSTER ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, CURSE, ROLLOUT, ZAP_CANNON, ROCK_SMASH, SUNNY_DAY, BLIZZARD, HYPER_BEAM, ICY_WIND, RAIN_DANCE, SOLARBEAM, THUNDER, PSYCHIC_M, SHADOW_BALL, MUD_SLAP, ICE_PUNCH, SANDSTORM, FIRE_BLAST, THUNDERPUNCH, FIRE_PUNCH, BUBBLEBEAM, ROCK_SLIDE, SURF, STRENGTH, FLAMETHROWER, THUNDERBOLT, ICE_BEAM
	; end
