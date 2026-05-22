{
  lib,
  config,
  username,
  pkgs,
  ...
}: let
  cf = config.cf.programs.flameshot;
in {
  options.cf.programs.flameshot = {
    enable = lib.mkEnableOption "flameshot";
    saveDir = lib.mkOption {
      type = lib.types.str;
      default = "/home/${username}/Pictures/";
      description = "Path to save screenshots.";
    };
  };

  config = lib.mkIf cf.enable {
    hjem.users.${username} = {
      packages = with pkgs; [flameshot grim];

      xdg.config.files = {
        "flameshot/flameshot.ini" = {
          generator = lib.generators.toINI {};
          value = {
            General = {
              disabledTrayIcon = true;
              startupLaunch = false;
              savePath = cf.saveDir;
              undoLimit = 100;
              contrastOpacity = 188;
            };
          };
        };
      };
    };
  };
}
