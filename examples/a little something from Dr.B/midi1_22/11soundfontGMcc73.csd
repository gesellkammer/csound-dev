<CsoundSynthesizer>

<CsOptions>
; XO
;-+rtmidi=alsa  --midi-device=hw:1,0 -+rtaudio=alsa -odac -r16000 -k160
; Mac
-odac -+rtmidi=PortMIDI -M1 -r44100 -k441
</CsOptions>

<CsInstruments>
nchnls	= 2

gi2 sfload "sf_GMbank.sf2"
;	sfilist		gi2
;	sfplist		gi2
	sfpassign	   0, gi2

	instr 1
ipres	init	0
			; set total number of presets contained into
			; file as mximum value
			; Controller 73 changes preset number 
ipres   midic7  73,0,127
ifreq	cpsmidi
iamp	ampmidi 2
inum	notnum
ivel	veloc
kamp	linsegr	1,1,1,.1,0
kfreq	init	1
a1,a2	sfplay	ivel,inum,kamp*iamp,kfreq,int(ipres),0
	outs	a1,a2
	endin
</CsInstruments>
<CsScore>
f0  60
</CsScore>

</CsoundSynthesizer>