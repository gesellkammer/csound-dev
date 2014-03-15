<CsoundSynthesizer>

<CsOptions>
-odac -r44100 -k441
</CsOptions>
<CsInstruments>
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
</CsInstruments>
<CsScore>
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