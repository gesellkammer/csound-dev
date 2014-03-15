<CsoundSynthesizer>

<CsOptions>
; XO
;-+rtmidi=alsa  --midi-device=hw:1,0 -+rtaudio=alsa -odac -r16000 -k160 ;-O stdout
; Mac
-odac -r44100 -k441
</CsOptions>

<CsInstruments>
;=======================================================================;
; JIMI            WaveShaping Electric Guitar Instrument                ;
;                 Coded by an Anonymous MIT Graduate Student            ;
;                 Music and Cognition Group, MIT Media Lab              ;
;=======================================================================;
          instr     1
k1        envlpx    .45,.01,p3,.03,1,-.2,.01
a1        oscil     k1,cpspch(p5),2
a2        tablei    a1,3,1,.5
          out       a2
          endin
</CsInstruments>

<CsScore>
;=======================================================================;
; JIMI            Score for WaveShaping Electric Guitar Instrument      ;
;=======================================================================;
f1    0   17      7   0    17    1
f2    0   1024    9   1    1     0  2  .4   0  .1   0   4  .1   0
f3    0   1024   -9   1    5000  0  3   0   5 1000  0   7  500  0
;=======================================================================;
; JIMI          p4      p5   - Purple Haze -                            ;
;               empty   pch                                             ;
;=======================================================================;
t     0     180
i1    0     1     0     8.07
i1    1     1     0     8.10
i1    2     1     0     9.03
i1    3     5     0     8.05
i1    8     1     0     8.03
i1    9     1     0     7.11
i1    10    1     0     8.00
i1    11    5     0     8.00
</CsScore>

</CsoundSynthesizer>