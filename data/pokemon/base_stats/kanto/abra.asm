	db 0 ; species ID placeholder
	;BST: 310
	db  25,  20,  15,  90, 105,  55	
	evs  0,   0,   0,   0,   1,   0
	;   hp  atk  def  spd  sat  sdf

	db PSYCHIC_TYPE, PSYCHIC_TYPE ; type
	db 200 ; catch rate
	db 73 ; base exp
	dw NO_ITEM, TWISTEDSPOON ; items
	db GENDER_F25 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/abra/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_HUMANSHAPE, EGG_HUMANSHAPE ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, HEADBUTT, CURSE, ZAP_CANNON, SUNNY_DAY, HYPER_BEAM, RAIN_DANCE, DIG, SHADOW_BALL, ICE_PUNCH, THUNDERPUNCH, DREAM_EATER, THIEF, FIRE_PUNCH, SHOCK_WAVE, FLASH
	; end
