{ pkgs, ... }:

{
    programs.hyprland = {
        enable = true;
        withUWSM = false;
        xwayland.enable = true;
    };

    environment.systemPackages = with pkgs; [
        waybar
        rofi
        wlogout
        swayosd
        swaynotificationcenter
        hyprcursor
        waypaper
        xbindkeys
        hyprland-qt-support
        egl-wayland

        # temporarily added, just to test smth :p
        hyprpolkitagent
        swww
    ];

}