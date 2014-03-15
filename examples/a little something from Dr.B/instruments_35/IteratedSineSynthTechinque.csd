<CsoundSynthesizer>

<CsOptions>
; XO
;-+rtmidi=alsa  --midi-device=hw:1,0 -+rtaudio=alsa -odac -r16000 -k160 ;-O stdout
; Mac
-odac -r44100 -k44100
</CsOptions>
<CsInstruments>
           instr 1
           
 ; SYNTHESIS BY FUNCTIONAL ITERATIONS
 ; INSTRUMENT BASED ON AN ARTICLE BY DI SCIPIO & PRIGNANO
 ; JOURNAL OF NEW MUSIC RESEARCH, VOL.25 (1996), PP. 31-46
 ; CODED TO CSOUND BY JOSEP M COMAJUNCOSAS / 1998
 
 kcount    =         0                                       ; counter for iterations. Keep inb small to reduce processing time!
 ifreq     =         cpspch(p4)
 inb       =         p5
 ir1       =         p6
 irf       =         p7
 ix1       =         p8
 ixf       =         p9
 imaxvol   =         10000                                   ; you´d better normalize it for r>3.14
 
 arenv     linseg    0,.01,1,p3-.11,.6,.1,0
 aosc      oscili    1, ifreq, 1
 aosc      =         (1+ aosc)/2
 ar        =         ir1 + (irf-ir1)*arenv*aosc              ; cyclic ar to get an arbitrary pitched wave
 
 avibosc   oscili    1, 5, 1
 avibosc   =         (1+avibosc)/2
 axenvibr  linseg    0, .5, 0, .5, 1, p3-1, 1                ; timbral modulation by changing initial conditions
 ax        =         ix1+(ixf-ix1)*axenvibr*avibosc
 
 iter: ax = sin(ar * ax)                                     ; doesn´t really matter the function used... try others as well!
 kcount    =         kcount + 1
 if kcount < inb goto iter
 out: 
           out       20000* ax*arenv-10000
           endin
 
</CsInstruments>
<CsScore>
f1 0 8192 10 1
 t 0 250
 ;          freq    niter  r0   rf    x0     xf
 ;------------------------------------------------
 i1 0 1     7.00      1    .1  1      .1     .2
 i1 +  .    7.07      2    <    <     <      <
 i1 +  .    7.10      3    <    <     <      <
 i1 +  .    8.02      4    <    <     <      <
 i1 +  .    8.06      5    <    <     <      <
 i1 +  .    8.09      6    <    <     <      <
 i1 +  .    9.01      7    <    <     <      <
 i1 + .     8.06      8    1    3.2  .2     .8
 i1 +  .    8.03      7    <    <     <      <
 i1 +  .    7.11      6    <    <     <      <
 i1 +  .    7.07      5    <    <     <      <
 i1 +  .    7.04      4    <    <     <      <
 i1 +  .    7.00      3    <    <     <      <
 i1 +  .    6.00      2   2.5  3.5   .01    1
 i1 +  .    7.00      4    .1  1      .1     .2
 i1 +  .    7.07      5    <    <     <      <
 i1 +  .    7.10      6    <    <     <      <
 i1 +  .    8.02      7    <    <     <      <
 i1 +  .    8.06      8    <    <     <      <
 i1 +  .    8.09      9    <    <     <      <
 i1 +  .    9.01     10    <    <     <      <
 i1 + .     8.06     11    1    3.2  .2      .8
 i1 +  .    8.03     10    <    <     <      <
 i1 +  .    7.11      9    <    <     <      <
 i1 +  .    7.07      8    <    <     <      <
 i1 +  .    7.04      7    <    <     <      <
 i1 +  .    7.00      6    <    <     <      <
 i1 +  10   8.00      5   2.5  3.5   .01    1
 e
 
</CsScore>

</CsoundSynthesizer>