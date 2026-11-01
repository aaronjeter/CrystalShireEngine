	db 0 ; species ID placeholder
	;BST: 302
	db  60,  30,  30,  60,  66,  56
	evs  1,   0,   0,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db GHOST, FLYING ; type
	db 255 ; catch rate
	db 58 ; base exp
	dw ORAN_BERRY, SPELL_TAG ; items
	db GENDER_F50 ; gender ratio
	db 15 ; step cycles to hatch
	INCBIN "gfx/pokemon/hoothoot/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_FLYING, EGG_FLYING ; egg groups

	; tm/hm learnset
	tmhm CURSE, SUNNY_DAY, HYPER_BEAM, MUD_SLAP, SWIFT, THIEF, STEEL_WING, AERIAL_ACE, LIGHT_SCREEN, FLY, FLASH
	; end
