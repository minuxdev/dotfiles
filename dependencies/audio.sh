#!/bin/bash

audio ()
{
  sudo pacman -Sy \
    pulseaudio pulseaudio-ctl pulseaudio-alsa \
    pulseaudio-bluetooth pavucontrol playerctl
}
