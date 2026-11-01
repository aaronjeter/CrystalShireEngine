	db 0 ; species ID placeholder
	;BST: 280
	db  55,  55,  55,  55,  30,  30
	evs  0,   1,   0,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db DARK, DARK ; type
	db 255 ; catch rate
	db 55 ; base exp
	dw ORAN_BERRY, SITRUS_BERRY ; items
	db GENDER_F50 ; gender ratio
	db 15 ; step cycles to hatch
	INCBIN "gfx/pokemon/poochyena/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm ROAR, ROCK_SMASH, SUNNY_DAY, BODY_SLAM, HYPER_BEAM, RAIN_DANCE, IRON_TAIL, DIG, SHADOW_BALL, THIEF, POISON_FANG, BRICK_BREAK, STRENGTH
	; end
