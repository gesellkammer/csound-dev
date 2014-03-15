<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
; Audio out   Audio in    No messages
-odac           -iadc     -d     ;;;RT audio I/O
; For Non-realtime ouput leave only the line below:
; -o wguide1.wav -W ;;; for file output any platform
</CsOptions>
<CsInstruments>

; Initialize the global variables.
sr = 44100
kr = 4410
ksmps = 10
nchnls = 1

; Instrument #1 - a simple noise waveform.
instr 1
  ; Generate some noise.
  asig noise 20000, 0.5

  out asig
endin

; Instrument #2 - a waveguide example.
instr 2
  ; Generate some noise.
  asig noise 20000, 0.2

  ; Run it through a wave-guide model.
  kfreq init 200
  kcutoff init 3000
  kfeedback init 0.95
  kfreq = scale(invalue("freq"), 1000, 2) + invalue("chk1") * 300
  kfreq = port(kfreq, 0.05)
  awg1 wguide1 asig, interp(kfreq), kcutoff, kfeedback

  out awg1
endin

instr 3
  ; Generate some noise.
  asig noise 20000, 0.2

  ; Run it through a wave-guide model.
  kfreq init 200
  kcutoff init 3000
  kfeedback init 0.9
  kfreq = scale(invalue("freq"), 1000, 2)
  kfreq += invalue("chk1") * 300
  kfreq = port(kfreq, 0.05)
  printk 0.1,  kfreq
  awg1 = vcomb(asig, 4, 1/interp(kfreq), 1)
  ;; awg1 wguide1 asig, interp(kfreq), kcutoff, kfeedback

  out awg1
endin


</CsInstruments>
<CsScore>

; Play Instrument #1 for 2 seconds.
;; i 1 0 3600
; Play Instrument #2 for 2 seconds.
i 2 0 3600 
e


</CsScore>
</CsoundSynthesizer>
<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>419</x>
 <y>358</y>
 <width>320</width>
 <height>240</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="nobackground">
  <r>255</r>
  <g>255</g>
  <b>255</b>
 </bgcolor>
 <bsbObject version="2" type="BSBVSlider">
  <objectName>freq</objectName>
  <x>81</x>
  <y>54</y>
  <width>20</width>
  <height>100</height>
  <uuid>{4c5c53d9-59b6-4326-a485-e44cb1d76096}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.72000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject version="2" type="BSBCheckBox">
  <objectName>chk1</objectName>
  <x>160</x>
  <y>58</y>
  <width>20</width>
  <height>20</height>
  <uuid>{a38a348d-8fed-4d82-96f1-6017b9e4b788}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
</bsbPanel>
<bsbPresets>
</bsbPresets>
