<CsoundSynthesizer>
<CsOptions>
</CsOptions>
<CsInstruments>
sr      = 44100
ksmps   = 64
nchnls  = 2
0dbfs = 1

; instr 1 is an always-on score activated instrument that 
; exists mainly to get "control" message values from [csound~].
;
; instr 2 is an FM MIDI instrument.
;
; instr 3 is a score activated FM instrument.
;
; instr 4 is an always-on score activated Effects instrument.
; It processes audio from instr 2, 3 with a reverb and flanger
; effect (respectively).

;massign 0, 0 ; Disable default MIDI assignments.
;massign 1, 2 ; Assign MIDI channel 1 to instr 2.
;zakinit 2, 1 ; Create 2 a-rate zak channels and 1 k-rate zak channel.
;giSine ftgen 1, 0, 16384, 10, 1 ; Generate a sine wave table.

; Initialize MIDI control values. 
;initc7 1, 1, 0
;initc7 1, 2, .5
;initc7 1, 3, .25
;initc7 1, 4, .2

; Declare all "chn" channels.  Always declare channels in the header
; section.  Declaring is required for output channels.  If an output
; channel is not declared using chn_k, [csound~] will not output value
; pairs for that channel.
;chn_k "car", 3      ; 3 = input + output
;chn_k "mod", 3
;chn_k "ndx", 3
;chn_k "portTime", 1 ; 1 = input
;chn_k "carX2", 2    ; 2 = output

;;chn_k "wet", 1   ; input

instr 1
	k_wet	invalue "wet"
	gk_wet	portk k_wet, 0.1	
endin


; chnget instrument.  Always-on and score activated.
instr 2
	a1 inch 1
	
	
	; Get the values for "car", "mod", "ndx", and "portTime". 
    ; We are getting some of these values at i-rate as well as
    ; k-rate.  The i-rate values are needed for the portk opcodes.
    ;iCar  chnget "car"
    ;iMod  chnget "mod"
    ;iNdx  chnget "ndx" 
    ;gkCar chnget "car"
    ;gkMod chnget "mod"
    ;gkNdx chnget "ndx"
    ;kTim  chnget "portTime"

    ; We could put the chnget/chnset opcodes in the MIDI activated
    ; instrument (2), but then we would have redundant calls because
    ; it's polyphonic.

    ; Smooth out jumps.
    ;gkCar portk gkCar, kTim, iCar
    ;gkMod portk gkMod, kTim, iMod
    ;gkNdx portk gkNdx, kTim, iNdx

    ;chnset gkCar * 2, "carX2" ; Just demonstrates the chnset opcode.

	

	a2	pconvolve a1, "/Users/edu/audio/ir/Claustrofobia v1.1/Iron bath/Bath.C.wav", 512
	kwet = gk_wet
	a2 = a2 * 0.1
	a2 = a1 * (1 - kwet) + a2 * kwet
	
	outch 1, a2, 2, a2
	
endin

</CsInstruments>
<CsScore>
i1 0 3600 ; Activate the always-on chnget instrument.
i2 0 3600 ; Activate the always-on chnget instrument.
e

</CsScore>
</CsoundSynthesizer>


<MacOptions>
Version: 3
Render: Real
Ask: Yes
Functions: ioObject
Listing: Window
WindowBounds: 642 44 798 791
CurrentView: io
IOViewEdit: On
Options:
</MacOptions>
<MacGUI>
ioView nobackground {65535, 65535, 65535}
ioSlider {62, 34} {15, 675} 0.000000 1.000000 0.700741 wet
</MacGUI>

