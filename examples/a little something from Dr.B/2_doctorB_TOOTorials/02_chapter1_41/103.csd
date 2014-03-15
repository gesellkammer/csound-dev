<CsoundSynthesizer>

<CsOptions>
-odac -r44100 -k441
</CsOptions>

<CsInstruments>
nchnls 	= 		1

		instr   103
a1   	buzz   	10000, 440, 10, 1  ; variable pulse train
        out     a1
		endin

</CsInstruments>

<CsScore>
; Function 1 uses the GEN10 subroutine to compute a sine wave

f 1  0 4096 10   1

;inst	start	duration
i 103  		0       3

</CsScore>

</CsoundSynthesizer>