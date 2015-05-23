<CsoundSynthesizer>
<CsOptions>

-dm0 -+rtaudio=alsa -Ma -odac:hw:1,0 --displays

</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 32
nchnls = 2
0dbfs  = 1

#include "tx81z.csd"

maxalloc 1, 12

instr 1

midinoteonoct p4, p5    ;MIDI note number and velocity

kvel = p5/127           ;scale midi velocity to 0-1
kpb init 0
midipitchbend kpb
koct =  p4+kpb/4          ;add pitchbend values to octave-point-decimal value
kcps =  cpsoct(koct)            ;convert octave-point-decimal value into Hz

kpolyaft polyaft p4, 0, 1.0
printks "inote = %f, kpolyaft = %f\\n", 1, p4, kpolyaft

kmod init 0
kmod ctrl7 1, 7, 0, 10 * kcps

kenv mxadsr 0.01, 0.06, .7, .6

amod  oscili kmod*(1 + kpolyaft), kcps, giW2

asig  oscili kenv*kvel, kcps + amod, giW1
     outs  .5*asig, .5*asig

endin
</CsInstruments>
<CsScore>

f1 0 8192 10 1

f 0 3600

i81 0 -1


e

</CsScore>
</CsoundSynthesizer>
