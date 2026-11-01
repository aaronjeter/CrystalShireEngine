	db 0 ; species ID placeholder
	;BST: 320
	db  40,  50,  45,  70,  70,  45
	evs  0,   0,   0,   0,   1,   0
	;   hp  atk  def  spd  sat  sdf

	db PSYCHIC_TYPE, FLYING ; type
	db 190 ; catch rate
	db 73 ; base exp
	dw NO_ITEM, TWISTEDSPOON ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/natu/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_FLYING, EGG_FLYING ; egg groups

	; tm/hm learnset
	tmhm CURSE, SUNNY_DAY, HYPER_BEAM, GIGA_DRAIN, SOLARBEAM, SWIFT, DREAM_EATER, THIEF, STEEL_WING, AERIAL_ACE, ANCIENTPOWER, FLY, FLASH
	; end
