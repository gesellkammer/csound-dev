<CsoundSynthesizer>

<CsOptions>
; XO
;-+rtmidi=alsa  --midi-device=hw:1,0 -+rtaudio=alsa -odac -r16000 -k160 ;-O stdout
; Mac
-odac -+rtmidi=PortMIDI -M1 -r44100 -k44100
</CsOptions>

<CsInstruments>

instr 1
	idur	=	3

	aflute1 init 0
	;.........	Get a note from the MIDI instrument
	ifrq1	cpsmidi			; the note's frequency
	ifrq	= ifrq1/1.15		; correct the pitch 1.122 
	iamp	ampmidi	10000 	; the note's amplitude scaled to a value between 0 and 10000

	;.........	EG
	iatt =	.001 							; attack duration
	idec = 	.1							; decay duration
	islev = iamp							; make the sustain level of "kenv" the same as iamp 
	irel = 	.1							; duration of release phase
	kenv	madsr		iatt, idec, islev, irel		
													
	;.........	Main Oscilator
	;..........	air flow
	kenv1		linseg	0, .05, 1.1, .1, .98, (idur-.15), .95
	kenv2		linseg	1, (idur-.01), 1, .01, 0
	aflow1	rand		kenv1
	asum1		=		(aflow1*.0356)+kenv1
	asum2		=		asum1+(aflute1*.4)

	;..........	embouchure
	ax		delayr		(1/ifrq)*.25	; delay the signal asum2 by (1/ifrq)*.25
									; this opcode must be paired with a delayw
									; ax becomes the delayed version of asum2
			delayw		asum2
	apoly		=		ax-(ax*ax*ax)			; this is the "distortion" 
									; in the flow chart version (see Virtual Sound p. 104)
	asum3		=		apoly+(aflute1*.4)
	avalue	tone		asum3, 8*ifrq

	;..........	tube
	aflute1	delayr	(1/ifrq)*.75
			delayw	avalue

	;..........	Output
	amyinstr =	avalue*iamp*kenv2
			

	;.........	Output
	ascl		=	amyinstr*.6		; scale the amplitude so it does not distort
	aout	clip	ascl, 0, 32000		; clip anything over 32000 to be sure nothing is out of range
	out aout
endin
; Flute based on Perry Cook found in Virtual Sound p. 105
</CsInstruments>

<CsScore>
f1 0 16384 10 1 ; 0 .5 0 .3
;i#	str	dur
i1 	0 	60		; make the duration long this is 60 seconds
</CsScore>

</CsoundSynthesizer>