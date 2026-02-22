{ pkgs, config, ... }: 

{
    home.file.".config/fastfetch" = {
        source = ./config;
    };
}