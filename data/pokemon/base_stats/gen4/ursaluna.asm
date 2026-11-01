	db 0 ; species ID placeholder
	;BST: 550
	db  130, 140,  105,  50,  45,  80
	evs  0,   2,   0,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db GROUND, NORMAL ; type
	db 60 ; catch rate
	db 189 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/ursaluna/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, CURSE, ROLLOUT, ROAR, ROCK_SMASH, SUNNY_DAY, BODY_SLAM, HYPER_BEAM, DIG, MUD_SLAP, ICE_PUNCH, SWIFT, THUNDERPUNCH, THIEF, FIRE_PUNCH, FURY_CUTTER, FIRE_FANG, ICE_FANG, THUNDER_FANG, POISON_FANG, ROCK_TOMB, DRAGON_CLAW, BRICK_BREAK, CUT, STRENGTH
	; end
