{ pkgs, config, ... }: 

{
    home.file.".config/alacritty" = {
        source = ./config;
        recursive = true;
    };
}