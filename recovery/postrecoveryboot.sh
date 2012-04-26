#!/sbin/sh

# reboot recovery fix
echo 0 > /proc/upgrade_mem/update_flag

# limit cpu frequency to 1ghz
echo 1000000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq

# turn on button backlight
echo 255 > /sys/class/leds/button-backlight/brightness