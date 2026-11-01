	db 0 ; species ID placeholder
	;BST: 289
	db  60,  30,  32,  65,  50,  52
	evs  0,   0,   0,   1,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db BUG, WATER ; type
	db 200 ; catch rate
	db 63 ; base exp
	dw ORAN_BERRY, WATER_STONE ; items
	db GENDER_F50 ; gender ratio
	db 15 ; step cycles to hatch
	INCBIN "gfx/pokemon/surskit/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_WATER_1, EGG_BUG ; egg groups

	; tm/hm learnset
	tmhm SUNNY_DAY, BLIZZARD, HYPER_BEAM, SOLARBEAM, SHADOW_BALL, THIEF, AERIAL_ACE, CALM_MIND, SCALD, SURF, FLASH, WATERFALL, ICE_BEAM
	; end
