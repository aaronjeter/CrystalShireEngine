	db 0 ; species ID placeholder
	;BST: 220
	db  40,  30,  30,  30,  40,  50
	evs  0,   0,   0,   0,   0,   1
	;   hp  atk  def  spd  sat  sdf

	db WATER, GRASS ; type
	db 255 ; catch rate
	db 74 ; base exp
	dw NO_ITEM, WATER_STONE ; items
	db GENDER_F50 ; gender ratio
	db 15 ; step cycles to hatch
	INCBIN "gfx/pokemon/lotad/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_WATER_1, EGG_PLANT ; egg groups

	; tm/hm learnset
	tmhm ROCK_SMASH, GRASS_KNOT, BLIZZARD, HYPER_BEAM, ICY_WIND, ICE_PUNCH, THUNDERPUNCH, THIEF, FIRE_PUNCH, SCALD, BRICK_BREAK, SURF, STRENGTH, FLASH, WATERFALL
	; end
