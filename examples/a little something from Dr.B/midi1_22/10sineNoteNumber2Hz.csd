<CsoundSynthesizer>

<CsOptions>
; XO
;-+rtmidi=alsa  --midi-device=hw:1,0 -+rtaudio=alsa -odac -r16000 -k160 ;-O stdout
; Mac
-odac -+rtmidi=PortMIDI -M1 -r44100 -k441
</CsOptions>

<CsInstruments>
; Set MIDI channel 1 to play instr 1.
        massign 1, 1
        instr   1
; Returns MIDI note number - an integer in range (0-127)
iNum    notnum
; Convert MIDI note number to Hz
iHz     = (440.0*exp(log(2.0)*((iNum)-69.0)/12.0))
; Generate audio by indexing a table; fixed amplitude.
aosc    oscili   10000, iHz, 1
kenv	madsr	.1,.1,.8,.2
        outs    aosc*kenv
                endin
</CsInstruments>

<CsScore>
; Generate a Sine-wave to be indexed at audio rate
;  by the oscil opcode.
f1      0       16384   10      1
; Keep the score "open" for 1 minute so that MIDI
;  notes can allocate new note events, arbitrarily.
f0      60
e
</CsScore>

</CsoundSynthesizer>