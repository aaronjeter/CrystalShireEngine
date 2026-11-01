	db 0 ; species ID placeholder
	;BST: 440
	db  55,  65,  95,  85,  95,  45
	evs  0,   0,   1,   0,   1,   0
	;   hp  atk  def  spd  sat  sdf

	db WATER, WATER ; type
	db 75 ; catch rate
	db 155 ; base exp
	dw MARVEL_SCALE, DRAGON_SCALE ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/seadra/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_WATER_1, EGG_DRAGON ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, BLIZZARD, HYPER_BEAM, ICY_WIND, FLASHCANNON, SWIFT, CALM_MIND, SCALD, DRAGON_CLAW, ANCIENTPOWER, SURF, WHIRLPOOL, ICE_BEAM
	; end
