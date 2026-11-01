	db 0 ; species ID placeholder
	;BST: 600
	db 100, 120,  75, 125, 100,  80
	evs  0,   0,   0,   3,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db ELECTRIC, DRAGON ; type
	db 25 ; catch rate
	db 225 ; base exp
	dw NO_ITEM, ORAN_BERRY ; items
	db GENDER_F50 ; gender ratio
	db 10 ; step cycles to hatch
	INCBIN "gfx/pokemon/gorochu/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_FAIRY ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, HEADBUTT, CURSE, ROLLOUT, ZAP_CANNON, HYPER_BEAM, RAIN_DANCE, IRON_TAIL, EARTHQUAKE, MUD_SLAP, SWIFT, THUNDERPUNCH, THIEF, FIRE_FANG, THUNDER_FANG, SHOCK_WAVE, STRENGTH, FLASH
	; end
