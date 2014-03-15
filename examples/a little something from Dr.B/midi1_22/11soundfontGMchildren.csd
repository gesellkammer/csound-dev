<CsoundSynthesizer>

<CsOptions>
; XO
;-odac -r16000 -k160 -+rtmidi=null -+rtaudio=alsa -T -Fmf_ballgame.mid
; Mac
-odac -r44100 -k441 -T -Fmf_ballgame.mid
</CsOptions>

<CsInstruments>

nchnls = 2

ga1 init 0
ga2 init 0

turnon 15

ichn = 1
lp1:
        massign   ichn, 0
        loop_le   ichn, 1, 16, lp1
        pgmassign 0, 0

gisf   sfload    "sf_GMbank44100.sf2"

sfpassign  0, gisf

instr 1

; set this to be preset 0 on bank 128
; by hand (eg. on gmBank44010.sf2 it's 317, on gmBank16000.sf2 it's 128, on gmBank22050 it's 226)

idkit = 317

tableiw idkit, 9, 1

; set this by hand to allow for some
; release envelope on percussion
irel = 0.5

ipg = 1
ivol = 2
ipan = 3

nxt:
  kst, kch, kd1, kd2 midiin
  if (kst != 0) then 
       kch = kch - 1
      if (kst == 128 || (kst == 144 && kd2 == 0)) then ; note off    
        kpg table kch, ipg
        kinst = 10 +  kd1/100000 + kch/100
        if kch == 9 then
         if (kd1 == 29 || kd1 == 30) then ; EXC7
          kinst = 10.97
         elseif (kd1 == 42 || kd1 == 44) then ; EXC1
           kinst = 10.91
         elseif (kd1 == 46 || kd1 == 49) then
           kinst = 10.91
         elseif (kd1 == 71 || kd1 == 72) then ; EXC2         
           kinst = 10.92
         elseif (kd1 == 73 || kd1 == 74) then ; EXC3         
           kinst = 10.93
         elseif (kd1 == 78 || kd1 == 79) then ; EXC4         
           kinst = 10.94
         elseif (kd1 == 80 || kd1 == 81) then ; EXC5         
           kinst = 10.95
         elseif (kd1 == 86 || kd1 == 87) then ; EXC6         
           kinst = 10.96
         endif
        else
         kpg = 0
        endif
        event "i", -kinst, 0, 1 

    elseif (kst == 144 && kd2 != 0) then ; note on
        kpg table kch, ipg 
        /* instrument identifier is 10.[chn][note] */
        kinst = 10 + kd1/100000 + kch/100  
        if kch == 9 then
         /* exclusive identifiers */
         if kpg == idkit+7 then
           krel = 2    /* add extra release time for orch perc*/
         else
           krel = 0.5
         endif
         if (kd1 == 29 || kd1 == 30) then ; EXC7
          kinst = 10.97
         elseif (kd1 == 42 || kd1 == 44) then ; EXC1
           kinst = 10.91
         elseif (kd1 == 46 || kd1 == 49) then
           kinst = 10.91
         elseif (kd1 == 71 || kd1 == 72) then ; EXC2         
           kinst = 10.92
         elseif (kd1 == 73 || kd1 == 74) then ; EXC3         
           kinst = 10.93
         elseif (kd1 == 78 || kd1 == 79) then ; EXC4         
           kinst = 10.94
         elseif (kd1 == 80 || kd1 == 81) then ; EXC5         
           kinst = 10.95
         elseif (kd1 == 86 || kd1 == 87) then ; EXC6         
           kinst = 10.96
         endif
        else
         krel = 0.1
        endif
        event "i", kinst, 0, -1, kd1, kd2, kpg, kch,krel 
      
    elseif (kst == 192) then ; program change 
       if kch == 9 then
         kpg = idkit
         if kd1 == 8 then
         kpg = idkit+1
         elseif kd1 == 16 then
         kpg = idkit+2
         elseif kd1 == 24 then
         kpg = idkit+3
         elseif kd1 == 25 then
         kpg = idkit+4
         elseif kd1 == 32 then
         kpg = idkit+5
         elseif kd1 == 40 then
         kpg = idkit+6
         elseif kd1 == 48 then
         kpg = idkit+7
         endif
       else
       kpg = kd1 
       endif
       tablew  kpg, kch, ipg
    elseif (kst == 176 && (kd1 == 11 || kd1 == 7)) then ; volume
       tablew kd2, kch, ivol
    elseif (kst == 176 && kd1 == 10) then  ; pan
       tablew kd2, kch, ipan
    endif
    /*if (kst == 176) then
      printk 0, kd1
      printk 0, kd2
      printk 0, kch
      endif*/
     kgoto nxt
  endif

endin

instr 10

if (p6 >= 40 && p6 < 50) then
iatt = 0.08
irel = 0.5
elseif (p6 >= 70 && p6 < 80) then
iatt = 0.02
irel = p8
else
irel = p8
iatt = 0.005
endif

kenv linenr 1,iatt,irel,0.01
iamp table p5, 5
a1, a2 sfplay p5, p4, iamp,1, p6
kv table p7, 2
kvol tablei kv, 5 
kpan  table p7, 3
kpan = (kpan - 64)/128
a1 = a1*kvol*(0.5-kpan/2)*kenv
a2 = a2*kvol*(0.5+kpan/2)*kenv 
       outs a1, a2
    vincr ga1, a1*.41
    vincr ga2, a2*.41
	endin

instr	15
       denorm ga1, ga2
aL, aR  reverbsc ga1, ga2, 0.85, 8000, sr, 0.5, 1
        outs aL, aR
clear ga1, ga2
endin
</CsInstruments>
<CsScore>
f1 0 16 -2 0 0 0 0 0 0 0 0 226 0 0 0 0 0 0 0
f2 0 16 -2 127 127 127 127 127 127 127 127 127 127 127 127 127 127 127 127
f3 0 16 -2 64 64 64 64 64 64 64 64 64 64 64 64 64 64 64 64
f5 0 128 5 0.05 128 1
i 1 0 3600

e
</CsScore>
</CsoundSynthesizer> 