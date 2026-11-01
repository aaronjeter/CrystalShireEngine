	db 0 ; species ID placeholder
	;BST: 465
	db 103, 105,  72,  65, 105,  75
	evs  0,   1,   0,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, PSYCHIC_TYPE ; type
	db 45 ; catch rate
	db 250 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/wyrdeer/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_SLOW ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, ROAR, SUNNY_DAY, BODY_SLAM, HYPER_BEAM, RAIN_DANCE, EARTHQUAKE, SHADOW_BALL, MUD_SLAP, HYPER_VOICE, SWIFT, THIEF, CALM_MIND, FLASH, THUNDERBOLT
	; end
