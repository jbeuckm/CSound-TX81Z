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

itable_w1 GEN_W1
itable_w2 GEN_W2
itable_w3 GEN_W3
itable_w4 GEN_W4
itable_w5 GEN_W5
itable_w6 GEN_W6
itable_w7 GEN_W7
itable_w8 GEN_W8

midinoteonoct p4, p5    ;MIDI note number and velocity

kvel = p5/127           ;scale midi velocity to 0-1
kpb init 0
midipitchbend kpb
koct =  p4+kpb          ;add pitchbend values to octave-point-decimal value
kcps =  cpsoct(koct)            ;convert octave-point-decimal value into Hz
kmod init 0
kmod ctrl7 1, 7, 0, kcps
kenv madsr 0.01, 0.1, 0.8, 0.2

amod  oscili kmod, kcps, 1
asig  oscili kenv*kvel, kcps + amod, itable_w5
     outs  asig, asig

endin
</CsInstruments>
<CsScore>

f1 0 8192 10 1

f 0 3600        ;runs for an hour

i1 0 3 36 100
e

</CsScore>
</CsoundSynthesizer>
