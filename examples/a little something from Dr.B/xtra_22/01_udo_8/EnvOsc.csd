<CsoundSynthesizer>

<CsOptions>
; XO
;-+rtmidi=alsa  --midi-device=hw:1,0 -+rtaudio=alsa -odac -r16000 -k160 ;-O stdout
; Mac
-odac -r44100 -k441
</CsOptions>

<CsInstruments>
itmp	ftgen 1, 0, 1024, -10, 1.5			; sine wave
itmp	ftgen 2, 0, 1024, -10, 1, 0.5, 0.333, 0.25, 0.2	; band-limited sawtooth
itmp	ftgen 3, 0, 1024, -10, 1.5, 0, 0.5, 0, 0.3	; band-limited square

			opcode EnvelopeOsc, a, akp
/* all notes before 5 seconds use the default ksmps, then ksmps = 1 */
			setksmps (p2 < 4.99 ? 0 : 1)
/* itabl is optional, and defaults to 1 (i.e. sine wave) */
aamp, kcps, itabl	xin
/* print the new ksmps value */
			print ksmps
kenv			linseg 0, p3/4, 1, p3/4, 1, p3/4, 0, p3/4, 0
a1			oscili aamp, kcps, itabl
			xout a1 * kenv
			endop

	instr 1		; instr 1: use default table
aamp	=  15000
a1	EnvelopeOsc aamp, p4
a1	pareq a1, 3000, 8, 0.7, 2	; make artifacts more audible
	out a1
	endin

	instr 2		; instr 2: table number is set by p5
aamp	=  15000
a1	EnvelopeOsc aamp, p4, p5
a1	pareq a1, 3000, 8, 0.7, 2	; make artifacts more audible
	out a1
	endin

</CsInstruments>
<CsScore>

i 1  0 1.5 220
i 2  2 1.5 220 2
i 2  4 1.5 220 3
i 1  6 1.5 220
i 2  8 1.5 220 2
i 2 10 1.5 220 3
e

</CsScore>

</CsoundSynthesizer>