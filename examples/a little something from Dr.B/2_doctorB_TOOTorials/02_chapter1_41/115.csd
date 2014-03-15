<CsoundSynthesizer>

<CsOptions>
-odac -r44100 -k441
</CsOptions>

<CsInstruments>
		instr   115
k1      linen   p4, p7, p3, p8
k2      expon  	p9, p3, p10
a1   	buzz   	1, p5, k2+1, p6
        out     a1*k1
		endin

</CsInstruments>
<CsScore>
;Function 1 uses the GEN10 subroutine to compute a sine wave

f 1  0 4096 10   1

;ins	strt	dur amp     frq     fn  atk    rel    	#harm1	#harm2
;============================================================================
i 115  	0		3	10000	440		1   1     	1 		30		2
i 115  	4.5		3	10000	220  	1   2     	.1    	2    	30
i 115  	8 		3	10000	110		1   .01  	.01   	20    	6
i 115  	12		10	10000	130.8	1   .01   	.01    	1     	15
i 115  	12		10	10000	311.1	1   8      	1     	33    	2
i 115  	12		10	10000	440	    1   5     	.5    	3     	11

</CsScore>

</CsoundSynthesizer>