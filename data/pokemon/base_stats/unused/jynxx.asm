	db 0 ; species ID placeholder
	;BST: 550
	db  75,  70,  50,  120, 125,  110
	evs  0,   0,   0,   0,   2,   0
	;   hp  atk  def  spd  sat  sdf

	db ICE, PSYCHIC_TYPE ; type
	db 45 ; catch rate
	db 137 ; base exp
	dw RAWST_BERRY, RAWST_BERRY ; items
	db GENDER_F100 ; gender ratio
	db 25 ; step cycles to hatch
	INCBIN "gfx/pokemon/jynxx/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_HUMANSHAPE, EGG_HUMANSHAPE ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, HEADBUTT, CURSE, TOXIC, HIDDEN_POWER, BLIZZARD, HYPER_BEAM, ICY_WIND, PROTECT, RAIN_DANCE, RETURN, PSYCHIC_M, SHADOW_BALL, MUD_SLAP, ICE_PUNCH, SLEEP_TALK, DREAM_EATER, REST, ATTRACT, THIEF, ICE_BEAM, HAIL, CALM_MIND, BUBBLEBEAM
	; end
