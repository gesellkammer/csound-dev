<CsoundSynthesizer>

<CsOptions>
; XO
;-+rtmidi=alsa  --midi-device=hw:1,0 -+rtaudio=alsa -odac -r16000 -k160 ;-O stdout
; Mac
-odac -r44100 -k4410
</CsOptions>

<CsInstruments>
instr 1
  asig      diskin2     "sa_BT_Fast_Satellite.wav", 1, 0, 1
  out asig
endin

instr 2
  asig      diskin2     "sa_BT_Fast_Satellite.wav", 1, 0, 1
  a1 waveset asig, 2
  out a1
endin
</CsInstruments>
<CsScore>
i1 0 3
i2 4 20
</CsScore>

</CsoundSynthesizer>