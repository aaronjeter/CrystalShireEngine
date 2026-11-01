	db 0 ; species ID placeholder

	db  70,  90,  70,  40,  60, 120
	evs  0,   0,   0,   0,   0,   1
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, NORMAL ; type
	db 200 ; catch rate
	db 132 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/kecleon/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, ROCK_SMASH, SUNNY_DAY, BODY_SLAM, BLIZZARD, RAIN_DANCE, SOLARBEAM, IRON_TAIL, THUNDER, DIG, SHADOW_BALL, ICE_PUNCH, FIRE_BLAST, DRAIN_PUNCH, THUNDERPUNCH, THIEF, FIRE_PUNCH, ROCK_TOMB, SHOCK_WAVE, AERIAL_ACE, BRICK_BREAK, CUT, STRENGTH, FLASH, FLAMETHROWER, THUNDERBOLT, ICE_BEAM
	; end
