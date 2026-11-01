	db 0 ; species ID placeholder
	;BST: 515
	db  85, 108,  66, 120,  60,  76
	evs  0,   0,   0,   2,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, NORMAL ; type
	db 45 ; catch rate
	db 94 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/ambipom/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_FAST ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, HEADBUTT, CURSE, ZAP_CANNON, ROCK_SMASH, SUNNY_DAY, BODY_SLAM, IRON_TAIL, THUNDER, SHADOW_BALL, MUD_SLAP, ICE_PUNCH, SWIFT, THUNDERPUNCH, DREAM_EATER, THIEF, FIRE_PUNCH, FURY_CUTTER, ROCK_TOMB, BULK_UP, BUBBLEBEAM, BRICK_BREAK, SHADOW_CLAW, CUT, STRENGTH, THUNDERBOLT
	; end
