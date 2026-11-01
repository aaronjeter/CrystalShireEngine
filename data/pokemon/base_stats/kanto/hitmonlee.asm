	db 0 ; species ID placeholder
	;BST: 455
	db  50, 120,  53,  87,  35, 110
	evs  0,   2,   0,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db FIGHTING, FIGHTING ; type
	db 45 ; catch rate
	db 139 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_F0 ; gender ratio
	db 25 ; step cycles to hatch
	INCBIN "gfx/pokemon/hitmonlee/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_HUMANSHAPE, EGG_HUMANSHAPE ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, HEADBUTT, CURSE, SUNNY_DAY, MUD_SLAP, SWIFT, DRAIN_PUNCH, THIEF, ROCK_TOMB, BULK_UP, BRICK_BREAK, ROCK_SLIDE, POISON_JAB, STRENGTH
	; end
