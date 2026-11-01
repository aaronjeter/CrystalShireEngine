	db 0 ; species ID placeholder
	;BST: 515
	db  75,  65,  60,  105,  105,  105
	evs  0,   0,   0,   0,   0,   1
	;   hp  atk  def  spd  sat  sdf

	db GHOST, GHOST ; type
	db 45 ; catch rate
	db 173 ; base exp
	dw NO_ITEM, SPELL_TAG ; items
	db GENDER_F50 ; gender ratio
	db 25 ; step cycles to hatch
	INCBIN "gfx/pokemon/mismagius/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_FAST ; growth rate
	dn EGG_INDETERMINATE, EGG_INDETERMINATE ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, ZAP_CANNON, DARK_PULSE, SUNNY_DAY, GRASS_KNOT, ICY_WIND, RAIN_DANCE, THUNDER, PSYCHIC_M, SWIFT, DREAM_EATER, THIEF, SHOCK_WAVE, FLASH, THUNDERBOLT
	; end
