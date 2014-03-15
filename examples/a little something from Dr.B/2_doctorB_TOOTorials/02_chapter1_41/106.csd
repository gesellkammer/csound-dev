<CsoundSynthesizer>

<CsOptions>
-odac -r44100 -k441
</CsOptions>

<CsInstruments>
nchnls 	= 		1

		instr 	106
a1 		loscil  10000, 440, 4  ; sample-based looping oscillator
		out 	a1
		endin

</CsInstruments>

<CsScore>
; Function 4 uses the GEN01 subroutine to read in an AIF audio file

f 4  0 0    1   "sing.aif" 0 4 0

;inst	start	duration
i 106     	0      2.3

</CsScore>

</CsoundSynthesizer>