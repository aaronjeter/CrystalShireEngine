	db 0 ; species ID placeholder
	;BST: 450
	db  65,  80,  60, 115,  65,  65
	evs  0,   0,   0,   2,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, DARK ; type
	db 90 ; catch rate
	db 148 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/persian/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, ROAR, ZAP_CANNON, DARK_PULSE, SUNNY_DAY, BODY_SLAM, HYPER_BEAM, ICY_WIND, IRON_TAIL, THUNDER, SHADOW_BALL, MUD_SLAP, HYPER_VOICE, SWIFT, DREAM_EATER, THIEF, AERIAL_ACE, SHADOW_CLAW, CUT, THUNDERBOLT
	; end
