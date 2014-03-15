<CsoundSynthesizer>
<CsOptions>
; XO
;-+rtmidi=alsa  --midi-device=hw:1,0 -+rtaudio=alsa -odac -r16000 -k160 ;-O stdout
; Mac
-odac -r44100 -k441
</CsOptions>
<CsInstruments>
nchnls    =         2
          instr 1
krandamp  randh     p5*2.5, p6, p5/10000
krandpan  randh     0.5, p6, p5/15000
;ksmoothamp port    krandamp, 0.01
ksmoothamp port     krandamp, 0.04
ksmoothpan port     krandpan, 0.03
atri      oscili    p4, p5, 1
afiltered tone      atri, ksmoothamp + p5*0.8
aout1     =         (ksmoothpan + 0.5) * afiltered
aout2     =         (0.5 - ksmoothpan) * afiltered
          outs      aout1, aout2
          endin
</CsInstruments>

<CsScore>
f 1 0 4096 9 1 1 0 3 0.111111 180 5 0.04 0 7 0.02 180 9 0.012 0 11 0.008 180 
i1 0 10 10000 110 8
i1 0 10 10000 165 8
i1 0 10 10000 220 8
i1 0 10 10000 440 8
i1 0 10 10000 523 8
i1 0 10 10000 660 8
i1 0 10 10000 784 8
e
</CsScore>

</CsoundSynthesizer>