	db 0 ; species ID placeholder
	;BST: 500
	db  90, 130,  75,  55,  75,  75
	evs  0,   2,   0,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, NORMAL ; type
	db 60 ; catch rate
	db 189 ; base exp
	dw URSA_FOSSIL, LEFTOVERS ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/ursaring/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, CURSE, ROLLOUT, ROAR, ROCK_SMASH, SUNNY_DAY, BODY_SLAM, HYPER_BEAM, DIG, MUD_SLAP, ICE_PUNCH, SWIFT, THUNDERPUNCH, THIEF, FIRE_PUNCH, FURY_CUTTER, FIRE_FANG, ICE_FANG, THUNDER_FANG, POISON_FANG, ROCK_TOMB, DRAGON_CLAW, BRICK_BREAK, CUT, STRENGTH
	; end
