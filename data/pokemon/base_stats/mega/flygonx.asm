	db 0 ; species ID placeholder
	;BST: 550
	db  80, 115,  90, 115,  70,  80
	evs  0,   1,   0,   2,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db GROUND, DRAGON ; type
	db 45 ; catch rate
	db 197 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/flygonx/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_BUG, EGG_DRAGON ; egg groups

	; tm/hm learnset
	tmhm ROCK_SMASH, SUNNY_DAY, HYPER_BEAM, GIGA_DRAIN, SOLARBEAM, IRON_TAIL, FIRE_BLAST, THUNDERPUNCH, STEEL_WING, FIRE_PUNCH, AERIAL_ACE, ROCK_SLIDE, EARTHPOWER, FLY, STRENGTH, FLAMETHROWER
	; end
