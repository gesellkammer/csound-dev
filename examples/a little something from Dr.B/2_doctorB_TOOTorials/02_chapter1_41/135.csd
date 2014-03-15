<CsoundSynthesizer>

<CsOptions>
-odac -r44100 -k441
</CsOptions>
<CsInstruments>
			instr 135
idur		=		p3
iamp		=		p4
igain		=		p5
iloopt		=		p6
kenv		linen	iamp, .01, idur, .01
ain 		diskin  "hellorcb.aif", 1
acomb 		comb	ain*kenv, igain, iloopt, 0
			out		ain+acomb
			endin
</CsInstruments>

<CsScore>
a 0 0 30
; ins	st	   dur   amp	gain	looptime	resonant frq
i 135	0	   5	 .4	 	10		.5      	; 1/.5 = 2 Hz
i 135	5	   5	 .3	  	5  		.25     	; 1/.25 = 4 Hz
i 135	10	   5	 .3	  	5   	.125    	; 1/.125 = 8 Hz
i 135	15	   5	 .2  	2   	.0625   	; 1/.0625 = 16 Hz
i 135	20	   5	 .2	 	2  		.03125   	; 1/.03125 = 32 Hz
i 135 	25	   5	 .2	  	2  		.015625  	; 1/.015625 = 64 Hz
i 135	30	   5	 .04	2 		.001     	; 1/.001 = 1000Hz
</CsScore>

</CsoundSynthesizer>