	db 0 ; species ID placeholder
	;BST: 485
	db  60,  85,  50, 110,  95,  85
	evs  0,   0,   0,   3,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db ELECTRIC, PSYCHIC_TYPE ; type
	db 75 ; catch rate
	db 243 ; base exp
	dw NO_ITEM, ORAN_BERRY ; items
	db GENDER_F50 ; gender ratio
	db 10 ; step cycles to hatch
	INCBIN "gfx/pokemon/araichu/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_FAIRY ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, HEADBUTT, CURSE, ROLLOUT, ZAP_CANNON, HYPER_BEAM, RAIN_DANCE, IRON_TAIL, DIG, MUD_SLAP, SWIFT, THUNDERPUNCH, THIEF, SHOCK_WAVE, BUBBLEBEAM, BRICK_BREAK, REFLECT, STRENGTH, FLASH
	; end
