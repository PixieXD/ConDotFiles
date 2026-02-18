#!/run/current-system/sw/bin/bash

CONFIG_LOC="/home/larry/Important/ConDotFiles/Config/waybar/config-test.jsonc /home/larry/Important/ConDotFiles/Config/waybar/style-test.css"

trap "killall .waybar-wrapped" EXIT

while true; do
  waybar --config /home/larry/Important/ConDotFiles/Config/waybar/config-test.jsonc --style /home/larry/Important/ConDotFiles/Config/waybar/style-test.css &
  inotifywait -e create,modify $CONFIG_LOC
  killall .waybar-wrapped
done