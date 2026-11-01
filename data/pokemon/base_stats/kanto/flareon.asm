	db 0 ; species ID placeholder
	;BST: 525
	db  65, 130,  60,  65,  95, 110
	evs  0,   2,   0,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db FIRE, FIRE ; type
	db 45 ; catch rate
	db 198 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_F12_5 ; gender ratio
	db 35 ; step cycles to hatch
	INCBIN "gfx/pokemon/flareon/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, ROAR, ZAP_CANNON, SUNNY_DAY, HYPER_BEAM, RAIN_DANCE, IRON_TAIL, SHADOW_BALL, MUD_SLAP, SWIFT, FLAMETHROWER, CALM_MIND, DRAGON_CLAW
	; end
