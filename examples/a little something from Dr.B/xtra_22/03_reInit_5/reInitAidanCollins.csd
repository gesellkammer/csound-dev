<CsoundSynthesizer>

<CsOptions>
; XO
;-+rtmidi=alsa  --midi-device=hw:1,0 -+rtaudio=alsa -odac -r16000 -k160 ;-O stdout
; Mac
-odac -r44100 -k4410
</CsOptions>

<CsInstruments>
;Aidan Collins
;12.04, revised 2.25.05
;mr.aidan.collins@gmail.com
;reinit table look up instrument.
nchnls 	= 		2

garvb    init 0

/*=====================================================================
instrument 1 */
instr 1
;get score information
iamp    = p4
ifnotes = p5
ifdyn   = p6
ifrthm  = p7
irate   = p8
itrans  = p9
ioct    = 8
itie    = p10
imethp  = p11   ;parameter value of pluck opcode
isndlvl = p12
;declicker
kenvc  linen 1, .01, p3, .01


;match speed through tables to speed of beats or not
irt     table (irate-1), 899
if (itie == 1) then
   isync = (1/irt)
endif
if (itie == 0) then
   isync = 1
endif

;lookup length of tables
inum    table 0, ifnotes
inumd   table 0, ifdyn
inumr   table 0, ifrthm
idxn    init 1
idxr    init 1
idxt    init 1

;make slow shallow pan around placement location
klfo    oscil  0.1, 0.2, 30
kpan    = klfo + 0.7

;read other tables (sort of in sync with gap rate)

/* rather than look up tables, one could easily put in a random statement
krand   random 1, 10
here, to either look up the table randomly or just generate a random pitch or whatever*/

kdxn    phasor (1/inum)*isync 
kdxd    phasor (1/inumd)*isync
kdxr    phasor (1/inumr)*isync


start:

/* and just take an i rate of it here, 
or do math and counters, a counter could just be a line or phasor object before the reinit, and an i() down here*/

idxn    = i(kdxn * inum) + 1
idxd    = i(kdxd * inumd) + 1
idxr    = i(kdxr * inumr) + 1

;get dynamic table info
ilvl    table idxd, ifdyn
ilvl    = ilvl+.0001

;get gap time (rhythm)
igap    table idxr, ifrthm
itime   = igap*irt

;radomness for note env.
irand   random .05, .2

;get note 
inote   table idxn, ifnotes
icps   =cpspch(inote+ioct)

        timout 0, itime, continue
        reinit start

continue:
kline   line   icps*10, itime, icps*2
print   irt
kenv    expseg .0001, itime*0.05, ilvl, itime*0.9, ilvl, itime*0.05, .001
kenv2   expseg .0001, itime*irand, ilvl, itime*(1-(2*irand)), ilvl, itime*irand, .001

ap      pluck iamp*kenv, (icps)*itrans, icps*.99, 30, 3, imethp
ap2     pluck iamp*kenv2, (icps+.5)*itrans, icps*.99+0.5, 30, 3, imethp

ap      butterlp ap, kline
ap2     butterlp ap2, kline*2

garvb   = (ap+ap2)*.05*kenvc*isndlvl

outs (ap+ap2)*0.5*kpan*kenvc, (ap+ap2)*0.5*(1-kpan)*kenvc
endin


/*=======================================================
reverb instrument
*/
instr 11
ar      nreverb garvb, 4, 1
outs   ar, ar
garvb = 0
endin

</CsInstruments>
<CsScore>
;note tables
f1  0 8 -2 2 0.07 0.06 0     0     0   0   0
f2  0 8 -2 2 0.06 0.07 0     0     0   0   0
f3  0 8 -2 3 0.07 0.02 0.00 0      0   0   0
f4  0 8 -2 3 0.00 0.02 0.07 0      0   0   0
f5  0 8 -2 4 0.07 0.02 0.09 0.11   0   0   0
f6  0 8 -2 4 0.11 0.09 0.02 0.07   0   0   0
f7  0 8 -2 4 1.06 1.02 0.07 0.00   0   0   0
f8  0 8 -2 4 0.00 0.07 1.02 1.06   0   0   0

;'dynamics'

f61 0 8 -2 2 0.001    1    0    0    0   0    0
f62 0 8 -2 4 0.001    1    1    0.001  
f63 0 8 -2 4 1        1    1    0 
f64 0 8 -2 6 .4  .5   .6    .7  .8   1
f65 0 8 -2 6 1   .8   .7    .6  .5   .4
f66 0 16 -2 12 .4 .5  .6    .7  .8   1  .8  .7  .6  .5  .4 
f67 0 8 -2 6 .8       1    .9   .7   1   .5   1
f68 0 8 -2 6 1        1    1    1    1   1    1

;rhythms
f101 0 8 -2 6 1    1    1    1    1   1   
f102 0 8 -2 6 .5   .333 1    .5   1   .333
f103 0 8 -2 4 .5   1    1    .5 
f104 0 8 -2 4 1    .5   1    .5 
f105 0 8 -2 3 .333 .333 .333
f106 0 8 -2 6 1    .333 .5   1   .333  .333

;waveforms
f30 0 4096 10 1
f31 0 1024 9 1 3 0 3 1 0 9 .3333 180

;rate table 
f899 0 16 -2 .333 .5 .666 .75 .8 1 1.5 2 2.5 3 4

;i start dur amp   note dyn rhythm rate trans tie meth  sndlvl 
i1 0     10  10000 3    63  102    7     1    0   0.001 .2
i. +     .   .     4    64  103    6     1    1   0.003 .5
i. +     .   .     5    65  104    5     1    1   0.005 .7
i. +     .   .     6    66  105    4     1.5  0   0.015 .9
i. +     .   .     7    67  106    2     2    1   0.02  .9
 
i11 0 52
;f0 20000
</CsScore>

</CsoundSynthesizer>