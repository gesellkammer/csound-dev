<CsoundSynthesizer>
<CsInstruments>
sr			=		44100
kr			=		441
ksmps		=		100
nchnls		=		1
			instr 1
inote		=		cpspch( p4)
ifc			=		p5
ifm			=		p6
id			=		p7*ifm		;p7 = Imax
iamp		=		p8
km			oscil	id,1/p3,p9
kc			oscil	iamp,1/p3,p10
am			oscil	km,ifm,1
ac			oscil	kc,(ifc+am),1
			out		ac
			endin
</CsInstruments>
<CsScore>
f1	0	1024	10	1
f2	0	1024	5	1	1000	.01
f3	0	1024	8	.8	50	1	100	.7	824	0
f4	0	512		7	1	100	0
f5	0	1024	7	0	100	1	124	.7	600	.7	100	0
f6	0	1024	7	0	100	1	824	1	100	0
			;NOTE	FC		FM		I	AMP
;BELL TONE
i1	0	15	8.00	200		280		10	10000	2	2
;WOOD DRUM
i1	11	.2	8.00	80		55		25	.		3	4
i1	12	.2	8.00	200		137.5	25	.		3	4
;BRASSLIKE
i1	13	.6	8.00	440		440		5	.		5	5
;CLARINET
i1	14	.5	8.00	900		800		2	.		6	6
i1	15	.5	8.00	900		800		3	.		.	.
i1	16	.5	8.00	900		800		4	.		.	.
e
</CsScore>
</CsoundSynthesizer>