{
  lib,
  config,
  username,
  ...
}: let
  cf = config.cf.programs.waybar;
in {
  options.cf.programs.waybar = {
    enable = lib.mkEnableOption "waybar";
  };

  config = lib.mkIf cf.enable {
    programs.waybar = {
      enable = true;
    };

    hjem.users.${username} = {
      xdg.config.files = {
        "waybar/config.jsonc".source = ./config.jsonc;
        "waybar/style.css".source = ./style.css;
      };
    };
  };
}
