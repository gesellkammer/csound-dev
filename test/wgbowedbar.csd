<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
; Audio out   Audio in    No messages
-odac           -iadc     -d     ;;;RT audio I/O
; For Non-realtime ouput leave only the line below:
; -o wgbowedbar.wav -W ;;; for file output any platform
</CsOptions>
<CsInstruments>

; Initialize the global variables.
sr = 44100
ksmps = 64
nchnls = 1

  instr 1
; pos      =         [0, 1]
; bowpress =         [1, 10]
; gain     =         [0.8, 1]
; intr     =         [0,1]
; trackvel =         [0, 1]
; bowpos   =         [0, 1]

  kb      line 0.5, p3, 0.1
  kp      line 0.6, p3, 0.7
  kc      line 1, p3, 1

  a1      wgbowedbar p4, cpspch(p5), kb, kp, 0.995, p6, 0

          out a1
          endin


</CsInstruments>
<CsScore>

  i1      0  10 32000 7.00 0
  e
</CsScore>
</CsoundSynthesizer>
<MacOptions>
Version: 3
Render: Real
Ask: Yes
Functions: ioObject
Listing: Window
WindowBounds: -789 -931 289 431
CurrentView: io
IOViewEdit: On
Options: -b128 -A -s -m167 -R
</MacOptions>
<MacGUI>
ioView background {32125, 41634, 41120}
ioSlider {8, 7} {20, 98} 0.000000 1.000000 0.377551 amp
ioSlider {34, 6} {239, 22} 100.000000 1000.000000 100.000000 freq
ioGraph {8, 112} {265, 116} table 0.000000 1.000000 
ioListing {8, 234} {266, 158}
ioText {34, 37} {41, 24} label 0.000000 0.00100 "" left "Lucida Grande" 8 {0, 0, 0} {65280, 65280, 65280} background noborder Amp:
ioText {74, 37} {70, 24} display 0.000000 0.00100 "amp" left "Lucida Grande" 8 {0, 0, 0} {65280, 65280, 65280} background noborder 0.4184
ioText {35, 67} {41, 24} label 0.000000 0.00100 "" left "Lucida Grande" 8 {0, 0, 0} {65280, 65280, 65280} background noborder Freq:
ioText {75, 67} {69, 24} display 0.000000 0.00100 "freq" left "Lucida Grande" 8 {0, 0, 0} {65280, 65280, 65280} background noborder 427.6151
ioText {152, 34} {119, 69} label 0.000000 0.00100 "" left "Lucida Grande" 8 {0, 0, 0} {65280, 65280, 65280} nobackground border 
ioText {169, 72} {78, 24} display 0.000000 0.00100 "freqsweep" center "DejaVu Sans" 8 {0, 0, 0} {14080, 31232, 29696} background border 999.6769
ioButton {160, 37} {100, 30} event 1.000000 "Button 1" "Sweep" "/" i1 0 10
</MacGUI>

