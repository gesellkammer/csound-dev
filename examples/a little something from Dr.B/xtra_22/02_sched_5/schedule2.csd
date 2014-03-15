<CsoundSynthesizer>

<CsOptions>
; XO
;-+rtmidi=alsa  --midi-device=hw:1,0 -+rtaudio=alsa -odac -r16000 -k160 ;-O stdout
; Mac
-odac -r44100 -k441
</CsOptions>

<CsInstruments>

instr 1
kgate linen p4, .1, p3, .1
asig oscil kgate, p5 , 1
out asig
endin

instr 2
kgate linen p4, .1, p3, .1
asig oscil kgate, p5 , 2
out asig
endin

instr MyPat1
   schedule 1, 0, .5, 10000, 1400
   schedule 1, .5, .5, 12000, 500
   schedule 1, 1, .5, 14000, 600
endin 

instr MyPat2
   schedule 1, 0, .5, 10000, 1400
   schedule 1, .5, .5, 12000, 500
   schedule 1, 1, .5, 14000, 600
  schedule 2, 1.5, .5, 10000, 110
  schedule 2, 2, .5, 20000, 3000
endin
</CsInstruments>
<CsScore>
f1 0 8192 10 1 
f2 0 8192 10 1 0 1 0 1 0 1 0 0 0 1
; score
i "MyPat1" 0 4
i "MyPat1" 3 4
i "MyPat2" 3 4
i "MyPat2" 3 4
</CsScore>

</CsoundSynthesizer>