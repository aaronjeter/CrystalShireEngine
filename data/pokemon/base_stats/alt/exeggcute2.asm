	db 0 ; species ID placeholder
	;BST: 360
	db  70,  60,  70,  60,  40,  60
	evs  0,   0,   1,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db GRASS, DRAGON ; type
	db 90 ; catch rate
	db 98 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/exeggcute2/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_PLANT, EGG_PLANT ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, ROLLOUT, SUNNY_DAY, BODY_SLAM, HYPER_BEAM, GIGA_DRAIN, SOLARBEAM, IRON_TAIL, EARTHQUAKE, SLUDGE_BOMB, THIEF, MAGICAL_LEAF, STRENGTH, FLASH
	; end
