<CsoundSynthesizer>
<CsOptions>
; XO
;-+rtmidi=alsa  --midi-device=hw:1,0 -+rtaudio=alsa -odac -r16000 -k160 ;-O stdout
; Mac
-odac -r44100 -k441
</CsOptions>
<CsInstruments>
;==========================================;
; Random Pitch Instrument		           ;
;                                          ;
; This instrument chooses random pitches   ;
; using the Csound i() function to access  ;
; the most recent output from a rand unit  ;
; and make it available at i-time.  Note   ;
; that on the very first note of the score ;
; that value will always be zero, so it is ;
; necessary to generate a value using the  ;
; seed, itself. Also note that after the   ;
; first note, the rand seed must be set to ;
; -1 to ensure that the random sequence    ;
; continues for succeeding notes. RP       ;
;==========================================;
 	instr 	1
iamp	=	p4
iseed	=	p5
irndamp	=	36
	if	(iseed < 0) igoto continue
krndval	init	iseed*irndamp
continue:
krndval	rand	irndamp,iseed
irndval	=	i(krndval)
imidinn	=	int(irndval)+irndamp+24	;midi notes from 24 - 96
icps	=	cpsoct(3.00+imidinn/12)
asig	oscili	iamp,icps,1	;sine
asig	linen	asig,.1*p3,p3,.2*p3
	out	asig
	endin
</CsInstruments>
<CsScore>
;test score for the random pitch instrument
t00 120
f1 0 8192 10 1 0 .3 0 .1 0 .5
;	st	dur	amp	seed
i01	0	.33	20000	2
i01	+	.	.	-1
i
i
i
i
i
i
i
i
i
i
i
i
e
</CsScore>

</CsoundSynthesizer>