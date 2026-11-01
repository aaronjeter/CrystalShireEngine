	db 0 ; species ID placeholder
	;BST: 330
	db  60,  25,  35,  60,  70,  80
	evs  0,   0,   0,   0,   0,   1
	;   hp  atk  def  spd  sat  sdf

	db PSYCHIC_TYPE, PSYCHIC_TYPE ; type
	db 255 ; catch rate
	db 89 ; base exp
	dw ORAN_BERRY, CHESTO_BERRY ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/spoink/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_FAST ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm SUNNY_DAY, HYPER_BEAM, RAIN_DANCE, TAUNT, IRON_TAIL, ICE_PUNCH, THIEF, FIRE_PUNCH, SHOCK_WAVE, BRICK_BREAK, FLASH
	; end
