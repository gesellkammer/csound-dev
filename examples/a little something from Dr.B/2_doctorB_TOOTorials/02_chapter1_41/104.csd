<CsoundSynthesizer>

<CsOptions>
-odac -r44100 -k441
</CsOptions>

<CsInstruments>
nchnls 	= 		1

		instr   104
a1 		pluck 	10000, 440, 440, 2, 1   ;karplus-strong plucked string
		out 	a1
		endin

</CsInstruments>

<CsScore>
; Function 2 uses the GEN10 subroutine to compute the first sixteen partials of a sawtooth wave
f 2  0 4096 10   1  .5 .333 .25 .2 .166 .142 .125 .111 .1 .09 .083 .076 .071 .066 .062

; inst	    start	duration
i 104    	0       3

</CsScore>

</CsoundSynthesizer>