<CsoundSynthesizer>

<CsOptions>
-odac
</CsOptions>
<CsInstruments>
sr        =         44100
kr        =         441
ksmps     =         100
nchnls 	= 		2

garvb	init	0


		instr	139; filtered noise with discrete random pan & reverb send
idur	=		p3
iamp	=		p4
ifrq	=		p5
iatk	=		p6
irel	=		p7
icut1	=		p8
icut2	=		p9
irvbsnd	linrand	.25
ipan	betarand	1, 1, 1
kenv	linen	iamp, iatk, idur, irel
kcut	expon	icut1, idur, icut2
anoise	rand	ifrq
afilt4	tone	anoise, kcut
afilt3	tone	afilt4, kcut
afilt2	tone	afilt3, kcut
afilt1	tone	afilt2, kcut
asig	=		afilt1*kenv
		outs	asig*ipan, asig*(1-ipan)
		print	ipan, irvbsnd
garvb	=		garvb+(asig*irvbsnd)
		endin

		instr 	199
idur	=		p3
irvbtim	=		p4
ihiatn	=		p5
arvb	nreverb	garvb, irvbtim, ihiatn
		outs		arvb, arvb
garvb	=		0
		endin

</CsInstruments>
<CsScore>
f 1  0 4096 10   1
f 2  0 4096 10   1  .5 .333 .25 .2 .166 .142 .125 .111 .1 .09 .083 .076 .071 .066 .062
f 3  0 4097 20   2  1
f 9  0 513  5    .001 128 .8  128 .6  256  1
f 16	0 513	7	0	256	1	256		0
f 17	0 513	7	0	10  1  246	1	10   0  246    0
f 18	0 513	7	0	10  1  502 0

;		st	dur	rvbtim	hfroll
;===================================================================
i199 	0	18	2.1  	.8
;ins	st	dur amp frq     atk	rel	cut1	cut2
;==================================================
i 139		0	.15	1	20000	.01	.01	10000	50
i 139		+	.	<	.		.	.	<
i 139		.	.	.	.		.	.	.
i 139		.	.	.	.		.	.	.
i 139		.	.	.	.		.	.	.
i 139		.	.	.	.		.	.	.
i 139		.	.	.	.		.	.	.
i 139		.	.	.	.		.	.	.
i 139		.	.	.	.		.	.	.
i 139		.	.	.	.		.	.	.
i 139		.	.	.	.		.	.	.
i 139		.	.	.	.		.	.	.
i 139		.	.	.	.		.	.	.
i 139		.	.	.	.		.	.	.
i 139		.	.	.5	.		.	.	100
i 139		.	.	<	.		.	.	<
i 139		.	.	.	.		.	.	.
i 139		.	.	.	.		.	.	.
i 139		.	.	.	.		.	.	.
i 139		.	.	.	.		.	.	.
i 139		.	.	.	.		.	.	.
i 139		.	.	.	.		.	.	.
i 139		.	.	.	.		.	.	.
i 139		.	.	.	.		.	.	.
i 139		.	.	.	.		.	.	.
i 139		.	.	.	.		.	.	.
i 139		.	.	.	.		.	.	.
i 139		.	.	.	.		.	.	.
i 139		.	.	.	.		.	.	.
i 139		.	.	.	.		.	.	.
i 139		.	.	.	.		.	.	.
i 139		.	.	.	.		.	.	.
i 139		.	.	.	.		.	.	.
i 139		.	.	.	.		.	.	.
i 139		.	3	1	.		.	.	10000

</CsScore>

</CsoundSynthesizer>