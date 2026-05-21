{
  config,
  lib,
  inputs,
  pkgs,
  username,
  ...
}: let
  cf = config.cf.services.stash;
  stash = inputs.stash.packages.${pkgs.stdenv.hostPlatform.system}.stash;
in {
  options.cf.services.stash = {
    enable = lib.mkEnableOption "stash";
  };

  config = lib.mkIf cf.enable {
    hjem.users.${username}.packages = [stash];
    systemd.packages = [stash];
  };
}
