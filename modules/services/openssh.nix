{
  config,
  lib,
  ...
}: let
  cf = config.cf.services.openssh;
in {
  options.cf.services.openssh = {
    enable = lib.mkEnableOption "openssh";
  };

  config = lib.mkIf cf.enable {
    services.openssh = {
      enable = true;
      settings = {
        PermitRootLogin = "yes";
        PasswordAuthentication = false;
      };
      openFirewall = true;
    };
  };
}
