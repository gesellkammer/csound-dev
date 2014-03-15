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
a1 oscil 7000, p4, 2
kenv expseg 1, p3, .01
a1 = a1 * kenv
outs a1, a1
endin
 
instr 102
a1 oscil 10000, p4, 3
kenv expseg 1, p3, .01
a1 = a1 * kenv
outs a1, a1
endin

instr 103
a1 oscil 10000, p4, 1
kenv expseg 1, p3, .01
a1 = a1 * kenv
outs a1, a1
endin
</CsInstruments>
<CsScore>
; by Brian Baughn 3-14-05
; bbaughn@berklee.net
;**********Notes**************************************************************************
#define C(OCTAVE) #[8.1757989156 * (2 ^ ($OCTAVE + 1))]#
#define Csh(OCTAVE) #[8.6619572180 * (2 ^ ($OCTAVE + 1))]#
#define Dfl(OCTAVE) #[8.6619572180 * (2 ^ ($OCTAVE + 1))]#
#define D(OCTAVE) #[9.1770239974 * (2 ^ ($OCTAVE + 1))]#
#define Dsh(OCTAVE) #[9.7227182413 * (2 ^ ($OCTAVE + 1))]#
#define Efl(OCTAVE) #[9.7227182413 * (2 ^ ($OCTAVE + 1))]#
#define E(OCTAVE) #[10.3008611535 * (2 ^ ($OCTAVE + 1))]#
#define F(OCTAVE) #[10.9133822323 * (2 ^ ($OCTAVE + 1))]#
#define Fsh(OCTAVE) #[11.5623257097 * (2 ^ ($OCTAVE + 1))]#
#define Gfl(OCTAVE) #[11.5623257097 * (2 ^ ($OCTAVE + 1))]#
#define G(OCTAVE) #[12.2498573744 * (2 ^ ($OCTAVE + 1))]#
#define Gsh(OCTAVE) #[12.9782717994 * (2 ^ ($OCTAVE + 1))]#
#define Afl(OCTAVE) #[12.9782717994 * (2 ^ ($OCTAVE + 1))]#
#define A(OCTAVE) #[13.7500000000 * (2 ^ ($OCTAVE + 1))]#
#define Ash(OCTAVE) #[14.5676175474 * (2 ^ ($OCTAVE + 1))]#
#define Bfl(OCTAVE) #[14.5676175474 * (2 ^ ($OCTAVE + 1))]#
#define B(OCTAVE) #[15.4338631643 * (2 ^ ($OCTAVE + 1))]# 
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
#define BPM #100#

; ENTER BEATS PER MEASURE HERE!
#define PERMEASURE #4#

f 1 0 4096 10 1
f 2 0 4096 7  -1 4096 1    ; sawtooth
f 3 0 4096 7  0 1024 1 2048 -1 1024 0  ;triangle

#define BASS #i101#

;INSTR    START      DUR      FREQ
$BASS    $m(1'1)     $q       $D(3)
$BASS       +         .       $F(3)
$BASS       +         .       $D(3)

$BASS    $m(2'1)      .       $D(3)
$BASS    $m(2'3)      .       $D(3)

$BASS    $m(3'1)      .       $D(3)
$BASS       +         .       $F(3)
$BASS       +         .       $D(3)

$BASS    $m(4'1)      .       $D(3)
$BASS    $m(4'3)      .       $D(3)

$BASS    $m(5'1)      .       $D(3)
$BASS    $m(5'4)      .       $G(5)

$BASS    $m(6'1)      .       $E(5)
$BASS    $m(6'2)      .       $F(5)
$BASS    $m(6'3)     $e      $Efl(5)
$BASS    $m(6'3.5)   $e         .
$BASS    $m(6'4)     $q         .

$BASS    $m(7'1)     $e       $D(5)
$BASS       +         .         .
$BASS       +        $q         .
$BASS       +        $e      $Dfl(5)
$BASS       +         .         .
$BASS       +        $q         .

$BASS    $m(8'1)     $q       $D(5)
$BASS       +         .       $E(5)
$BASS       +         .       $D(5)

#define HARP #i102#

$HARP    $m(1'2)      $q      $D(4)
$HARP    $m(1'4)       .      $E(4)
$HARP    $m(1'4)       .     $Bfl(3)

$HARP    $m(2'2)       .      $F(4)
$HARP    $m(2'2)       .      $B(3)
$HARP    $m(2'4)       .     $Csh(4)
$HARP    $m(2'4)       .     $Bfl(3)

$HARP    $m(3'2)      $q      $D(4)
$HARP    $m(3'4)       .      $E(4)
$HARP    $m(3'4)       .     $Bfl(3)

$HARP    $m(4'2)       .      $F(4)
$HARP    $m(4'2)       .      $B(3)
$HARP    $m(4'4)       .     $Csh(4)
$HARP    $m(4'4)       .     $Bfl(3)

#define BELL #i103#

$BELL    $m(5'2)      $e     $F(6)
$BELL    $m(5'2)      $e     $A(5)
$BELL    $m(5'2.5)    $e     $D(6)
$BELL    $m(5'3)      $e     $F(6)
$BELL    $m(5'3)      $e     $A(5)
$BELL    $m(5'4)      $e     $E(6)

$BELL    $m(6'1)      $q     $Csh(6)
$BELL    $m(6'2)      $q     $D(6)
$BELL    $m(6'3)      $e     $C(6)
$BELL      +           .       .
$BELL    $m(6'4)      $q       .

$BELL    $m(7'1)      $e     $B(5)
$BELL       +          .        .
$BELL       +         $q        .
$BELL       +         $e    $Bfl(5)
$BELL       +          .        .
$BELL       +         $q        .

$BELL     $m(8'1)     $e     $F(5)
$BELL     $m(8'1)     $e     $A(5)
$BELL     $m(8'1.5)   $e     $D(6)
$BELL     $m(8'2)     $e    $Bfl(5)
$BELL     $m(8'2.5)   $e     $D(6)
$BELL     $m(8'3)     $q     $F(5)
$BELL     $m(8'3)      .     $A(5)
</CsScore>

</CsoundSynthesizer>