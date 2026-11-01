	db 0 ; species ID placeholder
	;BST: 500
	db  55,  50,  45, 120, 135,  95
	evs  0,   0,   0,   0,   3,   0
	;   hp  atk  def  spd  sat  sdf

	db PSYCHIC_TYPE, PSYCHIC_TYPE ; type
	db 50 ; catch rate
	db 186 ; base exp
	dw NO_ITEM, TWISTEDSPOON ; items
	db GENDER_F25 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/alakazam/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_HUMANSHAPE, EGG_HUMANSHAPE ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, HEADBUTT, CURSE, ZAP_CANNON, SUNNY_DAY, HYPER_BEAM, RAIN_DANCE, DIG, SHADOW_BALL, ICE_PUNCH, THUNDERPUNCH, DREAM_EATER, THIEF, FIRE_PUNCH, SHOCK_WAVE, FLASH
	; end
