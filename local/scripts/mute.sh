#! /bin/bash
#
# Small script that toggles mute using amixer from alsa-utils package.
# Press F6 in alsamixer and you see the list of cards supported by Alsa.
#
# Usage:
#	<script> [card_num]
#		card_num: soundcard id, default 0, check cards in alsamixer
#
# Note:
# Also using pavucontrol
#   pactl set-sink-mute 0 0 #unmute
#   pactl set-sink-mute 0 1 #mute
#

CARD='0'

if [ $# -gt 1 ]; then
	echo "Invalid call"
	echo -e "\n"
	echo "<script> [card_num]"
	echo -e "\tcard_num: soundcard id, default 0, check cards in alsamixer"
	exit -1

elif [ $# -eq 1 ]; then
	CARD=$1
fi

if amixer -c $CARD | grep -E -A 6 -B 0 'Master|Headphone|Speaker' | grep -q '\[off\]'; then
	echo "Current status: MUTE"
    amixer -c $CARD set Master unmute > /dev/null
    amixer -c $CARD set Speaker unmute > /dev/null
    amixer -c $CARD set Headphone unmute > /dev/null
    echo "New status: UNMUTE"
    notify-send -i dialog-information "MUTE: OFF!"
else
	echo "Current status: UNMUTE"
    amixer -c $CARD set Master mute > /dev/null
    echo "New status: MUTE"
    notify-send -i dialog-information "MUTE: ON"
fi


