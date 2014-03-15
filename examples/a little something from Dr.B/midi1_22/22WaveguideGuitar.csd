<CsoundSynthesizer>

<CsOptions>
; XO
;-+rtmidi=alsa  --midi-device=hw:1,0 -+rtaudio=alsa -odac -r16000 -k160 ;-O stdout
; Mac
-odac -+rtmidi=PortMIDI -M1 -r44100 -k44100 -Fmf_guitar.mid -T
</CsOptions>

<CsInstruments>

          instr 3
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; MIDI CONTROLLED ACOUSTIC GUITAR
; COMMUTED WAVEGUIDE SYNTHESIS
; LINEAR INTERP. FOR FRACTIONAL DELAYS (*BIQUAD*) BY NOW...
; GUITAR LOOP FILTER FROM TERO TOLONEN (*FILTER2*)
; IMPULSE RESPONSE FROM DR. JULIUS SMITH 
; IMPLEMENTED BY JOSEP M COMAJUNCOSAS / AUG´98-FEB´99
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; NOTE THERE IS NO COMPENSATION YET
; FOR THE PHASE DELAY INDUCED BY THE LOOP FILTER.
; ANYWAY THE GUITAR IS NOT TERRIBLY OUT OF TUNE ;-)

; MODEL PARAMETERS : BETTER NOT TOUCH THEM !
iatt1     =         .996                                                   ; attenuation
ifco1     =         -.058                                                  ; freq dependent decay

iatt2     =         .992                                                   ; attenuation
ifco2     =         -.053                                                  ; freq dependent decay 
ichorus   =         1.002                                                  ; detuning factor ~1

iamp = 8000                                                                ; expected maximum output amplitude

; MIDI setup
ifrequency          pchmidi
print               ifrequency                                             ; displays current note being played
ifreq               cpsmidi

iampn     ampmidi   1                                                      ; normalised amplitude
print     iampn

ipluck    =         .5*(1.05-iampn)                                        ; pluck point (dependent on note loudness)
 
kmp       linsegr   1, 10, 1, .04 ,0; add some release

kfreq     cpsmidib                                                         ; + range in semitones (+-2?)

; table lookup for fine tuning up to .08*sr (about 3500Hz at sr=44100, enough for a guitar)
; kfreqn  = kfreq/sr
; kfreqncorr tablei kfreqn/.08,2,1,0,0
; kfreq   = kfreq*kfreqncorr

kdlt1     =         1/kfreq
kdlt2     =         kdlt1/ichorus

; CALCULATIONS FOR FRACTIONAL DELAY INTERPOLATION FILTER
; DELAY TIME *IN SAMPLES* (INTEGER)
kdltn1    =         int(sr*kdlt1)
kdltn2    =         int(sr*kdlt2)
; remainig fractional delay *in fractions of a sample*
kdltf1    =         frac(sr*kdlt1)                                         ; note than time=int(time)+frac(time) ;-)
kdltf2    =         frac(sr*kdlt2)

; STRING EXCITATION (SINGLE IMPULSE) CONVOLVED W.IR OF THE BODY
; = IR OF THE BODY OF COURSE...

knoise    oscil1i   0, 1, ftlen(3)/sr, 3
anoise    upsamp    knoise

; LOWPASS FILTER THE EXCITATION SIGNAL
; AT LOW AMPLITUDE LEVELS
anoise    butterlp  anoise,iampn*iampn*sr/2                                ; tune this at your own taste

; FILTERING CAUSED BY PLUCKING POINT

acomb     delay     anoise, ipluck*ifreq
anoize    =         anoise - acomb

; SET WAVEGUIDE 
; W. LOOP FILTER AND FRACTIONAL DELAY FILTER
; 2 PARALLEL STRUCTURES TO SIMULATE COUPLING OF VERTICAL & HORIZONTAL POLARISATIONS

awgout1   init      0
awgout2   init      0

ainput    =         anoize

imp       =         .5
ainput1   =         ainput*imp
ainput2   =         ainput*(1-imp)

atemp1    delayr    1/20
awg1      deltapn   kdltn1
alpf1     filter2   awg1, 1, 1, 1+ifco1, ifco1
afdf1     biquad    alpf1, 1-kdltf1, kdltf1,0,1,0,0
awgout1   =         iatt1*afdf1
          delayw    ainput1+awgout1

igc = .01

atemp2    delayr    1/20
awg2      deltapn   kdltn2
alpf2     filter2   awg2, 1, 1, 1+ifco2, ifco2
afdf2     biquad    alpf2, 1-kdltf2, kdltf2,0,1,0,0
awgout2   =         .97*iatt2*alpf2
          delayw    ainput2+igc*awgout1+awgout2

ainput2   =         awgout2

imo       =         .5

aout      =         imo*awgout1 + (1-imo)*awgout2

; SOUND OUTPUT
          out       iamp*iampn*kmp*aout

          endin
</CsInstruments>
<CsScore>
f1 0 4096 10 1                                                                  ; sine wave

; TUNING TABLE CALIBRATED FROM 220 HZ UP TO 3520 HZ (4 OCTAVES)
; THIS TABLE GOES FROM DC TO 0.08*SR ONLY !

f2 0 8193 -27 0 1 512 1.0092 1024 1.0092 2048 1.0221 4096 1.0396 8192 1.0798
f3 0 16384 1 "sa_guitar.wav" 0 0 0                                                 ; normalized IR

; DATA USED FOR THIS TABLE :
; EXPECTED FREQ.   -> CORR. FACTOR (MULTIPLY EXPECTED FREQ. BY THIS)
;220  =  0.005*sr ->  * 1.0092 (at  0.0625th of the table length)     :point 512
;440  =  0.01*sr  ->  * 1.0092 (id. at  0.125)                             :point 1024
;880  =  0.02*sr  ->  * 1.0221 (id. at  0.25)                              :point 2048
;1760 =  0.04*sr  ->  * 1.0396 (id. at 0.5)                                :point 4096
;3520 =  0.08*sr  ->  * 1.0798 (id. at 1)                                  :point 8192

f0 100                                                                               ; listen to incoming MIDI events for 100 sec.

e

</CsScore>

</CsoundSynthesizer>