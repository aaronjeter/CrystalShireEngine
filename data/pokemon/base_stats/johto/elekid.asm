	db 0 ; species ID placeholder
	;BST: 360
	db  45,  63,  37,  95,  65,  55
	evs  0,   0,   0,   1,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db ELECTRIC, ELECTRIC ; type
	db 45 ; catch rate
	db 106 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_F25 ; gender ratio
	db 25 ; step cycles to hatch
	INCBIN "gfx/pokemon/elekid/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_NONE, EGG_NONE ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, HEADBUTT, CURSE, ZAP_CANNON, ROCK_SMASH, HYPER_BEAM, RAIN_DANCE, IRON_TAIL, EARTHQUAKE, PSYCHIC_M, MUD_SLAP, ICE_PUNCH, SWIFT, DRAIN_PUNCH, THIEF, FIRE_PUNCH, BULK_UP, SHOCK_WAVE, BRICK_BREAK, STRENGTH, FLASH, FLAMETHROWER
	; end
