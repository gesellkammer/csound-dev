<CsoundSynthesizer>

<CsOptions>
; XO
;-+rtmidi=alsa  --midi-device=hw:1,0 -+rtaudio=alsa -odac -r16000 -k160 ;-O stdout
; Mac
-odac -r44100 -k441
</CsOptions>

<CsInstruments>


	instr 1

kclock	lfo 1, 2, 3
ktrig	trigger kclock, .5, 0
	schedkwhen ktrig, 0, 0, 2, 0, .1

	endin

	instr 2

kamp	linseg 0, .01, 5000, p3-.01, 0
ifreq	rnd31 440, 0
a1	lfo kamp, 880+ifreq
	out a1

	endin

</CsInstruments>
<CsScore>

i1 0 60

e

</CsScore>

</CsoundSynthesizer>