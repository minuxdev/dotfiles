#  ____                           _
# |  _ \  ___  ___ ___  _ __ __ _| |_(_) ___  _ __  ___ 
# | | | |/ _ \/ __/ _ \| '__/ _` | __| |/ _ \| '_ \/ __|
# | |_| |  __/ (_| (_) | | | (_| | |_| | (_) | | | \__ \
# |____/ \___|\___\___/|_|  \__,_|\__|_|\___/|_| |_|___/
#
#------------------------------ STYLING -------------------------------
general {
    border_size = 1
    gaps_out = 10
    gaps_in = 5
    resize_on_border = true
    extend_border_grab_area = 15
    col.active_border = rgba(3accffee)
    col.inactive_border = rgba(595959aa)
}

decoration {
    rounding = 4
    active_opacity = 1
    inactive_opacity = 0.9
    fullscreen_opacity = 1.0
    blur {
        enabled = true
        size = 10
        passes = 5
        noise = 0.05
    }
}

animations {
    enabled = yes

    # Some default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more

    bezier = myBezier, 0.05, 0.9, 0.1, 1.05

    animation = windows, 1, 7, myBezier
    animation = windowsOut, 1, 7, default, popin 80%
    animation = border, 1, 10, default
    animation = borderangle, 1, 8, default
    animation = fade, 1, 7, default
    animation = workspaces, 1, 6, default
}
