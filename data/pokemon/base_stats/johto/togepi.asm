	db 0 ; species ID placeholder
	;BST: 245
	db  35,  20,  65,  20,  40,  65
	evs  0,   0,   0,   0,   0,   1
	;   hp  atk  def  spd  sat  sdf

	db FAIRY, FAIRY ; type
	db 190 ; catch rate
	db 74 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_F12_5 ; gender ratio
	db 10 ; step cycles to hatch
	INCBIN "gfx/pokemon/togepi/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_FAST ; growth rate
	dn EGG_NONE, EGG_NONE ; egg groups

	; tm/hm learnset
	tmhm CURSE, ROLLOUT, ZAP_CANNON, ROCK_SMASH, SUNNY_DAY, GRASS_KNOT, HYPER_BEAM, RAIN_DANCE, SOLARBEAM, PSYCHIC_M, SHADOW_BALL, MUD_SLAP, FIRE_BLAST, SWIFT, DREAM_EATER, STEEL_WING, SHOCK_WAVE, AERIAL_ACE, LIGHT_SCREEN, REFLECT, FLY, FLASH, FLAMETHROWER
	; end
