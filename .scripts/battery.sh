#/bin/bash
if [ $(uname) = "Darwin" ]; then
  pmset -g batt|awk '/Internal/ {print $3 " " $4}'|tr -d ';'
elif [ $(uname) = "Linux" ]; then
  cat /sys/class/power_supply/BAT0/capacity
fi
