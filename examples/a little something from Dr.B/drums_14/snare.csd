<CsoundSynthesizer>

<CsOptions>
; XO
;-+rtmidi=alsa  --midi-device=hw:1,0 -+rtaudio=alsa -odac -r16000 -k160 ;-O stdout
; Mac
-odac -r44100 -k441
</CsOptions>

<CsInstruments>
nchnls = 2

instr 3

;snare

idur		=	p3
iamp		=	p4
ipulse	=	p5
ienv		=	p6
ienv2		=	p7
irhytable	=	p8
ipan		=	p9

;=====NOISE=======

asound	rand		1

;=====filternoise========

as1		butterbp	asound, 210, 55


;===one envelope (usually sharp for noise) ========

kenv2		phasor	ipulse
kenv2		table		kenv2*ftlen(ienv2), ienv2

;=== mix signals ========

asound	=		as1*.9 + asound*.8*kenv2

;=== another envelope =======

kenv		phasor	ipulse
kenv		tablei	kenv*ftlen(ienv), ienv

;====GET RHYTHMS======

krhythm	phasor	ipulse/ftlen(irhytable)
krhythm	table		krhythm*ftlen(irhytable), irhytable

;====MIX SIGNAL=======

asound	=		asound*kenv*krhythm*iamp

;==== PANNING ========


aL		=		asound*ipan
aR		=		asound*(1-ipan)

		outs		aL, aR

endin
</CsInstruments>
<CsScore>
;envelopes

f10 0 2048 7 0 10 1 700 0
f11 0 2048	5 .01 3 1 445 .01 1400 .01

;rhythm

f33 0 16 2 0 0 1 0   0 1 0 1   0 0 1 0  0 1 1 0

;in star 	dur	amp		pulse 	env1	env2	rhythm	pan
i3 	0	8	28000		8		10	11	33   		.3
</CsScore>
</CsoundSynthesizer>

