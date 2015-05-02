<CsoundSynthesizer>
<CsOptions>

-dm0 -+rtaudio=alsa -Ma -odac:hw:1,0 -i adc:hw:1,0 --displays

</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 32
nchnls = 2
0dbfs  = 1

#include "tx81z.csd"


instr 1

midinoteonoct p4, p5    ;MIDI note number and velocity

kvel = p5/127           ;scale midi velocity to 0-1
kpb init 0
midipitchbend kpb
koct =  p4+kpb          ;add pitchbend values to octave-point-decimal value
kcps =  cpsoct(koct)            ;convert octave-point-decimal value into Hz

kmod init 0
kmod ctrl7 1, 7, 0, kcps

kenv mxadsr 0.01, 0.1, .6, 1

amod  oscili kmod, kcps, giW1

asig  oscili kenv*kvel, kcps + amod, giW1
     outs  asig, asig

endin
</CsInstruments>
<CsScore>

f1 0 8192 10 1

f 0 3600        ;runs for an hour

i81 0 1

i1 0 1 36 127
i1 + 1 36 127

e

</CsScore>
</CsoundSynthesizer>
