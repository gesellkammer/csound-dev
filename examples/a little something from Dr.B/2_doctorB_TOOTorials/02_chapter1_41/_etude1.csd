<CsoundSynthesizer>
<CsOptions>
-odac
</CsOptions>
<CsInstruments>
sr 		= 		44100
kr 		= 		441
ksmps 	= 		100
nchnls 	= 		1

		instr  	101
a1   	oscil   10000, 440, 1
       	out      a1
		endin

		instr   102
a1   	foscil 	10000, 440, 1, 2, 3, 1 ;simple 2 operator fm opcode
		out     a1
		endin

		instr   103
a1   	buzz   	10000, 440, 10, 1  ;variable pulse train
        out     a1
		endin

		instr   104
a1 		pluck 	10000, 440, 440, 2, 1   ;karplus-strong plucked string
		out 	a1
		endin

		instr 	105
a1 		grain 	5000, 440, 55, 5000, 10, .05, 1, 3, 1  ;asynchronous granular synthesis
		out 	a1
		endin

		instr 	106
a1 		loscil  10000, 440, 4  ;sample-based looping oscillator
		out 	a1
		endin

</CsInstruments>
<CsScore>
; Function 1 uses the GEN10 subroutine to compute a sine wave
; Function 2 uses the GEN10 subroutine to compute the first sixteen partials of a sawtooth wave
; Function 3 uses the GEN20 subroutine to compute a Hanning window for use as a grain envelope
; Function 4 uses the GEN01 subroutine to read in an AIF audio file

f 1  0 4096 10   1 ;.1 .5 .7 .9 0 0 .1 .2 0 0 0 0 .3
f 2  0 4096 10   1  .5 .333 .25 .2 .166 .142 .125 .111 .1 .09 .083 .076 .071 .066 .062
f 3  0 4097 20   2  1
f 4  0 0    1   "sing.aif" 0 4 0


;inst	start	duration
i 101		0	3
i 102		4	3
i 103  	8       3
i 104    	12      3
i 105     	16      3
i 106     	20      2.3

</CsScore>
</CsoundSynthesizer>

<MacOptions>
Version: 3
Render: Real
Ask: Yes
Functions: ioObject
Listing: Window
WindowBounds: 703 62 642 583
CurrentView: io
IOViewEdit: On
Options: -b128 -A -s -m167 -R
</MacOptions>

<MacGUI>
ioView nobackground {65535, 65535, 65535}
ioSlider {5, 5} {20, 100} 0.000000 1.000000 0.000000 slider1
ioSlider {45, 5} {20, 100} 0.000000 1.000000 0.000000 slider2
ioSlider {85, 5} {20, 100} 0.000000 1.000000 0.000000 slider3
ioSlider {125, 5} {20, 100} 0.000000 1.000000 0.000000 slider4
ioSlider {165, 5} {20, 100} 0.000000 1.000000 0.000000 slider5
ioGraph {126, 172} {350, 150} scope 2.000000 -1.000000 
ioText {44, 217} {80, 25} display 0.000000 0.00100 "" left "Lucida Grande" 8 {0, 0, 0} {65280, 65280, 65280} nobackground border Display
ioGraph {72, 154} {350, 150} table 0.000000 1.000000 
</MacGUI>

