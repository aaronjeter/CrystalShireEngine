	db 0 ; species ID placeholder
	;BST: 530
	db  95, 115,  90,  60,  80,  90
	evs  0,   3,   0,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db FIRE, DARK ; type
	db 45 ; catch rate
	db 239 ; base exp
	dw ASPEAR_BERRY, ASPEAR_BERRY ; items
	db GENDER_F25 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/incineroar/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, ROAR, ROCK_SMASH, SUNNY_DAY, BODY_SLAM, HYPER_BEAM, TAUNT, IRON_TAIL, EARTHQUAKE, DIG, FIRE_BLAST, SWIFT, DRAIN_PUNCH, THUNDERPUNCH, THIEF, FIRE_PUNCH, THUNDER_FANG, WILLOWISP, SHADOW_CLAW, FLAMETHROWER
	; end
