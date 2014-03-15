<CsoundSynthesizer>

<CsOptions>
; mac osx
-m0 -odac -iadc -d -+rtmidi=null -Lstdin -+rtaudio=coreaudio -b64 -B128 
</CsOptions>

<CsInstruments>
nchnls		=	2

gifn1	ftgen	1,0,16384,10,1
gifn5	ftgen	5,0,16384,21,6,1

/*---

::  ASCII Key Drum Model
--::  by David Akbari

Current Implementation:

(Key)	:	(Drum type)
-----		-----------
A	=	Snare drum
S	=	Kick drum
D	=	Closed Hi-hat
F	=	Open Hi-hat

---*/

/**********************************/

		instr	1	;snare drum

;	init

idur		=	p3
iamp		=	ampdb(p4)
ifrq		=	p5
iatk		=	p6

;	synth

kampenv	expseg	iatk,	.5,	.001
;asnare	oscil		kampenv,	ifrq,	5
asnare	foscil	kampenv,	ifrq,	1,	1,	100,	5
klfo		oscil		.5,	.25,	1
klfo		=	klfo + .5

	outs		asnare*klfo, asnare*(1-klfo)	

		endin

/**********************************/

		instr	2	;kick drum

;	init

idur		=	p3
indx		=	p4
ivel		=	p5

;	synth

kpenv		expon		60, 1, 40
kampenv	expseg	.001, .01, ivel, 1, .001
akick		foscil	kampenv, kpenv, 1, 4, indx, 1
alpf		butterlp	akick, 80

	outs		alpf, alpf

		endin

/**********************************/

		instr	3	;hi hat

;	init

idur		=	p3
iamp		=	p4
ifrq		=	p5
idrum		=	p6
ilforate	=	p7
iseed		=	p8

ipan		=	.5

if	(idrum	==	1)	kgoto closed
if	(idrum	==	2)	kgoto	open
	kgoto end

;	synth

closed:
kampenv	expseg	p4+5000, .2, .01
	kgoto contin

open:
kampenv	linseg	p4+5000, .2, .01
	kgoto contin

contin:
kamplfo	oscil		.5,	ilforate,	1
kpan		oscil		.5,	idur/4,	1
kamplfo	=	kamplfo + .5
;ahhat		oscil		((kampenv + ampdb(kamplfo))/2), ifrq, 5
ahhat		foscil	((kampenv + ampdb(kamplfo))/2), ifrq, 1, 1, 100, 5
afilt2	atone		ahhat, 8000
afilt1	atone		afilt2, 8000
kpan		=	kpan + .5

	outs		afilt1 * (1 - kpan), afilt1 * (kpan)
end:
		endin

/**********************************/

		instr	4	;meta keys

k1	sensekey

	if	(k1 == 97) then
	event	"i",1,0,1,78,1289,15000
elseif	(k1 == 115) then
	event "i",2,0,0.75,1,15000
elseif	(k1 == 100) then
	event "i",3,0,0.5,20000,1289,1,0.25,0
elseif	(k1 == 102) then
	event "i",3,0,0.5,20000,1289,2,0.25,0
else
		endif

		endin
</CsInstruments>
<CsScore>
i4	0	300

e
</CsScore>

</CsoundSynthesizer>