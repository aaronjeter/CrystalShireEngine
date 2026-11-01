	db 0 ; species ID placeholder
	;BST: 450
	db  35,  110,  55, 130,  50,  70
	evs  0,   0,   0,   2,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db GROUND, GROUND ; type
	db 50 ; catch rate
	db 153 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/dugtrio/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm CURSE, ROCK_SMASH, SUNNY_DAY, HYPER_BEAM, DIG, MUD_SLAP, SLUDGE_BOMB, THIEF, ROCK_TOMB, ANCIENTPOWER, SHADOW_CLAW, CUT
	; end
