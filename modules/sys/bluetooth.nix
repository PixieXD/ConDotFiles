# like i said, i dont use bluetooth but wtv i guess...
{
  config,
  lib,
  username,
  pkgs,
  ...
}: let
  cf = config.cf.sys.bluetooth;
in {
  options.cf.sys.bluetooth = {
    enable = lib.mkEnableOption "bluetooth";
  };

  config = lib.mkIf cf.enable {
    hardware.bluetooth = {
      enable = true;
      powerOnBoot = false;
    };

    hjem.users.${username}.packages = [pkgs.overskride];
  };
}
