{ pkgs, ... }:

{
    imports = [
        ../../home/home-core.nix

        ./alacritty
        ./fastfetch
        ./hypr
        ./programs
        ./waybar
    ];
}