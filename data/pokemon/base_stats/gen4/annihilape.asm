	db 0 ; species ID placeholder
	;BST: 535
	db  110, 115, 80,  90,  50,  90
	evs  0,   1,   0,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db FIGHTING, GHOST ; type
	db 190 ; catch rate
	db 74 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/annihilape/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, HEADBUTT, CURSE, ROCK_SMASH, SUNNY_DAY, IRON_TAIL, THUNDER, DIG, MUD_SLAP, ICE_PUNCH, SWIFT, THUNDERPUNCH, THIEF, FIRE_PUNCH, ROCK_TOMB, BRICK_BREAK, POISON_JAB, STRENGTH, THUNDERBOLT
	; end
