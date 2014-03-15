<CsoundSynthesizer>

<CsOptions>
-odac -r44100 -k441
</CsOptions>

<CsInstruments>
		instr 	121
idur	=		p3
iamp	=		p4
ifrq	=		cpspch(p5)
ienvfun	=		p6
iwav1	=		p7
iwav1gn	=		p8
iwav2	=		p9
iwav2gn	=		p10
kenv    oscil   iamp, idur, ienvfun
awav2 	loscil  iwav2gn, ifrq*1.02, iwav2
awav1 	loscil  iwav1gn, ifrq, iwav1
		out 	(awav1+awav2)*kenv
		print	idur, iamp, ifrq
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

;ins	st	dur amp	frq   envfun  wv1	wv1gn	wv2	wv2gn
;===============================================
i 121 	0	.4	.1	8.09	15     11     1		12	1
i 121 	0.3	.4	.2	8.07	15     11     1		12	.9
i 121 	0.6 .4	.3	8.05	15     11     1		12	.8
i 121 	0.9	.4	.4	8.04	15     11     1		12	.7
i 121 	1.2	.4	.1	8.02	15     14     1		12	.6
i 121 	1.5	.4	.2	8.04	15     14     1		12	1
i 121 	1.8	.4	.3	8.05	15     14     1		12	.9
i 121 	2.1	.4	.4	8.08	15     14     1		12	.8
i 121 	2.4	.4	.1	8.09	15     13     1		12	.7
i 121 	2.7	.4	.2	8.04	15     13     1		12	.6
i 121 	3	.4	.3	8.00	15     13     1		12	1
i 121 	3.3	.4	.4	7.09	15     13     1		12	.9
i 121 	4	.7	.2	6.09	15     11     1		12	.8
i 121 	4.1	.6	.2	7.04	15     13     1		12	.7
i 121 	4.2	.5	.2	8.00	15     14     1		12	.6
i 121 	4.3	.4	.2	8.09	15     14     1		12	1

</CsScore>

</CsoundSynthesizer>