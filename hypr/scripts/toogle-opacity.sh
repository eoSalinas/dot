#!/bin/bash

current_opacity=$(hyprctl getoption decoration:active_opacity | grep -oP 'float:\s*\K[0-9\.]+')
echo $current_opacity

if [ "$current_opacity" == "1.000000" ]; then
    hyprctl keyword decoration:active_opacity 0.9
    hyprctl keyword decoration:inactive_opacity  0.9
    hyprctl keyword decoration:fullscreen_opacity  0.9
else
    hyprctl keyword decoration:active_opacity 1.0
    hyprctl keyword decoration:inactive_opacity 1.0
    hyprctl keyword decoration:fullscreen_opacity  1.0
fi

