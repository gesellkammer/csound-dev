<CsoundSynthesizer>

<CsOptions>
; XO
;-+rtmidi=alsa  --midi-device=hw:1,0 -+rtaudio=alsa -odac -r16000 -k160 ;-O stdout
; Mac
-odac -r44100 -k441
</CsOptions>

<CsInstruments>
          instr     1
 
 ;ULTRAFAT FM/ANALOG/WAVESHAPE PAD
 ;ANOTHER EMPHYRICAL INSTRUMENT
 ;JOSEP M COMAJUNCOSAS / FEB 99
 
 aout init 0
 kdeclick  linen     1, .01,p3,.01
 
 ;CASCADED FM SECTION (I GOT THIS FROM SOMEWHERE)
 
 ifdbk     =         .6                       ; EXTRA FEEDBACK TO THE LPF BANK
 iamp      =         1
 ipor      =         cpspch(p4)
 imod1     =         2*ipor
 indx1     =         3
 imod2     =         1.33*ipor
 indx2     =         3
 kndx1     linseg    0,p3/3,indx1,p3/2,indx1
 kndx2     linseg    0,p3/2,indx2,p3/3,indx2
 amod1     oscil3    imod1*kndx1,imod1,1
 amod2     oscil3    imod2*kndx2,imod2+amod1,1
 apor      oscil3    iamp/2,ipor+amod2, 1
 kamp      linen     1,p3/3,p3,p3/3
 
 ;ANALOG LPF SECTION
 
 kfco      linseg    200, p3/4, 10000,p3/4, 4000, p3/2,50
 kres      linseg    0,p3/3,0,p3/3, .5 ,p3/3, .2
 
 alpf0     moogvcf   apor*kamp-ifdbk*aout, kfco,kres
 adist      =        .5*tanh(apor*kamp)                      ; SMOOTH DISTORTION
 alpf1     tonex     -adist,sr/4                             ; PLAY WITH PHASES
 alpf2     tonex     alpf1,sr/8
 alpf3     tonex     -alpf2,sr/16
 alpf4     tonex     alpf3,sr/32
 
 ;MULTIBAND WAVESHAPER SECTION
 
 awsh1     table3    .5+alpf1,2,1
 awsh2     table3    .5+alpf2,3,1
 awsh3     table3    .5+alpf3,4,1
 awsh4     table3    .5+alpf4,5,1
 
 aout      =         awsh1+awsh2+awsh3+awsh4
           out       2000*aout * kdeclick
      
           endin 
</CsInstruments>

<CsScore>
;SINE WAVE
 f1 0 8192 10 1
 ; TR.FT
 f2 0 8193 13 1 1  0  6 -2  0  0 0 0  0  0 0 0 0 0 0 0 0 0
 f3 0 8193 13 1 1  0  0 0 -2 4 0 0  0  0 0 0 0 0 0 0 0 0
 f4 0 8193 13 1 1  0  0 0  0  0 5 -1 -7 3 0 0 0 0 0 0 0 0
 f5 0 8193 13 1 1  0  0 0  0  0 0 0  0  0 8 -5 -6 2 4 -1 -2 1
 
 i1 0  5  6.00
 i1 4  .  7.00
 i1 8  .  8.00
 i1 12 .  9.00
 e
</CsScore>

</CsoundSynthesizer>