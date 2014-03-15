<CsoundSynthesizer>

<CsOptions>
; XO
;-+rtmidi=alsa  --midi-device=hw:1,0 -+rtaudio=alsa -odac -r16000 -k160 ;-O stdout
; Mac
-odac -r44100 -k441
</CsOptions>

<CsInstruments>
nchnls = 2

gi1 ftgen  1, 0, 4096, 7, 0, 4096, 0
gi2 ftgen  2, 0, 4096, 9, 0.5, 1, 0

opcode  PitchShifter, a, akkii
        setksmps  1

asig,kpsc,kfdb,ifn,iwin  xin

ilen = ftlen(ifn) /* delay length (samples) */
ihl = ilen/2      /* delay half-length      */  
krp init 0        /* read pointer           */
kwp init 0        /* write pointer          */
awp = kwp         /* a-type copy of kwp     */

kbsdiff = abs(krp - kwp) /* absolute difference */

if kbsdiff > ihl then
  if krp > kwp then
  kbsdiff = kwp+ilen - krp
  else
  kbsdiff = krp+ilen - kwp
  endif
endif

kenv table kbsdiff, iwin /* envelope/crossfade */

as1  table krp, ifn, 0, 0, 1     /* \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\'read-head\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\' 1  */
as2  table krp, ifn, 0, ihl, 1   /* \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\'read-head\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\' 2  */
amix = as1*kenv + as2*(1-kenv)   /* mixed signal  */
     tablew asig+amix*kfdb, awp, ifn  /* delay input */

/* update the pointers, check bounds */
kwp = kwp + 1        
krp = krp + kpsc
if kwp > ilen then
kwp = 0
endif
if krp > ilen then
krp = 0
endif

       xout  amix
endop 


instr 1
  asig1      diskin2  "sa_BT_Fast_Satellite.wav", 1, 0, 1

;asig1, asig2  ins 

aout  PitchShifter asig1, 1.25, .5, gi1, gi2

      outs aout, asig1

endin
</CsInstruments>
<CsScore>
i1 0 20
</CsScore>

</CsoundSynthesizer>