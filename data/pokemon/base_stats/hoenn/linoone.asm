	db 0 ; species ID placeholder
	;BST: 450
	db  88,  80,  61, 110,  50,  61
	evs  0,   0,   0,   2,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, NORMAL ; type
	db 90 ; catch rate
	db 128 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 15 ; step cycles to hatch
	INCBIN "gfx/pokemon/linoone/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm ROAR, ROCK_SMASH, SUNNY_DAY, BLIZZARD, RAIN_DANCE, IRON_TAIL, THUNDER, DIG, SHADOW_BALL, THIEF, FIRE_FANG, ICE_FANG, THUNDER_FANG, POISON_FANG, BRICK_BREAK, SHADOW_CLAW, CUT, SURF, STRENGTH, THUNDERBOLT, ICE_BEAM
	; end
