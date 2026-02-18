{ pkgs, ... }:

{
    programs.hyprland = {
        enable = true;
        withUWSM = false;
        xwayland.enable = true;
    };

    enviroment.systemPackages = with pkgs; [
        rofi
        waybar
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