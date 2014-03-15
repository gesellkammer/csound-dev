<CsoundSynthesizer>

<CsOptions>
; XO
;-+rtmidi=alsa  --midi-device=hw:1,0 -+rtaudio=alsa -odac -r16000 -k160 ;-O stdout
; Mac
-odac -+rtmidi=PortMIDI -M1 -r44100 -k441
</CsOptions>

<CsInstruments>
gisin    ftgen    1, 0, 16384, 10, 1

         ctrlinit 1, 73,64, 72,64

         instr    1
           ; Scale the amplitude to 32768.
iscale = 0dbfs
iamp     ampmidi  0dbfs
icps     cpsmidi
kfiltfrq midic7   73,100,2000
kfiltres midic7   72,.1,1
kfrqmod	 madsr    .1,.3,.5,.2
kampenv  madsr    .01, .2, .6, .5
aosc     vco      kampenv, icps, 1
afilt    moogvcf  aosc, 100+kfiltfrq*kfrqmod, kfiltres, iscale
         out      afilt*iamp
         endin
          
</CsInstruments>

<CsScore>
f0 60
</CsScore>

</CsoundSynthesizer>