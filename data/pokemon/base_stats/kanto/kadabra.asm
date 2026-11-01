	db 0 ; species ID placeholder
	;BST: 400
	db  40,  35,  30, 105, 120,  70
	evs  0,   0,   0,   0,   2,   0
	;   hp  atk  def  spd  sat  sdf

	db PSYCHIC_TYPE, PSYCHIC_TYPE ; type
	db 100 ; catch rate
	db 145 ; base exp
	dw NO_ITEM, TWISTEDSPOON ; items
	db GENDER_F25 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/kadabra/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_HUMANSHAPE, EGG_HUMANSHAPE ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, HEADBUTT, CURSE, ZAP_CANNON, SUNNY_DAY, HYPER_BEAM, RAIN_DANCE, DIG, SHADOW_BALL, ICE_PUNCH, THUNDERPUNCH, DREAM_EATER, THIEF, FIRE_PUNCH, SHOCK_WAVE, FLASH
	; end
