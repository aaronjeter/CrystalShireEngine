	db 0 ; species ID placeholder
	;BST: 325
	db  80,  80,  50,  25,  40,  50
	evs  1,   0,   0,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db POISON, POISON ; type
	db 190 ; catch rate
	db 90 ; base exp
	dw NO_ITEM, NUGGET ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/grimer/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_INDETERMINATE, EGG_INDETERMINATE ; egg groups

	; tm/hm learnset
	tmhm CURSE, ZAP_CANNON, SUNNY_DAY, HYPER_BEAM, GIGA_DRAIN, TAUNT, THUNDER, MUD_SLAP, ICE_PUNCH, SLUDGE_BOMB, FIRE_BLAST, THUNDERPUNCH, THIEF, FIRE_PUNCH, POISON_FANG, ROCK_TOMB, BRICK_BREAK, ROCK_SLIDE, FLAMETHROWER, THUNDERBOLT
	; end
