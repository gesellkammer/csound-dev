<CsoundSynthesizer>

<CsOptions>
; XO
;-+rtmidi=alsa  --midi-device=hw:1,0 -+rtaudio=alsa -odac -r16000 -k160 ;-O stdout
; Mac
-odac -+rtmidi=PortMIDI -M1 -r44100 -k441
</CsOptions>

<CsInstruments>
i1 ftgen 1, 0, 1024, 10, 1
i2 ftgen 2, 0, 128, 5, 1, 128, 8 

               instr     1
icps           cpsmidi
iamp           ampmidi   5000, 2
kamp           expon     iamp, 5, iamp/icps       ;FREQ-DEPENDENT OVERALL DECAY
amp            linenr    kamp, .01, .333, .05
a1             oscil     amp, icps, 1
               out       a1
               endin

</CsInstruments>
<CsScore>
f0 600
</CsScore>

</CsoundSynthesizer>