	db 0 ; species ID placeholder
	;BST: 305
	db  60,  55,  50,  45,  40,  55
	evs  0,   0,   0,   0,   0,   1
	;   hp  atk  def  spd  sat  sdf

	db BUG, POISON ; type
	db 190 ; catch rate
	db 75 ; base exp
	dw NO_ITEM, SILVER_LEAF ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/venonat/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_BUG, EGG_BUG ; egg groups

	; tm/hm learnset
	tmhm CURSE, SUNNY_DAY, HYPER_BEAM, SOLARBEAM, SHADOW_BALL, SLUDGE_BOMB, SWIFT, THIEF, POISON_FANG, FLASH
	; end
