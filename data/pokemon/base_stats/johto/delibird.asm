	db 0 ; species ID placeholder
	;BST: 450
	db  60,  65,  55,  150,  65,  55
	evs  0,   0,   0,   1,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db ICE, FLYING ; type
	db 45 ; catch rate
	db 183 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/delibird/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_FAST ; growth rate
	dn EGG_WATER_1, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, RAIN_DANCE, MUD_SLAP, ICE_PUNCH, SWIFT, THIEF, AERIAL_ACE, BUBBLEBEAM, BRICK_BREAK, CUT, FLY
	; end
