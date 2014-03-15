<CsoundSynthesizer>
<CsOptions>
; XO
;-+rtmidi=alsa  --midi-device=hw:1,0 -+rtaudio=alsa -odac -r16000 -k160 ;-O stdout
; Mac
-odac -+rtmidi=PortMIDI -M1 -r44100 -k441
</CsOptions>
<CsInstruments>
/* scantable.orc */
; Initialize the global variables.
; Table #1 - initial position
git1 ftgen 1, 0, 128, 7, 0, 64, 1, 64, 0
; Table #2 - masses
git2 ftgen 2, 0, 128, -7, 1, 128, 1
; Table #3 - stiffness
git3 ftgen 3, 0, 128, -7, 0, 64, 100, 64, 0
; Table #4 - damping
git4 ftgen 4, 0, 128, -7, 1, 128, 1
; Table #5 - initial velocity
git5 ftgen 5, 0, 128, -7, 0, 128, 0

; Instrument #1.
instr 1
  iamp ampmidi 20000
  ipch cpsmidi 
  kenv	madsr .1,.12,.68,.3
  ipos = 1
  imass = 2
  istiff = 3
  idamp = 4
  ivel = 5
  a1 scantable iamp, ipch, ipos, imass, istiff, idamp, ivel
  a2 dcblock a1
  out a2*kenv
endin
</CsInstruments>

<CsScore>
; Play Instrument #1 for ten seconds.
f0 60
e
</CsScore>

</CsoundSynthesizer>

<MacGUI>
ioView nobackground {65535, 65535, 65535}
ioSlider {5, 5} {20, 100} 0.000000 1.000000 0.000000 slider1
ioSlider {45, 5} {20, 100} 0.000000 1.000000 0.000000 slider2
ioSlider {85, 5} {20, 100} 0.000000 1.000000 0.000000 slider3
ioSlider {125, 5} {20, 100} 0.000000 1.000000 0.000000 slider4
ioSlider {165, 5} {20, 100} 0.000000 1.000000 0.000000 slider5
</MacGUI>

