	db 0 ; species ID placeholder
	;BST: 253
	db  30,  56,  35,  72,  25,  35
	evs  0,   0,   0,   1,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, NORMAL ; type
	db 255 ; catch rate
	db 57 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 15 ; step cycles to hatch
	INCBIN "gfx/pokemon/rattata/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, ROAR, ROCK_SMASH, SUNNY_DAY, BODY_SLAM, BLIZZARD, HYPER_BEAM, ICY_WIND, TAUNT, IRON_TAIL, THUNDER, DIG, SHADOW_BALL, MUD_SLAP, SWIFT, THIEF, BUBBLEBEAM, CUT, STRENGTH, THUNDERBOLT, ICE_BEAM
	; end
