<CsoundSynthesizer>
<CsOptions>

-dm0 -+rtaudio=alsa -Ma -odac:plughw:1,0 -d --sched 1

</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 32
nchnls = 2
0dbfs  = 1

#include "tx81z.csd"

maxalloc 1, 12
massign 4, 1

instr 1

midinoteonoct p4, p5    ;MIDI note number and velocity

kvel = p5/127           ;scale midi velocity to 0-1
kpb init 0
midipitchbend kpb
koct =  p4+kpb/4          ;add pitchbend values to octave-point-decimal value
kcps =  cpsoct(koct)            ;convert octave-point-decimal value into Hz

kpolyaft polyaft p4, 0, 1.0
;printks "inote = %f, kpolyaft = %f\\n", 1, p4, kpolyaft

kmod init 0
kmod ctrl7 1, 7, 0, 10 * kcps

iatt ctrl7 1, 1, 0.001, 3
idec ctrl7 1, 16, 0.001, 3
isus ctrl7 1, 19, 0.001, 3
irel ctrl7 1, 71, 0.001, 3

kenv mxadsr iatt, idec, isus, irel
;kenv mxadsr .001, 1, .5, .2

;twaves init 8
;twaves[0] = giW1
;twaves[1] = giW2
;twaves[2] = giW3
;twaves[3] = giW4
;twaves[4] = giW5
;twaves[5] = giW6
;twaves[6] = giW7
;twaves[7] = giW8

iwave ctrl7, 1, 2, 0, 7
;printks "iwave = %f\\n", 1, iwave

iwaveTable = giW1

if (iwave < 1) then
  iwaveTable = giW1
elseif (iwave < 2) then
  iwaveTable = giW2
elseif (iwave < 3) then
  iwaveTable = giW3
elseif (iwave < 4) then
  iwaveTable = giW4
elseif (iwave < 5) then
  iwaveTable = giW5
elseif (iwave < 6) then
  iwaveTable = giW6
elseif (iwave < 7) then
  iwaveTable = giW7
else
  iwaveTable = giW8
endif

;printks "iwaveTable = %f\\n", 1, iwaveTable


amod  oscili kmod*(1 + kpolyaft), kcps, giW2

asig  oscili kenv*kvel, kcps + amod, iwaveTable
     outs  .5*asig, .5*asig

endin
</CsInstruments>
<CsScore>

f1 0 8192 10 1

f 0 3600000

i81 0 -1

e

</CsScore>
</CsoundSynthesizer>
