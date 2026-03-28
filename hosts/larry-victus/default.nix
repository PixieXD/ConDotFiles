{ config, pkgs, username, hostname, ... }: 

{
  imports = [
    ./programs.nix
    ./services.nix
    ./hardware.nix
    ./options.nix
    ./hardware-configurations.nix

    ../../modules
  ];


  users.users.${username} = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
    shell = pkgs.zsh;
  };

  hjem.users.${username}.directory = config.users.users.${username}.home;
  networking.hostName = hostname;

  system.stateVersion = "25.11"; # Did you read the comment? yes :)
}