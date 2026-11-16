MACRO boss
; extra bars, flags, aura, phases[, WILDAI_* profile (default WILDAI_BOSS)]
	assert \1 >= 1 && \1 <= BOSS_MAX_EXTRA_BARS, "a boss needs 1 to {d:BOSS_MAX_EXTRA_BARS} extra bars"
	db \1, \2
	dw \3, \4
	if _NARG > 4
		db \5
	else
		db WILDAI_BOSS
	endc
ENDM

MACRO boss_stat
; stat, stages
	assert \2 >= 1 && \2 <= 6, "boss_stat raises 1 to 6 stages"
	db BOSSCMD_STAT, \1, \2
ENDM

MACRO boss_weather
; WEATHER_*, turns (255: until replaced)
	db BOSSCMD_WEATHER, \1, \2
ENDM

MACRO boss_text
	db BOSSCMD_TEXT
	dw \1
ENDM

MACRO boss_end
	db BOSSCMD_END
ENDM

DEF BOSS_WEATHER_TURNS EQU 8

BossRecords:
; indexed by BOSS_* - 1
; BOSS_AUTO_CATCH for the one-time encounters; the others come back (their map
; object has no event flag, or it's cleared after the League) and use balls.
; The last argument picks how it chooses its moves (WILDAI_BOSS if left out).
	table_width BOSS_RECORD_SIZE
	boss 1, BOSS_AUTO_CATCH, RedGyaradosAura, RedGyaradosPhases, WILDAI_FERAL   ; BOSS_RED_GYARADOS
	boss 1, BOSS_AUTO_CATCH, UnownXAura,      UnownXPhases,      WILDAI_CUNNING ; BOSS_UNOWN_X
	boss 1, 0, ArticunoAura,    ArticunoPhases    ; BOSS_ARTICUNO
	boss 1, 0, ZapdosAura,      ZapdosPhases      ; BOSS_ZAPDOS
	boss 1, 0, MoltresAura,     MoltresPhases     ; BOSS_MOLTRES
	boss 1, 0, RegirockAura,    RegirockPhases    ; BOSS_REGIROCK
	boss 1, 0, RegiceAura,      RegicePhases      ; BOSS_REGICE
	boss 1, 0, RegisteelAura,   RegisteelPhases   ; BOSS_REGISTEEL
	boss 2, 0, MewtwoAura,      MewtwoPhases      ; BOSS_MEWTWO
	boss 2, 0, KyogreAura,      KyogrePhases      ; BOSS_KYOGRE
	boss 2, 0, GroudonAura,     GroudonPhases     ; BOSS_GROUDON
	boss 2, 0, RayquazaAura,    RayquazaPhases    ; BOSS_RAYQUAZA
	boss 2, BOSS_AUTO_CATCH, HoOhAura,        HoOhPhases        ; BOSS_HO_OH
	boss 2, BOSS_AUTO_CATCH, LugiaAura,       LugiaPhases       ; BOSS_LUGIA
	assert_table_length NUM_BOSSES - 1

; Phase tables: one entry per extra bar in the record, in break order.

RedGyaradosAura:
	boss_stat ATTACK, 1
	boss_end
RedGyaradosPhases:
	dw .bar1
.bar1
	boss_weather WEATHER_RAIN, BOSS_WEATHER_TURNS
	boss_stat SPEED, 1
	boss_end

UnownXAura:
	boss_stat SP_ATTACK, 1
	boss_end
UnownXPhases:
	dw .bar1
.bar1
	boss_text BossRuinsText
	boss_stat SP_DEFENSE, 1
	boss_end

ArticunoAura:
	boss_stat SP_DEFENSE, 1
	boss_end
ArticunoPhases:
	dw .bar1
.bar1
	boss_weather WEATHER_HAIL, BOSS_WEATHER_TURNS
	boss_end

ZapdosAura:
	boss_stat SPEED, 1
	boss_end
ZapdosPhases:
	dw .bar1
.bar1
	boss_weather WEATHER_RAIN, BOSS_WEATHER_TURNS
	boss_end

MoltresAura:
	boss_stat SP_ATTACK, 1
	boss_end
MoltresPhases:
	dw .bar1
.bar1
	boss_weather WEATHER_SUN, BOSS_WEATHER_TURNS
	boss_end

RegirockAura:
	boss_stat DEFENSE, 2
	boss_end
RegirockPhases:
	dw .bar1
.bar1
	boss_stat ATTACK, 2
	boss_end

RegiceAura:
	boss_stat SP_DEFENSE, 2
	boss_end
RegicePhases:
	dw .bar1
.bar1
	boss_stat SP_ATTACK, 2
	boss_end

RegisteelAura:
	boss_stat DEFENSE, 1
	boss_stat SP_DEFENSE, 1
	boss_end
RegisteelPhases:
	dw .bar1
.bar1
	boss_stat ATTACK, 2
	boss_end

MewtwoAura:
	boss_stat SP_ATTACK, 1
	boss_stat SP_DEFENSE, 1
	boss_end
MewtwoPhases:
	dw .bar1, .bar2
.bar1
	boss_stat SP_ATTACK, 1
	boss_stat SP_DEFENSE, 1
	boss_end
.bar2
	boss_stat SP_ATTACK, 1
	boss_stat SP_DEFENSE, 1
	boss_stat SPEED, 1
	boss_end

KyogreAura:
	boss_weather WEATHER_RAIN, 255
	boss_stat SP_ATTACK, 1
	boss_end
KyogrePhases:
	dw .bar1, .bar2
.bar1
	boss_stat SP_ATTACK, 1
	boss_end
.bar2
	boss_stat SP_ATTACK, 1
	boss_stat SP_DEFENSE, 1
	boss_end

GroudonAura:
	boss_weather WEATHER_SUN, 255
	boss_stat ATTACK, 1
	boss_end
GroudonPhases:
	dw .bar1, .bar2
.bar1
	boss_stat ATTACK, 1
	boss_end
.bar2
	boss_stat ATTACK, 1
	boss_stat DEFENSE, 1
	boss_end

RayquazaAura:
	boss_weather WEATHER_NONE, 0
	boss_end
RayquazaPhases:
	dw .bar, .bar
.bar
	boss_stat ATTACK, 1
	boss_stat SPEED, 1
	boss_end

HoOhAura:
	boss_weather WEATHER_SUN, BOSS_WEATHER_TURNS
	boss_stat SP_DEFENSE, 1
	boss_end
HoOhPhases:
	dw .bar1, .bar2
.bar1
	boss_stat ATTACK, 1
	boss_end
.bar2
	boss_stat ATTACK, 1
	boss_stat SP_DEFENSE, 1
	boss_end

LugiaAura:
	boss_stat DEFENSE, 1
	boss_stat SP_DEFENSE, 1
	boss_end
LugiaPhases:
	dw .bar1, .bar2
.bar1
	boss_stat SP_DEFENSE, 1
	boss_end
.bar2
	boss_stat SP_ATTACK, 1
	boss_stat SP_DEFENSE, 1
	boss_end

BossRuinsText:
	text "The ruins' power"
	line "surges through it!"
	prompt
