	db 0 ; species ID placeholder
	;BST: 480
	db  50, 105, 125,  50,  55,  95
	evs  0,   1,   1,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db STEEL, FAIRY ; type
	db 45 ; catch rate
	db 98 ; base exp
	dw NO_ITEM, PINK_BOW ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/mawile/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_FAST ; growth rate
	dn EGG_GROUND, EGG_FAIRY ; egg groups

	; tm/hm learnset
	tmhm ROCK_SMASH, SUNNY_DAY, HYPER_BEAM, RAIN_DANCE, SOLARBEAM, ICE_PUNCH, SLUDGE_BOMB, SANDSTORM, FIRE_BLAST, THUNDERPUNCH, FIRE_PUNCH, BRICK_BREAK, STRENGTH, FLAMETHROWER, ICE_BEAM
	; end
