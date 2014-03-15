<CsoundSynthesizer>

<CsOptions>
; XO
;-+rtmidi=alsa  --midi-device=hw:1,0 -+rtaudio=alsa -odac -r16000 -k160 ;-O stdout
; Mac
-odac -r44100 -k4410
</CsOptions>

<CsInstruments>
nchnls    =         2


          instr     3
;iroot in pch, no amp mapping, if(p10) mixout.
ipanfn    =         p9
irise     =         p6
imidinn   =         int(((octpch(p4)-3)*12))
iglobal   =         p10
iamp      =         p5
idecay    =         p7
ipitch    =         cpspch(p4)
ismpfn    =         p11
irisefn   =         p8
idatafn   =         p12
ismpno    table     imidinn,ismpfn
kpan      oscil1i   0,1,p3,ipanfn
index     =         (int(ismpno)-1)*4
klfac     =         (1) - (kpan)
iroot     table     index,idatafn
iloope    table     index+3,idatafn
iloops    table     index+2,idatafn
imode     table     index+1,idatafn
klfac     =         sqrt(klfac)
krfac     =         sqrt(kpan)
aw1       envlpx    iamp,irise,p3,idecay,irisefn,1,.01
aw2,      loscil    aw1,ipitch,ismpno,cpspch(iroot),imode,iloops,iloope
aw3       =         (klfac) * (aw2)
aw4       =         (aw2) * (krfac)
          outs      aw3,aw4
          endin
</CsInstruments>
<CsScore>
;LOAD HARMSCR1.WAV (9.03 -- 11.55 SECONDS -- 509413 SAMPLES)
f1 0 524288 1 "sa_Piano.aif" 0 0 0
;SAMPLE MAPPING FUNCTION (HERE: ALL 1's)
f2 0 129 7 1 129 1
;SAMPLE DATA FUNCTION
f3 0 4    -2
;    root imode     iloops    iloope
     261   0        0         1
;vel to amp scaling function
f4     0     129    -5    100  129     32767
;    st   dur  pit  amp
;fixed mono pan function (.5)
f5   0    3    -7   .5   3    .5
;envlpx rise func
f6   0    513  9    .25  1    0

t 0 200
;parms:   st   dur  pch  vel  ris  dec  rfn  panfn     ampfn     smpfn     datafn
i3   	  0    1   7.03 127  .01  1    6    5    		4    	2    		3
i3   	  +    1   6.03 127  .01  1    6    5    		4    	2    		3
i3   	  +    1   5.03 127  .01  1    6    5    		4    	2    		3
i3   	  +    1   6.03 127  .01  1    6    5    		4    	2    		3
i3   	  +    1   6.04 127  .01  1    6    5    		4    	2    		3
i3   	  +    1   6.06 127  .01  1    6    5    		4    	2    		3
i3   	  +    1   6.08 127  .01  1    6    5    		4    	2    		3
i3   	  +    1   6.11 127  .01  1    6    5    		4    	2    		3
i3   	  +    1   7.00 127  .01  1    6    5    		4    	2    		3
e
</CsScore>
</CsoundSynthesizer>