	db 0 ; species ID placeholder
	;BST: 450
	db  60,  80, 110,  60,  60,  80
	evs  0,   0,   2,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db FIRE, GHOST ; type
	db 75 ; catch rate
	db 149 ; base exp
	dw NO_ITEM, THICK_CLUB ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/amarowak/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_MONSTER, EGG_MONSTER ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, HEADBUTT, ROCK_SMASH, SUNNY_DAY, BLIZZARD, HYPER_BEAM, ICY_WIND, IRON_TAIL, EARTHQUAKE, DIG, SHADOW_BALL, MUD_SLAP, SANDSTORM, FIRE_BLAST, THUNDERPUNCH, THIEF, FIRE_PUNCH, ROCK_TOMB, BRICK_BREAK, ANCIENTPOWER, ROCK_SLIDE, STRENGTH, FLAMETHROWER, ICE_BEAM
	; end
