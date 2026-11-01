	db 0 ; species ID placeholder
	;BST: 490
	db  60,  50,  70, 150,  80,  80
	evs  0,   0,   0,   2,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db ELECTRIC, GRASS ; type
	db 60 ; catch rate
	db 150 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_UNKNOWN ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/helectrode/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_MINERAL, EGG_MINERAL ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, ROLLOUT, ZAP_CANNON, GRASS_KNOT, HYPER_BEAM, RAIN_DANCE, TAUNT, SWIFT, SHOCK_WAVE, MAGICAL_LEAF, FLASH
	; end
