<CsoundSynthesizer>
<CsOptions>
-odac -r44100 -k441
</CsOptions>
<CsInstruments>
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
</CsInstruments>
<CsScore>
a 0 0 10
;ins		st		dur amp frq     atk	rel	cf1		cf2		bw1	bw2
;==============================================================
i 128		10		5	.5	10000	.5	2	80	20000		800	30
e
i 128		14		5	.5	20000	.25	1	200		12000	10	200
i 128		18		3	.5	20000	.15	.1	800		300		300	40
i 128		20		11	.5	20000	1	1	40		90		10	40
i 128		23		7	.4	20000	.05	2	8000	150		100	50
i 128		25		5	.3	20000	2	1	800		2000	200	500
i 128		26		4	.2	20000	.03	.1	5000	200		1000	70
i 128		27		3	.1	20000	1	.1	30		6000	10	400
</CsScore>

</CsoundSynthesizer>
<MacOptions>
Version: 3
Render: Real
Ask: Yes
Functions: ioObject
Listing: Window
WindowBounds: 72 179 400 200
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

