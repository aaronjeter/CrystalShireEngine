	db 0 ; species ID placeholder
	;BST: 525
	db  85,  60,  60,  80, 120, 120
	evs  0,   0,   0,   1,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db WATER, WATER ; type
	db 24 ; catch rate
	db 225 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/mercury/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_NONE, EGG_NONE ; egg groups

	; tm/hm learnset
	tmhm TOXIC, HAIL, HIDDEN_POWER, ICE_BEAM, BLIZZARD, HYPER_BEAM, RAIN_DANCE, FRUSTRATION, IRON_TAIL, RETURN, REST, ATTRACT, SURF, WATERFALL, SHOCK_WAVE, WILLOWISP, CALM_MIND, SCALD, BUBBLEBEAM, MAGICAL_LEAF, DRAGON_CLAW, ANCIENTPOWER
	; end
