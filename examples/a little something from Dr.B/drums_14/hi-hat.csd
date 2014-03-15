<CsoundSynthesizer>

<CsOptions>
; XO
;-+rtmidi=alsa  --midi-device=hw:1,0 -+rtaudio=alsa -odac -r16000 -k160 ;-O stdout
; Mac
-odac -r44100 -k441
</CsOptions>

<CsInstruments>
nchnls 	=	2

instr 2


;hihat

idur 		=	p3
iamp		=	p4
ipulse	=	p5
irhytable	=	p6
ienv		=	p7
ienv2		=	p8
ipan		=	p9

;=====RHYTHM========
krhythm	phasor	ipulse/(ftlen (irhytable))
krhythm	table		krhythm*(ftlen(irhytable)), irhytable

;open (longer envelope)

kenvindex		phasor	ipulse
kenv			tablei	kenvindex*ftlen(ienv), ienv

; closed (shorter envelope)

kenv2			tablei	kenvindex*ftlen(ienv2), ienv2

;randomly chose envelope

kwhichenv		randh		5, ipulse, 1
kwhichenv		=		abs (kwhichenv)
kwhichenv		=	(kwhichenv < 2 ? 0 : 1 )

; mix envelopes
kenv		=		kenv*kwhichenv + kenv2 * (1- kwhichenv)


;====create sound ========

asound	rand		1
asound	=		asound*kenv

; filter sound

asound	butterbp	asound, cpspch (5.08+8), cpspch (5.08+8) * .5
asound	moogvcf	asound, cpspch (5.08+8), .7
a1		comb		asound, .5, 1/cpspch(8)
asound		=		a1*.05 + asound*.93


; mix
asound	=		asound*iamp*krhythm

; pan

ipan		=		.7

aL		=		asound*ipan
aR		=		asound*(1-ipan)

		outs		aL, aR

endin
</CsInstruments>
<CsScore>
;envelopes
f11 0 2048 7 0 10 1 500 0
f12 0 2048 7 0 40 1 1200 0

;rhythm

f32	0 16 2 1 0 1 0   1 0 1 0   1 1 0 1   0 1 0 1




;in star 	dur	amp		 pulse	rhythm	env1	env2	pan


i2 0		8	20000		8		32		12	11	.7

</CsScore>
</CsoundSynthesizer>

