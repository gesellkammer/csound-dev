<CsoundSynthesizer>

<CsOptions>
; XO
;-+rtmidi=alsa  --midi-device=hw:1,0 -+rtaudio=alsa -odac -r16000 -k160 ;-O stdout
; Mac
-odac -r44100 -k4410
</CsOptions>

<CsInstruments>
nchnls    =         2

;-------------------------------------------------------------
; SINGLE TRIGGER DRUM SAMPLES
;-------------------------------------------------------------
          instr     3

idur      =         p3+p9
p3        =         p3+p9
iamp      =         p4
ifqc      =         cpspch(p5)
ibase     =         cpspch(8.09)
iwav      =         p6
iatk      =         p7
idcy      =         p8
irel      =         p9

kamp      linseg    0, iatk, 1, idur-iatk-idcy, 1, idcy,0
asamp1    loscil    iamp, ifqc, iwav, ibase
          outs      asamp1*kamp, asamp1*kamp
          endin

</CsInstruments>
<CsScore>
f1 0 0 1 "sa_tom.wav" 0 4 0
f2 0 0 1 "sa_tom.wav" 0 4 0
f3 0 0 1 "sa_tom.wav" 0 4 0
f4 0 0 1 "sa_tom.wav" 0 4 0
f5 0 0 1 "sa_tom.wav" 0 4 0

;   Sta  Dur  Amp    Pitch  Wav  Atk  Dcy  Rel
i3  0    .2   16000  8.09   1    .002 .1   .1
i3  +    .    17000  .      2    .    .    .
i3  .    .    22000  .      3    .    .    .
i3  .    .    16000  .      2    .    .    .
i3  .    .    17000  .      1    .    .    .
i3  .    .    18000  .      2    .    .    .
i3  .    .    18000  .      3    .    .    .
i3  .    .    18000  .      2    .    .    .
;
i3  .    .    20000  8.09   1    .002 .1   .1
i3  .    .    20000  .      2    .    .    .
i3  .    .    25000  .      3    .    .    .
i3  .    .    20000  .      2    .    .    .
i3  .    .    20000  .      1    .    .    .
i3  .    .    20000  .      2    .    .    .
i3  .    .    25000  .      3    .    .    .
i3  .    .    20000  .      2    .    .    .
;
i3  .    .    20000  7.09   1    .002 .1   .1
i3  .    .    20000  .      2    .    .    .
i3  .    .    25000  .      3    .    .    .
i3  .    .    16000  .      2    .    .    .
i3  .    .    16000  .      1    .    .    .
i3  .    .1   16000  .      2    .    .    .2
i3  .    .    20000  .      4    .    .    .
i3  .    .2   20000  .      3    .    .    .1
i3  .    .    16000  .      2    .    .    .
;
i3  .    .    20000  7.09   1    .002 .1   .1
i3  .    .1   20000  .      2    .    .    .2
i3  .    .    20000  .      4    .    .    .
i3  .    .    25000  .      3    .    .    .
i3  .    .    20000  .      5    .    .    .
i3  .    .2   16000  .      2    .    .    .1
i3  .    .    16000  .      1    .    .    .
i3  .    .1   16000  .      2    .    .    .2
i3  .    .    20000  .      4    .    .    .
i3  .    .2   20000  .      3    .    .    .1
i3  .    .    16000  .      2    .    .    .
;
i3  .    .    20000  8.09   1    .002 .1   .1
i3  .    .1   20000  .      2    .    .    .2
i3  .    .    20000  .      4    .    .    .
i3  .    .    25000  .      3    .    .    .
i3  .    .    20000  .      5    .    .    .
i3  .    .    16000  .      2    .    .    .
i3  .    .    16000  .      3    .    .    .
i3  .    .    16000  .      1    .    .    .
i3  .    .1   16000  .      2    .    .    .2
i3  .    .    20000  .      4    .    .    .
i3  .    .2   20000  .      3    .    .    .1
i3  .    .    16000  .      2    .    .    .0
;
i3  .    .    16000  8.07   1    .002 .1   .1
i3  .    .1   14000  .      2    .    .    .2
i3  .    .    14000  .      4    .    .    .
i3  .    .    17000  .      3    .    .    .
i3  .    .    16000  .      5    .    .    .
i3  .    .    14000  .      2    .    .    .
i3  .    .    14000  .      3    .    .    .
i3  .    .    14000  .      1    .    .    .
i3  .    .    14000  .      2    .    .    .
i3  .    .    15000  .      4    .    .    .
i3  .    .2   15000  .      3    .    .    .1
i3  .    .    14000  .      2    .    .    .0
;
i3  .    .    20000  8.09   1    .002 .1   .1
i3  .    .1   20000  .      2    .    .    .2
i3  .    .    20000  .      4    .    .    .
i3  .    .    25000  .      3    .    .    .
i3  .    .    20000  .      5    .    .    .
i3  .    .    16000  .      2    .    .    .
i3  .    .    16000  .      3    .    .    .
i3  .    .    16000  .      1    .    .    .
i3  .    .1   16000  .      2    .    .    .2
i3  .    .    20000  .      4    .    .    .
i3  .    .2   20000  .      3    .    .    .1
i3  .    .    16000  .      2    .    .    .0
;
i3  .    .    16000  8.07   1    .002 .1   .1
i3  .    .1   14000  .      2    .    .    .2
i3  .    .    14000  .      4    .    .    .
i3  .    .    17000  .      3    .    .    .
i3  .    .    16000  .      5    .    .    .
i3  .    .    14000  .      2    .    .    .
i3  .    .    14000  .      3    .    .    .
i3  .    .    14000  .      1    .    .    .
i3  .    .    14000  .      2    .    .    .
i3  .    .    15000  .      4    .    .    .
i3  .    .2   15000  .      3    .    .    .1
i3  .    .    14000  .      2    .    .    .0

</CsScore>
</CsoundSynthesizer>