<CsoundSynthesizer>
<CsOptions>

</CsOptions>
<CsInstruments>

sr     =        44100
ksmps  =        64
nchnls =        2

instr    1
	a0 inch 1
	a0 crybaby a0, 0, 0.8
	outch 1, a0

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
