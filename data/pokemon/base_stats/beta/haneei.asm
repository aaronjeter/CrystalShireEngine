	db 0 ; species ID placeholder
	;BST: 500
	db  100, 75,  75,  90,  85,  75
	evs  0,   0,   1,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db WATER, GHOST ; type
	db 35 ; catch rate
	db 200 ; base exp
	dw NO_ITEM, EVERSTONE ; items
	db GENDER_F50 ; gender ratio
	db 15 ; step cycles to hatch
	INCBIN "gfx/pokemon/haneei/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_MINERAL, EGG_MINERAL ; egg groups

	; tm/hm learnset
	tmhm TOXIC, HIDDEN_POWER, ICE_BEAM, BLIZZARD, HYPER_BEAM, RAIN_DANCE, FRUSTRATION, EARTHQUAKE, RETURN, SHADOW_BALL, DOUBLE_TEAM, REST, ATTRACT, FLASH, WILLOWISP, CALM_MIND, BUBBLEBEAM
	; end
