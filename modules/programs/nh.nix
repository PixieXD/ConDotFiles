{
  config,
  lib,
  ...
}: let
  cf = config.cf.programs.nh;
in {
  options.cf.programs.nh = {
    enable = lib.mkEnableOption "nh";
    flake = lib.mkOption {
      type = lib.types.str;
      default = "";
      description = "directory to your flake.nix";
    };
  };

  config = lib.mkIf cf.enable {
    programs.nh = {
      enable = true;
      clean.enable = true;
      clean.extraArgs = "--keep-since 4d --keep 3";
      flake = cf.flake;
    };
  };
}
