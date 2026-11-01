	db 0 ; species ID placeholder
	;BST: 458
	db  73, 115,  60,  90,  60,  60
	evs  0,   2,   0,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, NORMAL ; type
	db 90 ; catch rate
	db 165 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/zangoose/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, ROAR, ROCK_SMASH, SUNNY_DAY, BODY_SLAM, BLIZZARD, RAIN_DANCE, IRON_TAIL, THUNDER, DIG, SHADOW_BALL, FIRE_BLAST, THIEF, ICE_FANG, POISON_FANG, AERIAL_ACE, DRAGON_CLAW, ROCK_SLIDE, POISON_JAB, STRENGTH, FLAMETHROWER, THUNDERBOLT, ICE_BEAM
	; end
