{ config, lib, pkgs, ... }:

{
    imports = [
        ./hardware-configuration.nix
    ];


    hardware = {
        graphics.enable = true;
        nvidia = {
            open = true;
            modesetting.enable = true;
            package = config.boot.kernelPackages.nvidiaPackages.stable;
            nvidiaSettings = true;
            prime = {
                sync.enable = true;
                intelBusId = "PCI:0:2:0";
                nvidiaBusId = "PCI:1:0:0";
            };
        };
    };
    
    networking.hostName = "larry-victus";
    services.xserver.videoDrivers = [ "nvidia" ];

    system.stateVersion = "25.11"; # Did you read the comment? yes :)
}