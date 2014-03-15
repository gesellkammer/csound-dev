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
a1 oscil 10000, p4, 2
kenv expseg 1, p3, .1
a1 = a1 * kenv
outs a1, a1
endin
 
instr 102
a1 oscil 10000, p4, 2
kenv expseg 1, p3, .1
a1 = a1 * kenv
outs a1, a1
endin
</CsInstruments>
<CsScore>
; Bach - Goldberg Variations - Variato 3
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
#define BPM #120#

; ENTER BEATS PER MEASURE HERE!
#define PERMEASURE #6#

#define RH #i101#
#define LH #i102#
f 1 0 4096 10 1
f 2 0 4096 7  -1 4096 1    ; sawtooth

;INSTR      START            DUR        FREQ

#define MEASUREONERH(MEASURE) #
$RH 	     $m($MEASURE'1) [$qd + $s]    $B(4)
$RH           +              $s        $C(5)  
$RH           +               .        $D(5)
$RH           +               .        $C(5)
$RH           +               .        $D(5)
$RH           +               .        $E(5)
$RH           +          [$qd + $s]    $A(4)
$RH           +              $s        $B(4)
$RH           +               .        $C(5)
$RH           +               .        $B(4)
$RH           +               .        $C(5)
$RH           +               .        $D(5)#

#define MEASURETWORH(MEASURE) #
$RH     $m($MEASURE'1)       $qd       $G(4)
$RH           +          [$qd + $e]    $G(5)
$RH           +              $s        $A(5)
$RH           +               .        $G(5)
$RH           +               .        $Fsh(5)
$RH           +               .        $G(5)
$RH           +               $e       $A(5)
#

#define MEASURETHREERH(MEASURE) #
$RH     $m($MEASURE'1.5)     $s        $D(5)
$RH           +               .        $C(5)
$RH           +               .        $B(4)
$RH           +               .        $A(4)
$RH           +              $e        $B(4)
$RH           +              $s        $C(5)
$RH           +               .        $B(4)
$RH           +               .        $A(4)
$RH           +               .        $B(4)
$RH           +              $e        $G(4)
$RH           +               .        $E(5)
$RH           +               .        $D(5)
$RH           +               .        $C(5)
$RH           +               .        $Fsh(5)
$RH           +               .        $A(5)
#

#define MEASUREFOURRH(MEASURE) #
$RH     $m($MEASURE'1)       $q        $B(4)
$RH           +              $e        $G(5)
$RH           +              $q        $G(5)
$RH           +              $e        $Fsh(5)
$RH           +              $e         $r
$RH           +               .         $r
$RH           +              $e        $B(5)
$RH           +              $q        $A(5)
$RH           +              $e        $D(5)
#


#define MEASUREONELH #
$LH       $m(1'1)            $e        $G(2)
$LH           +               .        $B(2)
$LH           +               .        $D(3)
$LH           +               .        $G(3)
$LH           +               .        $B(3)
$LH           +               .        $E(3)
$LH           +               .        $Fsh(2)
$LH           +               .        $A(2)
$LH           +               .        $D(3)
$LH           +               .        $Fsh(3)
$LH           +               .        $A(3)
$LH           +               .        $D(3)
#

#define MEASURETWOLH #
$LH       $m(2'1)            $e        $E(2)
$LH           +               .        $G(2)
$LH           +               .        $B(2)
$LH           +               .        $E(3)
$LH           +               .        $B(2)
$LH           +               .        $Csh(3)
$LH           +               .        $D(2)
$LH           +               .        $Fsh(2)
$LH           +               .        $A(2)
$LH           +               .        $D(3)
$LH           +               .        $Fsh(3)
$LH           +               .        $A(2)
#

#define MEASURETHREELH #
$LH       $m(3'1)             $s       $B(2)
$LH           +               .        $A(2)
$LH           +               .        $B(2)
$LH           +               .        $C(3)
$LH           +            [$e + $s]   $D(3)
$LH           +               $s       $G(2)
$LH           +               .        $A(2)
$LH           +               .        $B(2)
$LH           +               .        $C(3)
$LH           +               .        $D(3)
$LH           +               .        $E(3)
$LH           +               .        $D(3)
$LH           +               .        $C(3)
$LH           +               .        $B(2)
$LH           +               .        $C(3)
$LH           +               .        $E(3)
$LH           +               .        $Fsh(2)
$LH           +               .        $A(2)
$LH           +               .        $G(2)
$LH           +               .        $Fsh(2)
$LH           +               .        $E(2)
$LH           +               .        $D(2)
#

#define MEASUREFOURLH #
$LH       $m(4'1)             $s       $G(2)
$LH           +               .        $Fsh(2)
$LH           +               .        $G(2)
$LH           +               .        $A(2)
$LH           +               .        $B(2)
$LH           +               .        $C(3)
$LH           +               .        $D(3)
$LH           +               .        $E(3)
$LH           +               .        $A(2)
$LH           +               .        $B(2)
$LH           +               .        $C(3)
$LH           +               .        $A(2)
$LH           +               .        $B(2)
$LH           +               .        $A(2)
$LH           +               .        $G(2)
$LH           +               .        $Fsh(2)
$LH           +            [$e + $s]   $G(2)
$LH           +               $s       $Fsh(2)
$LH           +               .        $E(2)
$LH           +               .        $D(2)
$LH           +               .        $E(2)
$LH           +               .        $Fsh(2)
#

;Measure One
$MEASUREONERH(1)
$MEASUREONELH

;Measure Two
$MEASURETWORH(2)
$MEASUREONERH(2)
$MEASURETWOLH

;Measure Three
$MEASURETHREERH(3)
$MEASURETWORH(3)
$MEASURETHREELH

;Measure Four
$MEASUREFOURRH(4)
$MEASURETHREERH(4)
$MEASUREFOURLH

;Quick Ending
$RH         $m(5'1)           $q        $G(5)
$RH         $m(5'1)           $q        $B(4)
$LH         #m(5'1)           $q        $G(2)
</CsScore>

</CsoundSynthesizer>

/*

How to Use It

Start Times:
   To indicate when a note should start, use the $m macro and include
arguments for the measure number and beat number to start on.

   For example, p2 of a note starting on the second beat of the first measure:

   $m(1'2)

   A note starting on the "and" of 3 in the 13th measure:

   $m(13'3.5)

   A note starting on the third eighth-note triplet of beat 1 measure 51:

   $m(51,1.667)

Duration:
   Durations are defined by the following macros:

   $th      Thirty-second note
   $s       Sixteenth note
   $sd      Dotted sixteenth
   $st      Sixteenth note triplet
   $e       Eighth note
   $ed      Dotted eighth
   $et      Eigth note triplet
   $q       Quarter note
   $qd      Dotted quarter
   $qt      Quarter note triplet
   $h       Half note
   $hd      Dotted Half
   $ht      Half note triplet
   $w       Whole note

   For ties, use brackets to add two or more note durations.

   For example, p3 of a quarter note tied to a sixteenth:

   [$q + $s]

   A whole note tied to a half note tied to an eighth:

   [$w + $h + $e]

Rests:
  For a rest, just put the duration of the rest p3, and use the $r macro for amplitude (and/or frequency):

  An eighth note rest on the first beat of bar 2:

  $m(2'1)	$e	$r

*/