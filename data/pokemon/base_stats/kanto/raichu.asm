	db 0 ; species ID placeholder
	;BST: 485
	db  60,  90,  55, 110,  90,  80
	evs  0,   0,   0,   3,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db ELECTRIC, ELECTRIC ; type
	db 75 ; catch rate
	db 122 ; base exp
	dw NO_ITEM, ORAN_BERRY ; items
	db GENDER_F50 ; gender ratio
	db 10 ; step cycles to hatch
	INCBIN "gfx/pokemon/raichu/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_FAIRY ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, HEADBUTT, CURSE, ROLLOUT, ZAP_CANNON, HYPER_BEAM, IRON_TAIL, DIG, MUD_SLAP, SWIFT, THUNDERPUNCH, THIEF, SHOCK_WAVE, CALM_MIND, BRICK_BREAK, REFLECT, STRENGTH, FLASH
	; end
