	db 0 ; species ID placeholder

	db  75,  50,  70,  65, 100,  90
	evs  0,   0,   0,   0,   1,   1
	;   hp  atk  def  spd  sat  sdf

	db PSYCHIC_TYPE, PSYCHIC_TYPE ; type
	db 45 ; catch rate
	db 147 ; base exp
	dw NO_ITEM, AMULET_COIN ; items
	db GENDER_F50 ; gender ratio
	db 25 ; step cycles to hatch
	INCBIN "gfx/pokemon/chimecho/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_FAST ; growth rate
	dn EGG_INDETERMINATE, EGG_INDETERMINATE ; egg groups

	; tm/hm learnset
	tmhm SUNNY_DAY, GRASS_KNOT, RAIN_DANCE, TAUNT, SHOCK_WAVE, FLASH
	; end
