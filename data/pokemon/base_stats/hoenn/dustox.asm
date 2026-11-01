	db 0 ; species ID placeholder
	;BST: 450
	db  75,  75,  70,  75,  50,  105
	evs  0,   0,   0,   0,   0,   3
	;   hp  atk  def  spd  sat  sdf

	db BUG, POISON ; type
	db 45 ; catch rate
	db 161 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 15 ; step cycles to hatch
	INCBIN "gfx/pokemon/dustox/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_BUG, EGG_BUG ; egg groups

	; tm/hm learnset
	tmhm SUNNY_DAY, HYPER_BEAM, GIGA_DRAIN, SOLARBEAM, SHADOW_BALL, SLUDGE_BOMB, THIEF, FLASH, AERIAL_ACE, MAGICAL_LEAF
	; end
