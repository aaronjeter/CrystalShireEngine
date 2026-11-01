	db 0 ; species ID placeholder
	;BST: 450
	db  115,  75,  75,  30,  80,  75
	evs  2,   0,   0,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, NORMAL ; type
	db 45 ; catch rate
	db 127 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/lickitung/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_MONSTER, EGG_MONSTER ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, HEADBUTT, CURSE, ROAR, ROCK_SMASH, SUNNY_DAY, BLIZZARD, HYPER_BEAM, ICY_WIND, RAIN_DANCE, IRON_TAIL, THUNDER, EARTHQUAKE, SHADOW_BALL, MUD_SLAP, ICE_PUNCH, HYPER_VOICE, SANDSTORM, FIRE_BLAST, THUNDERPUNCH, DREAM_EATER, ZEN_HEADBUTT, THIEF, FIRE_PUNCH, SHOCK_WAVE, BUBBLEBEAM, BRICK_BREAK, ROCK_SLIDE, CUT, SURF, STRENGTH, FLAMETHROWER, THUNDERBOLT, ICE_BEAM
	; end
