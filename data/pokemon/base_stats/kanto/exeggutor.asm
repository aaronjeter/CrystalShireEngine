	db 0 ; species ID placeholder
	;BST: 530
	db  95,  95,  85,  55, 125,  75
	evs  0,   0,   0,   0,   2,   0
	;   hp  atk  def  spd  sat  sdf

	db GRASS, PSYCHIC_TYPE ; type
	db 45 ; catch rate
	db 212 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/exeggutor/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_PLANT, EGG_PLANT ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, ROLLOUT, SUNNY_DAY, GRASS_KNOT, HYPER_BEAM, SLUDGE_BOMB, DREAM_EATER, THIEF, MAGICAL_LEAF, ANCIENTPOWER, LIGHT_SCREEN, STRENGTH, FLASH
	; end
