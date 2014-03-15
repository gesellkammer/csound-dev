<CsoundSynthesizer>

<CsOptions>
-odac
</CsOptions>

<CsInstruments>
;===========
; toot08.orc
;===========

sr        =         44100
kr        =         4410
ksmps     =         10
nchnls    =         1

          instr 8
idur      =         p3
iamp      =         p4
iskiptime =         p5
iattack   =         p6
irelease  =         p7
irvbtime  =         p8
irvbgain  =         p9

kamp      linen     iamp, iattack, idur, irelease
asig      soundin   "hellorcb.aif", iskiptime
arampsig  =         kamp * asig
aeffect   reverb    asig, irvbtime
arvbretrn =         aeffect * irvbgain
          out       arampsig + arvbretrn
          endin

</CsInstruments>

<CsScore>
;===========
; toot08.sco
;===========

;ins strt dur  amp  skip atk  rel       rvbt rvbgain
i8   0    2.28 .3   0    .03  .1        1.5  .3
i8   4    1.6  .3   1.6  .1   .1        1.1  .4
i8   5.5  2.28 .3   0    .5   .1        2.1  .2
i8   6.5  2.28 .4   0    .01  .1        1.1  .1
i8   8    2.28 .5   0.1  .01  .1        0.1  .1

</CsScore>

</CsoundSynthesizer>
