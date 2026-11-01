	db 0 ; species ID placeholder
	;BST: 530
	db  95,  125,  75,  95, 65,  75
	evs  0,   0,   0,   0,   2,   0
	;   hp  atk  def  spd  sat  sdf

	db GRASS, DRAGON ; type
	db 45 ; catch rate
	db 212 ; base exp
	dw NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/exeggutor2/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_PLANT, EGG_PLANT ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, ROLLOUT, SUNNY_DAY, BODY_SLAM, HYPER_BEAM, GIGA_DRAIN, SOLARBEAM, IRON_TAIL, EARTHQUAKE, SLUDGE_BOMB, THIEF, MAGICAL_LEAF, STRENGTH, FLASH
	; end
