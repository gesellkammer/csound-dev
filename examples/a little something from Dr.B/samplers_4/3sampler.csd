<CsoundSynthesizer>

<CsOptions>
; XO
;-+rtmidi=alsa  --midi-device=hw:1,0 -+rtaudio=alsa -odac -r16000 -k160 ;-O stdout
; Mac
-odac -r44100 -k4410
</CsOptions>

<CsInstruments>
nchnls	=		2

;------------------------------------------------------------------
; SAMPLER EFFECTS
;------------------------------------------------------------------
		instr	7
idur	   	=		p3
iamp	   	=		p4
ifqc	   	=		p5
irattab 	=		p6
iratrat 	=		p7
ipantab 	=		p8
imixtab 	=		p9
ilptab  	=		p10
isndin  	=		p11
kpan	   	oscil	1, 1/idur, ipantab		; PANNING
kmix	   	oscil	1, 1/idur, imixtab		; FADING
kloop   	oscil	1, 1/idur, ilptab		; LOOPING
loop1:
kprate  	oscil	1, iratrat/kloop, irattab  ; PULSE RATE
kamp	   	linseg	0, .01, 1, i(kloop)-.02, 1, .01, 0	 ; AMPLITUDE GATE
;			 	AMP	   FQC
; a1, a2 	diskin   	isndin, ifqc
a1      	diskin2 	isndin, 1, 0, 0
aout	   	=		(a1)*kamp
; WHEN THE TIME RUNS OUT REINITIALIZE
	   	timout	0, i(kloop), cont1
	   	reinit	loop1
cont1:
	   	outs		aout*sqrt(kpan)*kmix, aout*sqrt(1-kpan)*kmix ; OUTPUT PAN & FADE
	   	endin

</CsInstruments>
<CsScore>
; Rate Table
f29  0 1024  -7  .5   250 .5 6 2 250 2 6 1 250 1 6 4 256 .5
; Pan Tables
f31  0 1024  7  1  1024  0
; Mix Tables
f41  0 1024  5  .01 128 1 768 1 128 .01
; Loop Table
f53  0 1024 -7  .12 512 .15 512 .24
;   Sta  Dur  Amp   Pitch  RtTab  RtRt  PanTab  MixTab  Loop  Diskin
i7   0   8    3     1      29     1     31      41      53   "sa_Piano.aif""
s
i7   0   8    3     2      29     2     31      41      53    "sa_tom.wav"

</CsScore>
</CsoundSynthesizer>

