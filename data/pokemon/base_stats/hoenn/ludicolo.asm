	db 0 ; species ID placeholder
	;BST: 480
	db  80,  70,  70,  70,  90, 100
	evs  0,   0,   0,   0,   0,   3
	;   hp  atk  def  spd  sat  sdf

	db WATER, GRASS ; type
	db 45 ; catch rate
	db 181 ; base exp
	dw NO_ITEM, WATER_STONE ; items
	db GENDER_F50 ; gender ratio
	db 15 ; step cycles to hatch
	INCBIN "gfx/pokemon/ludicolo/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_WATER_1, EGG_PLANT ; egg groups

	; tm/hm learnset
	tmhm TOXIC, HIDDEN_POWER, SUNNY_DAY, ICE_BEAM, BLIZZARD, HYPER_BEAM, PROTECT, RAIN_DANCE, GIGA_DRAIN, FRUSTRATION, SOLARBEAM, RETURN, DOUBLE_TEAM, REST, ATTRACT, THIEF, SURF, STRENGTH, FLASH, ROCK_SMASH, WATERFALL, ICE_PUNCH, BUBBLEBEAM, MAGICAL_LEAF, BRICK_BREAK
	; end
