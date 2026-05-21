{
  config,
  lib,
  pkgs,
  username,
  ...
}: let
  cf = config.cf.services.usb;
in {
  options.cf.services.usb = {
    enable = lib.mkEnableOption "USB support";
  };

  config = lib.mkIf cf.enable {
    hjem.users.${username}.packages = [pkgs.udiskie];
    services.udisks2.enable = true;
  };
}
