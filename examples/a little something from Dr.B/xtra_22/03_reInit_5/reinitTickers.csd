<CsoundSynthesizer>

<CsOptions>
; XO
;-+rtmidi=alsa  --midi-device=hw:1,0 -+rtaudio=alsa -odac -r16000 -k160 ;-O stdout
; Mac
-odac -r44100 -k441
</CsOptions>

<CsInstruments>
nchnls	=	2
 
	instr	1			;simple ticking instrument
icps	=	cpspch(p5)		;oscil pitch
ilfohz	=	p8			;repeat envelope frequency
aenvlp	linen	p4,p6,p3,p7		;overall envelope
agate	oscili	aenvlp,ilfohz,p9	;repeating envelope
asig    oscili  agate,icps,p10
	outs	asig,asig
	endin
 
	instr	2		;ticking instrument with timout/reinit
;initialization block
iamp	=	p4
icps	=	cpspch(p5)
irise	=	p6
idecay	=	p7
ipkhz	=	p8
iamfn	=	p9
isinefn	=	p10
ihzfn	=	p11
ipanfn	=	p12
;performance block
klfohz	oscil1i	0,ipkhz,p3,ihzfn	;controls varying lfo freq
kpanfac	oscil1i	0,1,p3,ipanfn		;controls dynamic panning
klfohz	init	ipkhz			;init for first tick
;reinitialization block
reinitstart:
ilfodur	=	1/25			;tick duration is fixed
kmicro	oscil1i	0,iamp,ilfodur,iamfn	;envelope for each tick
	timout	0,1/i(klfohz),continue	;varying tick rate
	reinit	reinitstart
continue:
	rireturn			;end of reinit block
;---------------------------------------
aenvlp	linen	kmicro,irise,p3,idecay
asig	oscili	aenvlp,icps,isinefn
aleft	=	asig * sqrt(kpanfac)
aright	=	asig * sqrt(1-kpanfac)
	outs	aleft,aright
	endin
 
	instr	3	;version of instr 2 with pitch bend
;initialization block
iamp	=	p4
icps	=	cpspch(p5)
irise	=	p6
idecay	=	p7
ipkhz	=	p8	;max tick rate	
iamfn	=	p9
isinefn	=	p10
ihzfn	=	p11
ipanfn	=	p12
ibend	=	p13
ibendfn	=	p14
;performance block
klfohz	oscil1i	0,ipkhz,p3,ihzfn
kpanfac	oscil1i	0,1,p3,ipanfn
kpbend  oscil1i	0,ibend,p3,ibendfn
klfohz	init	ipkhz			;initial tick at max rate
;reinitialization block
reinitstart:
ilfodur	=	1/25			;tick duration is fixed
kmicro	oscil1i	0,iamp,ilfodur,iamfn	;envelope for each tick
	timout	0,1/i(klfohz),continue	;varying tick rate
	reinit	reinitstart
continue:
	rireturn
;--------------------------------------
aenvlp	linen	kmicro,irise,p3,idecay
kcps	=	icps + kpbend * icps
asig	oscili	aenvlp,kcps,isinefn
aleft	=	asig * sqrt(kpanfac)
aright	=	asig * sqrt(1-kpanfac)
	outs	aleft,aright
	endin
</CsInstruments>
<CsScore>
f1	0	8192	10	1
;the individual tick envelope function for instrs 2 & 3
f2	0	513	5	.0001	33	1	480	.000001
;pan control functions
f3	0	257	7	.5	128	1	129	.25
f4	0	257	7	0	128	1	129	0
;parms: st      dur     amp     pch     rise    decay   lfohz   lfofn   oscfn
i1	0	3	16000	13.00	1	2	15	2	1
i1	+	.	.	.	.	.	20
i1      +       .       .       .       .       .       25
e
f0	10
s
;parms:	st	dur	amp	pch	rise	decay	lfohz	amfn	oscfn
i2      0       3       16000    13.00   1       2       15      2       1
;	lfohzfn	panfn
	3	4
i2      +       .       .       .       .       .       20
i2      +       .       .       .       .       .       25
f0	10
s
;parms: st      dur     amp     pch     rise    decay   lfohz   amfn    oscfn
i3      0       3       16000    12.06   1       2       15      2       1
;	lfohzfn	panfn	ibend	bendfn
	3	4	.25	4
i3      +       .       .       .       .       .       20
i3      +       .       .       .       .       .       25
e
</CsScore>
</CsoundSynthesizer>