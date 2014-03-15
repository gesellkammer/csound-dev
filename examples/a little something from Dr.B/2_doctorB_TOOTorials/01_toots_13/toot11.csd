<CsoundSynthesizer>

<CsOptions>
-odac
</CsOptions>

<CsInstruments>
;===========
; toot11.orc
;===========

sr        =         44100
kr        =         441
ksmps     =         100
nchnls    =         1

          instr 6
ifunc     =         p11                                ; select the basic waveform
irel      =         0.01                               ; set vibrato release time
idel1     =         p3 - (p10 * p3)                    ; calculate initial delay (% of dur)
isus      =         p3 - (idel1- irel)                 ; calculate remaining duration
iamp      =         ampdb(p4)
iscale    =         iamp * .333                        ; p4=amp
inote     =         cpspch(p5)                         ; p5=freq
k3        linseg    0, idel1, p9, isus, p9, irel, 0    ; p6=attack time
k2        oscil     k3, p8, 1                          ; p7=release time
k1        linen     iscale, p6, p3, p7                 ; p8=vib rate
a3        oscil     k1, inote*.999+k2, ifunc           ; p9=vib depth
a2        oscil     k1, inote*1.001+k2, ifunc          ; p10=vib delay (0-1)
a1        oscil     k1, inote+k2, ifunc
          out       a1+a2+a3
          endin

		instr 11
asig1	pluck	ampdb(p4)/2, p5, p5, 0, 1
asig2	pluck	ampdb(p4)/2, p5*1.003, p5*1.003, 0, 1
		out		asig1 + asig2
		endin

</CsInstruments>

<CsScore>
;===========
; toot11.sco
;===========

f1   0    2048 10   1                                                                ; Sine
f2   0    2048 10   1    0.5  0.3  0.25 0.2  0.167     0.14      0.125     .111      ; Sawtooth
f3   0    2048 10   1    0    0.3  0    0.2  0         0.14      0         .111      ; Square
f4   0    2048 10   1    1    1    1    0.7  0.5       0.3       0.1                 ; Pulse


;    ins  strt dur  amp  freq           ; toot11a.sco
     i11  0    1    90   200            ; The Carry Feature
     i11  1    .    .    300
     i11  2    .    .    400
s
     f0   1
s
;    ins  strt dur  amp  freq
     i11  0    1    90   200
     i11  1    1    90   300
     i11  2    1    90   400
s
     f0   1
s
;    ins  strt dur  amp  freq           ; toot11b.sco
     i11  0    1    90   200            ; The "+" Feature
     i .  +    .    .    300
     i .  .    .    .    500
s
     f0   1
s
;    ins  strt dur  amp  freq
     i11  0    1    90   200
     i11  1    1    90   300
     i11  2    1    90   500
s
f0 1
s
;    ins  strt dur  amp  freq           ; toot11c.sco
     i11  0    1    90   100            ; Carry empty p-fields
     i11  +    2
     i11
s
f0 1
s
;    ins  strt dur  amp  freq
     i11  0    1    90   100
     i11  1    2    90   100
     i11  3    2    90   100
s
f0 1
s
;    ins  strt dur  amp  freq           ; toot11d.sco
     i11  0    1    90   200            ; The Ramping Feature
     i .  +    .    <    <
     i .  .    .    <    400
     i .  .    .    <    <
     i .  .    4    70   200
s
f0 1
s
;    ins  strt dur  amp  freq
     i11  0    1    90   200
     i11  1    1    85   300
     i11  2    1    80   400
     i11  3    1    75   300
     i11  4    4    70   200
s
f0 1
s
;    ins  strt dur  amp  freq           ; toot11e.sco
     i11  0    .5   90   200            ; The Tempo Statement
     i .  +    .    <    <
     i .  .    .    <    400
     i .  .    .    <    <
     i .  .    2    70   200
s
f0 1
s
     t    0    120
;    ins  strt dur  amp  freq           ; Double-time via Tempo
     i11  0    1    90   200
     i .  +    .    <    <
     i .  .    .    <    400
     i .  .    .    <    <
     i .  .    4    70   200

s
f0 1
s

     t    0 60 4    400  8    60        ; toot11f.sco
;    ins  strt dur  amp  freq           ; Time-warping via Tempo
     i11  0    1    70   200
     i .  +    .    <    500
     i .  .    .    90   800
     i .  .    .    <    500
     i .  .    .    70   100
     i .  .    .    90   1000
     i .  .    .    <    600
     i .  .    .    70   200
     i .  .    8    90   100
s
f0 1
s
;    ins  strt dur  amp  freq           ; toot11g.sco
     i11  0    2    90   100            ; The Section Statement
     f0   4                             ; The f0 Statement
     s
     i11  0    1    90   800
     i .  +    .    .    400
     i .  .    .    .    100
     f0   5
     s
     i11  0    4    90   50
s
f0 1
s
;    ins  strt dur  amp  freq           ; toot11h.sco
     i11  0    1    70   100            ; Sorting a Score
     i .  +    .    <    <
     i .  .    .    <    <
     i .  .    .    90   800
     i .  .    .    <    <
     i .  .    .    <    <
     i .  .    .    70   100
     i .  .    .    90   1000
     i .  .    .    <    <
     i .  .    .    <    <
     i .  .    .    <    <
     i .  .    .    70   <
     i .  .    8    90   50
;    ins  strt dur  amp  frq       atk  rel  vbrt vbdpt     vbdl wvfrm
     i6   0    2    86   9.00      .03  .1   6    5         .4   1
     i6   2    2    86   9.02      .03  .1   6    5         .4   2
     i6   4    2    86   9.04      .03  .1   6    5         .4   3
     i6   6    4    86   9.05      .05  .1   6    5         .4

</CsScore>

</CsoundSynthesizer>