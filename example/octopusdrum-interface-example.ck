//Start after start-octopusdrum.ck
OctopusInterface hh;
OctopusInterface hs;

[1.0,1.0,0.0,0.0] @=> hs.pattern;
//or
hh.setpattern([0.0,0.0,1.0,1.0]);

hs.loadsample("../samples/snare_01.wav");
hh.loadsample("../samples/hihat_01.wav");

//load start on or off
hs.startstate(0);

hh.out => dac;
hs.out => dac;

spork ~ hh.loop(300::ms);
spork ~ hs.loop(350::ms);

1::day => now;
