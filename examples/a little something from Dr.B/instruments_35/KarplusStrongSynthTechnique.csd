<CsoundSynthesizer>

<CsOptions>
; XO
;-+rtmidi=alsa  --midi-device=hw:1,0 -+rtaudio=alsa -odac -r16000 -k160 ;-O stdout
; Mac
-odac -r44100 -k44100
</CsOptions>
<CsInstruments>
sr = 44100
kr = 44100
          instr 1
 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 ; Low level implementation
 ; of the classic Karplus-Strong algorithm
 ; fixed pitches : no vibratos or glissandi !
 ; implemented by Josep M Comajuncosas / Aug«98
 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 
 ipluck    =         p5; pluck position ( 0 to 1 )
 ifreq     =         cpspch(p4)
 idlts     =         int(kr/ifreq-.5)         ; SET WAVEGUIDE LENGTH (AN INTEGER NUMBER OF >SAMPLES)
 idlt      =         idlts/kr                 ; CONVERT SO SECONDS
 kdlt      init      idlts                    ; COUNTER FOR STRING INITIALISATION
 
 irems     =         kr/ifreq - idlts +.5     ; REMAINING TIME IN FRACTIONS OF A SAMPLE
 ; SET PHASE DELAY INDUCED BY THE FIR LOWPASS FILTER
 ; AND THE FRACTIONAL DELAY IN THE WAVEGUIDE
 
 iph       =         (1-irems)/(1+irems)      ; ALLPASS FILTER PARAMETER
 ; APPROXIMATION VALID AT LOW FREQUENCIES RELATIVE TO sr
 
 awgout    init      0
 
 ;         timout    0, idlt, initialise
 ;timout   CAUSED PROBLEMS WITH DELAY INITIALISATION
 ;SO I USED kdlt AS A COUNTER...
 
           if        kdlt < 0 goto continue
 
 initialise:
 
 anoise    trirand   32000
 ; FILL THE BUFFER WITH RANDOM NUMBERS
 
 anoise    butterlp  anoise, p6, 1
 ; SMOOTH A BIT THE NOISE BURST
 ; HARMONIC RICHNESS GROWS WITH VOLUME
 ; FINAL VOLUME DETERMINED BY THE FILTER GAIN
 
 acomb     delay     anoise, ipluck/idlt
 anoize    =         anoise - acomb
 ; IMPLEMENT PLUCK POINT AS A FIR COMB FILTER
 
 
 continue:
 
 
 areturn   delayr    idlt
 ainput    =         anoize + areturn
 
 
 alpf      filter2   ainput, 2, 0, .5, .5
 ; LOWPASS FILTER TO SIMULATE ENERGY LOSSES
 ; COULD BE VARIABLE TO ALLOW DAMPING CONTROL
 
 awgout    filter2   alpf, 2, 1, iph, 1, iph
 ; ALLPASS FILTER TO FINE TUNE THE INSTRUMENT
 
           delayw    awgout
 
           out       awgout
 
 kdlt      =         kdlt - 1
 anoize    =         0                        ; SUPRESS LAST IMPULSE WHEN WAVEGUIDE IS LOADED
 ; TRICKY BUT EASY...
 
           endin
 
</CsInstruments>
<CsScore>
;ks.sco
 f1 0 32769 10 1; sine wave
 
 ; an awful tune... enjoy it!
 ;      pch
 ;          pluck
 ;              fco & amp
 ;                   Josep M Comajuncosas / Aug«98
 
 t 0 180
 
 i1 0 1 7.00 .1  1000
 i1 + . .    <   <
 i1 . . 7.02 <   <
 i1 . . 7.04 <   <
 i1 . . 7.00 .4  3000
 i1 . . 7.04 <   <
 i1 . . 7.02 .2  1000
 
 i1 . . 6.07 .8  6000
 i1 . . 7.00 .1  1500
 i1 . . .    <   <
 i1 . . 7.02 <   <
 i1 . . 7.04 <   <
 i1 . 2 7.00 .4  4000
 i1 . 1 6.11 .3  3000
 
 i1 . . 6.07 .8  6000
 i1 . . 7.00 .1  2000
 i1 . . .    <   <
 i1 . . 7.02 <   <
 i1 . . 7.04 <   <
 i1 . . 7.05 .9  8000
 i1 . . 7.04 .6  <
 i1 . . 7.02 .4  <
 i1 . . 7.00 .2  <
 i1 . . 6.11 .1  7000
 
 i1 . . 6.07 .8  17000
 i1 . . 6.09 .9  17000
 i1 . . 6.11 .9  17000
 i1 . 2 7.00 .5  17000
 i1 . 6 7.00 .9  19000
 e
 
</CsScore>

</CsoundSynthesizer>