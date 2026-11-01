	db 0 ; species ID placeholder
	;BST: 340
	db  30,  45,  55,  85,  70,  55
	evs  0,   0,   0,   1,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db WATER, WATER ; type
	db 225 ; catch rate
	db 106 ; base exp
	dw STARDUST, STAR_PIECE ; items
	db GENDER_UNKNOWN ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/staryu/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_SLOW ; growth rate
	dn EGG_WATER_3, EGG_WATER_3 ; egg groups

	; tm/hm learnset
	tmhm CURSE, ZAP_CANNON, GRASS_KNOT, BLIZZARD, HYPER_BEAM, ICY_WIND, RAIN_DANCE, THUNDER, SWIFT, DREAM_EATER, SHOCK_WAVE, CALM_MIND, SCALD, ANCIENTPOWER, SURF, FLASH, WHIRLPOOL, WATERFALL
	; end
