<CsoundSynthesizer>

<CsOptions>
; mac osx
-m0 -odac -iadc -+rtaudio=coreaudio -d -+rtmidi=null -Lstdin -b64 -B128 -r44100 -k441
</CsOptions>

<CsInstruments>
/*---
::  ASCII Key Piano Model
--::  by David Akbari

See attached image for how the ASCII keys interpret
  a chromatic piano.

White	=	White keys
Black	=	Black keys
Red	=	All Off / "SHUT UP NOW" 
---*/

nchnls	=	2
	maxalloc	1, 2
	maxalloc	2, 2
	maxalloc	3, 2
	maxalloc	4, 2
	maxalloc	5, 2
	maxalloc	6, 2
	maxalloc	7, 2
	maxalloc	8, 2
	maxalloc	9, 2
	maxalloc	10, 2
	maxalloc	11, 2
	maxalloc	12, 2
	maxalloc	13, 2
	maxalloc	14, 2
	maxalloc	15, 2
	maxalloc	16, 2
	maxalloc	17, 2
	maxalloc	18, 2
	maxalloc	19, 2
	maxalloc	20, 2
	maxalloc	21, 2
	maxalloc	22, 2
	maxalloc	23, 2
	maxalloc	24, 2
	maxalloc	25, 2
	maxalloc	26, 2
	maxalloc	27, 2
	maxalloc	28, 2

/* sine */
itmp	ftgen	1, 0, 16384, 10, 1
/* saw */
;itmp    ftgen   1, 0, 16384, 10, 1/1, 1/2, 1/3, 1/4, 1/5, 1/6, 1/7, 1/8, 1/9, 1/10, 1/11, 1/12, 1/13, 1/14, 1/15, 1/16

itmp	ftgen	99, 0, 256, 7, 0, 256, 0

opcode  cpsmid, k, k

kmid    xin

#define MIDI2CPS(xmidi) # (440.0*exp(log(2.0)*(($xmidi)-69.0)/12.0)) #
kcps    =       $MIDI2CPS(kmid)

        xout    kcps

                endop

/*--- ---*/

	instr	1

kpch	cpsmid	p4

a1	oscil	1000, kpch, 1
kenv	linenr	1, 0.05, 0.05, 0.05
a1	=	a1*kenv

	outs	a1, a1

	endin

/*--- ---*/

	instr	2

kpch	cpsmid	p4

a1	oscil	1000, kpch, 1
kenv	linenr	1, 0.05, 0.05, 0.05
a1	=	a1*kenv

	outs	a1, a1

	endin

/*--- ---*/

	instr	3

kpch	cpsmid	p4

a1	oscil	1000, kpch, 1
kenv	linenr	1, 0.05, 0.05, 0.05
a1	=	a1*kenv

	outs	a1, a1

	endin

/*--- ---*/

	instr	4

kpch	cpsmid	p4

a1	oscil	1000, kpch, 1
kenv	linenr	1, 0.05, 0.05, 0.05
a1	=	a1*kenv

	outs	a1, a1

	endin

/*--- ---*/

	instr	5

kpch	cpsmid	p4

a1	oscil	1000, kpch, 1
kenv	linenr	1, 0.05, 0.05, 0.05
a1	=	a1*kenv

	outs	a1, a1

	endin

/*--- ---*/

	instr	6

kpch	cpsmid	p4

a1	oscil	1000, kpch, 1
kenv	linenr	1, 0.05, 0.05, 0.05
a1	=	a1*kenv

	outs	a1, a1

	endin

/*--- ---*/

	instr	7

kpch	cpsmid	p4

a1	oscil	1000, kpch, 1
kenv	linenr	1, 0.05, 0.05, 0.05
a1	=	a1*kenv

	outs	a1, a1

	endin

/*--- ---*/

	instr	8

kpch	cpsmid	p4

a1	oscil	1000, kpch, 1
kenv	linenr	1, 0.05, 0.05, 0.05
a1	=	a1*kenv

	outs	a1, a1

	endin

/*--- ---*/

	instr	9

kpch	cpsmid	p4

a1	oscil	1000, kpch, 1
kenv	linenr	1, 0.05, 0.05, 0.05
a1	=	a1*kenv

	outs	a1, a1

	endin

/*--- ---*/

	instr	10

kpch	cpsmid	p4

a1	oscil	1000, kpch, 1
kenv	linenr	1, 0.05, 0.05, 0.05
a1	=	a1*kenv

	outs	a1, a1

	endin

/*--- ---*/

	instr	11

kpch	cpsmid	p4

a1	oscil	1000, kpch, 1
kenv	linenr	1, 0.05, 0.05, 0.05
a1	=	a1*kenv

	outs	a1, a1

	endin

/*--- ---*/

	instr	12

kpch	cpsmid	p4

a1	oscil	1000, kpch, 1
kenv	linenr	1, 0.05, 0.05, 0.05
a1	=	a1*kenv

	outs	a1, a1

	endin

/*--- ---*/

	instr	13

kpch	cpsmid	p4

a1	oscil	1000, kpch, 1
kenv	linenr	1, 0.05, 0.05, 0.05
a1	=	a1*kenv

	outs	a1, a1

	endin

/*--- ---*/

	instr	14

kpch	cpsmid	p4

a1	oscil	1000, kpch, 1
kenv	linenr	1, 0.05, 0.05, 0.05
a1	=	a1*kenv

	outs	a1, a1

	endin

/*--- ---*/

	instr	15

kpch	cpsmid	p4

a1	oscil	1000, kpch, 1
kenv	linenr	1, 0.05, 0.05, 0.05
a1	=	a1*kenv

	outs	a1, a1

	endin

/*--- ---*/

	instr	16

kpch	cpsmid	p4

a1	oscil	1000, kpch, 1
kenv	linenr	1, 0.05, 0.05, 0.05
a1	=	a1*kenv

	outs	a1, a1

	endin

/*--- ---*/

	instr	17

kpch	cpsmid	p4

a1	oscil	1000, kpch, 1
kenv	linenr	1, 0.05, 0.05, 0.05
a1	=	a1*kenv

	outs	a1, a1

	endin

/*--- ---*/

	instr	18

kpch	cpsmid	p4

a1	oscil	1000, kpch, 1
kenv	linenr	1, 0.05, 0.05, 0.05
a1	=	a1*kenv

	outs	a1, a1

	endin

/*--- ---*/

	instr	19

kpch	cpsmid	p4

a1	oscil	1000, kpch, 1
kenv	linenr	1, 0.05, 0.05, 0.05
a1	=	a1*kenv

	outs	a1, a1

	endin

/*--- ---*/

	instr	20

kpch	cpsmid	p4

a1	oscil	1000, kpch, 1
kenv	linenr	1, 0.05, 0.05, 0.05
a1	=	a1*kenv

	outs	a1, a1

	endin

/*--- ---*/

	instr	21

kpch	cpsmid	p4

a1	oscil	1000, kpch, 1
kenv	linenr	1, 0.05, 0.05, 0.05
a1	=	a1*kenv

	outs	a1, a1

	endin

/*--- ---*/

	instr	22

kpch	cpsmid	p4

a1	oscil	1000, kpch, 1
kenv	linenr	1, 0.05, 0.05, 0.05
a1	=	a1*kenv

	outs	a1, a1

	endin

/*--- ---*/

	instr	23

kpch	cpsmid	p4

a1	oscil	1000, kpch, 1
kenv	linenr	1, 0.05, 0.05, 0.05
a1	=	a1*kenv

	outs	a1, a1

	endin

/*--- ---*/

	instr	24

kpch	cpsmid	p4

a1	oscil	1000, kpch, 1
kenv	linenr	1, 0.05, 0.05, 0.05
a1	=	a1*kenv

	outs	a1, a1

	endin

/*--- ---*/

	instr	25

kpch	cpsmid	p4

a1	oscil	1000, kpch, 1
kenv	linenr	1, 0.05, 0.05, 0.05
a1	=	a1*kenv

	outs	a1, a1

	endin

/*--- ---*/

	instr	26

kpch	cpsmid	p4

a1	oscil	1000, kpch, 1
kenv	linenr	1, 0.05, 0.05, 0.05
a1	=	a1*kenv

	outs	a1, a1

	endin

/*--- ---*/

	instr	27

kpch	cpsmid	p4

a1	oscil	1000, kpch, 1
kenv	linenr	1, 0.05, 0.05, 0.05
a1	=	a1*kenv

	outs	a1, a1

	endin

/*--- ---*/

	instr	28

kpch	cpsmid	p4

a1	oscil	1000, kpch, 1
kenv	linenr	1, 0.05, 0.05, 0.05
a1	=	a1*kenv

	outs	a1, a1

	endin

/*--- ---*/

	instr	128	; the brain

kkey, kres	sensekey

  if	(kkey == -1) then  ; ma++ ingalls' control logic

kndx	=	kkey - 32

konoff	table	kndx, 99
konoff	=	(konoff == 0 ? -1 : 0)

	tablew	konoff, kndx, 99

  endif

/*  lower octave  */
  if	(kkey == 122) then ; z
kmid	=	48
elseif	(kkey == 115) then ; s
kmid	=	49
elseif	(kkey == 120) then ; x
kmid	=	50
elseif (kkey == 100) then ; d
kmid	=	51
elseif (kkey == 99) then ; c
kmid	=	52
elseif	(kkey == 118) then ; v
kmid	=	53
elseif	(kkey == 103) then ; g
kmid	=	54
elseif	(kkey == 98) then ; b
kmid	=	55
elseif (kkey == 104) then ; h
kmid	=	56
elseif (kkey == 110) then ; n
kmid	=	57
elseif (kkey == 106) then ; j
kmid	=	58
elseif (kkey == 109) then ; m
kmid	=	59
else
  endif

/*  upper octave  */
  if	(kkey == 113) then ; q
kmid	=	60
elseif	(kkey == 50) then ; 2
kmid	=	61
elseif	(kkey == 119) then ; w
kmid	=	62
elseif (kkey == 51) then ; 3
kmid	=	63
elseif (kkey == 101) then ; e
kmid	=	64
elseif	(kkey == 114) then ; r
kmid	=	65
elseif	(kkey == 53) then ; 5
kmid	=	66
elseif	(kkey == 116) then ; t
kmid	=	67
elseif (kkey == 54) then ; 6
kmid	=	68
elseif (kkey == 121) then ; y
kmid	=	69
elseif (kkey == 55) then ; 7
kmid	=	70
elseif (kkey == 117) then ; u
kmid	=	71
elseif (kkey == 105) then ; i
kmid	=	72
elseif (kkey == 57) then ; 9
kmid	=	73
elseif (kkey == 111) then ; o
kmid	=	74
elseif (kkey == 48) then ; 0
kmid	=	75
elseif (kkey == 112) then ; p
kmid	=	76
else
  endif

/*  allocate note events  */

; FIXME: Is there an opcode to query # of current
;        instr allocations so as to not use
;        1 instr per note for polyphony?

if	(kkey != -1 && kmid == 48) then
	event	"i", 1, 0, konoff, kmid
elseif	(kkey != -1 && kmid == 49) then
	event	"i", 2, 0, konoff, kmid
elseif	(kkey != -1 && kmid == 50) then
	event	"i", 3, 0, konoff, kmid
elseif	(kkey != -1 && kmid == 51) then
	event	"i", 4, 0, konoff, kmid
elseif	(kkey != -1 && kmid == 52) then
	event	"i", 5, 0, konoff, kmid
elseif	(kkey != -1 && kmid == 53) then
	event	"i", 6, 0, konoff, kmid
elseif	(kkey != -1 && kmid == 54) then
	event	"i", 7, 0, konoff, kmid
elseif	(kkey != -1 && kmid == 55) then
	event	"i", 8, 0, konoff, kmid
elseif	(kkey != -1 && kmid == 56) then
	event	"i", 9, 0, konoff, kmid
elseif	(kkey != -1 && kmid == 57) then
	event	"i", 10, 0, konoff, kmid
elseif	(kkey != -1 && kmid == 58) then
	event	"i", 11, 0, konoff, kmid
elseif	(kkey != -1 && kmid == 59) then
else
	endif

if	(kkey != -1 && kmid == 60) then
	event	"i", 12, 0, konoff, kmid
elseif	(kkey != -1 && kmid == 61) then
	event	"i", 13, 0, konoff, kmid
elseif	(kkey != -1 && kmid == 62) then
	event	"i", 14, 0, konoff, kmid
elseif	(kkey != -1 && kmid == 63) then
	event	"i", 15, 0, konoff, kmid
elseif	(kkey != -1 && kmid == 64) then
	event	"i", 16, 0, konoff, kmid
elseif	(kkey != -1 && kmid == 65) then
	event	"i", 17, 0, konoff, kmid
elseif	(kkey != -1 && kmid == 66) then
	event	"i", 18, 0, konoff, kmid
elseif	(kkey != -1 && kmid == 67) then
	event	"i", 19, 0, konoff, kmid
elseif	(kkey != -1 && kmid == 68) then
	event	"i", 20, 0, konoff, kmid
elseif	(kkey != -1 && kmid == 69) then
	event	"i", 21, 0, konoff, kmid
elseif	(kkey != -1 && kmid == 70) then
	event	"i", 22, 0, konoff, kmid
elseif	(kkey != -1 && kmid == 71) then
	event	"i", 23, 0, konoff, kmid
elseif	(kkey != -1 && kmid == 72) then
	event	"i", 24, 0, konoff, kmid
elseif	(kkey != -1 && kmid == 73) then
	event	"i", 25, 0, konoff, kmid
elseif	(kkey != -1 && kmid == 74) then
	event	"i", 26, 0, konoff, kmid
elseif	(kkey != -1 && kmid == 75) then
	event	"i", 27, 0, konoff, kmid
elseif	(kkey != -1 && kmid == 76) then
	event	"i", 28, 0, konoff, kmid
else
	endif

if	(kkey != -1 && kkey == 32) then	; "SHUT UP NOW"
	turnoff2	1, 0, 1
	turnoff2	2, 0, 1
	turnoff2	3, 0, 1
	turnoff2	4, 0, 1
	turnoff2	5, 0, 1
	turnoff2	6, 0, 1
	turnoff2	7, 0, 1
	turnoff2	8, 0, 1
	turnoff2	9, 0, 1
	turnoff2	10, 0, 1
	turnoff2	11, 0, 1
	turnoff2	12, 0, 1
	turnoff2	13, 0, 1
	turnoff2	14, 0, 1
	turnoff2	15, 0, 1
	turnoff2	16, 0, 1
	turnoff2	17, 0, 1
	turnoff2	18, 0, 1
	turnoff2	19, 0, 1
	turnoff2	20, 0, 1
	turnoff2	21, 0, 1
	turnoff2	22, 0, 1
	turnoff2	23, 0, 1
	turnoff2	24, 0, 1
	turnoff2	25, 0, 1
	turnoff2	26, 0, 1
	turnoff2	27, 0, 1
	turnoff2	28, 0, 1
else
	endif

	endin
</CsInstruments>
<CsScore>

i128	0	3600

e
</CsScore>

</CsoundSynthesizer>