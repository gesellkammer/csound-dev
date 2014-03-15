<CsoundSynthesizer>

<CsOptions>
; XO
;-+rtmidi=alsa  --midi-device=hw:1,0 -+rtaudio=alsa -odac -r16000 -k160 ;-O stdout
; Mac
-odac -r44100 -k441
</CsOptions>

<CsInstruments>
nchnls = 2
/*
sampleSlicer - Reads a function table in incremental slices.

DESCRIPTION
Reads a function table in incremental slices.  Frequency is independent.

Uses lposcil, allowing GEN01 function tables with zero size.

SYNTAX
asig sampleSlicer kamp, kfreq, kminslice, kmaxslice, kmininc, kmaxinc, ifn

INITIALIZATION
ifn -- the function table containing sample to be sliced.  can be zero size.

PERFORMANCE
kamp -- amplitude

kfreq -- .5 = half speed, 2 = double speed... same as lposcil

kminslice/kmaxslice -- minimum/maximum length of slice in seconds

kmininc/kmaxinc -- minimum/maximum length of increment per slice in seconds

CREDITS
credits
*/

	opcode sampleSlicer, a, kkkkkki

kamp, kfreq, kminslice, kmaxslice, kmininc, kmaxinc, ifn xin

isize = ftlen(ifn)

kphase init 0

kslice random kminslice, kmaxslice

kinc random kmininc, kmaxinc
 

redo:

timout 0, i(kslice), continue

kphase = (kphase < (isize - i(kslice) * sr)?kphase + kinc * sr:0)

reinit redo
 

continue:

aenv linseg 0, .01, 1, i(kslice) - .02, 1, .01, 0

asig lposcil3 kamp, kfreq, 0, 0, ifn, i(kphase)

rireturn

asig = asig * aenv

xout asig

	endop


/* .orc */


instr 1
al sampleSlicer 32000, .5, .101, .23, .1, .4, 1
ar sampleSlicer 32000, .5, .105, .21, .1, .4, 1
outs al, ar
endin

instr 2
asig sampleSlicer 32000, 1, .1, .1, .005, .005, 1
outs asig, asig
endin
</CsInstruments>
<CsScore>

/*.sco*/
f1 0 0 1 "sa_BT_Fast_Satellite.wav" 0 0 0
i1 0 5
i2 6 5
</CsScore>

</CsoundSynthesizer>