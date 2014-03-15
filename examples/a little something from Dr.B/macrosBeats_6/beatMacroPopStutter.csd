<CsoundSynthesizer>

<CsOptions>
; XO
;-+rtmidi=alsa  --midi-device=hw:1,0 -+rtaudio=alsa -odac -r16000 -k160 ;-O stdout
; Mac
-odac -r44100 -k441
</CsOptions>

<CsInstruments>
nchnls 	= 		2

instr 101
iskip = p4
a1, a2 diskin2 "sa_beat1.aif", 1, iskip
kenv expseg .001, .001, 1, p3 - .002, 1, .001, .001
a1 = a1 * kenv
a2 = a2 * kenv
a1 = a1 * p5
a2 = a2 * p5
outs a1, a2
endin

instr 102
iskip = p4
kpitch linseg 1, 1, 1, .817, 0
a1, a2 diskin2 "sa_beat1.aif", kpitch, iskip
kenv expseg .001, .001, 1, 1.4, 1, .417, .001
a1 = a1 * kenv
a2 = a2 * kenv
a1 = a1 * p5
a2 = a2 * p5
outs a1, a2
endin

instr 103
iskip = p4
kpitch linseg 1, 1, 1
a1, a2 diskin2 "sa_beat1.aif", kpitch, iskip
kenv expseg .001, .001, 1, p3 - .002, 1, .001, .001
a1 = a1 * kenv
a2 = a2 * kenv
a1 = a1 * p5
a2 = a2 * p5
outs a1, a2
endin

instr 104
iskip = p4
kpitch linseg -1, 1, -1
a1, a2 diskin2 "sa_beat1.aif", kpitch, iskip
kenv expseg .001, .001, 1, p3 - .002, 1, .001, .001
a1 = a1 * kenv
a2 = a2 * kenv
a1 = a1 * p5
a2 = a2 * p5
outs a1, a2
endin
</CsInstruments>
<CsScore>
;**********Beat Macro********************************************************************
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

#define m(MNUMBER'BEATNUMBER) #[(($BEAT * $PERMEASURE) * ($MNUMBER -1 )) + (($BEATNUMBER - 1) * $BEAT)]#

#define r #0#
;***************************************************************************************
; ENTER BPM HERE!
#define BPM #131.94#

; ENTER BEATS PER MEASURE HERE!
#define PERMEASURE #4#

#define THEBEAT #i101#
#define TURNTABLE #i102#
#define TABLESTART #i103#
#define TABLEREV #i104#

#define STUTTERFOUR(DUR'SKIP)#
$THEBEAT      +       $DUR  $SKIP
$THEBEAT      +         .      .
$THEBEAT      +         .      .
$THEBEAT      +         .      .
# 

;Start

;INSTR      START      DUR   SKIP   AMP
$THEBEAT    $m(1'1)    $w     0      1
$THEBEAT      +        $w     .      .

;Stutter
$THEBEAT    $m(2'4)    $th   $q     .5
$THEBEAT      +         .     .       .
$THEBEAT      +         .     .       .
$THEBEAT      +         .     .       .
$THEBEAT      +     [$th / 2] .       .
$THEBEAT      +         .     .       .
$THEBEAT      +         .     .       .
$THEBEAT      +         .     .       .
$THEBEAT      +         .     .       .
$THEBEAT      +         .     .       .
$THEBEAT      +         .     .       .
$THEBEAT      +         .     .       .

$THEBEAT    $m(3'1)    $w     0       1
$THEBEAT      +        $hd     .       .

$TABLESTART $m(4'4)    $s     0       .5
$TABLEREV   $m(4'4.25) $s     $s      .5
$TABLESTART $m(4'4.5)  $s     0       .5    
$TABLEREV   $m(4'4.75) $s     $s      .5   


;Start Changing the beat
$THEBEAT    $m(5'1)     $e     0      1
$THEBEAT      +         $e     0      .
$THEBEAT      +         $s    $q      .
$THEBEAT      +          .     .     .5
$THEBEAT      +    [$h + $e] [$q + $e] 1 

$THEBEAT    $m(6'1)     $w     0       .

$THEBEAT    $m(7'1)     $e     0       1
$THEBEAT    $m(7'1.25)  $e    $q       .5
$THEBEAT    $m(7'2)     $q    $q       1
$THEBEAT    $m(7'2.75)  $e   $hd       .5
$THEBEAT    $m(7'3.25)  $e   $hd       .5
$THEBEAT    $m(7'3.5)   $q     0       1
;stutter
$THEBEAT    $m(7'4)     $th  $hd       .5
$THEBEAT       +         .    .        .
$THEBEAT       +         .    .        .
$THEBEAT       +         .    .        .   
$THEBEAT       +        $e    .        1

$THEBEAT    $m(8'1)     $q    0        1
$THEBEAT    $m(8'2)     $e    0        .
$THEBEAT    $m(8'2.5)   $e   $q        .
$THEBEAT    $m(8'3)     $h   $h        .   
;stutter
$THEBEAT    $m(8'4)  [$th / 2] $q     .3
$THEBEAT       +         .     .       .
$THEBEAT       +         .     .       .
$THEBEAT       +         .     .       .
$THEBEAT       +    [$th / 2]  $q     .3
$THEBEAT       +         .     .       .
$THEBEAT       +         .     .       .
$THEBEAT       +         .     .       . 
$THEBEAT       +   [$th / 4]   .       .
$THEBEAT       +         .     .       .
$THEBEAT       +         .     .       .
$THEBEAT       +         .     .       .
$THEBEAT       +         .     .       .
$THEBEAT       +         .     .       .
$THEBEAT       +         .     .       .
$THEBEAT       +         .     .       .
$THEBEAT       +   [$th / 8]   0     .1
$THEBEAT       +         .     .       .
$THEBEAT       +         .     .       .
$THEBEAT       +         .     .       .
$THEBEAT       +         .     .       .
$THEBEAT       +         .     .       .
$THEBEAT       +         .     .       .
$THEBEAT       +         .     .       .
$THEBEAT       +    [$th / 16] .       .
$THEBEAT       +         .     .       .
$THEBEAT       +         .     .       .
$THEBEAT       +         .     .       .
$THEBEAT       +         .     .       .
$THEBEAT       +         .     .       .
$THEBEAT       +         .     .       .
$THEBEAT       +         .     .       .
$THEBEAT       +         .     .       .
$THEBEAT       +         .     .       .
$THEBEAT       +         .     .       .
$THEBEAT       +         .     .       .
$THEBEAT       +         .     .       .
$THEBEAT       +         .     .       .
$THEBEAT       +         .     .       .
$THEBEAT       +         .     .       .


$THEBEAT    $m(9'1)      $w    0       1
$THEBEAT    $m(10'1)     $w    0       1
</CsScore>

</CsoundSynthesizer>