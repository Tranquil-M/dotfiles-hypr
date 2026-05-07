#!/usr/bin/env bash
while true; do
    BAT=$(ls /sys/class/power_supply | grep BAT | head -n 1) # get battery devices
    CAPACITY=$(cat /sys/class/power_supply/${BAT}/capacity) # get current capacity
    STATUS=$(cat /sys/class/power_supply/${BAT}/status) # current charging status (discharging/charging/plugged)

    # check if battery is below 20%
    if [ "$STATUS" == "Discharging" ] && [ "$CAPACITY" -le 20 ]; then
        notify-send -u critical "Battery Low" "Battery is at ${CAPACITY}%! CHARGE YOUR COMPUTER NOW!!"
    fi
    sleep 30
    # loop every 30 seconds until you charge your laptop (GET ON WITH IT)
done
