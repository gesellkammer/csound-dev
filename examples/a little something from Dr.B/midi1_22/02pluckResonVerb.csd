<CsoundSynthesizer>
<CsOptions>
; XO
;-+rtmidi=alsa  --midi-device=hw:1,0 -+rtaudio=alsa -odac -r16000 -k160 ;-O stdout
; Mac
-odac -+rtmidi=PortMIDI -M1 -r44100 -k441
</CsOptions>
<CsInstruments>

;Adam Boulanger
;Midi added to Mikelson's river inst from catalog

	ctrlinit 1, 2, 110, 3, 220, 4, .99, 5,0, 6,64

garvb		init	0	

			instr 	1
ablock2 	init   	0
ablock3 	init   	0
iamp		ampmidi	0dbfs
icps		cpsmidi
kres		midic7	2, 50, 800						;Added:Tune reson filters
kres2		midic7	3, 50, 800
kblk3mod	midic7	4, 0.0, .99					;Added:Offset DC block
kmod		midic7	5, 1.6, 15.7					;Added:Microtune pch
kmod		lfo		10, .02
irvbsend	midic7	6, 0, 1
ablk		pluck 	iamp, icps+kmod, icps, 0, 1
ablock2 	=      	ablk-ablock3+kblk3mod*ablock2	;THIS IS A DC BLOCKING FILTER
ablock3 	=      	ablk                        	;USED TO PREVENT DRIFT AWAY FROM
asig    	=      	ablock2                     	;ZERO.
af1			reson	asig, kres, 80
af2			reson	asig, kres2, 80
af3			reson	asig, 440, 80
abalnc		balance 0.8*af1+af2+0.4*af3+0.4*asig, asig
afinal		linenr	abalnc, .01, .4, .5
			out 	afinal
garvb		=		garvb+(afinal*(.2+irvbsend))
			endin
			
        	instr  	11
idur      	=		p3
irevtm    	=       p4
ihidif    	=       p5
aout      	reverb2	garvb, irevtm, ihidif     	; DELAY FOR TIME
          	out		aout            	 		; OUTPUT THE CHANNEL
garvb		=		0
          	endin
</CsInstruments>

<CsScore>
f1	0	8192	10	1							; sine wave
f0 600
i11 0	600  	4.6	.18      
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

