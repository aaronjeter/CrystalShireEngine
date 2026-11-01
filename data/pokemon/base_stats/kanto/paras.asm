	db 0 ; species ID placeholder
	;BST: 300
	db  50,  70,  55,  25,  45,  55
	evs  0,   1,   0,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db BUG, GRASS ; type
	db 190 ; catch rate
	db 70 ; base exp
	dw TINYMUSHROOM, BIG_MUSHROOM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/paras/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_BUG, EGG_PLANT ; egg groups

	; tm/hm learnset
	tmhm ROCK_SMASH, SUNNY_DAY, HYPER_BEAM, SOLARBEAM, DIG, SLUDGE_BOMB, THIEF, FURY_CUTTER, POISON_JAB, CUT, FLASH
	; end
