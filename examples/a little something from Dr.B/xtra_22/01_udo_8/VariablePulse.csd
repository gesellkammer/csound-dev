<CsoundSynthesizer>

<CsOptions>
; XO
;-+rtmidi=alsa  --midi-device=hw:1,0 -+rtaudio=alsa -odac -r16000 -k160 ;-O stdout
; Mac
-odac -r44100 -k441
</CsOptions>

<CsInstruments>
nchnls = 2

givarpulsetbl_1 ftgen 299, 0, 8193, -7, -1.0, 192, 1.0, 8000, 1.0
givarpulsetbl_2 ftgen 298, 0, 8193, -7, 0.0, 4042, 0.0, 100, -2.0, 4050, -2.0


opcode varpulse, a, kk

        kwidth, kfrq  xin
        koffset = (1-kwidth)/2.0
        aphs    phasor kfrq
        aindx1  = aphs/2.0
        aindx2  = aphs/2.0 + koffset
        asig1   tablei aindx1, givarpulsetbl_1, 1  ; normalized access
        asig2   tablei aindx2, givarpulsetbl_2, 1
        asig    = asig1 + asig2
                xout asig

endop

instr 1
  p3 = p3*1.5

  ilen = p3
  iamp = ampdb(p4)
  ifrq = cpspch(p5)

  kwidth linseg 0, ilen, 1

  kenv linseg 0, 0.02, 1, ilen-0.05, 1, 0.03, 0

  asig varpulse kwidth, ifrq

  outs asig*kenv*iamp, asig*kenv*iamp

endin
</CsInstruments>
<CsScore>
i1 0 0.2 70 7.00
i1 + 0.2 72 8.00
i1 + 0.2 74 7.03
i1 + 0.2 76 6.03
i1 + 0.2 78 5.10
i1 + 0.2 80 6.10
i1 + 0.2 82 7.00
</CsScore>

</CsoundSynthesizer>