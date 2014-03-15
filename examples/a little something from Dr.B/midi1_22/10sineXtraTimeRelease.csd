<CsoundSynthesizer>

<CsOptions>
; XO
;-+rtmidi=alsa  --midi-device=hw:1,0 -+rtaudio=alsa -odac -r16000 -k160 ;-O stdout
; Mac
-odac -+rtmidi=PortMIDI -M1 -r44100 -k441
</CsOptions>

<CsInstruments>
nchnls=2
ctrlinit 1, 7, 100, 73, 0

 instr 1 ;allows complex ADSR envelope with MIDI events
  inum notnum
  icps cpsmidi
  iamp ampmidi 10000
  kvol midic7 7, 0, 1
  kchor midic7 73, 1,4
 ;
 ;------- complex envelope block ------
  xtratim 1 ;extra-time, i.e. release dur
  krel init 0
  krel release ;outputs release-stage flag (0 or 1 values)
  if (krel > .5) kgoto rel ;if in release-stage goto release section
 ;
 ;************ attack and sustain section ***********
  kmp1 linseg 0, .03, 1, .05, 1, .07, 0, .08, .5, 4, 1, 50, 1
  kmp = kmp1*iamp
   kgoto done
 ;
 ;--------- release section --------
   rel:
  kmp2 linseg 1, .3, .2, .7, 0
  kmp = kmp1*kmp2*iamp
  done:
 ;------
  a1 oscili kmp, icps, 1
  a2 oscili kmp, icps+kchor, 1
  amix = a1+a2
  out amix*kvol, amix*kvol
 endin      
</CsInstruments>

<CsScore>
f1 0 4096 10 1
f0 600
</CsScore>

</CsoundSynthesizer>