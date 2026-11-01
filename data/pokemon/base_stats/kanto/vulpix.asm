	db 0 ; species ID placeholder
	;BST: 360
	db  48,  41,  65,  71,  70,  65
	evs  0,   0,   0,   1,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db FIRE, FAIRY ; type
	db 190 ; catch rate
	db 63 ; base exp
	dw ASPEAR_BERRY, LEPPA_BERRY ; items
	db GENDER_F75 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/vulpix/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, ROAR, DARK_PULSE, HYPER_BEAM, IRON_TAIL, DIG, SHADOW_BALL, SWIFT
	; end
