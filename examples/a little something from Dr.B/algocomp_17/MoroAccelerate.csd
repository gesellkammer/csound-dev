<CsoundSynthesizer>
<CsOptions>
; XO
;-+rtmidi=alsa  --midi-device=hw:1,0 -+rtaudio=alsa -odac -r16000 -k160 ;-O stdout
; Mac
-odac -r44100 -k441
</CsOptions>
<CsInstruments>
;---------------------------------------------------------------------/
;	Nicola Moro id 992-52-0479									   /
;	NYU spring 2005											   /
;---------------------------------------------------------------------/
nchnls=2

maxalloc 1, 4

instr 1
	kfire init 1
	kdrip init 1
	kenv init 0
	kread		linseg 0, p3, 1
	kmenv		table	kread, 3, 1, 0
	kmenv=kmenv*kmenv
	ktempo	table kread, 1, 1, 0	
;	ktempo	pow 2,(kread*8)
	kspeed=240*ktempo*4/60
	kphasor	phasor kspeed, 0
	
	if (kphasor>0.9 && kdrip==1) then
		event "i",3, 0, 1, 200
		kdrip=0
	elseif (kphasor<=0.9) then	
		kdrip=1
	endif
	kpan	randi	0.5,kspeed*2,0,0.5
	anoise  noise 32767, 1
	if (kread>=0.125 && kfire==1) then
		kfire=0
		event "i",1,0,20,kpan
	endif
	anoise	butterbp	anoise,400,10
	anoise	butterbp 	anoise,400,10
	anoise=anoise*10	
	outs	anoise*kenv*kmenv,anoise*kenv*kmenv
endin

instr 2
a1=0
outs	a1,a1
endin

instr 3
a3 sleighbells 20000, 0.01
outs a3*p4*0.005,(1-p4)*a3*0.005
endin
</CsInstruments>
<CsScore>
;f1 0 4096 7  0.0625 1024 0.125 1024 0.25 1024 0.5 1024 1. 1024
f1 0 8192 7 0.00078125 1024 0.015625 1024 0.03125 1024 0.0625 1024 0.125 1024 0.25 1024 0.5 1024 1. 1024 2.
f2 0 4096 10 1
f3 0 2049 1  "bellfunc.aif" 0 0 0    
f4 0 4096 5 0.0001 1024 1 2048 1 1024 0.0001

;i0 0 600
i1 0 20
i2 0 60
</CsScore>

</CsoundSynthesizer>