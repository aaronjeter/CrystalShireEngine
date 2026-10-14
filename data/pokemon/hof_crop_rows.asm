; Hall of Fame team screen (engine/events/halloffame_team.asm): each front pic
; is cropped from 56 to 48 pixel rows. By default it drops its blank rows at the
; top (up to 8) and the rest from the bottom, which keeps heads for most
; Pokémon. The species listed here have their heads near the bottom instead:
; the number is how many pixel rows (0-8) to drop from the top; the bottom
; loses the other 8 - that many.
;   0: keep the top, drop the bottom 8
;   4: drop 4 from the top and 4 from the bottom
;   8: drop the top 8, keep the bottom

HOFCropTopRows:
	dw STEELIX
	db 8
	dw PROBOPASS
	db 8
	dw LUGIA
	db 8
	dw -1 ; end
