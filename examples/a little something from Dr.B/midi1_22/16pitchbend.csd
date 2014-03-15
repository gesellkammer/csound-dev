<CsoundSynthesizer>

<CsOptions>
; XO
;-+rtmidi=alsa  --midi-device=hw:1,0 -+rtaudio=alsa -odac -r16000 -k160 ;-O stdout
; Mac
-odac -+rtmidi=PortMIDI -M1 -r44100 -k441
</CsOptions>

<CsInstruments>
        instr   1
ivel    veloc
kcps    cpsmidib 12

;------- complex envelope block ------
		xtratim 6 ;extra-time, i.e. release dur
krel 	init 0
kmp		init 1
krel 	release ;outputs release-stage flag (0 or 1 values)
if (krel > .01) kgoto rel ;if in release-stage goto release section
		kgoto done
;--------- release section --------

rel:
	kmp linseg 1, 5, 0
	
done:
a1		oscil	ivel*100, kcps, 1
        out     a1* kmp
        endin
</CsInstruments>
<CsScore>
f1 0 8192 10 1 1 1 1 1
f0 60
e
</CsScore>

</CsoundSynthesizer>