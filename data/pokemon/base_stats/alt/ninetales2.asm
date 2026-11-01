	db 0 ; species ID placeholder
	;BST: 525
	db  93,  67,  75, 109,  81, 100
	evs  0,   0,   0,   1,   0,   1
	;   hp  atk  def  spd  sat  sdf

	db WATER, FIRE ; type
	db 75 ; catch rate
	db 178 ; base exp
	dw ASPEAR_BERRY, ASPEAR_BERRY ; items
	db GENDER_F75 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/ninetales2/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, ROAR, DARK_PULSE, HYPER_BEAM, IRON_TAIL, DIG, SHADOW_BALL, SWIFT, SURF
	; end
