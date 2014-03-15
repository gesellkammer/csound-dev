<CsoundSynthesizer>
<CsOptions>
; XO
;-+rtmidi=alsa  --midi-device=hw:1,0 -+rtaudio=alsa -odac -r16000 -k160 ;-O stdout
; Mac
-odac -r44100 -k441
</CsOptions>
<CsInstruments>
; Here's a little piece where the computer whistles to itself (precisely...)
;  by Chuck Bermingham
;
	instr   1 ; Whistle to yourself....
;
; The instrument gets a new note whenever the amplitude envelope crosses zero.	
;
; p4 is envelope maximum
; p5 is base frequency
; p6 is rate of change for amplitute envelope
; p6/15 is rate of change for frequency
;
kc	rtclock ; for random number seed
ic = i(kc)
kswitch		init	1 ; Makes sure frequency changes only 1 time per crossing
kampenv		randi	1,p6 ; Amplitute envelope
kdclick		linseg	0,.01,1,p3-.02,1,.01,0
kfreqr		randi	30,p6/15,ic ; Random frequency

if ((kampenv < 0) && (kswitch == 1)) then ; Envelope crossed from + to -
  kswitch = -1 ; Make sure change only happens once/crossing
  kfreq = int(kfreqr)*p5 ; Frequency is harmonic of base note
elseif ((kampenv > 0) && (kswitch == -1)) then ; Envelope crossed from - to +
  kswitch = 1
  kfreq = int(kfreqr)*p5
endif
a1	oscil	kampenv*p4*kdclick,kfreq,1
	out	a1
	endin    

</CsInstruments>
<CsScore>
; Function 1 uses the GEN10 subroutine to compute a sine wave
f 1  0 4096 10   1    

i 1 0  120 5000 100 5
i 1 30 120 5000 75 1
i 1 60 120 5000 125 15
e
</CsScore>

</CsoundSynthesizer>