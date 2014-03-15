<CsoundSynthesizer>

<CsOptions>
; XO
;-+rtmidi=alsa  --midi-device=hw:1,0 -+rtaudio=alsa -odac -r16000 -k160 ;-O stdout
; Mac
-odac -r44100 -k441
</CsOptions>
<CsInstruments>
           instr 1                                                     ; 2 Chorused (detuned) saw waves
 kamp      linen     1, 1,p3,1
 kpitch    init      cpspch(p4)
 
 alfo2     linseg    0,p3/3,0,p3/3,.001,p3/3,.001
 
 abuzz1    buzz      kamp, kpitch, sr/(2*kpitch), 1 ,0
 asaw1     filter2   abuzz1, 1, 1, 1, -.98                             ; weak bass response
 abuzz2    buzz      kamp, kpitch*(1-alfo2), sr/(2*kpitch), 1 ,0
 asaw2     filter2   abuzz2, 1, 1, 1, -.98                             ; weak bass response
 amix      =         asaw1+asaw2
 
           out       amix*4000
           endin
 
 
           instr 2                                                     ; 3 detuned waves. 3rd is 1 octave higher. LFO«s for detuning
 kamp      linen     1, 1,p3,1
 kamp2     linen     1, 2,p3,1
 kpitch    init      cpspch(p4)
 
 alfo1     lfo       .001,.8
 alfo2     lfo       .001,.56
 
 abuzz1    buzz      kamp, kpitch*(1+alfo1), sr/(2*kpitch), 1 ,0
 asaw1     filter2   abuzz1, 1, 1, 1, -.95                             ; weak bass response
 abuzz2    buzz      kamp, kpitch*(1-alfo2), sr/(2*kpitch), 1 ,0
 asaw2     filter2   abuzz2, 1, 1, 1, -.95                             ; weak bass response
 abuzz3    buzz      kamp2, 2*kpitch, sr/(4*kpitch), 1 ,0              ; 8th higher
 asaw3     filter2   abuzz3, 1, 1, 1, -.999
 
 amix      =         .25*(asaw1+asaw2+2*asaw3)
           out       amix*4000
           endin
 
 
           instr 3                                                     ; "Solina" String Ensemble .Like instr 2 + extra chorus
 kamp      linen     1, 1,p3,1
 kamp2     linen     1, 2,p3,1
 kpitch    init      cpspch(p4)
 
 alfo1     lfo       .001,.8
 alfo2     lfo       .001,.56
 
 abuzz1    buzz      kamp, kpitch*(1+alfo1), sr/(2*kpitch), 1 ,0
 asaw1     filter2   abuzz1, 1, 1, 1, -.95                             ; weak bass response
 abuzz2    buzz      kamp, kpitch*(1-alfo2), sr/(2*kpitch), 1 ,0
 asaw2     filter2   abuzz2, 1, 1, 1, -.95                             ; weak bass response
 abuzz3    buzz      kamp2, 2*kpitch, sr/(4*kpitch), 1 ,0              ; 8th higher
 asaw3     filter2   abuzz3, 1, 1, 1, -.999
 
 amix      =         .25*(asaw1+asaw2+2*asaw3)
 
                                                                       ; add some chorus
 adel1     lfo       .01, .8
 adel1     =         .04*(1+adel1)
 adel2     lfo       .03, .7
 adel2     =         .04*(1+adel2)
 adel3     lfo       .02, .9
 adel3     =         .04*(1+adel3)
 aflanger1 flanger   amix, adel1, 0, .1
 aflanger2 flanger   amix, adel2, 0, .1
 aflanger3 flanger   amix, adel3, 0, .1
 
 amix2     =         .5*amix + .2*(aflanger1+aflanger2+aflanger3)
           out       amix2*4000
           endin
 
 
           instr 4                                                     ; "Solina" String Ensemble+reverb (operat to rendered soundfile)
 kamp      linen     1, 1,p3,1
 kamp2     linen     1, 2,p3,1
 kpitch    init      cpspch(p4)
 
 alfo1     lfo       .001,.8
 alfo2     lfo       .001,.56
 
 abuzz1    buzz      kamp, kpitch*(1+alfo1), sr/(2*kpitch), 1 ,0
 asaw1     filter2   abuzz1, 1, 1, 1, -.95                             ; weak bass response
 abuzz2    buzz      kamp, kpitch*(1-alfo2), sr/(2*kpitch), 1 ,0
 asaw2     filter2   abuzz2, 1, 1, 1, -.95                             ; weak bass response
 abuzz3    buzz      kamp2, 2*kpitch, sr/(4*kpitch), 1 ,0              ; 8th higher
 asaw3     filter2   abuzz3, 1, 1, 1, -.999
 
 amix      =         .25*(asaw1+asaw2+2*asaw3)
 
                                                                       ; add some chorus
 adel1     lfo       .01, .8
 adel1     =         .04*(1+adel1)
 adel2     lfo       .03, .7
 adel2     =         .04*(1+adel2)
 adel3     lfo       .02, .9
 adel3     =         .04*(1+adel3)
 aflanger1 flanger   amix, adel1, 0, .1
 aflanger2 flanger   amix, adel2, 0, .1
 aflanger3 flanger   amix, adel3, 0, .1
 
 amix2     =         .5*amix + .2*(aflanger1+aflanger2+aflanger3)
           out       amix2*4000
           endin
 
 
</CsInstruments>
<CsScore>

 f1 0 32768 10 1
 
 i1 0 7 8.09 .34
 s
 i2 0 7 8.09 .84
 s
 i3 0 7 8.09 .15
 s
 i3 0 7 6.02 .24
 i3 0 . 7.02 .62
 i3 0 . 8.02 .23
 i3 0 . 8.05 .44
 i3 0 . 8.09 .14
 s
 i4 0 10 6.02 .21
 i4 0 10 7.02 .42
 i4 0 . 8.02 .23
 i4 0 . 8.05 .41
 i4 0 . 8.09 .14
 i4 4 6 9.04 .44
 i4 4 . 9.05 .43
 i4 4 . 10.00 .22
 e
 
</CsScore>

</CsoundSynthesizer>