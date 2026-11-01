	db 0 ; species ID placeholder
	;BST: 520
	db  60,  75,  85, 115, 100,  85
	evs  0,   0,   0,   2,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db WATER, PSYCHIC_TYPE ; type
	db 60 ; catch rate
	db 207 ; base exp
	dw STARDUST, STAR_PIECE ; items
	db GENDER_UNKNOWN ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/starmie/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_SLOW ; growth rate
	dn EGG_WATER_3, EGG_WATER_3 ; egg groups

	; tm/hm learnset
	tmhm CURSE, ZAP_CANNON, GRASS_KNOT, BLIZZARD, HYPER_BEAM, ICY_WIND, RAIN_DANCE, THUNDER, SWIFT, DREAM_EATER, SHOCK_WAVE, CALM_MIND, SCALD, ANCIENTPOWER, SURF, FLASH, WHIRLPOOL, WATERFALL
	; end
