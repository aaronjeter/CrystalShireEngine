	db 0 ; species ID placeholder
	;BST: 300
	db  25,  55,  45,  95,  35,  45
	evs  0,   0,   0,   1,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db GROUND, STEEL ; type
	db 255 ; catch rate
	db 81 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/adiglett/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm CURSE, ROCK_SMASH, SUNNY_DAY, HYPER_BEAM, DIG, MUD_SLAP, SLUDGE_BOMB, THIEF, ROCK_TOMB, ANCIENTPOWER, SHADOW_CLAW, CUT
	; end
