<CsoundSynthesizer>

<CsOptions>
; XO
;-+rtmidi=alsa  --midi-device=hw:1,0 -+rtaudio=alsa -odac -r16000 -k160 ;-O null
; Mac
-odac -+rtmidi=PortMIDI -M1 -r44100 -k441
</CsOptions>

<CsInstruments>
;================ARPEGGIO.O=================
;THIS INSTRUMENT, DESIGNED BY RISSET, PRODUCES AN ARPEGGIATION IN THE
;HARMONIC SERIES.  ONE CAN HEAR VERY CLEARLY THE INDIVIDUAL HARMONICS
;COME INTO PHASE.  THE PHENOMENON OF BEATING IS AGAIN THE MEANS FOR
;DOING THIS.  SEE THE RELAVENT PASSAGE IN CHAPTER 3 (PP. 101-102) DODGE.
				instr          1
knote       	cpsmidib
iveloc      	ampmidi   1
;p4 = FREQ OF FUNDAMENTAL (HZ)
;p5 = AMP
;p6 = INITIAL OFFSET OF FREQ - .03 HZ
;INIT VALUES CORRESPOND TO FREQ. OFFSETS FOR OSCILLATORS BASED ON ORIGINAL P6
i1             	=         1*.03
i2             	=         2*.03
i3             	=         3*.03
i4             	=         4*.03
ampenv         	linenr    iveloc*2500,.01,1,.01      ;A SIMPLE ENVELOPE TO PREVENT CLICKING.
a1             	oscili    ampenv,knote,1      ;NINE OSCILLATORS WITH THE SAME AMPLITUDE ENV
a2             	oscili    ampenv,knote+i1,1   ;AND WAVEFORM, BUT SLIGHTLY DIFFERENT
a3             	oscili    ampenv,knote+i2,1   ;FREQUENCIES TO CREATE THE BEATING EFFECT
a4             	oscili    ampenv,knote+i3,1
a5             	oscili    ampenv,knote+i4,1
a6             	oscili    ampenv,knote-i1,1
a7             	oscili    ampenv,knote-i2,1
a8             	oscili    ampenv,knote-i3,1
a9             	oscili    ampenv,knote-i4,1
               	out      (a1+a2+a3+a4+a5+a6+a7+a8+a9)
				endin
</CsInstruments>
<CsScore>
; RISSET'S ARPEGGIO SCORE
f1 0 1024 10 1 0 0 0 .7 .7 .7 .7 .7 .7
f0 30
e
</CsScore>

</CsoundSynthesizer>