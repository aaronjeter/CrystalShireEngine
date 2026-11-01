	db 0 ; species ID placeholder
	;BST: 280
	db  50,  65,  45,  50,  35,  35
	evs  0,   0,   0,   1,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, NORMAL ; type
	db 255 ; catch rate
	db 65 ; base exp
	dw NO_ITEM, MOON_STONE ; items
	db GENDER_F75 ; gender ratio
	db 15 ; step cycles to hatch
	INCBIN "gfx/pokemon/skitty/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_FAST ; growth rate
	dn EGG_GROUND, EGG_FAIRY ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, ROCK_SMASH, SUNNY_DAY, BLIZZARD, HYPER_BEAM, RAIN_DANCE, SOLARBEAM, IRON_TAIL, THUNDER, DIG, SHADOW_BALL, BRICK_BREAK, STRENGTH, FLASH, THUNDERBOLT, ICE_BEAM
	; end
