	db 0 ; species ID placeholder
	;BST: 565
	db  70,  65,  70,  90, 150, 120
	evs  0,   0,   0,   0,   3,   0
	;   hp  atk  def  spd  sat  sdf

	db PSYCHIC_TYPE, FAIRY ; type
	db 45 ; catch rate
	db 208 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/gardevoirx/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_SLOW ; growth rate
	dn EGG_HUMANSHAPE, EGG_INDETERMINATE ; egg groups

	; tm/hm learnset
	tmhm SUNNY_DAY, GRASS_KNOT, HYPER_BEAM, RAIN_DANCE, TAUNT, SHADOW_BALL, THIEF, SHOCK_WAVE, WILLOWISP, FLASH, THUNDERBOLT
	; end
