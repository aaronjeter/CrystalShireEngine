	db 0 ; species ID placeholder
	;bst 580
	db  80, 110,  90, 100, 110,  90
	evs  2,   0,   0,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db ICE, ICE ; type
	db 75 ; catch rate
	db 187 ; base exp
	dw NO_ITEM, NEVERMELTICE ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/glaliex/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_FAIRY, EGG_MINERAL ; egg groups

	; tm/hm learnset
	tmhm TOXIC, HIDDEN_POWER, ICE_BEAM, BLIZZARD, HYPER_BEAM, RAIN_DANCE, FRUSTRATION, EARTHQUAKE, RETURN, SHADOW_BALL, DOUBLE_TEAM, REST, ATTRACT, FLASH
	; end
