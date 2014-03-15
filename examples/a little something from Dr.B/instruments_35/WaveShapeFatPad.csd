<CsoundSynthesizer>
<CsInstruments>
sr     = 44100
kr     = 44100
ksmps  = 1
nchnls = 1
instr    1 ; Wave Oscillator
ilevl    = p4*32767   ; Level
iptch    = cpspch(p5) ; Pitch
ipos1    = p6         ; Start position
ipos2    = p7         ; End position
iamp1    = p8         ; Start width
iamp2    = p9         ; End width
itabi    = p10        ; Index waveform
itabr    = p11        ; Indexed waveform
kpos     line  ipos1, p3, ipos1                   ; Position
kamp     line  iamp1, p3, iamp2                   ; Width
kosc     oscil  .5, iptch, itabi, -1              ; Indexing Osc
awave    tablei  kosc*kamp + kpos, itabr, 1, 0, 1 ; Table Indexed
out      awave*ilevl                              ; Level and output
endin
</CsInstruments>
<CsScore>
;Terrain Tables
f1 0 4097 10 1 ; Sine
f2 0 4097 10 10 1 0 8 0 0 12 7 5 3 1 5 0 0 6
f3 0 32769 10 0 0 0 0 0 0 0 0 0 0 1 ; 11th Harmonic
f4 0 32769 10 0 0 0 0 0 0 0 0 0 0 0 1 ; 12th Harmonic
f5 0 4097 10 0 7 5 0 2 2 2 1
f6 0 4097 10 1 2 3 4 5 6 7 8 ; Rising Harmonics
;Index Tables
f50 0 4097 10 1 ; Sine
f51 0 4097 7 0 1024 1 2048 -1 1024 0 ; Tri
f52 0 4097 7 -1 4096 1 ; Ramp
;   Strt  Leng  Levl  Pitch Mod1  Mod2  Amp1  Amp2  TabI  TabR
i1  0.00  4.00  1.00  05.00 0.50  0.50 .0833  1.00  50    3
e
</CsScore>
</CsoundSynthesizer>