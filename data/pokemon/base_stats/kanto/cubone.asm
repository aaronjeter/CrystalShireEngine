	db 0 ; species ID placeholder
	;BST: 320
	db  50,  50,  95,  35,  40,  50
	evs  0,   0,   1,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db GROUND, GHOST ; type
	db 190 ; catch rate
	db 87 ; base exp
	dw NO_ITEM, THICK_CLUB ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/cubone/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_MONSTER, EGG_MONSTER ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, ROCK_SMASH, SUNNY_DAY, BLIZZARD, HYPER_BEAM, ICY_WIND, IRON_TAIL, EARTHQUAKE, DIG, SHADOW_BALL, MUD_SLAP, SANDSTORM, FIRE_BLAST, THUNDERPUNCH, THIEF, FIRE_PUNCH, ROCK_TOMB, WILLOWISP, BUBBLEBEAM, BRICK_BREAK, ANCIENTPOWER, ROCK_SLIDE, STRENGTH, FLAMETHROWER, ICE_BEAM
	; end
