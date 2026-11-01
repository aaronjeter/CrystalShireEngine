	db 0 ; species ID placeholder
	;BST: 680
	db 106, 130,  90,  90, 110, 154
	evs  0,   0,   0,   0,   0,   3
	;   hp  atk  def  spd  sat  sdf

	db FIRE, FLYING ; type
	db 7 ; catch rate
	db 220 ; base exp
	dw SACRED_ASH, SACRED_ASH ; items
	db GENDER_UNKNOWN ; gender ratio
	db 120 ; step cycles to hatch
	INCBIN "gfx/pokemon/ho_oh/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_SLOW ; growth rate
	dn EGG_NONE, EGG_NONE ; egg groups

	; tm/hm learnset
	tmhm CURSE, ROAR, ZAP_CANNON, ROCK_SMASH, HYPER_BEAM, RAIN_DANCE, GIGA_DRAIN, SOLARBEAM, DRAGONBREATH, THUNDER, EARTHQUAKE, PSYCHIC_M, SHADOW_BALL, MUD_SLAP, SANDSTORM, SWIFT, DREAM_EATER, STEEL_WING, WILLOWISP, AERIAL_ACE, ROCK_SLIDE, FLY, STRENGTH, FLASH, FLAMETHROWER, THUNDERBOLT
	; end
