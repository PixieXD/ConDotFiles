#!/run/current-system/sw/bin/bash

CONFIG_LOC="./Important/ConDotFiles/home/waybar/config/testing/config-test.jsonc ./Important/ConDotFiles/home/waybar/config/testing/style-test.css"

trap "killall .waybar-wrapped && hyprctl dispatch exec waybar" EXIT

killall .waybar-wrapped

while true; do
  waybar --config ./Important/ConDotFiles/home/waybar/config/testing/config-test.jsonc --style ./Important/ConDotFiles/home/waybar/config/testing/style-test.css &
  inotifywait -e create,modify $CONFIG_LOC
  killall .waybar-wrapped
done