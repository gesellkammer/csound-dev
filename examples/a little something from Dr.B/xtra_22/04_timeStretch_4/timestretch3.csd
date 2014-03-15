<CsoundSynthesizer>
<CsOptions>
; XO
;-+rtmidi=alsa  --midi-device=hw:1,0 -+rtaudio=alsa -odac -r16000 -k160 ;-O stdout
; Mac
-odac -r44100 -k44100 -B2048 -b1024
</CsOptions>
<CsInstruments>
instr 1	
ifile	=	p8	; name of audio file to be processed
ilen	filelen	ifile	; duration of file in seconds
istrch	=	(p4=0 ? p5 : p5/ilen)	; time-stretching factor
iread	=	1/istrch	; inverse of pitch-shifting factor
itransp	=	istrch*p6	; pitch-shifting factor
iloop	=	p7	; sample playback mode (with/without loop)
ifft	=	2048	; fft size
ihop	=	ifft*.2	; hop size
iwinsize	=	ifft*2	; analysis window size
iwintype	=	0	; window type (hamming)
inbins	=	(ifft/2) + 1
asig	diskin2	ifile, iread, 0, iloop	; play audio file
fsrc	pvsanal	asig, ifft, ihop, iwinsize, iwintype	; phase-vocoding analyis of signal
astrch	pvsadsyn	fsrc, inbins, itransp	; pitch-shifted resynthesis
kenv	linen	1, .002, p3, .008	; declick envelope
aout	=	astrch*kenv
	out	aout
endin
</CsInstruments>
<CsScore> 
; p4	determines the meaning of p5 (istrch)
;		0 = a time compression/expansion factor
;		1 = total duration in seconds of resynthesized signal
; p5	time-stretching factor, according to p4
; p6	pitch-shifting factor 
; p7	sample playback mode
;		0 = without loop
;		1 = with loop
; p8	name of audio file to be processed

;p1	  p2	p3	p4	p5	p6	p7	p8
i1	   0	20	0	1	.5	0	"sa_BT_Fast_Satellite.wav"
e
</CsScore>
</CsoundSynthesizer>