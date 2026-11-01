	db 0 ; species ID placeholder
	;BST: 270
	db  40,  55,  30,  85,  30,  30
	evs  0,   0,   0,   1,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, FLYING ; type
	db 200 ; catch rate
	db 59 ; base exp
	dw ORAN_BERRY, SHARP_BEAK ; items
	db GENDER_F50 ; gender ratio
	db 15 ; step cycles to hatch
	INCBIN "gfx/pokemon/taillow/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_FLYING, EGG_FLYING ; egg groups

	; tm/hm learnset
	tmhm SUNNY_DAY, HYPER_BEAM, RAIN_DANCE, THIEF, STEEL_WING, BRICK_BREAK, FLY
	; end
