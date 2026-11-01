	db 0 ; species ID placeholder
	;BST: 450
	db  70,  60,  75,  65, 100,  80
	evs  0,   0,   0,   0,   2,   0
	;   hp  atk  def  spd  sat  sdf

	db GRASS, POISON ; type
	db 150 ; catch rate
	db 152 ; base exp
	dw LUM_BERRY, POISON_BARB ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/roselia/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_FAIRY, EGG_PLANT ; egg groups

	; tm/hm learnset
	tmhm SUNNY_DAY, GRASS_KNOT, HYPER_BEAM, SLUDGE_BOMB, CUT, FLASH
	; end
