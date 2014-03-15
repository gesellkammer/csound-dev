<CsoundSynthesizer>
<CsOptions>
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 64
nchnls = 2
0dbfs = 1

#define NEXT_POW_2(x) #2 ** ceil(log( $x ) / 0.69314718055994529)#

gibreakpoints = 264
gifreq	ftgen 0, 0, -264, -23, "/Users/edu/Desktop/pru-freq.txt"
giamp 	ftgen 0, 0, -264, -23, "/Users/edu/Desktop/pru-amp.txt"
git0 = 0.037503
git1 = 2.665703
gidur = git1 - git0
gidt = 0.01

;opcode table_at, kkkk, k
;	ktime xin
;	kx = (ktime - git0) / (git1 - git0) * gibreakpoints
;	kf0	table kx * 2, gidata
;	ka0	table kx * 2 + 1, gidata
;	kf1	table kx * 2 + 2, gidata
;	ka1	table kx * 2 + 3, gidata
;	xout kf0, kf1, ka0, ka1
;endop 

instr 1
	;kfreq init 534.092896  
	;kamp init 0.008810i
	; kt line git0, gidur, git1
	kin line 0, p3, 264
	kfreq table3 kin, gifreq
	kamp  table3 kin, giamp

	asig oscili kamp, kfreq, 1
	;asig3 streson asig, kfreq*3, 0.9

	;asig5 streson asig, kfreq*5, 0.8
	;asig = asig * 0.3 + asig3 + asig5
	asig delay asig, git0
	;aout lpf18 aout, 2000, 0, 0
	outs asig, asig

endin


</CsInstruments>
<CsScore>
;f 1	0 	1024	27 	0 0	100 1	200 -1	999 0
;f 2	0	0	23	"/Users/edu/Desktop/pru.txt"
f 1 0 32768 10 1
i 1 0 2.7
e
</CsScore>
</CsoundSynthesizer>
<MacOptions>
Version: 3
Render: Real
Ask: Yes
Functions: ioObject
Listing: Window
WindowBounds: -1126 -1165 626 665
CurrentView: io
IOViewEdit: On
Options: -b128 -A -s -m167 -R
</MacOptions>
<MacGUI>
ioView background {32125, 41634, 41120}
ioListing {11, 479} {430, 157}
ioGraph {5, 4} {588, 264} table 0.000000 1.000000 
</MacGUI>

