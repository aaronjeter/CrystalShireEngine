	db 0 ; species ID placeholder
	;BST: 465
	db  70,  70,  115,  60, 130,  90
	evs  0,   0,   0,   0,   2,   0
	;   hp  atk  def  spd  sat  sdf

	db ELECTRIC, STEEL ; type
	db 60 ; catch rate
	db 161 ; base exp
	dw NO_ITEM, METAL_COAT ; items
	db GENDER_UNKNOWN ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/magnezone/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_MINERAL, EGG_MINERAL ; egg groups

	; tm/hm learnset
	tmhm CURSE, ROLLOUT, HYPER_BEAM, RAIN_DANCE, THUNDER, SWIFT, SHOCK_WAVE, FLASH
	; end
