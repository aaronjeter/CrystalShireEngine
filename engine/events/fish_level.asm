FishScaled:
; Fish (engine/events/fish.asm), then add the badge-scaled wild level to the
; level it returns in e, as grass and surf encounters do. The fishing tables
; now hold level offsets (Old +2, Good +5, Super +8). Returns d = species,
; e = level, like Fish.
	farcall Fish
	push af
	ld a, d
	and a
	jr z, .done ; no bite
	ld a, [wWildLevel]
	add e
	ld e, a
.done
	pop af
	ret
