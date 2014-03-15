<CsoundSynthesizer>

<CsOptions>
-odac
</CsOptions>

<CsInstruments>
sr        =         44100
kr        =         441
ksmps     =         100
nchnls 	= 		1

gacmb	init	0
garvb	init	0


		instr	128
idur	=		p3
iamp	=		p4
ifrq	=		p5
iatk	=		p6
irel	=		p7
icf1	=		p8
icf2	=		p9
ibw1	=		p10
ibw2	=		p11
kenv	expseg	.001, iatk, iamp, idur/6, iamp*.4, idur-(iatk+irel+idur/6), iamp*.6, irel,.01
anoise	rand	ifrq
kcf		expon	icf1, idur, icf2
kbw		line	ibw1, idur, ibw2
afilt	reson	anoise, kcf, kbw, 2
       	out  	afilt*kenv
       	display	kenv, idur
		endin

		instr	129
idur	=		p3
iamp	=		p4
ifrq	=		p5
iatk	=		p6
irel	=		p7
icut1	=		p8
icut2	=		p9
kenv	linen	iamp, iatk, idur, irel
kcut	expon	icut1, idur, icut2
anoise	rand	ifrq
afilt	tone	anoise, kcut
       	out  	afilt*kenv
		dispfft	afilt, idur, 4096
		endin

		instr	130
idur	=		p3
iamp	=		p4
ifrq	=		p5
iatk	=		p6
irel	=		p7
icut1	=		p8
icut2	=		p9
kenv	linen	iamp, iatk, idur, irel
kcut	expon	icut1, idur, icut2
anoise	rand	ifrq
afilt2	tone	anoise, kcut
afilt1	tone	afilt2, kcut
       	out  	afilt1*kenv
		dispfft	afilt1, idur, 4096
		endin

		instr	131
idur	=		p3
iamp	=		p4
ifrq	=		p5
iatk	=		p6
irel	=		p7
icut1	=		p8
icut2	=		p9
kenv	linen	iamp, iatk, idur, irel
kcut	expon	icut1, idur, icut2
anoise	rand	ifrq
afilt3	tone	anoise, kcut
afilt2	tone	afilt3, kcut
afilt1	tone	afilt2, kcut
       	out  	afilt1*kenv
		dispfft	afilt1, idur, 4096
		endin

		instr	132
idur	=		p3
iamp	=		p4
ifrq	=		p5
iatk	=		p6
irel	=		p7
icut1	=		p8
icut2	=		p9
kenv	linen	iamp, iatk, idur, irel
kcut	expon	icut1, idur, icut2
anoise	rand	ifrq
afilt4	tone	anoise, kcut
afilt3	tone	afilt4, kcut
afilt2	tone	afilt3, kcut
afilt1	tone	afilt2, kcut
       	out  	afilt1*kenv
		dispfft	afilt1, idur, 4096
		endin

		instr   133
idur	=		p3
iamp	=		ampdb(p4)
ifrq	=		p5
icut1	=		p6
icut2	=		p7
iresgn	=		p8
kcut	expon	icut1, idur, icut2
aplk 	pluck 	iamp, ifrq, ifrq, 0, 1
abpf	butterbp	aplk, kcut, kcut*.2
alpf	butterlp	aplk, kcut
amix	=     alpf+(abpf*iresgn)
		out		amix
		dispfft	amix, idur, 1024
		endin

		instr   134
idur	=		p3
iamp	=		ampdb(p4)
ifrq	=		cpspch(p5)
icut1	=		p6
icut2	=		p7
iresgn	=		p8
kcut	expon	icut1, idur, icut2
aplk 	pluck 	iamp, ifrq, ifrq, 0, 1
abpf	butterbp	aplk, kcut, kcut*.2
alpf	butterlp	aplk, kcut
amix	=     alpf+(abpf*iresgn)
		out		amix
		dispfft	amix, idur, 1024
		endin

		instr 	135
idur	=		p3
iamp	=		p4
ifrq	=		p5
iatk	=		p6
irel	=		p7
irat1	=		p8
irat2	=		p9
imsdel	=		p10
kenv	expseg	.001, iatk, iamp, idur/8, iamp*.3, idur-(iatk+irel+idur/8), iamp*.7, irel,.01
krate	line	irat1, idur, irat2
alfo	oscil	imsdel, krate/idur, 19
anoise	rand	ifrq
adel4	vdelay	anoise, alfo, imsdel
adel3	vdelay	adel4, alfo, imsdel
adel2	vdelay	adel3, alfo, imsdel
adel1	vdelay	adel2, alfo, imsdel
adel0	vdelay	adel1, alfo, imsdel
amix	=		adel0+adel1+adel2+adel3+adel4
		out		kenv*amix
		dispfft	amix, idur, 1024
		endin

		instr 	136
idur	=		p3
iamp	=		ampdb(p4)
ifrq	=		cpspch(p5)
ilfodep	=		p6
ilfofrq	=		p7
ilfofun	=		p8
irat1	=		p9
irat2	=		p10
imsdel	=		p11
kgate	linen	1, .01, idur, .1
klfo	oscil	ilfodep, ilfofrq, ilfofun
krate	line	irat1, idur, irat2
alfo	oscil	imsdel, krate/idur, 19
aplk 	pluck 	iamp, ifrq+klfo, ifrq, 0, 1
adel4	vdelay	aplk, alfo, imsdel
adel3	vdelay	adel4, alfo, imsdel
adel2	vdelay	adel3, alfo, imsdel
adel1	vdelay	adel2, alfo, imsdel
adel0	vdelay	adel1, alfo, imsdel
amix	=		adel0+adel1+adel2+adel3+adel4
		out		amix*kgate
		dispfft	amix, idur, 1024
		endin

</CsInstruments>
<CsScore>
;Function  1 uses the GEN10 subroutine to compute a sine wave
;Function  2 uses the GEN10 subroutine to compute the first sixteen partials of a sawtooth wave
;Function  3 uses the GEN20 subroutine to compute a Hanning window for use as a grain envelope
;Function  8 uses the GEN05 subroutine to compute an exponential ADSR envelope function
;Function  9 uses the GEN05 subroutine to compute an exponential Attack for use with envlpx
;Function 10 uses the GEN05 subroutine to compute an exponential Attack for use with envlpx
;Function 11 uses the GEN01 subroutine to read in an AIF audio file "piano.aif"
;Function 12 uses the GEN01 subroutine to read in an AIF audio file "marimba.aif"
;Function 13 uses the GEN01 subroutine to read in an AIF audio file "brass.aif.aif"
;Function 14 uses the GEN01 subroutine to read in an AIF audio file "violin.aif"
;Function 15 uses the GEN05 subroutine to compute an exponential ADSR envelope function
;Function 16 uses the GEN07 subroutine to compute a linear triangle function for AM
;Function 17 uses the GEN07 subroutine to compute a square function for AM

f1  0 4096 10   1
f2  0 4096 10   1  .5 .333 .25 .2 .166 .142 .125 .111 .1 .09 .083 .076 .071 .066 .062
f3  0 4097 20   2  1
f5  0 0    1   "hellorcb.aif" 	0 	4 	0
f8  0 1024 5   .01  32  1   288   .8   512  .7   192  .01
f9  0 513  5    .001 128 .8  128 .6  256  1
f10 0 513  5   .01  64   1   64   .5   64  .99  64   .6  64  .98  64  .7  64 .97  32  .8  32 1
f11 0 0   1   "piano.aif" 0 4 0
f12 0 0   1   "marimba.aif" 0 4 0
f13 0 0   1   "brass.aif" 0 4 0
f14 0 0   1   "violin.aif" 0 4 0
f15 0 512  5    1   64  .7   136  .65    312  .001
f16	0 513	7	0	256	1	256		0
f17	0 513	7	0	10  1  246	1	10   0  246    0
f18	0 513	7	0	10  1  502 0
f19 0 1024 -8 .1 	512 .9 512 .1

; INS	ST	DUR	AMPDB	FRQ	FC1	FC2	RESONGAIN

a 0 0 10

;ins	st	dur amp frq     atk	rel	cf1		cf2		bw1	bw2
;==============================================================
i 128	1	5	.5	20000	.5	2	8000	200		800	30
i 128	6	5	.5	20000	.25	1	200		12000	10	200


i 128	10	5	.5	20000	.5	2	8000	200		800	30
i 128	14	5	.5	20000	.25	1	200		12000	10	200
i 128	18	3	.5	20000	.15	.1	800		300		300	40
i 128	20	11	.5	20000	1	1	40		90		10	40
i 128	23	7	.4	20000	.05	2	8000	150		100	50
i 128	25	5	.3	20000	2	1	800		2000	200	500
i 128	26	4	.2	20000	.03	.1	5000	200		1000	70
i 128	27	3	.1	20000	1	.1	30		6000	10	400
s
;ins	st	dur amp frq     atk	rel	cut1	cut2
;==================================================
i 129	0	1.5	3	20000	.1	.1	 500	500
i 130	2	1.5	3	20000	.1	.1	 500	500
i 131	4	1.5	3	20000	.1	.1	 500	500
i 132	6	1.5	3	20000	.1	.1	 500	500
i 129	8	1.2	1	20000	.01	.01	 5000	40
i 130	11	1.2	1	20000	.01	.01	 5000	40
i 131	12	1.2	1	20000	.01	.01	 5000	40
i 132	13	1.2	1	20000	.01	.01	 5000	40
s
;ins	st	dur amp frq     atk	rel	cut1	cut2
;==================================================
i 129	0	1.5	3	20000	.1	.1	 500	500
i 130	2	1.5	3	20000	.1	.1	 500	500
i 131	4	1.5	3	20000	.1	.1	 500	500
i 132	6	1.5	3	20000	.1	.1	 500	500
i 129	8	1.2	1	20000	.01	.01	 5000	40
i 130	11	1.2	1	20000	.01	.01	 5000	40
i 131	12	1.2	1	20000	.01	.01	 5000	40
i 132	13	1.2	1	20000	.01	.01	 5000	40
s
f 0 2
s
;ins	st	dur amp frq     atk	rel	cf1		cf2		bw1	bw2
;==============================================================
i 128	0	5	.5	20000	.5	2	8000	200		800	30
i 128	4	5	.5	20000	.25	1	200		12000	10	200
i 128	8	3	.5	20000	.15	.1	800		300		300	40
i 128	10	11	.5	20000	1	1	40		90		10	40
s
i 132	0	.2	1	20000	.01	.01	10000	40
i 132	+	.	<	.		.	.	<
i 132	.	.	.	.		.	.	.
i 132	.	.	.	.		.	.	.
i 132	.	.	.	.		.	.	.
i 132	.	.	.	.		.	.	.
i 132	.	.	.	.		.	.	.
i 132	.	.	.	.		.	.	.
i 132	.	.	.	.		.	.	.
i 132	.	.	.	.		.	.	.
i 132	.	.	.5	.		.	.	100
i 132	.	.	<	.		.	.	<
i 132	.	.	.	.		.	.	.
i 132	.	.	.	.		.	.	.
i 132	.	.	.	.		.	.	.
i 132	.	.	.	.		.	.	.
i 132	.	.	.	.		.	.	.
i 132	.	.	.	.		.	.	.
i 132	.	.	.	.		.	.	.
i 132	.	.	.	.		.	.	.
i 132	.	.	.	.		.	.	.
i 132	.	.	.	.		.	.	.
i 132	.	.	.	.		.	.	.
i 132	.	.	.	.		.	.	.
i 132	.	3	1	.		.	.	10000
s
f0 1
s
;ins	st		dur ampdb 	frq		fc1		fc2	resgn
;======================================================================
i 133	0		.1	90		440		1000	20	 1
i.		+		.	<		<		<		.	 <
i.		.		.	.		.		.		.	 .
i.		.		.	.		.		.		.	 .
i.		.		.	.		.		.		.	 .
i.		.		.	.		.		.		.	 .
i.		.		.	.		.		.		.	 .
i.		.		.	.		.		.		.	 .
i.		.		.	.		.		.		.	 .
i.		.		.	.		.		.		.	 .
i.		.		.	.		.		.		.	 .
i.		.		.	.		.		.		.	 .
i.		.		.	.		.		.		.	 .
i.		.		.	.		.		.		.	 .
i.		.		.	.		.		.		.	 .
i.		.		.	.		.		.		.	 .
i.		.		.	.		.		.		.	 .
i.		.		.	.		.		.		.	 .
i.		.		.	.		.		.		.	 .
i.		.		.	.		.		.		.	 .
i.		.		.	60		55		60		20	 30
i.		.		.	<		<		<		<	 <
i.		.		.	.		.		.		.	 .
i.		.		.	.		.		.		.	 .
i.		.		.	.		.		.		.	 .
i.		.		.	.		.		.		.	 .
i.		.		.	.		.		.		.	 .
i.		.		.	.		.		.		.	 .
i.		.		.	.		.		.		.	 .
i.		.		.	.		.		.		.	 .
i.		.		.	.		.		.		.	 .
i.		.		.	.		.		.		.	 .
i.		.		.	.		.		.		.	 .
i.		.		.	.		.		.		.	 .
i.		.		.	.		.		.		.	 .
i.		.		.	.		.		.		.	 .
i.		.		.	.		.		.		.	 .
i.		.		.	.		.		.		.	 .
i.		.		.	.		.		.		.	 .
i.		.		.	.		.		.		.	 .
i.		.		5	80		880		2000	200	 5
s
f0 1
s
;ins	st		dur ampdb 	frq		fc1		fc2	resgn
;======================================================================
i 134	0		.1	90		8.09	1000	20	 1
i.		+		.	<		<		<		.	 <
i.		.		.	.		.		.		.	 .
i.		.		.	.		.		.		.	 .
i.		.		.	.		.		.		.	 .
i.		.		.	.		.		.		.	 .
i.		.		.	.		.		.		.	 .
i.		.		.	.		.		.		.	 .
i.		.		.	.		.		.		.	 .
i.		.		.	.		.		.		.	 .
i.		.		.	.		.		.		.	 .
i.		.		.	.		.		.		.	 .
i.		.		.	.		.		.		.	 .
i.		.		.	.		.		.		.	 .
i.		.		.	.		.		.		.	 .
i.		.		.	.		.		.		.	 .
i.		.		.	.		.		.		.	 .
i.		.		.	.		.		.		.	 .
i.		.		.	.		.		.		.	 .
i.		.		.	.		.		.		.	 .
i.		.		.	60		4.09	60		20	 30
i.		.		.	<		<		<		<	 <
i.		.		.	.		.		.		.	 .
i.		.		.	.		.		.		.	 .
i.		.		.	.		.		.		.	 .
i.		.		.	.		.		.		.	 .
i.		.		.	.		.		.		.	 .
i.		.		.	.		.		.		.	 .
i.		.		.	.		.		.		.	 .
i.		.		.	.		.		.		.	 .
i.		.		.	.		.		.		.	 .
i.		.		.	.		.		.		.	 .
i.		.		.	.		.		.		.	 .
i.		.		.	.		.		.		.	 .
i.		.		.	.		.		.		.	 .
i.		.		.	.		.		.		.	 .
i.		.		.	.		.		.		.	 .
i.		.		.	.		.		.		.	 .
i.		.		.	.		.		.		.	 .
i.		.		.	.		.		.		.	 .
i.		.		5	80		9.09	2000	200	 5
s
f0 1
s
;ins	st		dur ampdb 	frq			fc1		fc2	resgn
;======================================================================
i 134	0		.1	81		8.09		8000	80	 1
i.		+		.	<		8.095		<		<	 <
i.		.		.	.		8.10		.		.	 .
i.		.		.	.		8.105		.		.	 .
i.		.		.	.		8.11		.		.	 .
i.		.		.	.		8.115		.		.	 .
i.		.		.	.		9.00		.		.	 .
i.		.		.	.		9.005		.		.	 .
i.		.		.	.		9.01		.		.	 .
i.		.		.	.		9.015		.		.	 .
i.		.		.	.		9.02		.		.	 .
i.		.		.	.		9.025		.		.	 .
i.		.		.	.		9.03		.		.	 .
i.		.		.	.		9.035		.		.	 .
i.		.		.	.		9.04		.		.	 .
i.		.		.	.		9.045		.		.	 .
i.		.		.	.		9.05		.		.	 .
i.		.		.	.		9.055		.		.	 .
i.		.		.	.		9.06		.		.	 .
i.		.		.	.		9.065		.		.	 .
i.		.		.	.		9.07		.		.	 .
i.		.		.	.		9.075		.		.	 .
i.		.		.	.		9.08		.		.	 .
i.		.		.	.		9.085		.		.	 .
i.		.		6	68		9.09		500		50	 30
s
f0 1
s
;ins	strt		dur amp	frq   atk	rel	rat1	rat2	msdel
;==========================================================
f0 1
f0 2
f0 3
f0 4
f0 5
i 135		0		6	.5	10000 .1	1	.3   	10  	6
i 135		6.5		6	.5	10000 .1	2	.01  	1  		5
f0 7
f0 8
f0 9
f0 10
f0 11
;ins		strt	dur amp	frq   lfpdep	lfofrq	lfofun	rat1	rat2	imsdel
;=============================================================================
i 136		13		6	80	4.09 	1		20		1		.3  	.6		8
i 136		19.5	6	80	4.11 	15		5		1		2  		.1		7
i 136		26		20	80	5.09 	20		8		17		.03  	1		5
i 136		31		15	80	6.01 	30		5		17		.08  	2		6
i 136		36		10	80	4.04 	40		3		17		.3 	   .09		7
s
f0 2
s
t 0 60
i 134	0	.1	90	8.09	8000	80	1
i .		+	.	<	8.095	<		<	<
i .		.	.	.	8.10	.		.	.
i .		.	.	.	8.105	.		.	.
i .		.	.	.	8.11	.		.	.
i .		.	.	.	8.115	.		.	.
i .		.	.	.	9.00	.		.	.
i .		.	.	.	9.005	.		.	.
i .		.	.	.	9.01	.		.	.
i .		.	.	.	9.015	.		.	.
i .		.	.	80	9.02	9000	60	50
s
t 0 120
i 134	0	.1	90	8.09	8000	80	1
i .		+	.	<	8.095	<		<	<
i .		.	.	.	8.10	.		.	.
i .		.	.	.	8.105	.		.	.
i .		.	.	.	8.11	.		.	.
i .		.	.	.	8.115	.		.	.
i .		.	.	.	9.00	.		.	.
i .		.	.	.	9.005	.		.	.
i .		.	.	.	9.01	.		.	.
i .		.	.	.	9.015	.		.	.
i .		.	.	80	9.02	9000	60	50
s
t 0 30
i 134	0	.1	90	8.09	8000	80	1
i .		+	.	<	8.095	<		<	<
i .		.	.	.	8.10	.		.	.
i .		.	.	.	8.105	.		.	.
i .		.	.	.	8.11	.		.	.
i .		.	.	.	8.115	.		.	.
i .		.	.	.	9.00	.		.	.
i .		.	.	.	9.005	.		.	.
i .		.	.	.	9.01	.		.	.
i .		.	.	.	9.015	.		.	.
i .		.	.	80	9.02	9000	60	50
s
t 0 120 1 30
i 134	0	.1	90	8.09	8000	80	1
i .		+	.	<	8.095	<		<	<
i .		.	.	.	8.10	.		.	.
i .		.	.	.	8.105	.		.	.
i .		.	.	.	8.11	.		.	.
i .		.	.	.	8.115	.		.	.
i .		.	.	.	9.00	.		.	.
i .		.	.	.	9.005	.		.	.
i .		.	.	.	9.01	.		.	.
i .		.	.	.	9.015	.		.	.
i .		.	.	80	9.02	9000	60	50
s
t 0 120 1 15
i 134	0	.1	90	8.09	8000	80	1
i .		+	.	<	8.095	<		<	<
i .		.	.	.	8.10	.		.	.
i .		.	.	.	8.105	.		.	.
i .		.	.	.	8.11	.		.	.
i .		.	.	.	8.115	.		.	.
i .		.	.	.	9.00	.		.	.
i .		.	.	.	9.005	.		.	.
i .		.	.	.	9.01	.		.	.
i .		.	.	.	9.015	.		.	.
i .		.	.	80	9.02	9000	60	50
e

</CsScore>

</CsoundSynthesizer>