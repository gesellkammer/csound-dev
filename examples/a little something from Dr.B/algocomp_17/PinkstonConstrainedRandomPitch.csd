<CsoundSynthesizer>
<CsOptions>
; XO
;-+rtmidi=alsa  --midi-device=hw:1,0 -+rtaudio=alsa -odac -r16000 -k160 ;-O stdout
; Mac
-odac -r44100 -k44100
</CsOptions>
<CsInstruments>
;========================================;
; Constrained Random Pitch Instrument    ;
;                                        ;
; This instrument uses randh to choose   ;
; a random index into a table containing ;
; a set of pitches in PCH format.        ;
; Russell Pinkston                       ;                ;
;========================================; 
	instr	1
;init section
isine	=	1		;sine function in fn1
iamp	=	p4		;p4 has peak amplitude
ibase	=	octpch(p5)	;base pitch in octave.pch
irise	=	p6
idecay	=	p7
irange	=	.5		;randh range +/- .5
irandhz	=	p8
iseed	=	p9		;seed for rand
ipitfn	=	p10		;number of pitch table
;performance section
krval	randh	irange,irandhz,iseed
kindex	=	.5+krval	;offset to range of 0-1
kvaryp	table	kindex,ipitfn,1	;map rand index onto pitches in table
koct	=	octpch(kvaryp)	;convert table pch value to oct
kgate	linen	iamp,irise,p3,idecay
asig	oscili	kgate,cpsoct(ibase+koct),isine
	out	asig
	endin
</CsInstruments>
<CsScore>
;test score for randmap.orc
f1	0	8192	10	1	.3	.1	0	.05
;table of 16 pitches (all black notes - 3 octaves); no rescaling!
f2	0	16	-2	.01	.03	.06	.08	.10
	1.01	1.03	1.06	1.08	1.10	2.01	2.03	2.06
	2.08	2.10	3.01
;table of 16 pitches (only whole tones)
f3	0	16	-2	.00	.02	.04	.06	.08
	.10	1.00	1.02	1.04	1.06	1.08	1.10	2.00
	2.02	2.04	2.06
;nn	st	dur	amp	base	rise	dec	rndhz	seed	table
i01	0	30	10000	7.00	.1	5	8	.12345	2
;canon at upper octave
i01	4	26	.	8.00
;canon at lower octave
i01	8	22	12000	6.00
s
;repeat with different seed and different pitch table
;nn	st	dur	amp	base	rise	dec	rndhz	seed	table
i01	0	30	10000	7.00	.1	5	8	.23456	3
;canon at upper octave
i01	4	26	.	8.00
;canon at lower octave
i01	8	22	12000	6.00
e
</CsScore>

</CsoundSynthesizer>
