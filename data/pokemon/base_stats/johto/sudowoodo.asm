	db 0 ; species ID placeholder
	;BST: 450
	db  70, 100, 115,  70,  30,  65
	evs  0,   0,   2,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db ROCK, ROCK ; type
	db 65 ; catch rate
	db 135 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/sudowoodo/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_MINERAL, EGG_MINERAL ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, HEADBUTT, ROCK_SMASH, SUNNY_DAY, EARTHQUAKE, DIG, MUD_SLAP, ICE_PUNCH, THUNDERPUNCH, THIEF, FIRE_PUNCH, BRICK_BREAK, ANCIENTPOWER, STRENGTH
	; end
