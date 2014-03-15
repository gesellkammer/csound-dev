<CsoundSynthesizer>

<CsOptions>
; XO
;-+rtmidi=alsa  --midi-device=hw:1,0 -+rtaudio=alsa -odac -r16000 -k160 ;-O stdout
; Mac
-odac -r44100 -k441
</CsOptions>

<CsInstruments>
/*
boomerangPointer - Pointer to read a function table forwards then backwards or vice versa.

DESCRIPTION
Pointer to read a function table forwards then backwards or vice versa.

SYNTAX
boomerangPointer kspeed, kbeg, kend, ifn, [imode]

INITIALIZATION
ifn -- function table to point at 

imode [optional] -- if -1 reads backwards then forwards. all other values, reads forwards then backwards

PERFORMANCE
kspeed -- 1=no change, 2=double speed, .5=half speed 

kbeg/kend -- values 0-1. example: kbeg=.1, kend = .8 loops between .1 and .8 * tablelength

CREDITS
bhob rainey
*/

/* .orc */
nchnls = 2

        opcode stereoGrain, aa, kkkkkkkkkkkkkkkiiip
;amp, off 0-1, grain, off, gap, off, skip (secs), pan -1 1, distributions, att % of grain, dec, pointer, numfreqs, freq ft, samp ft, density
kamp, kampoff, kgrain, kgrainoff, kgap, kgapoff, kmaxskip, kcenterpan, kampr, kfreqr, kpanr, katt, kdec, kpoint, knumfreq, ifreqfn, ifn, idens, icount xin

ainl init 0
ainr init 0

if (icount > idens) goto out

loop:
ainl, ainr stereoGrain kamp, kampoff, kgrain, kgrainoff, kgap, kgapoff, kmaxskip, kcenterpan, kampr, kfreqr, kpanr, katt, kdec, kpoint, knumfreq, ifreqfn, ifn, idens, icount + 1

out:
isamps = ftlen(ifn)
kdec limit kdec, .05, 1-katt
katt limit katt, .05, 1-kdec
kgrainmin = kgrain - kgrain * kgrainoff
kgrainmax = kgrain + kgrain * kgrainoff
kgapmin = kgap - kgap * kgapoff
kgapmax = kgap + kgap * kgapoff

redo:
ipan rnd31 1, i(kpanr)
ipan limit ipan + i(kcenterpan), -1, 1
ifreq rnd31 1, i(kfreqr)
ifreq = abs(ifreq * (i(knumfreq)-.001))
ifreq table ifreq, ifreqfn

iamp rnd31 i(kamp) * i(kampoff), i(kampr)
iamp = abs(iamp) + (i(kamp) - i(kamp) * i(kampoff))

igrain random i(kgrainmin), i(kgrainmax)
igap random i(kgapmin), i(kgapmax)
iskip random 0, i(kmaxskip)
iskip = iskip * sr
ipoint limit i(kpoint) + iskip, 0, isamps-(((igrain + igap) * sr) * ifreq)

timout 0, igrain + igap, continue
reinit redo

continue:
kl = sqrt(2)/2 * cos(ipan) - sin(ipan)
kri = sqrt(2)/2 * cos(ipan) + sin(ipan)
aline linseg 0, i(katt) * igrain, 1, (1-i(katt)-i(kdec)) * igrain, 1, i(kdec) * igrain, 0
asig lposcil3 iamp, ifreq, 0, isamps, ifn, ipoint
rireturn
asig = asig * aline
al = ainl + asig * kl
ar = ainr + asig * kri

xout al, ar
        endop

        opcode boomerangPointer, k, kkkip
kspeed, kbeg, kend, ifn, imode xin
kend limit kend, kbeg + .001, 1
kbeg limit kbeg, 0, kend
isamps = ftlen(ifn)
ilength = (isamps/sr) * 2
kcps = kspeed/ilength
kpoint loopseg kcps, 0, 0, 0, kcps * 2, 1, kcps * 2, 0, 0
kpoint = (imode == -1?kpoint * -1 + 1:kpoint)
kpoint = (kpoint * (kend-kbeg)) * isamps + kbeg * isamps
xout kpoint
        endop

instr 1
ifn = 1
ifreqfn = 10
kspeed = .5
kbeg = 0
kend = 1
kamp = 5000
kampoff = .1
kgrain = .05
kgrainoff = .1
kgap = .001
kgapoff = .1
kmaxskip = .2
kcenterpan = 0
kampr = 6
kfreqr = .5
kpanr = -.5
katt = .1
kdec = .1
knumfreq = 8
idens = 30

kpoint boomerangPointer kspeed, kbeg, kend, ifn, -1
al, ar stereoGrain kamp, kampoff, kgrain, kgrainoff, kgap, kgapoff, kmaxskip, kcenterpan, kampr, kfreqr, kpanr, katt, kdec, kpoint, knumfreq, ifreqfn, ifn, idens
outs al, ar
endin
</CsInstruments>
<CsScore>

/* .sco */
f1 0 0 1 "sa_BT_Fast_Satellite.wav" 0 4 0
f10 0 8 -2 .33333 .49 .6 .713 1.2 1.707 2.12 2.8
i1 0 60
</CsScore>

</CsoundSynthesizer>