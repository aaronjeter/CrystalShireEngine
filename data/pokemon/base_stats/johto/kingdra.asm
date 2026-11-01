	db 0 ; species ID placeholder
	;BST: 540
	db  75,  95,  95,  85,  95,  95
	evs  0,   1,   0,   0,   1,   1
	;   hp  atk  def  spd  sat  sdf

	db WATER, DRAGON ; type
	db 45 ; catch rate
	db 207 ; base exp
	dw NO_ITEM, DRAGON_SCALE ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/kingdra/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_WATER_1, EGG_DRAGON ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, BLIZZARD, HYPER_BEAM, ICY_WIND, FLASHCANNON, SWIFT, CALM_MIND, SCALD, DRAGON_CLAW, ANCIENTPOWER, SURF, WHIRLPOOL, ICE_BEAM
	; end
