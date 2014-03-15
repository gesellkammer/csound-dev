<CsoundSynthesizer>

<CsOptions>
-odac -r44100 -k441
</CsOptions>
<CsInstruments>
		instr	127
idur	=		p3
iamp	=		ampdb(p4)
ifrq	=		cpspch(p5)
iatk	=		p6
irel	=		p7
ivibdel	=		p8
ivibdpt	=		p9
ivibfrq	=		p10
imdfrq1	=		cpspch(p11)
imdfrq2	=		cpspch(p12)
imdndx1	=		p13
imdndx2	=		p14
kenv	linen	iamp, iatk, idur, irel
kvibenv	linseg	0, ivibdel, 1, idur-ivibdel, .3
klfo	oscil	kvibenv*ivibdpt, ivibfrq, 1
kmodfrq	line	imdfrq1, p3, imdfrq2
kmodndx	linseg	imdndx1, p3/2, imdndx2, p3/2, imdndx1
amod	oscil	kmodndx*ifrq, kmodfrq, 1
aplk 	pluck 	iamp, ifrq+klfo, ifrq, 0, 1
asig	oscil	kenv, ifrq+klfo+amod, 1
amix	=		asig+aplk
       	out  	amix
		endin
</CsInstruments>

<CsScore>
;Function  1 uses the GEN10 subroutine to compute a sine wave
;Function  2 uses the GEN10 subroutine to compute the first sixteen partials of a sawtooth wave
;Function  8 uses the GEN05 subroutine to compute an exponential ADSR envelope function
;Function  9 uses the GEN05 subroutine to compute an exponential Attack for use with envlpx
;Function 10 uses the GEN05 subroutine to compute an exponential Attack for use with envlpx
;Function 11 uses the GEN01 subroutine to read in an AIF audio file "piano.aif"
;Function 12 uses the GEN01 subroutine to read in an AIF audio file "marimba.aif"
;Function 13 uses the GEN01 subroutine to read in an AIF audio file "brass.aif.aif"
;Function 14 uses the GEN01 subroutine to read in an AIF audio file "violin.aif"
;Function 15 uses the GEN05 subroutine to compute an exponential ADSR envelope function
;Function 16 uses the GEN07 subroutine to compute a linear triangle function for AM
;Function 17 uses the GEN07 subroutine to compute a square function for AM
f1  0 4096 10   1
f2  0 4096 10   1  .5 .333 .25 .2 .166 .142 .125 .111 .1 .09 .083 .076 .071 .066 .062
f5  0 0    1   "hellorcb.aif" 	0 	4 	0
f8  0 1024 5   .01  32  1   288   .8   512  .7   192  .01
f9  0 513  5    .001 128 .8  128 .6  256  1
f10 0 513  5   .01  64   1   64   .5   64  .99  64   .6  64  .98  64  .7  64 .97  32  .8  32 1
f11 0 0   -1   "piano.aif" 0 4 0
f12 0 0   -1   "marimba.aif" 0 4 0
f13 0 0   -1   "brass.aif" 0 4 0
f14 0 0   -1   "violin.aif" 0 4 0
f15 0 512  5    1   64  .7   136  .65    312  .001
f16	0 513	7	0	256	1	256		0
f17	0 513	7	0	10  1  246	1	10   0  246    0
f18	0 513	7	0	10  1  502 0
;ins	st		dur	amp	frq		atk	 rel lfodel	lfodpth	lfofrq	mdf1  mdf2 mdndx1	mdndx2
;=========================================================================================
i 127     0	    3.1	 	76	7.09	.01	 .3	  1.2	 6		5		7.10  7.09 10		4
i 127     3	    3.1	 	76	6.04	.1	 .4	  2.2	 4		7		6.04  8.03 	2		12
i 127     6	    3.1	 	76	5.09	.31	 .5	   3	 5		7		10.09  5.09 7		3
i 127     9	    14	 	70	5.09	2     5  	7	 10		36		4.02  12.03 40		20
i 127     9.06	13.94	70	6.09	1     5   	9	 14		56		4.03  12.02 30		10
i 127     9.1	13.9	70	7.09	.5    5   	11	 18		86		4.04  12.01 15		30
</CsScore>

</CsoundSynthesizer>