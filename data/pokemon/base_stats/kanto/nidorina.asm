	db 0 ; species ID placeholder
	;BST: 400
	db  70,  72,  67,  66,  55,  70
	evs  2,   0,   0,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db POISON, POISON ; type
	db 120 ; catch rate
	db 117 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_F100 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/nidorina/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_NONE, EGG_NONE ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, HEADBUTT, CURSE, ROAR, ROCK_SMASH, SUNNY_DAY, BLIZZARD, HYPER_BEAM, ICY_WIND, RAIN_DANCE, IRON_TAIL, THUNDER, DIG, SHADOW_BALL, MUD_SLAP, ICE_PUNCH, SANDSTORM, FIRE_BLAST, THUNDERPUNCH, THIEF, FIRE_PUNCH, SHOCK_WAVE, CALM_MIND, BUBBLEBEAM, DRAGON_CLAW, ROCK_SLIDE, POISON_JAB, SHADOW_CLAW, SURF, STRENGTH, FLAMETHROWER, THUNDERBOLT, ICE_BEAM
	; end
