<CsoundSynthesizer>

<CsOptions>
; Select audio/midi flags here according to platform
; Audio out   Audio in    No display
-odac           -iadc     -d     ;;;RT audio I/O
</CsOptions>

<CsInstruments>
sr= 44100
ksmps = 64
nchnls= 2
0dbfs = 1

;Example by Victor Lazzarini 2007
;;giwave ftgen 0, 0, 4096, 10, 1, 0.5, 0.333, 0.25, 0.2, 0.1666
;;gisine ftgen 0, 0, 16384, 10, 1

instr 1
  a1, a2 ins               ; take an input signal
  ifftsize = 1024
  iwtype = 1
  fsig pvsanal a1, ifftsize, ifftsize/4, ifftsize, iwtype
  
  kf,ka pvspitch fsig, 0.01
  kcps port kf, 0.01     ; smooth freq
  kamp port ka, 0.01     ; smooth amp
  ;printk 0.1, kcps
  ;printk 0.1, kamp
  ; drive an oscillator
  ;;aout oscili ampdb(kamp)*0dbfs, kcps, 1
  
  
  ;kamp = 0.3
  ;kfreq = 440
  kjet = 0.3
  iatt = 0.1
  idetk = 0.1
  kngain = 0.3
  kvibf = 5.925
  kvamp = 0.05
  ;kjet line 0.3, 5, 0.32
  aout wgflute kamp, kcps, kjet, iatt, idetk, kngain, kvibf, kvamp, 1
  ;;aout oscil kamp, kcps * 1.5, giwave
  ;; aout oscili 1, 220, 1

  outs  aout, aout
endin

</CsInstruments>

<CsScore>
f 1 0 16384 10 1
i1 0 3600
e
</CsScore>

</CsoundSynthesizer><bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>611</x>
 <y>44</y>
 <width>669</width>
 <height>666</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="nobackground">
  <r>231</r>
  <g>46</g>
  <b>255</b>
 </bgcolor>
 <bsbObject version="2" type="BSBVSlider">
  <objectName>slider1</objectName>
  <x>5</x>
  <y>5</y>
  <width>20</width>
  <height>100</height>
  <uuid>{2b5d37aa-17f1-4be9-8434-08b150af6fa0}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.00000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
</bsbPanel>
<bsbPresets>
</bsbPresets>
<MacGUI>
ioView nobackground {59367, 11822, 65535}
ioSlider {5, 5} {20, 100} 0.000000 1.000000 0.000000 slider1
</MacGUI>
