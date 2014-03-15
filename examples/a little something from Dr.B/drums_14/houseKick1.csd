<CsoundSynthesizer>

<CsOptions>
; XO
;-+rtmidi=alsa  --midi-device=hw:1,0 -+rtaudio=alsa -odac -r16000 -k160 ;-O stdout
; Mac
-odac -r44100 -k441
</CsOptions>

<CsInstruments> 
instr 1
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; DRUM MODELER
; BASED ON STOMPER ULTRA++ OSCILLATOR MODULE.
; MORE ABOUT STOMPER AT HTTP://ZAP.BASE.ORG
; PORTED TO CSOUND BY JOSEP M COMAJUNCOSAS/ AUG´98
; MODEL 1: 2 OSCILLATORS : KICKS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
p3 		= 		(p3 < .3 ? p3 :.3) 		; SET P3 TO THE LONGER OSC ENVELOPE TIME AND YOU´LL SAVE TIME
;SETTINGS FOR OSC1:
idur1    	= 		.3;		   DURATION
ifreqst1 	= 		200;	   INITIAL FREQUENCY
ifreqnd1 	= 		80;		   FINAL FREQUENCY
iampst1  	=   		1;	   INITIAL AMPLITUDE MULTIP.
iampnd1  	=   		0;	   FINAL AMPLITUDE MULTIP.
iampenv1 	= 		7.5858;	   AMPLITUDE ENVELOPE SHAPING FACTOR (.01 TO 100)
icpsenv1 	=  		.182;	   FREQUENCY ENVELOPE SHAPING FACTOR (.01 TO 100)
icurveshape1 = 	.8318 ; WAVEFORM SHAPING FACTOR (.01 TO 100)
;SETTINGS FOR OSC2:
idur2    	= 		.003
ifreqst2 	= 		600
ifreqnd2 	= 		60
iampst2  	= 		1
iampnd2  	=   		0
iampenv2 	= 		7.9433
icpsenv2 	= 		1.9055
icurveshape2 = 	1
;********************************************************
;********************************************************
; OSC 1
;********************************************************
;********************************************************
timout 	0, idur1, osc1
kgoto 	skip1
;;;;;;;;;;;;;;;;;;;;;
; ENVELOPES
;;;;;;;;;;;;;;;;;;;;;
osc1:
kphase1 	phasor 	1/idur1
kamp1 	pow 		kphase1, iampenv1
kamp1 	= 		1 - kamp1
kcps1 	pow 		kphase1, icpsenv1
kcps1 	= 		(ifreqst1-ifreqnd1)*(1 - kcps1)+ifreqnd1
;;;;;;;;;;;;;;;;;;;;;
; OSCILLATOR
;;;;;;;;;;;;;;;;;;;;;
kdrum1 	oscili 	kamp1, kcps1,1
;;;;;;;;;;;;;;;;;;;;;
; VARIABLE WAVESHAPER
;;;;;;;;;;;;;;;;;;;;;
if 		kdrum1 	< 0 goto neg1
kshaper1 	pow 		kdrum1, icurveshape1
goto 	out1
neg1:
kshaper1 	pow 		-kdrum1, icurveshape1
kshaper1 	= 		(kshaper1 < 0 ? kshaper1:-kshaper1)
out1:
ashaper1 	upsamp 	kshaper1
		out 		ashaper1*16000
;********************************************************
;********************************************************
; OSC 2
;********************************************************
;********************************************************
skip1:
timout 	0, idur2, osc2
kgoto 	skip2
;;;;;;;;;;;;;;;;;;;;;
; ENVELOPES
;;;;;;;;;;;;;;;;;;;;;
osc2:
kphase2 	phasor 	1/idur2
kamp2 	pow 		kphase2, iampenv2
kamp2 	= 		1 - kamp2
kcps2 	pow 		kphase2, icpsenv2
kcps2 	= 		(ifreqst2-ifreqnd2)*(1 - kcps2)+ifreqnd2
;;;;;;;;;;;;;;;;;;;;;
; OSCILLATOR
;;;;;;;;;;;;;;;;;;;;;
kdrum2 	oscili 	kamp2, kcps2,1
;;;;;;;;;;;;;;;;;;;;;
; VARIABLE WAVESHAPER
;;;;;;;;;;;;;;;;;;;;;
if 		kdrum2 < 0 goto neg2
kshaper2 	pow 		kdrum2, icurveshape2
goto 	out2
neg2:
kshaper2 	pow 		-kdrum2, icurveshape2
kshaper2 	= 		(kshaper2 < 0 ? kshaper2:-kshaper2)
out2:
ashaper2 	upsamp 	kshaper2
		out 		ashaper2*16000
skip2:
		endin

</CsInstruments>
<CsScore>
;f1 0 8193 11 200 1 1
f1 0 8193 10 1 
;f1  0 256   7 0 128 1 0 -1 128 0 
t 0 170
i1 0 1
i1 + .
i1 . .
i1 . .
i1 . .
i1 . .
i1 . .
i1 . .
i1 . .
i1 . .
i1 . .
i1 . .
i1 . .
i1 . .
i1 . .
i1 . .5
i1 . .
i1 . 1
i1 . .
i1 . .
i1 . .
i1 . .
i1 . .
i1 . .
i1 . .
i1 . .
i1 . .
i1 . .
i1 . .
i1 . .
i1 . .
i1 . .75
i1 . .25
i1 . .5
i1 . .5
e
</CsScore>

</CsoundSynthesizer>