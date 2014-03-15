<CsoundSynthesizer>
<CsOptions>
-iadc -odac ; -+rtaudio=alsa 
</CsOptions>
<CsInstruments>
	sr = 44100
	kr = 441
	ksmps = 100
	nchnls = 1

	instr	1
a1	in
	out	a1
	endin
</CsInstruments>
<CsScore>
i1 0 10
e
</CsScore>
</CsoundSynthesizer>