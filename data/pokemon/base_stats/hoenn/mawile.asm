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
	tmhm TOXIC, HIDDEN_POWER, SUNNY_DAY, ICE_BEAM, HYPER_BEAM, PROTECT, RAIN_DANCE, FRUSTRATION, SOLARBEAM, RETURN, DOUBLE_TEAM, FLAMETHROWER, SLUDGE_BOMB, SANDSTORM, FIRE_BLAST, REST, ATTRACT, STRENGTH, ROCK_SMASH, ICE_PUNCH, BRICK_BREAK, ANCIENTPOWER
	; end
