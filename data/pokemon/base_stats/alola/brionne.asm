	db 0 ; species ID placeholder
	;bst 420
	db  60,  69,  69,  50,  91,  81
	evs  0,   0,   0,   0,   0,   2
	;   hp  atk  def  spd  sat  sdf

	db WATER, WATER ; type
	db 45 ; catch rate
	db 147 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/brionne/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_WATER_1, EGG_DRAGON ; egg groups

	; tm/hm learnset
	tmhm TOXIC, HAIL, HIDDEN_POWER, ICE_BEAM, BLIZZARD, HYPER_BEAM, RAIN_DANCE, FRUSTRATION, IRON_TAIL, RETURN, REST, ATTRACT, SURF, WATERFALL, SHOCK_WAVE, WILLOWISP, CALM_MIND, SCALD, BUBBLEBEAM, MAGICAL_LEAF, DRAGON_CLAW, ANCIENTPOWER
	; end
