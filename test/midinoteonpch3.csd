<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
; Audio out   Audio in   No messages  MIDI in
-odac           -iadc     -d         -M0  ;;;RT audio I/O with MIDI in
; For Non-realtime ouput leave only the line below:
; -o midinoteonpch.wav -W ;;; for file output any platform
</CsOptions>
<CsInstruments>

; Initialize the global variables.
sr = 44100

0dbfs = 1
ksmps = 64
nchnls = 1

gi_sin ftgen 0, 0, 16384, 10, 1
gi_miditable ftgen 0, 0, 256, 7, 0, 0.05*256, 0.2, 0.25*256, 0.7, 0.7*256, 1

; Instrument #1.
instr 1
  kpch init 0
  kcps init 0
  kvelocity init 0
  iamp ampmidi 2, gi_miditable
  print iamp
  
  midinoteoncps kcps, kvelocity
  kenv linsegr 0.0, 0.005, iamp, 0.05, iamp*0.7, 0.2, 0.0000000  
  
  kamp = 0.3
  kfreq = 440
  kjet = 0.3
  iatt = 0.1
  idetk = 0.1
  kngain = 0.3
  kvibf = 5.925
  kvamp = 0.05
  ifn = 1
;kjet line 0.3, 5, 0.32
  a1 wgflute iamp * kenv, kcps, kjet, iatt, idetk, kngain, kvibf, kvamp, ifn
  
  ; Display the pitch-class value when it changes.
  ;kend release
  ; a0	oscil iamp * kenv, kcps, gi_sin
  ;if kend == 1 then
  ;	event "i", 30, 0, 0
  ;endif
  out a1 * kenv
endin

instr 30
	prints "aqui"
endin

instr 40
endin

</CsInstruments>
<CsScore>
f 1 0 16384 10 1

; Play Instrument #1 for ten seconds.
i 40 0 3600
e


</CsScore>
</CsoundSynthesizer><bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>659</x>
 <y>44</y>
 <width>621</width>
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
  <uuid>{343d5ed2-41c8-4f73-9247-f6f0a96a70ad}</uuid>
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
 <bsbObject version="2" type="BSBGraph">
  <objectName/>
  <x>178</x>
  <y>249</y>
  <width>350</width>
  <height>150</height>
  <uuid>{69bc9ff3-c5fa-46bf-8d68-02ebfe2e86a2}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <value>0</value>
  <objectName2>gi_miditable</objectName2>
  <zoomx>1.00000000</zoomx>
  <zoomy>1.00000000</zoomy>
  <dispx>1.00000000</dispx>
  <dispy>1.00000000</dispy>
  <modex>lin</modex>
  <modey>lin</modey>
  <all>true</all>
 </bsbObject>
</bsbPanel>
<bsbPresets>
</bsbPresets>
<MacOptions>
Version: 3
Render: Real
Ask: Yes
Functions: ioObject
Listing: Window
WindowBounds: -1121 -1166 621 666
CurrentView: io
IOViewEdit: On
Options:
</MacOptions>
<MacGUI>
ioView nobackground {59367, 11822, 65535}
ioSlider {5, 5} {20, 100} 0.000000 1.000000 0.000000 slider1
ioGraph {178, 249} {350, 150} table 0.000000 1.000000 
</MacGUI>
