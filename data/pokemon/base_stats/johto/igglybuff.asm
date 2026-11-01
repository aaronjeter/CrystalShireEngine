	db 0 ; species ID placeholder
	;BST: 210
	db  90,  30,  15,  15,  40,  20
	evs  1,   0,   0,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, FAIRY ; type
	db 170 ; catch rate
	db 39 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_F75 ; gender ratio
	db 10 ; step cycles to hatch
	INCBIN "gfx/pokemon/igglybuff/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_FAST ; growth rate
	dn EGG_NONE, EGG_NONE ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, HEADBUTT, CURSE, ZAP_CANNON, SUNNY_DAY, BLIZZARD, HYPER_BEAM, RAIN_DANCE, SOLARBEAM, THUNDER, PSYCHIC_M, SHADOW_BALL, MUD_SLAP, ICE_PUNCH, FIRE_BLAST, SWIFT, THUNDERPUNCH, DREAM_EATER, FIRE_PUNCH, SHOCK_WAVE, CALM_MIND, BUBBLEBEAM, BRICK_BREAK, LIGHT_SCREEN, REFLECT, STRENGTH, FLASH, FLAMETHROWER, THUNDERBOLT, ICE_BEAM
	; end
