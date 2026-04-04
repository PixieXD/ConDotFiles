{ config, pkgs, username, hostname, ... }: 

{
  imports = [
    ./programs.nix
    ./services.nix
    ./hardware.nix
    ./options.nix
    ./hardware-configuration.nix

    ../../modules
  ];


  users.users.${username} = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "input" ];
    shell = pkgs.zsh;
  };

  hjem = {
    users.${username} = {
      directory = "/home/larry";
    };
    clobberByDefault = true;
    linker = pkgs.smfh;
  };

  networking.hostName = hostname;

  system.stateVersion = "25.11"; # Did you read the comment? yes :)
}