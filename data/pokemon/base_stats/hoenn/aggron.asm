	db 0 ; species ID placeholder
	;BST: 530
	db  70, 110, 180,  50,  60,  60
	evs  0,   0,   3,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db STEEL, STEEL ; type
	db 45 ; catch rate
	db 205 ; base exp
	dw NO_ITEM, METAL_COAT ; items
	db GENDER_F50 ; gender ratio
	db 35 ; step cycles to hatch
	INCBIN "gfx/pokemon/aggron/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_MONSTER, EGG_MONSTER ; egg groups

	; tm/hm learnset
	tmhm ROCK_SMASH, SUNNY_DAY, BODY_SLAM, BLIZZARD, HYPER_BEAM, RAIN_DANCE, SOLARBEAM, THUNDER, DIG, ICE_PUNCH, SANDSTORM, FIRE_BLAST, THUNDERPUNCH, FIRE_PUNCH, DRAGON_CLAW, SHADOW_CLAW, CUT, SURF, STRENGTH, FLAMETHROWER, THUNDERBOLT, ICE_BEAM
	; end
