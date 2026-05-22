{
  config,
  lib,
  username,
  pkgs,
  ...
}: let
  cf = config.cf.services.fnott;
in {
  options.cf.services.fnott = {
    enable = lib.mkEnableOption "fnott";
  };

  config = lib.mkIf cf.enable {
    hjem.users.${username} = {
      packages = with pkgs; [fnott libnotify];

      xdg.config.files = {
        "fnott/fnott.ini" = {
          generator = lib.generators.toINI {};
          value = {
            min-width = 0;
            max-width = 0;
            max-height = 0;
            stacking-order = "bottom-up";
            anchor = "top-right";
            edge-margin-vertical = 15;
            edge-margin-horizontal = 15;

            border-size = 2;

            padding-vertical = 15;
            padding-horizontal = 15;

            dpi-aware = true;

            title-font = "JetBrainsMono Nerd Font Mono";
            title-format = "<i>%a%A</i>";

            summary-font = "JetBrainsMono Nerd Font Mono";
            summary-format = "<b>%s</b>\n";

            body-font = "JetBrainsMono Nerd Font Mono";
            body-format = "%b";

            progress-bar-height = 20;
            progress-style = "bar";

            max-timeout = 5;
            default-timeout = 5;
            idle-timeout = 5;

            title-color = "a6adc8ff";
            summary-color = "cdd6f4ff";
            body-color = "cdd6f4ff";
            background = "1e1e2eff";
            border-color = "89b4faff";
            progress-bar-color = "6c7086ff";

            critical.border-color = "fab387ff";
          };
        };
      };
    };
  };
}
