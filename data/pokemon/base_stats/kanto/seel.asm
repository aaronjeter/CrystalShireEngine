	db 0 ; species ID placeholder
	;BST: 325
	db  65,  45,  55,  45,  45,  70
	evs  0,   0,   0,   0,   0,   1
	;   hp  atk  def  spd  sat  sdf

	db WATER, WATER ; type
	db 190 ; catch rate
	db 100 ; base exp
	dw NO_ITEM, FIN_FOSSIL ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/seel/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_WATER_1, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm CURSE, BODY_SLAM, HYPER_BEAM, ICY_WIND, RAIN_DANCE, HAIL, ICE_FANG, SCALD, SURF, WHIRLPOOL, WATERFALL
	; end
