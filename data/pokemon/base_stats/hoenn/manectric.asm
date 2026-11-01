	db 0 ; species ID placeholder
	;BST: 475
	db  70,  75,  60, 105, 105,  60
	evs  0,   0,   0,   2,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db ELECTRIC, ELECTRIC ; type
	db 45 ; catch rate
	db 168 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/manectric/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm ZAP_CANNON, HYPER_BEAM, RAIN_DANCE, IRON_TAIL, THIEF, SHOCK_WAVE, STRENGTH, FLASH, THUNDERBOLT
	; end
