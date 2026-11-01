	db 0 ; species ID placeholder
	;BST: 310
	db  35,  85,  45,  75,  35,  35
	evs  0,   1,   0,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, FLYING ; type
	db 190 ; catch rate
	db 96 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/doduo/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_FLYING, EGG_FLYING ; egg groups

	; tm/hm learnset
	tmhm CURSE, SUNNY_DAY, BODY_SLAM, HYPER_BEAM, MUD_SLAP, SWIFT, THIEF, STEEL_WING, AERIAL_ACE, CUT, FLY
	; end
