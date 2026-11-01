	db 0 ; species ID placeholder
	;BST: 450
	db  75,  75,  75,  75,  75,  75
	evs  0,   0,   0,   0,   1,   0
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, NORMAL ; type
	db 255 ; catch rate
	db 85 ; base exp
	dw ETHER, QUICK_CLAW ; items
	db GENDER_F50 ; gender ratio
	db 15 ; step cycles to hatch
	INCBIN "gfx/pokemon/spinda/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_FAST ; growth rate
	dn EGG_GROUND, EGG_HUMANSHAPE ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, ROCK_SMASH, SUNNY_DAY, BODY_SLAM, RAIN_DANCE, DIG, PSYCHIC_M, SHADOW_BALL, ICE_PUNCH, HYPER_VOICE, DRAIN_PUNCH, THUNDERPUNCH, THIEF, FIRE_PUNCH, BUBBLEBEAM, BRICK_BREAK, STRENGTH, FLASH
	; end
