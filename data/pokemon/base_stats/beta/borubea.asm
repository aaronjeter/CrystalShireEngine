	db 0 ; species ID placeholder
	;BST: 405
	db  58,  80,  58,  80,  64,  65
	evs  0,   1,   1,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db FIRE, FIRE ; type
	db 45 ; catch rate
	db 142 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 15 ; step cycles to hatch
	INCBIN "gfx/pokemon/borubea/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_MINERAL, EGG_MINERAL ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, SUNNY_DAY, BODY_SLAM, HYPER_BEAM, IRON_TAIL, DRAGONBREATH, EARTHQUAKE, DIG, MUD_SLAP, SWIFT, FURY_CUTTER, WILLOWISP, DRAGON_CLAW, ANCIENTPOWER, ROCK_SLIDE, CUT, STRENGTH, FLAMETHROWER
	; end
