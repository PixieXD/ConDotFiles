{ config, pkgs, ... }:

{
  services = {
    # printing.enable = true;
    libinput.enable = true;
    udisks2.enable = true;

    pipewire = {
      enable = true;
      pulse.enable = true;
      jack.enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
    };

    openssh = {
      enable = true;
      settings.PermitRootLogin = "yes";
      settings.PasswordAuthentication = false;
      openFirewall = true;
    };

    displayManager.ly = {
      enable = true;
      x11Support = true;
    };


  };
}