<CsoundSynthesizer>

<CsOptions>

-odac

</CsOptions>

<CsInstruments>
;===========
; toot02.orc
;===========

sr        =         44100
kr        =         441
ksmps     =         100
nchnls    =         1

          instr 2
a1        oscil     p4, p5*4, 1      ; p4=amp
          out       a1             ; p5=freq
          endin

</CsInstruments>

<CsScore>
;===========
; toot02.sco
;===========

f1   0    4096 10 1      ; sine wave

;ins strt dur  amp(p4)   freq(p5)
i2   0    1    2000      880
i2   1.5  1    4000      440
i2   3    1    8000      220
i2   4.5  1    16000     110
i2   6    1    32000     55

e

</CsScore>

</CsoundSynthesizer>