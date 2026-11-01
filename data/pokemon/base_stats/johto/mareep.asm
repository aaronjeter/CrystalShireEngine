	db 0 ; species ID placeholder
	;BST: 300
	db  55,  40,  40,  55,  65,  45
	evs  0,   0,   0,   0,   1,   0
	;   hp  atk  def  spd  sat  sdf

	db ELECTRIC, ELECTRIC ; type
	db 235 ; catch rate
	db 59 ; base exp
	dw NO_ITEM, THUNDERSTONE ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/mareep/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_MONSTER, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, HEADBUTT, CURSE, ROCK_SMASH, HYPER_BEAM, RAIN_DANCE, IRON_TAIL, SWIFT, THUNDERPUNCH, FIRE_PUNCH, SHOCK_WAVE, BUBBLEBEAM, BRICK_BREAK, STRENGTH, FLASH, THUNDERBOLT
	; end
