	db 0 ; species ID placeholder
	;BST: 550
	db  75, 117,  78,  65, 126,  89
	evs  0,   3,   0,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db GRASS, POISON ; type
	db 45 ; catch rate
	db 191 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/victreebelx/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_PLANT, EGG_PLANT ; egg groups

	; tm/hm learnset
	tmhm CURSE, GRASS_KNOT, HYPER_BEAM, GIGA_DRAIN, SLUDGE_BOMB, POISON_FANG, MAGICAL_LEAF, SLUDGE_WAVE, CUT, FLASH
	; end
