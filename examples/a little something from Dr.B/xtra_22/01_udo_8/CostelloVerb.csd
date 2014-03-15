<CsoundSynthesizer>

<CsOptions>
; XO
;-+rtmidi=alsa  --midi-device=hw:1,0 -+rtaudio=alsa -odac -r16000 -k160 ;-O stdout
; Mac
-odac -r44100 -k441
</CsOptions>

<CsInstruments>
nchnls = 2
0dbfs	=  1

	opcode SCReverb, aa, aakkjpo

	setksmps 1

ainL, ainR, kFeedBack, kLPFreq, iSRate, iPitchMod, iSkip	xin
iSRate	=  (iSRate <= 0 ? 1 : (sr / iSRate))
	if (iSkip != 0) igoto SkipInit

; 8 delay line FDN reverb, with feedback matrix based upon
; physical modeling scattering junction of 8 lossless waveguides
; of equal characteristic impedance. Based on Julius O. Smith III,
; "A New Approach to Digital Reverberation using Closed Waveguide
; Networks," Proceedings of the International Computer Music
; Conference 1985, p. 47-53 (also available as a seperate
; publication from CCRMA), as well as some more recent papers by
; Smith and others.
;
; Coded by Sean Costello, October 1999

afilt1	init 0
afilt2	init 0
afilt3	init 0
afilt4	init 0
afilt5	init 0
afilt6	init 0
afilt7	init 0
afilt8	init 0

; Delay times chosen to be prime numbers.
; Works with sr=44100 ONLY. If you wish to
; use a different delay time, find some new
; prime numbers that will give roughly the
; same delay times for the new sampling rate.
; Or adjust to taste.

idel1 = 2473.000 / (iSRate * 44100)
idel2 = 2767.000 / (iSRate * 44100)
idel3 = 3217.000 / (iSRate * 44100)
idel4 = 3557.000 / (iSRate * 44100)
idel5 = 3907.000 / (iSRate * 44100)
idel6 = 4127.000 / (iSRate * 44100)
idel7 = 2143.000 / (iSRate * 44100)
idel8 = 1933.000 / (iSRate * 44100)

; kFeedBack:
; gain of reverb. Adjust empirically
; for desired reverb time. .6 gives
; a good small "live" room sound, .8
; a small hall, .9 a large hall,
; .99 an enormous stone cavern.

; iPitchMod:
; amount of random pitch modulation
; for the delay lines. 1 is the "normal"
; amount, but this may be too high for
; held pitches such as piano tones.
; Adjust to taste.

; kLPFreq:
; Cutoff frequency of lowpass filters
; in feedback loops of delay lines,
; in Hz. Lower cutoff frequencies results
; in a sound with more high-frequency
; damping.

; k1-k8 are used to add random pitch modulation to the
; delay lines. Helps eliminate metallic overtones
; in the reverb sound.

iPitchMod	=  iPitchMod / iSRate

k1	randi 0.0010 * iPitchMod, 3.100 * iSRate, 0.06
k2	randi 0.0011 * iPitchMod, 3.500 * iSRate, 0.90
k3	randi 0.0017 * iPitchMod, 1.110 * iSRate, 0.70
k4	randi 0.0006 * iPitchMod, 3.973 * iSRate, 0.30
k5	randi 0.0010 * iPitchMod, 2.341 * iSRate, 0.63
k6	randi 0.0011 * iPitchMod, 1.897 * iSRate, 0.70
k7	randi 0.0017 * iPitchMod, 0.891 * iSRate, 0.90
k8	randi 0.0006 * iPitchMod, 3.221 * iSRate, 0.44

; apj is used to calculate "resultant junction pressure" for
; the scattering junction of 8 lossless waveguides
; of equal characteristic impedance. If you wish to
; add more delay lines, simply add them to the following
; equation, and replace the .25 by 2/N, where N is the
; number of delay lines.

apj	=  .25 * (afilt1+afilt2+afilt3+afilt4+afilt5+afilt6+afilt7+afilt8)

adum1   delayr  1
adel1   deltap3 idel1 + k1
	delayw  ainL + apj - afilt1

adum2   delayr  1
adel2   deltap3 idel2 + k2
	delayw  ainR + apj - afilt2

adum3   delayr  1
adel3   deltap3 idel3 + k3
	delayw  ainL + apj - afilt3

adum4	delayr  1
adel4   deltap3 idel4 + k4
	delayw  ainR + apj - afilt4

adum5   delayr  1
adel5   deltap3 idel5 + k5
	delayw  ainL + apj - afilt5

adum6   delayr  1
adel6   deltap3 idel6 + k6
	delayw  ainR + apj - afilt6

adum7	delayr  1
adel7	deltap3 idel7 + k7
	delayw  ainL + apj - afilt7

adum8	delayr  1
adel8	deltap3 idel8 + k8
	delayw  ainR + apj - afilt8

; 1st order lowpass filters in feedback
; loops of delay lines.

kLPFreq	=  kLPFreq * iSRate

afilt1	tone  adel1 * kFeedBack, kLPFreq
afilt2	tone  adel2 * kFeedBack, kLPFreq
afilt3	tone  adel3 * kFeedBack, kLPFreq
afilt4	tone  adel4 * kFeedBack, kLPFreq
afilt5	tone  adel5 * kFeedBack, kLPFreq
afilt6	tone  adel6 * kFeedBack, kLPFreq
afilt7	tone  adel7 * kFeedBack, kLPFreq
afilt8	tone  adel8 * kFeedBack, kLPFreq

; The outputs of the delay lines are summed
; and sent to the stereo outputs. This could
; easily be modified for a 4 or 8-channel
; sound system.

aoutL	= 0.35 * (afilt1 + afilt3 + afilt5 + afilt7)
aoutR	= 0.35 * (afilt2 + afilt4 + afilt6 + afilt8)

SkipInit:
	xout aoutL, aoutR

	endop

	instr 1
a1	vco2 0.75, 440, 10
kfrq	port 100, 0.008, 20000
a1	butterlp a1, kfrq
a2	linseg 0, 0.003, 1, 0.01, 0.7, 0.005, 0, 1, 0
a1	=  a1 * a2
;	denorm a1
aL, aR	SCReverb a1, a1, 0.92, 7500, sr/1.5, 0.5, 0
	outs a1 + aL, a1 + aR
	endin

</CsInstruments>
<CsScore>
i 1 0 5
e
</CsScore>

</CsoundSynthesizer>