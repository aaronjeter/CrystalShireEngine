	db 0 ; species ID placeholder
	;BST: 500
	db 105, 105,  75,  50,  65, 100
	evs  1,   1,   0,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db POISON, DARK ; type
	db 75 ; catch rate
	db 175 ; base exp
	dw NO_ITEM, NUGGET ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/amuk/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_INDETERMINATE, EGG_INDETERMINATE ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, ZAP_CANNON, SUNNY_DAY, HYPER_BEAM, GIGA_DRAIN, TAUNT, THUNDER, MUD_SLAP, ICE_PUNCH, FIRE_BLAST, DRAIN_PUNCH, THUNDERPUNCH, THIEF, FIRE_PUNCH, BRICK_BREAK, ROCK_SLIDE, FLAMETHROWER, THUNDERBOLT
	; end
