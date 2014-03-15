<CsoundSynthesizer>

<CsOptions>
; XO
;-+rtmidi=alsa  --midi-device=hw:1,0 -+rtaudio=alsa -odac -r16000 -k160 ;-O stdout
; Mac
-odac -M0 -d -r44100 -k441
</CsOptions>

<CsInstruments>
nchnls	=	2

massign 1, 222

ctrlinit	1, 13,100, 14,10, 15,2, 16,5

instr	222
icps	cpsmidi
kamp	midic7	13, 0, 10000
kamp  port kamp,.1
kcar	midic7	14, 1, 10
kmod	midic7	15, 1, 10
kindx	midic7	16, 1, 30
kindx	port kindx,.1
asig	foscil	kamp, icps, (kcar), (kmod), kindx, 1
kmgate	linsegr	0, .01, 1, 2, 0
outs	asig*kmgate, asig*kmgate
endin
</CsInstruments>
<CsScore>
f1	0	8192	10	1
f2 0 1024 7 	-1 1024 1
f0	600
e
</CsScore>
</CsoundSynthesizer>

<MacOptions>
Version: 3
Render: Real
Ask: Yes
Functions: ioObject
Listing: Window
WindowBounds: 480 62 400 167
CurrentView: io
IOViewEdit: On
Options:
</MacOptions>

<MacGUI>
ioView nobackground {65535, 65535, 65535}
ioSlider {5, 5} {20, 100} 0.000000 1.000000 0.000000 slider1
ioSlider {45, 5} {20, 100} 0.000000 1.000000 0.000000 slider2
ioSlider {85, 5} {20, 100} 0.000000 1.000000 0.000000 slider3
ioSlider {125, 5} {20, 100} 0.000000 1.000000 0.000000 slider4
ioSlider {165, 5} {20, 100} 0.000000 1.000000 0.000000 slider5
</MacGUI>

