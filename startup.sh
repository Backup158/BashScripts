#! /usr/bin/bash
echo "G-good Meowning :3"

# OBS audio sinks
#   Sink name is for internal use. Cannot use spaces
#   If there is a device description, that will be used as the display name (when human is reading)
pactl load-module module-null-sink sink_name="OBS" sink_properties="'device.description=\"OBS Only\"'"
pactl load-module module-combine-sink sink_name="OBS+Headphones" sink_properties="'device.description=\"Combined (OBS/Headphones)\"'" slaves="OBS",alsa_output.pci-0000_0b_00.4.analog-stereo
# Rename headphone sink for human readibility
pactl load-module update-sink-proplist alsa_output.pci-0000_0b_00.4.analog-stereo device.description="Headphones"
