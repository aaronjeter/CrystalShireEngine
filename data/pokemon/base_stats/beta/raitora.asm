	db 0 ; species ID placeholder
	;BST: 535
	db  75, 120,  75, 120,  65,  80
	evs  0,   0,   0,   3,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db ELECTRIC, DARK ; type
	db 45 ; catch rate
	db 200 ; base exp
	dw NO_ITEM, ORAN_BERRY ; items
	db GENDER_F50 ; gender ratio
	db 10 ; step cycles to hatch
	INCBIN "gfx/pokemon/raitora/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_FAIRY ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, ROLLOUT, ROAR, ZAP_CANNON, RAIN_DANCE, TAUNT, IRON_TAIL, MUD_SLAP, SWIFT, THIEF, SHOCK_WAVE, DRAGON_CLAW, SHADOW_CLAW, STRENGTH, FLASH
	; end
