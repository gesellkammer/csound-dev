<CsoundSynthesizer>

<CsOptions>
; XO
;-+rtmidi=alsa  --midi-device=hw:1,0 -+rtaudio=alsa -odac -r16000 -k160 ;-O stdout
; Mac
-odac -+rtmidi=PortMIDI -M1 -r44100 -k441
</CsOptions>

<CsInstruments>
nchnls    =         2

          instr 1
; A SEMITONE 2^(1/12)
isem      =         .059463094
; GET MIDI NOTE
inote     cpsmidi
; GET PITCH BEND AND FIND THE 2 SEMITONE BEND CPS
kpbend    pchbend   2 * isem * inote
; MOD WHEEL
kmodw     midictrl  2
; CTL 10 FOR PAN SCALED TO 1
kctl10     midictrl  3
kctl10     =         kctl10 / 127
; CTL 73 FOR VIBRATO SPEED
kctl73     midictrl  4
kctl73     =         kctl73 / 127
; CTL 72 FOR MOD INDEX
kctl72     midictrl  5
kctl72     =         kctl72 / 127
; AFTER TOUCH SCALED TO 1
kafter    aftouch   1
; Velocity
ivel      veloc
; Keyboard gate
kgate     linenr    ivel / 127, .2, .5, .01
; LFO OSCILATOR
klfo      oscil     kmodw * inote / 2400, 10 * kctl73, 1
; AUDIO OSCILATOR
aoscm     oscil     1000 * kctl72, inote + kpbend, 1
aosc      oscil     20000, inote + kpbend + klfo + aoscm, 1
; SET UP AND EXECUTE A LOWPASS FILTER
ilofr     =         100
ihifr     =         sr/2 - ilofr
kafter    port      kafter, 2/kr
afilt     tone      aosc, (kafter * ihifr) + ilofr
aq        reson     aosc, (kafter * ihifr) + ilofr, 100
; MIXER AND OUTPUT
aout      =         (afilt + aq/10)/10
          outs      aout * kgate * kctl10, aout * kgate * (1 - kctl10)
          endin
</CsInstruments>

<CsScore>
f0 30
f1 0 4096 10 1
f2 0 4096 7 -1 96 1 4000 -1 
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

