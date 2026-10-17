
# See https://wiki.hyprland.org/Configuring/Window-Rules/ for more
windowrulev2 = suppressevent miximize, class:.* # You'll probably like this.
windowrule = workspace 1 silent, $terminal
windowrulev2 = float,class:(firefox),title(Downloads|Library)
windowrulev2 = float,class:(pavucontrol)
windowrulev2 = float,class:(rofi)
