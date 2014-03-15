<CsoundSynthesizer>

<CsOptions>
; XO
;-+rtmidi=alsa  --midi-device=hw:1,0 -+rtaudio=alsa -odac -r16000 -k160 ;-O stdout
; Mac
-odac -+rtmidi=PortMIDI -M0 -r44100 -k441
</CsOptions>

<CsInstruments>
nchnls	=	2

ctrlinit 1, 2,64, 3,64

instr 1
icps	cpsmidi
iamp	ampmidi 30000
kctrl	midic7	2,0,20
kctrl	port	kctrl, .1
kpan	midic7	3, 0, 1						;Pan
	kenv	linsegr	0, .01, iamp, 2, iamp* .5, 1, iamp*.2, .25, 0
	kenv2	expon	19, 2, 1				;Index of Modulation Envelope
	afm	foscil	kenv, icps, 1, .5, kenv2+kctrl, 1		;Generates Sound

	aleft	=	afm * (sqrt(1-kpan))			;Pan Left
	aright	=	afm * (sqrt(kpan))			;Pan Right
	outs	aleft, aright					;Outs the Signals
endin
</CsInstruments>

<CsScore>

f1	0	8192	10	1
f2	0	8192	7	-1	8192	1
f3	0	8192	7	1	4096	1	0	-1	4096	-1
f4	0	8192	21	1

f0 600
</CsScore>

</CsoundSynthesizer>

<MacGUI>
ioView nobackground {65535, 65535, 65535}
ioSlider {5, 5} {20, 100} 0.000000 1.000000 0.000000 slider1
ioSlider {45, 5} {20, 100} 0.000000 1.000000 0.000000 slider2
ioSlider {85, 5} {20, 100} 0.000000 1.000000 0.000000 slider3
ioSlider {125, 5} {20, 100} 0.000000 1.000000 0.000000 slider4
ioSlider {165, 5} {20, 100} 0.000000 1.000000 0.000000 slider5
</MacGUI>

