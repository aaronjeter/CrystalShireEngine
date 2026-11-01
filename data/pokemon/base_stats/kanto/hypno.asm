	db 0 ; species ID placeholder
	;BST:483
	db  85,  73,  70,  67,  73, 115
	evs  0,   0,   0,   0,   0,   2
	;   hp  atk  def  spd  sat  sdf

	db PSYCHIC_TYPE, GHOST ; type
	db 75 ; catch rate
	db 165 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/hypno/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_HUMANSHAPE, EGG_HUMANSHAPE ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, HEADBUTT, CURSE, ZAP_CANNON, SUNNY_DAY, HYPER_BEAM, RAIN_DANCE, ICE_PUNCH, THUNDERPUNCH, FIRE_PUNCH, BRICK_BREAK, LIGHT_SCREEN, REFLECT, SHADOW_CLAW, FLASH
	; end
