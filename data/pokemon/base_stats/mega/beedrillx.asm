	db 0 ; species ID placeholder
	;BST: 550
	db  90,  140,  60,  120,  60,  80
	evs  0,   2,   0,   0,   0,   1
	;   hp  atk  def  spd  sat  sdf

	db BUG, POISON ; type
	db 45 ; catch rate
	db 159 ; base exp
	dw NO_ITEM, POISON_BARB ; items
	db GENDER_F50 ; gender ratio
	db 15 ; step cycles to hatch
	INCBIN "gfx/pokemon/beedrillx/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_BUG, EGG_BUG ; egg groups

	; tm/hm learnset
	tmhm CURSE, SUNNY_DAY, HYPER_BEAM, GIGA_DRAIN, SLUDGE_BOMB, SWIFT, FURY_CUTTER, AERIAL_ACE, CUT
	; end
