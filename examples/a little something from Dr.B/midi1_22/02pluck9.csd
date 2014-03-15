<CsoundSynthesizer>

<CsOptions>
; XO
;-+rtmidi=alsa  --midi-device=hw:1,0 -+rtaudio=alsa -odac -r16000 -k160 ;-O stdout
; Mac
-odac -+rtmidi=PortMIDI -M1 -r44100 -k441
</CsOptions>

<CsInstruments>
		nchnls = 2

garvb	init	0
		ctrlinit	1, 7, 100, 73, 0
		instr   	1
icps	cpsmidi
iamp  	ampmidi 	8000
kvol	midic7		7, 0, 1
kcps  	midic7 		73, 0, 40
a1   	pluck   	iamp, icps, icps*1.1, 0, 1
a2   	pluck   	iamp, (icps*1.01)+kcps, icps, 0, 1
a3   	pluck   	iamp, (icps*.989)-kcps, icps, 0, 1
a4   	pluck   	iamp, icps*.99, icps*.95, 0, 1
a5   	pluck   	iamp, (icps*2.01)+kcps, icps*.99, 0, 1
a6   	pluck   	iamp, (icps*1.99)-kcps, icps*.98, 0, 1
a7   	pluck   	iamp, icps*.501, icps*.495, 0, 1
a8   	pluck   	iamp, (icps*2.1)+kcps, icps*1.99, 0, 1
a9   	pluck   	iamp, (icps*3.89)-kcps, icps*1.98, 0, 1
amix = a1 + (a2*.78) + (a3*.67) + a4 + (a5*.79) + (a6*.83) + a7 + a8 *.6 + a9 * .57
kenv	madsr		.1, .01, .8, 2
amix = amix*kenv*kvol
garvb		=		garvb+amix*.23
        outs     	amix, amix
		endin
;reverb instrument
		instr 2
arev	nreverb	garvb, 2.1, .01
		outs	arev, arev
garvb = 0
		endin
</CsInstruments>

<CsScore>
f0 600
i2 0 600
e
</CsScore>
</CsoundSynthesizer>