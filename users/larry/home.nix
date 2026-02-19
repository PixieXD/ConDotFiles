{ pkgs, ... }:

{
    imports = [
        ../../home/home-core.nix

        ../../home/alacritty
        ../../home/fastfetch
        ../../home/hyprland
        ../../home/programs
        ../../home/waybar
    ];
}