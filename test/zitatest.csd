<CsoundSynthesizer>
<CsOptions>

</CsOptions>
<CsInstruments>

sr     =        44100
ksmps  =        64
nchnls =        2

instr    1
	a0 inch 1
        a1 inch 2
	a2, a3 zitaverb a0, a0, 30, 240, 4.8, 5.2, 5400, 315, 10, 315, 12, 0.8, 0
        a4, a5 zitaverb a1, a1, 30, 240, 4.8, 5.2, 23400, 315, 10, 315, 12, 0.8, 0
	outch 1, a2
        outch 2, a4

	endin

</CsInstruments>
<CsScore>
i 1 0 1000


</CsScore>
</CsoundSynthesizer> 
<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>100</x>
 <y>254</y>
 <width>320</width>
 <height>240</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="nobackground">
  <r>255</r>
  <g>255</g>
  <b>255</b>
 </bgcolor>
</bsbPanel>
<bsbPresets>
</bsbPresets>
