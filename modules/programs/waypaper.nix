{
  lib,
  config,
  pkgs,
  username,
  ...
}: let
  cf = config.cf.programs.waypaper;
in {
  options.cf.programs.waypaper = {
    enable = lib.mkEnableOption "waypaper";
  };

  config = lib.mkIf cf.enable {
    hjem.users.${username} = {
      packages = with pkgs; [waypaper awww];

      xdg.config.files = {
        "waypaper/config.ini" = {
          generator = lib.generators.toINI {};
          value = {
            Settings = {
              folder = "~/Picures/Wallpaper"; # Adjust accordingly
              backend = "awww";
              monitors = "All";
              fill = "Fill";
              sort = "name";
              show_path_in_tooltip = true;
              awww_transition_type = "wipe";
              awww_transition_duration = 1;
              awww_transition_angle = 45;
              awww_transition_fps = 60;
              awww_transition_steps = 60;
            };
          };
        };
      };
    };
  };
}
