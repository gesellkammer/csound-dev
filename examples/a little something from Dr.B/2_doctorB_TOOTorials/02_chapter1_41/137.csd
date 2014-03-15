<CsoundSynthesizer>

<CsOptions>
-odac
</CsOptions>
<CsInstruments>
gacmb	init	0
garvb	init	0
		instr 	137
idur	=		p3
iamp	=		ampdb(p4)
ifrq	=		cpspch(p5)
ifun	=		p6
iatk	=		p7
irel	=		p8
irvbsnd	=		p9
icmbsnd	=		p10
kenv	linen	iamp, iatk, idur, irel
asig	loscil	kenv, ifrq, ifun
		out		asig
garvb	=		garvb+(asig*irvbsnd)
gacmb	=		gacmb+(asig*icmbsnd)
		endin

		instr	198
idur	=		p3
itime 	= 		p4
iloop 	= 		p5
kenv	linen	1, .01, idur, .01
acomb 	comb	gacmb, itime, iloop, 0
		out		acomb*kenv
gacmb	=		0
endin

		instr 	199
idur	=		p3
irvbtim	=		p4
ihiatn	=		p5
arvb	reverb2	garvb, irvbtim, ihiatn
		out		arvb
garvb	=		0
		endin

</CsInstruments>
<CsScore>
f 5  0 0    1   "hellorcb.aif" 	0 	4 	0

;ins	strt	dur 	amp		frq1	sample atk	rel	rvbsnd	cmbsnd
;===================================================================
i 137     0      .4		70  	8.09     5		.01	.01	.3		0
;ins	strt	dur 	rvbtim	hfroll
;===================================================================
i199	0		3		2.6		.1
;ins	strt	dur 	amp		frq1	sample atk	rel	rvbsnd	cmbsnd
;===================================================================
i 137     3      .4		70  	8.085     5		.01	.01	.6		0
;ins	strt	dur 	rvbtim	hfroll
;===================================================================
i199	3		9		8.6		.9
;ins	strt	dur 	amp		frq1	sample atk	rel	rvbsnd	cmbsnd
;===================================================================
i 137     12      .4		70  	8.095     5		.01	.01	.1		0
;ins	strt	dur 	rvbtim	hfroll
;===================================================================
i199	12		2		1.6		.5
;ins	strt	dur 	amp		frq1	sample atk	rel	rvbsnd	cmbsnd
;===================================================================
i 137     15      .4		70  	8.08     5		.01	.01	 0		.2
;ins	strt	dur 	time	loop
;===================================================================
i198	15		10		10		.25
;ins	strt	dur 	amp		frq1	sample atk	rel	rvbsnd	cmbsnd
;===================================================================
i 137     25      .4		70  	8.10     5		.01	.01	 0		.4
;ins	strt	dur 	time	loop
;===================================================================
i198	25		10		10		.56
;ins	strt	dur 	amp		frq1	sample atk	rel	rvbsnd	cmbsnd
;===================================================================
i 137     35      .4		70  	8.10     5		.01	.01	 0		.3
;ins	strt	dur 	time	loop
;===================================================================
i198	35		5		5		.1
;ins	strt	dur 	amp		frq1	sample atk	rel	rvbsnd	cmbsnd
;===================================================================
i 137     40      2.1		80  	8.105     5		.01	.01	 0		.4
;ins	strt	dur 	time	loop
;===================================================================
i198	40		2.1		1		.01
;ins	strt	dur 	amp		frq1	sample atk	rel	rvbsnd	cmbsnd
;===================================================================
i 137     42.2    2.36		80  	8.085     5		.01	.01	 0		.7
;ins	strt	dur 	time	loop
;===================================================================
i198	42.2	3		3		.02
;ins	strt	dur 	amp		frq1	sample atk	rel	rvbsnd	cmbsnd
;===================================================================
i 137     46     2.1		70  	8.09     5		.01	.01	.3		.6
i 137     47     2.1		70  	8.09     5		.01	.01	.5		.6
;ins	strt	dur 	rvbtim	hfroll
;===================================================================
i199	46		6		4.6		.8
;ins	strt	dur 	time	loop
;===================================================================
i198	46		6		10		.8
i198	46		6		10		.3
i198	46		6		10		.5

</CsScore>

</CsoundSynthesizer>