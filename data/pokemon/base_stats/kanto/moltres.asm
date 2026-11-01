	db 0 ; species ID placeholder
	;BST: 580
	db  90, 100,  90,  90, 125,  85
	evs  0,   0,   0,   0,   3,   0
	;   hp  atk  def  spd  sat  sdf

	db FIRE, FLYING ; type
	db 7 ; catch rate
	db 217 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_UNKNOWN ; gender ratio
	db 80 ; step cycles to hatch
	INCBIN "gfx/pokemon/moltres/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_SLOW ; growth rate
	dn EGG_NONE, EGG_NONE ; egg groups

	; tm/hm learnset
	tmhm CURSE, ROAR, ROCK_SMASH, SUNNY_DAY, HYPER_BEAM, RAIN_DANCE, MUD_SLAP, SANDSTORM, SWIFT, STEEL_WING, AERIAL_ACE, ANCIENTPOWER, FLY
	; end
