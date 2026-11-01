	db 0 ; species ID placeholder

	db  45, 100,  45,  10,  45,  45
	evs  0,   1,   0,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db GROUND, GROUND ; type
	db 255 ; catch rate
	db 73 ; base exp
	dw NO_ITEM, SOFT_SAND ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/trapinch/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_BUG, EGG_DRAGON ; egg groups

	; tm/hm learnset
	tmhm ROCK_SMASH, SUNNY_DAY, HYPER_BEAM, GIGA_DRAIN, SOLARBEAM, IRON_TAIL, FIRE_BLAST, THUNDERPUNCH, STEEL_WING, FIRE_PUNCH, AERIAL_ACE, ROCK_SLIDE, EARTHPOWER, FLY, STRENGTH, FLAMETHROWER
	; end
