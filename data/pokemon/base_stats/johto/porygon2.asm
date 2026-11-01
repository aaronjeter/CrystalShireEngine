	db 0 ; species ID placeholder
	;BST: 515
	db  85,  80,  90,  60, 105,  95
	evs  0,   0,   0,   0,   2,   0
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, ELECTRIC ; type
	db 45 ; catch rate
	db 180 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_UNKNOWN ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/porygon2/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_MINERAL, EGG_MINERAL ; egg groups

	; tm/hm learnset
	tmhm CURSE, DARK_PULSE, SUNNY_DAY, BLIZZARD, ICY_WIND, RAIN_DANCE, IRON_TAIL, THUNDER, PSYCHIC_M, SHADOW_BALL, SWIFT, DREAM_EATER, THIEF, FLASH, ICE_BEAM
	; end
