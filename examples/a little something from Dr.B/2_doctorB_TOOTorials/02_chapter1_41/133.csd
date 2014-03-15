<CsoundSynthesizer>

<CsOptions>
-odac -r44100 -k441
</CsOptions>
<CsInstruments>
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
</CsInstruments>
<CsScore>
;ins	st		dur ampdb 	frq		fc1		fc2	resgn
;======================================================================
i 133		0		.1	90		440		1000	20	 1
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
</CsScore>
</CsoundSynthesizer>