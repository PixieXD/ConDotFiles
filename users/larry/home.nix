{ pkgs, ... }:

{
    imports = [
        ../../home/home-core.nix

        ../../home/alacritty
        ../../home/fastfetch
        ../../home/hypr/land
        ../../home/programs
        ../../home/waybar
    ];
}