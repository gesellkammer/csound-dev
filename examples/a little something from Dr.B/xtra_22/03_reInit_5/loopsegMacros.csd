<CsoundSynthesizer>

<CsOptions>
; XO
;-+rtmidi=alsa  --midi-device=hw:1,0 -+rtaudio=alsa -odac -r16000 -k160 ;-O stdout
; Mac
-odac -r44100 -k4410
</CsOptions>

<CsInstruments>
instr 1
  kdclick linen 1, .01, p3, .1
  kfreq expon 1, p3, 440
  klp loopseg kfreq, 0, 0, 0, 0.01, p4, 1, 0
  a1 oscil klp, p5, 1
  out a1*kdclick
endin
</CsInstruments>
<CsScore>
#define BEAT #[60 / $BPM]#

#define th #[$BEAT / 8]#
#define s #[$BEAT / 4]#
#define sd #[($BEAT / 4) * 1.5]#
#define st #[($BEAT / 2) / 3]#
#define e #[$BEAT / 2]#
#define ed #[($BEAT / 2) * 1.5]#
#define et #[$BEAT / 3]#
#define q #[$BEAT]#
#define qd #[$BEAT * 1.5]#
#define qt #[$BEAT * (2/3)]#
#define h #[$BEAT * 2]#
#define hd #[$BEAT * 3]#
#define ht #[$BEAT * (4/3)]#
#define w #[$BEAT * 4]#

#define m(MNUMBER'BEATNUMBER) #[(($BEAT*$PERMEASURE)*($MNUMBER -1 ))+(($BEATNUMBER - 1)*$BEAT)]#

#define r #0#
;***************************************************************************************
; ENTER BPM HERE!
#define BPM #60#

; ENTER BEATS PER MEASURE HERE!
#define PERMEASURE #4#


f 1 0 16384 10 1 1 1 1 1 1 1 0 0 0 0 0 0 1 1 1 1 1 

i1 $m(1'1) $w  5000  440 [1/$et] [1/$et] ; 1 bar of eighth note triplets
i1 $m(2'1) $w  5000  440 [1/$st] [133/$st] ; 1 bar of eighth note triplets morphing to sixteenth trips
</CsScore>

</CsoundSynthesizer>