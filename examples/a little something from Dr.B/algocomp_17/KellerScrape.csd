<CsoundSynthesizer>
<CsOptions>
; XO
;-+rtmidi=alsa  --midi-device=hw:1,0 -+rtaudio=alsa -odac -r16000 -k160 ;-O stdout
; Mac
-odac -r44100 -k441
</CsOptions>
<CsInstruments>
; Damian Keller. June 1997.
; Scraping floors. Gaussian noise is shaped by a sine function.
		instr 1
kamp 	= 		p4					; OVERALL AMPLITUDE.
idur 	= 		p3					; DURATION
; CONTROL
kramp	linseg 	1, idur, 0			; INTENSITY.
krate	linseg	2, idur, .2			; RATE OF SCRAPING
; SOURCE: GAUSSIAN NOISE.
a1		gauss kramp			
; WINDOWED WITH SINE.
a2		oscili	1, krate, 1		 
a3		= 		a1 * a2 * kamp
    		out 		a3	
		endin
</CsInstruments>

<CsScore>
; sine weights control spectral regions.
f1 0 513 10 1 
;       st  dur     amp     
i1      0   10      30000
</CsScore>

</CsoundSynthesizer>