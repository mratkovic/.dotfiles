#! /bin/bash
# Small script that toggles touchpad on-off.
# Script uses Synaptics (synclient)


STATE=`synclient | grep TouchpadOff | sed -r 's/\s//g' | cut -d'=' -f2`

if [ $STATE -eq 0 ];then
    synclient TouchpadOff=1
    notify-send -i dialog-error "Touchpad disabled!"
else
    synclient TouchpadOff=0
    notify-send -i dialog-information "Touchpad enabled!"
fi
