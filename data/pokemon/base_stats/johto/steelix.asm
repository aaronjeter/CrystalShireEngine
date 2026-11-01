	db 0 ; species ID placeholder
	;BST: 510
	db  75,  85, 200,  30,  55,  65
	evs  0,   0,   2,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db STEEL, GROUND ; type
	db 25 ; catch rate
	db 196 ; base exp
	dw NO_ITEM, METAL_COAT ; items
	db GENDER_F50 ; gender ratio
	db 25 ; step cycles to hatch
	INCBIN "gfx/pokemon/steelix/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_MINERAL, EGG_MINERAL ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, ROAR, ROCK_SMASH, SUNNY_DAY, HYPER_BEAM, DRAGONBREATH, DIG, MUD_SLAP, FIRE_FANG, ICE_FANG, THUNDER_FANG, ANCIENTPOWER, CUT, STRENGTH
	; end
