{ pkgs, config, ... }: 

{
    home.file.".config/fastfetch" = {
        source = ./config;
        recursive = true;
    };
}