
#!/usr/bin/env bash
while true; do
    BAT=$(ls /sys/class/power_supply | grep BAT | head -n 1)
    CAPACITY=$(cat /sys/class/power_supply/${BAT}/capacity)
    STATUS=$(cat /sys/class/power_supply/${BAT}/status)

    if [ "$STATUS" == "Discharging" ] && [ "$CAPACITY" -le 20 ]; then
        notify-send -u critical "Battery Low" "Battery is at ${CAPACITY}%!"
    fi
    sleep 30
done
