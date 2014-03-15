<CsoundSynthesizer>

<CsOptions>
; XO
;-+rtmidi=alsa  --midi-device=hw:1,0 -+rtaudio=alsa -odac -r16000 -k160 ;-O stdout
; Mac
-odac -+rtmidi=PortMIDI -M1 -r44100 -k441
</CsOptions>

<CsInstruments>
nchnls	=	2

;variable ga1 is the reverb bus.

ga1 init 0

gifn1	ftgen		1, 0, 16384, 10, 1, .5, .333333, .25, .2, .166667, .142857, .125, .111111, .1, .090909, .083333, .076923

		instr	1
;	init

iamp	ampmidi	10000
kcps	cpsmidib
kamp	=	iamp

kcf 	=	kcps + 420
kfreq	expon	1,	1.1,	.1

;	synth

a1	oscili	kamp,	kcps,	1
a2	oscili	kamp,	kcps + .1, 1
a3	oscili	kamp,	kcps - .1, 1

aosc	=	a1 + a2 + a3
aosc	butlp	aosc,	kcf * kfreq
kenv	linenr	1,	.8,	0,	.3
amix	=	aosc*kenv
ga1	=	ga1+(amix)
		endin

; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; Reverb
;
; Coded by Sean Costello, October 1999
instr 25	;Reverb
   ; Note: ga1 is the global input to the reverb.
   afilt1 init 0
   afilt2 init 0
   afilt3 init 0
   afilt4 init 0
   afilt5 init 0
   afilt6 init 0
   afilt7 init 0
   afilt8 init 0
   idel1 = (2473.000/sr)
   idel2 = (2767.000/sr)
   idel3 = (3217.000/sr)
   idel4 = (3557.000/sr)
   idel5 = (3907.000/sr)
   idel6 = (4127.000/sr)
   idel7 = (2143.000/sr)
   idel8 = (1933.000/sr)


   igain = .89     ; gain of reverb. Adjust empirically
                   ; for desired reverb time. .6 gives
                   ; a good small "live" room sound, .8
                   ; a small hall, .9 a large hall,
                   ; .99 an enormous stone cavern.

   ipitchmod = 1	 ; amount of random pitch modulation
                   ; for the delay lines. 1 is the "normal"
                   ; amount, but this may be too high for
                   ; held pitches such as piano tones.
                   ; Adjust to taste.

   itone = 420      ; Cutoff frequency of lowpass filters
                   ; in feedback loops of delay lines,
                   ; in Hz. Lower cutoff frequencies results
                   ; in a sound with more high-frequency
                   ; damping.

   ; k1-k8 are used to add random pitch modulation to the
   ; delay lines. Helps eliminate metallic overtones
   ; in the reverb sound.
   k1      randi   .001, 3.1, .06
   k2      randi   .0011, 3.5, .9
   k3      randi   .0017, 1.11, .7
   k4      randi   .0006, 3.973, .3
   k5      randi   .001, 2.341, .63
   k6      randi   .0011, 1.897, .7
   k7      randi   .0017, 0.891, .9
   k8      randi   .0006, 3.221, .44
   ; apj is used to calculate "resultant junction pressure" for
   ; the scattering junction of 8 lossless waveguides
   ; of equal characteristic impedance. If you wish to
   ; add more delay lines, simply add them to the following
   ; equation, and replace the .25 by 2/N, where N is the
   ; number of delay lines.
 apj = .25 * (afilt1 + afilt2 + afilt3 + afilt4 + afilt5 +afilt6 + afilt7 + afilt8)

   adum1   delayr  1
   adel1   deltapi idel1 + k1 * ipitchmod
           delayw  ga1 + apj - afilt1

   adum2   delayr  1
   adel2   deltapi idel2 + k2 * ipitchmod
           delayw  ga1 + apj - afilt2

   adum3   delayr  1
   adel3   deltapi idel3 + k3 * ipitchmod
           delayw  ga1 + apj - afilt3

   adum4   delayr  1
   adel4   deltapi idel4 + k4 * ipitchmod
           delayw  ga1 + apj - afilt4

   adum5   delayr  1
   adel5   deltapi idel5 + k5 * ipitchmod
           delayw  ga1 + apj - afilt5

   adum6   delayr  1
   adel6   deltapi idel6 + k6 * ipitchmod
           delayw  ga1 + apj - afilt6

   adum7   delayr  1
   adel7   deltapi idel7 + k7 * ipitchmod
           delayw  ga1 + apj - afilt7

   adum8   delayr  1
   adel8   deltapi idel8 + k8 * ipitchmod
           delayw  ga1 + apj - afilt8

   ; 1st order lowpass filters in feedback
   ; loops of delay lines.
   afilt1  tone    adel1 * igain, itone
   afilt2  tone    adel2 * igain, itone
   afilt3  tone    adel3 * igain, itone
   afilt4  tone    adel4 * igain, itone
   afilt5  tone    adel5 * igain, itone
   afilt6  tone    adel6 * igain, itone
   afilt7  tone    adel7 * igain, itone
   afilt8  tone    adel8 * igain, itone

   ; The outputs of the delay lines are summed
   ; and sent to the stereo outputs. This could
   ; easily be modified for a 4 or 8-channel
   ; sound system.

   aout1 = (afilt1 + afilt3 + afilt5 + afilt7)
   aout2 = (afilt2 + afilt4 + afilt6 + afilt8)

	outs    aout1, aout2

	ga1 = 0
endin
</CsInstruments>

<CsScore>
i25	0	30
</CsScore>

</CsoundSynthesizer>