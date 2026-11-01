	db 0 ; species ID placeholder
	;BST: 550
	db  90,  80,  95,  40, 150,  95
	evs  0,   0,   0,   0,   3,   0
	;   hp  atk  def  spd  sat  sdf

	db ELECTRIC, DRAGON ; type
	db 45 ; catch rate
	db 250 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/ampharosx/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_MONSTER, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, HEADBUTT, CURSE, ROCK_SMASH, HYPER_BEAM, RAIN_DANCE, IRON_TAIL, SWIFT, THUNDERPUNCH, FIRE_PUNCH, SHOCK_WAVE, BUBBLEBEAM, BRICK_BREAK, STRENGTH, FLASH, THUNDERBOLT
	; end
