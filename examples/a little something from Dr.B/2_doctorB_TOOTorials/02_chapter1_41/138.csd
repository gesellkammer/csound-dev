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

		instr   138 ;sweeping fm with vibrato & discrete pan
idur	=		p3
iamp	=		ampdb(p4)
ifrq	=		cpspch(p5)
ifc		=		p6
ifm		=		p7
iatk	=		p8
irel	=		p9
indx1	=		p10
indx2	=		p11
indxtim	=		p12
ilfodep	=		p13
ilfofrq	=		p14
ipan	=		p15
irvbsnd	=		p16
klfopan oscil .5, 1, 1
klfopan = klfopan+.5
kpan	expseg 1,p3*.3,0.0001,p3*.3,1,p3*.4,0.0001
kampenv	expseg	.01, iatk, iamp, idur/9, iamp*.6, idur-(iatk+irel+idur/9), iamp*.7, irel,.01
klfo	oscil	ilfodep, ilfofrq, 1
kindex  expon  	indx1, indxtim, indx2
krand	randh	100, 60
krandpan	randh	1, 10
printk .1, abs(krandpan)
asig   	foscil 	kampenv, ifrq+klfo+krand, ifc, ifm, kindex, 1
		outs     asig*klfopan, asig*(1-klfopan)
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
f1  0 4096 10   1

;		st	dur	rvbtim	hfroll
;===================================================================
i 199 	0	22	1.3  	.09
;		st	dr 	amp	frq		fc	fm	atk	rel	ndx1	ndx2	ndxtim  lfodep	lfofrq	pan	rvbsnd
;=================================================================================
i 138	0	1	80	8.09	1	2	.01	.2	20	4		.85		7		5		1	.1
e
i 138	2	2	80	.		2	1	. 	. 	10		1		.8		.		6		0	.2
i 138	5	.2	80	.		1	2	. 	.1	30		.		.01		9		4		1	.1
i 138	+	.	79	.		2	1	.	.	<		<		<		<		<		~	<
i 138	+	.	78	.		1	3	.	.	.		.		.		.		.		.	.
i 138	+	.	77	.		3	1	.	.	.		.		.		.		.		.	.
i 138	+	.	76	.		1	4	.	.	.		.		.		.		.		.	.
i 138	+	.	75	.		4	1	.	.	.		.		.		.		.		.	.
i 138	+	.	74	.		1	5	.	.	.		.		.		.		.		.	.
i 138	+	.	73	.		5	1	.	.	.		.		.		.		.		.	.
i 138	+	.	72	.		1	6	.	.	.		.		.		.		.		.	.
i 138	+	1	71	.		6	1	.	.	10		3		.2		4		10		0	.04
i 138	+	.2	71	.		6	1	.	.	<		<		<		<		<		<	<
i 138	+	.	72	.		1	6	.	.	.		.		.		.		.		.	.
i 138	+	.	73	.		5	1	.	.	.		.		.		.		.		.	.
i 138	+	.	74	.		1	5	.	.	.		.		.		.		.		.	.
i 138	+	.	75	.		4	1	.	.	.		.		.		.		.		.	.
i 138	+	.	76	.		1	4	.	.	.		.		.		.		.		.	.
i 138	+	.	77	.		3	1	.	.	.		.		.		.		.		.	.
i 138	+	.	78	.		1	3	.	.	.		.		.		.		.		.	.
i 138	+	.	79	.		2	1	.	.	.		.		.		.		.		.	.
i 138	+	.2	80	.		1	2	. 	.1	30		1		.01		9		4		1	.1
i 138	+	2	80	.		2	1	.  	.2	10		4		.8		7		6		1	.2
i 138	2.5	4	80	.		1	2	. 	. 	20		4		.5		.		5		0	.1

</CsScore>

</CsoundSynthesizer>
<MacOptions>
Version: 3
Render: Real
Ask: Yes
Functions: ioObject
Listing: Window
WindowBounds: 72 163 400 200
CurrentView: io
IOViewEdit: On
Options: -b128 -A -s -m167 -R
</MacOptions>

<MacGUI>
ioView nobackground {65535, 65535, 65535}
ioSlider {5, 5} {20, 100} 0.000000 1.000000 0.000000 slider1
ioSlider {45, 5} {20, 100} 0.000000 1.000000 0.000000 slider2
ioSlider {85, 5} {20, 100} 0.000000 1.000000 0.000000 slider3
ioSlider {125, 5} {20, 100} 0.000000 1.000000 0.000000 slider4
ioSlider {165, 5} {20, 100} 0.000000 1.000000 0.000000 slider5
</MacGUI>

