{
  config,
  lib,
  hostname,
  username,
  ...
}: let
  cf = config.cf.sys.network;
in {
  options.cf.sys.network = {
    enable = lib.mkEnableOption "networking";
  };

  config = lib.mkIf cf.enable {
    networking = {
      hostName = hostname;
      networkmanager.enable = true;
      dhcpcd.enable = false;
      # nm-applet.enable = true; maybe?
    };

    users.users.${username}.extraGroups = ["networkmanager"];
  };
}
