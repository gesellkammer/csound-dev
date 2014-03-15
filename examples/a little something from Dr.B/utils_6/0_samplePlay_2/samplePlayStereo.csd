<CsoundSynthesizer>
<CsOptions>
-iadc -odac ; -+rtaudio=alsa 
</CsOptions>
<CsInstruments>
	sr = 44100
	kr = 441
	ksmps = 100
	nchnls = 2

	instr	1
a1, a2	ins
	outs	a1, a2
	endin
</CsInstruments>
<CsScore>
i1 0 10
e
</CsScore>
</CsoundSynthesizer>