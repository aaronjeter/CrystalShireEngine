	db 0 ; species ID placeholder

	db  50,  65,  45,  95,  85,  65
	evs  0,   0,   0,   2,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db GRASS, GRASS ; type
	db 45 ; catch rate
	db 141 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_F12_5 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/hoenn/grovyle/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_MONSTER, EGG_DRAGON ; egg groups

	; tm/hm learnset
	tmhm TOXIC, HIDDEN_POWER, SUNNY_DAY, PROTECT, GIGA_DRAIN, FRUSTRATION, SOLARBEAM, IRON_TAIL, RETURN, DIG, REST, ATTRACT, CUT, STRENGTH, FLASH, ROCK_SMASH
	; end
