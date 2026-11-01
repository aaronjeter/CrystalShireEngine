	db 0 ; species ID placeholder
	;BST: 450
	db  100,  76,  74,  90,  45,  65
	evs  0,   0,   0,   2,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, NORMAL ; type
	db 90 ; catch rate
	db 116 ; base exp
	dw ORAN_BERRY, SITRUS_BERRY ; items
	db GENDER_F50 ; gender ratio
	db 15 ; step cycles to hatch
	INCBIN "gfx/pokemon/furret/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, HEADBUTT, CURSE, ROLLOUT, SUNNY_DAY, BODY_SLAM, IRON_TAIL, DIG, SHADOW_BALL, MUD_SLAP, ICE_PUNCH, SWIFT, THUNDERPUNCH, THIEF, FIRE_PUNCH, POISON_FANG, DRAGON_CLAW, BRICK_BREAK, CUT, SURF, STRENGTH
	; end
