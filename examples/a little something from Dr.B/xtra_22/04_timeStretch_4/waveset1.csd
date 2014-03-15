<CsoundSynthesizer>

<CsOptions>
; XO
;-+rtmidi=alsa  --midi-device=hw:1,0 -+rtaudio=alsa -odac -r16000 -k160 ;-O stdout
; Mac
-odac -r44100 -k4410
</CsOptions>

<CsInstruments>
            instr       1
  asig      diskin2     "sa_BT_Fast_Satellite.wav", 1, 0, 1
kline      line  1, p3, 40
  a2        waveset     asig, kline
            out         a2
            endin  
</CsInstruments>
<CsScore>
i1 0 20  20
</CsScore>

</CsoundSynthesizer>