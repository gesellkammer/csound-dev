<CsoundSynthesizer>
<CsOptions>
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 128
nchnls = 2
0dbfs = 1.0

instr 1
	kprevious init 0
	know timeinsts
	kdt = know - kprevious
	kprevious = know
	ksr = ksmps/kdt
	printk 0.5, ksr	
	printk 0.5, kdt    				 						
endin

instr 2
	asin oscili 0.2, 440
	outch 1, asin
endin

</CsInstruments>
<CsScore>
i1 0 3600
i2 0 3600
</CsScore>
</CsoundSynthesizer>
<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>0</x>
 <y>0</y>
 <width>0</width>
 <height>0</height>
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
