	db 0 ; species ID placeholder
	;BST: 580
	db  95, 145,  79,  81,  60, 120
	evs  0,   2,   0,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db WATER, DRAGON ; type
	db 45 ; catch rate
	db 250 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 5 ; step cycles to hatch
	INCBIN "gfx/pokemon/gyaradosx/front.dimensions"
	dw NULL ; unused (beta front pic)
	db GROWTH_SLOW ; growth rate
	dn EGG_WATER_2, EGG_DRAGON ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, ROAR, ROCK_SMASH, BODY_SLAM, BLIZZARD, ICY_WIND, TAUNT, IRON_TAIL, DRAGONBREATH, THUNDER, EARTHQUAKE, FIRE_BLAST, SCALD, BUBBLEBEAM, SURF, STRENGTH, WHIRLPOOL, WATERFALL, FLAMETHROWER, THUNDERBOLT, ICE_BEAM, AQUA_TAIL, AQUA_RING
	; end
