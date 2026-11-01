	db 0 ; species ID placeholder
	;BST: 460
	db  40,  45,  65,  90, 100, 120
	evs  0,   0,   0,   0,   0,   2
	;   hp  atk  def  spd  sat  sdf

	db PSYCHIC_TYPE, FAIRY ; type
	db 45 ; catch rate
	db 136 ; base exp
	dw NO_ITEM, LEPPA_BERRY ; items
	db GENDER_F50 ; gender ratio
	db 25 ; step cycles to hatch
	INCBIN "gfx/pokemon/mr__mime/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_HUMANSHAPE, EGG_HUMANSHAPE ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, HEADBUTT, CURSE, ZAP_CANNON, SUNNY_DAY, HYPER_BEAM, TAUNT, SOLARBEAM, THUNDER, SHADOW_BALL, MUD_SLAP, ICE_PUNCH, SWIFT, THUNDERPUNCH, DREAM_EATER, THIEF, FIRE_PUNCH, SHOCK_WAVE, FLASH, THUNDERBOLT
	; end
