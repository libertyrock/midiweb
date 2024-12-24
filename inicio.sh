#!/bin/bash
# cat /proc/asound/cards
clear

export dev=hw:DAC
export rate="44100"
export soundfont="/usr/share/sounds/sf2/FluidR3_GM.sf2"
mkfifo feca
mkfifo fmidi

echo 
echo "*** Cpu a tope"
#sudo cpufreq-set -g performance -d 1.37G -u 1.37g

echo 
echo "*** Parando servicios"
killall -9 qjackctl qsynth jackdbus pulseaudio dbus-daemon fluidsynth jackd 
killall -9 j2amidi_bridge jack_midi_clock ecasound cat midish nc

sleep 5
echo 
echo "*** Arrancando servicio jackd"
JACK_NO_AUDIO_RESERVATION=1 jackd -R -P80 -d alsa -d $dev -r $rate -p 256 -n 2 -S &

sleep 5
echo 
echo "*** Conectando puentes midi"
j2amidi_bridge &
a2jmidi_bridge &

sleep 5
echo "*** Arrancando servicio fluidsynth"
fluidsynth -z 256 -c 2 -is -a jack -j -m jack -o shell.port=9801 -o midi.alsa_seq.id=fsgm -o audio.jack.id=fsgm -o audio.realtime-prio=70 -o shell.prompt="" -g 1 -r $rate $soundfont &

sleep 5
echo 
echo "*** fin"

