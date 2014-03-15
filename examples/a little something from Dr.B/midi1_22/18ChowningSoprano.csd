<CsoundSynthesizer>

<CsOptions>
; XO
;-+rtmidi=alsa  --midi-device=hw:1,0 -+rtaudio=alsa -odac -r16000 -k160 ;-O null
; Mac
-odac -+rtmidi=PortMIDI -M1 -r44100 -k441
</CsOptions>

<CsInstruments>
; CHOWNING SOPRANO FROM THE DODGE COLLECTION IN *THE CSOUND CATALOG*

				instr          1
inote          	cpsmidib
inote			=		inote*2
iveloc         	ampmidi  1
kgate          	linenr   iveloc,0,1,.01
        i7     =         inote
        i2     =         7000
        i2     =         (i2/i7)+.5
        i2     =         int(i2)
        i3     =         .04
        i4     =         .25
        i5     =         5*.4
        i6     =         5
        i8     =         i5/i4
        i9     =         exp(1.5*log(7000/32767))
        i10    =         .00311*log(i7)
        i11    =         sqrt(7000/32767)
        i12    =         (1-i3)*i11
        i13    =         i4*i7
        i14    =         i9*i3
a1             linenr    i12,.1,1,.08
a2             oscil     i13,i7,3
a8             =         i7+a2
a4             linenr    i10,.6,2,.1
a4             oscil     a4,i6,3
a5             randi     i10,15
a6             linsegr   .03,.07,.03,.03,0,1-.1,0
a6             =         a4+a5+a6+1.
a1             oscili    a1,(a8+a2)*a6,3
a7             =         (a2*i8)+i2
a3             linsegr   0,.07,.1,.03,1.,2-.18,1,.02,.1,.06,0
a3             =         a3*(i9*i3)
a3             oscili    a3,a7*a6,3

               out      ((a1+a3)*10000)*kgate
endin

</CsInstruments>
<CsScore>
c CHOWNING SOPRANO FROM DODGE
f 3 0 512 9 1 1 0
f 4 0 512 -7 3000 71 3000 168 2300 100 2100 71 2000 102 2000
f 5 0 512 -7 .025 71 .02 102 .025 71 .05 268 .06
f 6 0 512 -7 .25 71 .25 102 .08 .05 339 .05
f 7 0 512 -7 5 71 2.3 102 1.5 237 2.5 102 2.3
f 8 0 512 -7 5 512 6.5
f0 30
end of score
</CsScore>

</CsoundSynthesizer>