import("stdfaust.lib");

envelop = abs : max ~ -(1.0/ma.SR) : max(ba.db2linear(-70)) : ba.linear2db;
vmeter(x) = attach(x, envelop(x) : vbargraph("[03][unit:dB]", -70, +5));
hmeter(x) = attach(x, envelop(x) : hbargraph("[03][unit:dB]", -70, +5));

ramp = os.lf_sawpos(1.0/(hslider("[01] time", 3.0, 0.1, 23.0, 0.01)));
distance = hslider("[02] distance", 1, 0, 1, 0.01);

process = os.osc(1000) : sp.spat(10, ramp, distance) : hmeter, hmeter, hmeter, hmeter, hmeter, hmeter, hmeter, hmeter, hmeter, hmeter;