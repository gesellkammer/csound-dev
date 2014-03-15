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
PitchShifter - A rotating-tapehead-type pitch shifter using function tables and delayw

DESCRIPTION
This is a classic delay-based pitch shifter. The signal is fed into the delay line and then read at different speeds. This implementation uses function tables, with delayw, also intended as tutorial on the technique and function table writing and reading. 

It is important to note that for each instance of the pitch shifter, a unique function table number has to be supplied. This technique can also be implemented with standard delaylines.

SYNTAX
asig  PitchShifter ain, kscl, kfdb, ifn1, ifn2

INITIALIZATION
ifn1 - function table used as a delay. This requires an unique ftable for each instance of the UDO. The size of the table will determine the delayline size.

ifn2 - envelope function table. This should be the same size as ifn1 and contain the window function used for the crossfade between the delay readers. A typical such window can be created with the 1st half of a sine wave (GEN09) or a triangle shape. Depending on the shape an AM side-effect can be heard.



PERFORMANCE
ain - signal input

kscl - pitch scale (> 0), interval ratio of transposition (2 octave, 0.5 octave below, 1.5 fifth etc)

kfdb - feedback amount into the delay line, creating arpeggiation effects (speed of arpeggio depends on the delayline size)

CREDITS
Victor Lazzarini, 2005
*/



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
i1 0 10
</CsScore>

</CsoundSynthesizer>