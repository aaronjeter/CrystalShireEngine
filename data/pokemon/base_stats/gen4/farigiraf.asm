	db 0 ; species ID placeholder
	;BST: 520
	db  120,  90,  70,  60,  110,  70
	evs  0,   0,   0,   0,   2,   0
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, PSYCHIC_TYPE ; type
	db 60 ; catch rate
	db 149 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/farigiraf/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, ROAR, ZAP_CANNON, ROCK_SMASH, SUNNY_DAY, GRASS_KNOT, HYPER_BEAM, IRON_TAIL, THUNDER, EARTHQUAKE, SHADOW_BALL, MUD_SLAP, SWIFT, DREAM_EATER, THIEF, SHOCK_WAVE, STRENGTH, THUNDERBOLT
	; end
