<CsoundSynthesizer>

<CsOptions>
; XO
;-+rtmidi=alsa  --midi-device=hw:1,0 -+rtaudio=alsa -odac -r16000 -k160 ;-O stdout
; Mac
-odac -r44100 -k441
</CsOptions>

<CsInstruments>
nchnls	=	2

garvb init 0

instr	1
	kamp	=	p4
	kfreq	=	p5
	kc1	=	6
	kc2	=	0
	kvdepth	=	0.01
	kvrate	=	3
	ifn1	=	1
	ifn2	=	1
	ifn3	=	1
	ifn4	=	2
	ivfn	=	1

kjit  jitter 4, 1, 4
kvib	lfo	 6,4+kjit,1

kjit2  jitter 5, 1, 4
kvib2	lfo	 7,3+kjit2,1

kjit3  jitter 4, 2, 7
kvib3	lfo	 8,1+kjit3,1


;a1	oscil  20000, kvrate+440, 1

a1	fmrhode	kamp,	kfreq+kvib,	kc1,	kc2,	kvdepth,	kvrate,	ifn1,	ifn2,	ifn3,	ifn4,	ivfn
a2	fmrhode	kamp,	kfreq*.98+kvib2,	kc1,	kc2,	kvdepth,	kvrate,	ifn1,	ifn2,	ifn3,	ifn4,	ivfn
a3	fmrhode	kamp,	kfreq*1.1+kvib3,	kc1,	kc2,	kvdepth,	kvrate,	ifn1,	ifn2,	ifn3,	ifn4,	ivfn
a4      cabasa 10000, 0.01

ipan = p6
	outs	(a1+a2+a3+(a4*.5))*ipan,(a1+a2+a3+(a4*.5))*(1-ipan)
garvb =  garvb +  (a1+a2+a3+(a4*.5))*.1
endin

instr 2
asig nreverb  garvb, 2.4, .1
outs asig, asig
garvb = 0
endin
</CsInstruments>

<CsScore>
	Table	#1,	a	sine	wave.
f	1	0	32768	10	1
;	Table	#2,	the	"fwavblnk.aiff"	audio	file.
f	2	0	256	1	"fwavblnk.aiff"	0	0	0
;	Play	Instrument	#1	for	two	seconds.
i 2 0 10
i	1	0	.1 10000 110  1
i	 .	+   .  >      ~  ~
i	 .	+   .  >      ~  ~
i	 .	+   .  >      ~  ~
i	 .	+   .  >      ~  ~ 
i	 .	+   .  >      ~  ~
i	 .	+   .  >      ~  ~
i	 .	+   .  >      ~  ~
i	 .	+   .  >      ~  ~
i	 .  +  .	 20000  220 0

e
</CsScore>

</CsoundSynthesizer>