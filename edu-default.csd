<CsoundSynthesizer>
<CsOptions>
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 64
nchnls = 2
0dbfs = 1
;; NB: en csound los channels empiezan por el 1
;; a1	inch 1  --> recibe el audio del primer canal de audio (L en stereo)
;; outch	1, a1   --> manda el audio en a1 al primer canal de audio de salida
instr 1
	gkslider1	invalue "kslider1"
	gkslider2	invalue "kslider2"
	gkslider3	invalue "kslider3"
	gkslider4	invalue "kslider4"
	gkslider5	invalue "kslider5"
	gkslider6	invalue "kslider6"
	gkslider7	invalue "kslider7"
endin

instr 2
	a1	soundin	"/Users/edu/proj/fetiche/seccionD/IR/springs01-03.aiff"
	a_G5 reson	a1, 787, 20
	a_Gd5 reson	a1, 765, 20
	a_Cd6 reson	a1, 1021, 20
	a_H5	reson	a1, 992, 20
	a_D6	reson	a1, 1180, 80
	a_E	reson 	a1, 662, 30
	a_Fs6 reson	a1, 1486, 80
	
	a_G5	= a_G5 * gkslider1 * (1/7)
	a_Gd5 = a_Gd5 * gkslider2 * (1/7)
	a_Cd6 = a_Cd6 * gkslider3 * (1/7)
	
	a_H5	= a_H5 * gkslider4 * (1/7)
	a_D6 = a_D6 * gkslider5 * (1/7)
	a_E	= a_E * gkslider6 * (1/7)
	a_Fs6 = a_Fs6 * gkslider7 * (1/7)
	aout = a_G5 + a_Gd5 + a_Cd6 + a_H5 + a_D6 + a_E + a_Fs6
	aout = aout * 0.2
	outs aout, aout
	
endin


</CsInstruments>
<CsScore>
;f 1 0 16384 10 1
i 1 0 360
e
</CsScore>
</CsoundSynthesizer>
<MacOptions>
Version: 3
Render: Real
Ask: Yes
Functions: ioObject
Listing: Window
WindowBounds: 694 44 586 665
CurrentView: io
IOViewEdit: On
Options: -b128 -A -s -m167 -R
</MacOptions>
<MacGUI>
ioView background {32125, 41634, 41120}
ioSlider {61, 99} {20, 100} 0.000000 1.000000 0.470000 kslider1
ioSlider {86, 99} {20, 100} 0.000000 1.000000 0.460000 kslider2
ioSlider {111, 98} {20, 100} 0.000000 1.000000 0.000000 kslider3
ioSlider {137, 97} {20, 100} 0.000000 1.000000 0.000000 kslider4
ioSlider {162, 98} {20, 100} 0.000000 1.000000 0.080000 kslider5
ioSlider {189, 98} {20, 100} 0.000000 1.000000 0.270000 kslider6
ioSlider {216, 96} {20, 100} 0.000000 1.000000 0.180000 kslider7
ioButton {87, 287} {100, 30} event 1.000000 "button1" "New Button" "/" i 2 0 10
</MacGUI>

