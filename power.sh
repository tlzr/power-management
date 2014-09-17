#!/bin/bash -x

#*/5 * * * * /home/ai/scripts/power-reaction/power.sh

PWRCPT="/sys/class/power_supply/BAT0/capacity"
sudo_bin="/usr/bin/sudo"
hibernate_bin="/usr/sbin/pm-hibernate"

if [ -f $PWRCPT ];
then
    PWRVAL=$(< /sys/class/power_supply/BAT0/capacity)

    if [ ! -z $PWRVAL ] && [ $PWRVAL -le "40" ];
    then
        $sudo_bin $hibernate_bin
    fi

fi

#$ /usr/bin/acpi -V
#Battery 0: Charging, 85%, 00:15:45 until charged
#Battery 0: design capacity 3417 mAh, last full capacity 3629 mAh = 100%
#Adapter 0: on-line
#Thermal 0: ok, 42.0 degrees C
#Thermal 0: trip point 0 switches to mode critical at temperature 126.0 degrees C
#Thermal 1: ok, 58.0 degrees C
#Thermal 1: trip point 0 switches to mode critical at temperature 98.0 degrees C
#Cooling 0: pkg-temp-0 no state information available
#Cooling 1: intel_powerclamp no state information available
#Cooling 2: LCD 8 of 15
#Cooling 3: Processor 0 of 10
#Cooling 4: Processor 0 of 10

