	db 0 ; species ID placeholder
	;BST: 505
	db  100, 125, 52,  71,  105,  52
	evs  0,   0,   0,   1,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db DARK, FLYING ; type
	db 30 ; catch rate
	db 107 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/honchkrow/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_FLYING, EGG_FLYING ; egg groups

	; tm/hm learnset
	tmhm CURSE, SUNNY_DAY, HYPER_BEAM, ICY_WIND, SHADOW_BALL, MUD_SLAP, SWIFT, DREAM_EATER, THIEF, STEEL_WING, AERIAL_ACE, FLY
	; end
