{
  config,
  lib,
  pkgs,
  ...
}: let
  cf = config.cf.programs.steam;
in {
  options.cf.programs.steam = {
    enable = lib.mkEnableOption "steam";
    enableProton = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enables Proton-GE";
    };
    enableGamemode = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enables Gamemode";
    };
  };

  config = lib.mkIf cf.enable {
    programs.steam = {
      enable = true;
      extraCompatPackages = lib.mkIf cf.enableProton [pkgs.proton-ge-bin];
    };

    programs.gamemode.enable = cf.enableGamemode; # todo : gamescope?
  };
}
