	db 0 ; species ID placeholder
	;BST: 450
	db  80,  75,  75,  90,  55,  75
	evs  1,   0,   0,   1,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, NORMAL ; type
	db 60 ; catch rate
	db 138 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_F75 ; gender ratio
	db 15 ; step cycles to hatch
	INCBIN "gfx/pokemon/delcatty/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_FAST ; growth rate
	dn EGG_GROUND, EGG_FAIRY ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, ROCK_SMASH, SUNNY_DAY, BLIZZARD, HYPER_BEAM, RAIN_DANCE, SOLARBEAM, IRON_TAIL, THUNDER, DIG, SHADOW_BALL, BRICK_BREAK, STRENGTH, FLASH, THUNDERBOLT, ICE_BEAM
	; end
