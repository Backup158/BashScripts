#! /usr/bin/bash
echo "G-good Meowning :3"

# Creates separate audio sinks to separate tracks for OBS
#   So I can avoid recording background music while making gaming clips or tutorials
pactl load-module module-null-sink sink_name=OBSonly
pactl load-module module-combine-sink slaves=OBSonly,alsa_output.pci-0000_0b_00.4.analog-stereo sink_name=OBSandHeadphones
