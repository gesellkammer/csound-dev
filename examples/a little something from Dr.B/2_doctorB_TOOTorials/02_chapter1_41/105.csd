<CsoundSynthesizer>

<CsOptions>
-odac -r44100 -k441
</CsOptions>

<CsInstruments>
nchnls 	= 		1

		instr 	105
a1 		grain 	10000, 440, 55, 10000, 10, .05, 1, 3, 1  ; asynchronous granular synthesis
		out 	a1
		endin

</CsInstruments>

<CsScore>
; Function 1 uses the GEN10 subroutine to compute a sine wave
; Function 3 uses the GEN20 subroutine to compute a Hanning window for use as a grain envelope

f 1  0 4096 10   1
f 3  0 4097 20   2  1


; inst	start	duration
i 105     	0      3

</CsScore>

</CsoundSynthesizer>