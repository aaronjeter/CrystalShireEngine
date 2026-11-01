	db 0 ; species ID placeholder
	;BST: 550
	db  100,  90, 115,  95,  60,  90
	evs  0,   0,   2,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db STEEL, FLYING ; type
	db 25 ; catch rate
	db 168 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 25 ; step cycles to hatch
	INCBIN "gfx/pokemon/skarmory2/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_SLOW ; growth rate
	dn EGG_FLYING, EGG_FLYING ; egg groups

	; tm/hm learnset
	tmhm SUNNY_DAY, TAUNT, MUD_SLAP, SANDSTORM, SWIFT, THIEF, ROCK_TOMB, AERIAL_ACE, ANCIENTPOWER, CUT, FLY
	; end
