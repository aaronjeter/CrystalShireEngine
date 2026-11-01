	db 0 ; species ID placeholder
	;BST: 360
	db  60,  63,  45,  42,  60,  90
	evs  0,   0,   0,   0,   0,   1
	;   hp  atk  def  spd  sat  sdf

	db PSYCHIC_TYPE, GHOST ; type
	db 190 ; catch rate
	db 102 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/drowzee/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_HUMANSHAPE, EGG_HUMANSHAPE ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, HEADBUTT, CURSE, ZAP_CANNON, SUNNY_DAY, HYPER_BEAM, RAIN_DANCE, ICE_PUNCH, THUNDERPUNCH, FIRE_PUNCH, BRICK_BREAK, LIGHT_SCREEN, REFLECT, SHADOW_CLAW, FLASH
	; end
