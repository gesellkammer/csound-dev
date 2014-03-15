<CsoundSynthesizer>

<CsOptions>
; XO
;-+rtmidi=alsa  --midi-device=hw:1,0 -+rtaudio=alsa -odac -r16000 -k160 ;-O stdout
; Mac
-odac -r44100 -k441
</CsOptions>

<CsInstruments>
instr 1
  kamp = 15000
  kfreq = 220
  kc1 = 5
  kc2 = 5
  kvdepth = 0.005
  kvrate = 6
  ifn1 = 1
  ifn2 = 1
  ifn3 = 1
  ifn4 = 1
  ivfn = 1

  a1 fmb3 kamp, kfreq, kc1, kc2, kvdepth, kvrate,  \
          ifn1, ifn2, ifn3, ifn4, ivfn
  out a1
endin
</CsInstruments>

<CsScore>
; Table #1, a sine wave.
f 1 0 32768 10 1
; Play Instrument #1 for two seconds.
i 1 0 2
e
</CsScore>

</CsoundSynthesizer>