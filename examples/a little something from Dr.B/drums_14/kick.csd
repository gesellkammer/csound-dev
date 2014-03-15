<CsoundSynthesizer>

<CsOptions>
; XO
;-+rtmidi=alsa  --midi-device=hw:1,0 -+rtaudio=alsa -odac -r16000 -k160 ;-O stdout
; Mac
-odac -r44100 -k441
</CsOptions>

<CsInstruments>
nchnls = 2



instr 1

;Bass drum

idur		=	p3
iamp		=	p4
iwave		=	p5
ipulse	=	p6
ienv		=	p7
irhytable	=	p8
icps		=	cpspch (p9)
igliss	=	p10


;=====RHYTHMS============
krhythm	phasor	ipulse/ftlen(irhytable)
krhythm	table		krhythm*ftlen(irhytable), irhytable

;=====ENVELOPE========
kenvindex	phasor	ipulse
kenv		tablei	kenvindex*ftlen(ienv), ienv

;======ADD GLISS, makes it sound more like a bass drum?========

kgliss	phasor	ipulse
kgliss	tablei	kgliss * ftlen (igliss), igliss


;=====SOUND=======

athump	oscili	1,icps*kgliss*.5, iwave

;=====MIX signal ========

athump	=		athump * kenv * krhythm * iamp

kpan		=	.5

aL		=		athump*kpan
aR		=		athump*(1-kpan)

		outs		aL, aR


endin
</CsInstruments>
<CsScore>
; wave tables
;low res works well!

f1 0 32 10 1
f2 0 8192 10 1


; envelopes - - - - -

f10 0 2048 7 0 20 1 800 0



;for gliss

f20 0 1024 -5 	10 650 1 724 1
f21 0 1024 -5    6 350 1 724 1

;rhythm tables

f30 0 16 -2 1 0 0 .5 1 0 1 0 1 0 0 .5 1 0 1 .5
f31 0 32 -2 1 0 0 0 1 0 0 .5   	1 0 0 0 1 0 0 .5 		1 0 0 1  0 0 1 0  0 1 0 0  1 0 0 .5




;in star 	dur	amp		wave  	pulse		env		rhyth		cps		gliss
i1 0 		8  	40000		1 		8		10		30		5.07 		20

s
i1 0 		8  	40000		2 		10		10		31		6.07 		21
</CsScore>
</CsoundSynthesizer>

