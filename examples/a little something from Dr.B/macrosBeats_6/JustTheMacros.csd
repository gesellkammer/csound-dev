<CsoundSynthesizer>
<CsInstruments>

</CsInstruments>
<CsScore>
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