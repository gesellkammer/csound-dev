<CsoundSynthesizer>

<CsOptions>
; XO
;-+rtmidi=alsa  --midi-device=hw:1,0 -+rtaudio=alsa -odac -r16000 -k160 ;-O stdout
; Mac
-odac -+rtmidi=PortMIDI -M1 -r44100 -k441
</CsOptions>

<CsInstruments>
	nchnls = 2	

ctrlinit 1, 7,100, 73,16

	instr	1
icps	cpsmidi
iamp	ampmidi	10000
iatk	init	rnd(.02)+.003
kvol	midic7	7,0,1
kctrl	midic7	73,1,64
kmp	linsegr	0,iatk,iamp, 1, iamp,10,iamp*.2,1, 0
a1	buzz	kmp, icps, kctrl, 1
	outs	a1*kvol, a1*kvol
	endin
</CsInstruments>
<CsScore>
f1 0 1024 10 	1
f0 600	; allows realtime midi playing for 600 seconds
e
</CsScore>
</CsoundSynthesizer>