	db 0 ; species ID placeholder
	;BST: 295
	db  40,  45,  40,  65,  65,  40
	evs  0,   0,   0,   1,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db ELECTRIC, ELECTRIC ; type
	db 120 ; catch rate
	db 104 ; base exp
	dw NO_ITEM, MAGNET ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/electrike/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm ZAP_CANNON, HYPER_BEAM, RAIN_DANCE, IRON_TAIL, THIEF, SHOCK_WAVE, STRENGTH, FLASH, THUNDERBOLT
	; end
