	db 0 ; species ID placeholder
	;BST: 550
	db  70, 100, 100,  40, 135, 105
	evs  0,   1,   0,   0,   1,   0
	;   hp  atk  def  spd  sat  sdf

	db FIRE, GROUND ; type
	db 150 ; catch rate
	db 175 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/cameruptx/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm ROAR, ROCK_SMASH, SUNNY_DAY, BODY_SLAM, HYPER_BEAM, SOLARBEAM, DIG, SANDSTORM, WILLOWISP, ANCIENTPOWER, STRENGTH
	; end
