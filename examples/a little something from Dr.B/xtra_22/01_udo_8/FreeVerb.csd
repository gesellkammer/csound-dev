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

; -----------------------------------------------------------------------------

	opcode HFDampFilter, a, ak
	setksmps 1
ain, kdamp	xin
atmp	init 0
atmp	=  (atmp - ain) * kdamp + ain
	xout atmp
	endop

	opcode CombFilter, a, akkiiiiiiii
ain, kfb, kdamp, id1, id2, id3, id4, id5, id6, id7, id8	xin
ismptim	=  (ksmps - 0.25) / sr
aout1	init 0
aout	=  aout1
atmp	HFDampFilter aout1, kdamp
aout1	delay ain + (atmp * kfb), id1 - ismptim
aout2	init 0
	vincr aout, aout2
atmp	HFDampFilter aout2, kdamp
aout2	delay ain + (atmp * kfb), id2 - ismptim
aout3	init 0
	vincr aout, aout3
atmp	HFDampFilter aout3, kdamp
aout3	delay ain + (atmp * kfb), id3 - ismptim
aout4	init 0
	vincr aout, aout4
atmp	HFDampFilter aout4, kdamp
aout4	delay ain + (atmp * kfb), id4 - ismptim
aout5	init 0
	vincr aout, aout5
atmp	HFDampFilter aout5, kdamp
aout5	delay ain + (atmp * kfb), id5 - ismptim
aout6	init 0
	vincr aout, aout6
atmp	HFDampFilter aout6, kdamp
aout6	delay ain + (atmp * kfb), id6 - ismptim
aout7	init 0
	vincr aout, aout7
atmp	HFDampFilter aout7, kdamp
aout7	delay ain + (atmp * kfb), id7 - ismptim
aout8	init 0
	vincr aout, aout8
atmp	HFDampFilter aout8, kdamp
aout8	delay ain + (atmp * kfb), id8 - ismptim
	xout aout
	endop

	opcode AllPassFilter, a, aiiii
ain, id1, id2, id3, id4	xin
ismptim	=  (ksmps - 0.25) / sr
aout1	init 0
atmp	=  aout1 - ain
aout1	delay ain + (aout1 * 0.5), id1 - ismptim
ain	=  atmp
aout2	init 0
atmp	=  aout2 - ain
aout2	delay ain + (aout2 * 0.5), id2 - ismptim
ain	=  atmp
aout3	init 0
atmp	=  aout3 - ain
aout3	delay ain + (aout3 * 0.5), id3 - ismptim
ain	=  atmp
aout4	init 0
atmp	=  aout4 - ain
aout4	delay ain + (aout4 * 0.5), id4 - ismptim
	xout atmp
	endop

	opcode FreeVerb, aa, aakkjo
ainL, ainR, kRoomSize, kHFDamp, iSRate, iSkip	xin
iSRate	=  (iSRate < 1000 ? 44100 : iSRate)
iSRate	=  iSRate / 44100
ic1L	=  int(1116 * iSRate + 0.5) / sr
ic2L	=  int(1188 * iSRate + 0.5) / sr
ic3L	=  int(1277 * iSRate + 0.5) / sr
ic4L	=  int(1356 * iSRate + 0.5) / sr
ic5L	=  int(1422 * iSRate + 0.5) / sr
ic6L	=  int(1491 * iSRate + 0.5) / sr
ic7L	=  int(1557 * iSRate + 0.5) / sr
ic8L	=  int(1617 * iSRate + 0.5) / sr
iap1L	=  int(556 * iSRate + 0.5) / sr
iap2L	=  int(441 * iSRate + 0.5) / sr
iap3L	=  int(341 * iSRate + 0.5) / sr
iap4L	=  int(225 * iSRate + 0.5) / sr
ic1R	=  int((1116 + 23) * iSRate + 0.5) / sr
ic2R	=  int((1188 + 23) * iSRate + 0.5) / sr
ic3R	=  int((1277 + 23) * iSRate + 0.5) / sr
ic4R	=  int((1356 + 23) * iSRate + 0.5) / sr
ic5R	=  int((1422 + 23) * iSRate + 0.5) / sr
ic6R	=  int((1491 + 23) * iSRate + 0.5) / sr
ic7R	=  int((1557 + 23) * iSRate + 0.5) / sr
ic8R	=  int((1617 + 23) * iSRate + 0.5) / sr
iap1R	=  int((556 + 23) * iSRate + 0.5) / sr
iap2R	=  int((441 + 23) * iSRate + 0.5) / sr
iap3R	=  int((341 + 23) * iSRate + 0.5) / sr
iap4R	=  int((225 + 23) * iSRate + 0.5) / sr
	if (iSkip != 0) igoto SkipInit
kfb	=  kRoomSize * 0.28 + 0.7
khf	=  exp(log(0.4 * kHFDamp) / exp(log(iSRate) * 0.8))
aL	=  ainL * 0.015
atmpL	CombFilter aL, kfb, khf, ic1L, ic2L, ic3L, ic4L, ic5L, ic6L, ic7L, ic8L
aoutL	AllPassFilter atmpL, iap1L, iap2L, iap3L, iap4L
aR	=  ainR * 0.015
atmpR	CombFilter aR, kfb, khf, ic1R, ic2R, ic3R, ic4R, ic5R, ic6R, ic7R, ic8R
aoutR	AllPassFilter atmpR, iap1R, iap2R, iap3R, iap4R
	xout aoutL, aoutR
SkipInit:
	endop

; -----------------------------------------------------------------------------

	instr 1
a1	vco2 0.75, 440, 10
kfrq	port 100, 0.008, 20000
a1	butterlp a1, kfrq
a2	linseg 0, 0.003, 1, 0.01, 0.7, 0.005, 0, 1, 0
a1	=  a1 * a2
;	denorm a1	/* uncomment this for Csound5 */
atmp	rnd31 0.00000001, 0, 0	; portable, but slower method
	vincr a1, atmp		; of avoiding denormals
aL, aR	FreeVerb a1, a1, 0.9, 0.35, sr, 0
	outs a1 + aL, a1 + aR
	endin

</CsInstruments>
<CsScore>
i 1 0 5
e
</CsScore>

</CsoundSynthesizer>