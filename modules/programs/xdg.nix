{
  config,
  lib,
  pkgs,
  ...
}: let
  cf = config.cf.programs.xdg;
in {
  options.cf.programs.xdg = {
    enable = lib.mkEnableOption "XDG Desktop Portal";
  };

  config = lib.mkIf cf.enable {
    xdg.portal = {
      enable = true;
      xdgOpenUsePortal = true; # see 160923 or 330916 on nixpkgs' issue tracker for more info
      extraPortals = with pkgs; [
        kdePackages.xdg-desktop-portal-kde
        xdg-desktop-portal-gtk
      ];

      config = {
        common.default = ["gtk"];
        gtk.default = ["gtk"];

        hyprland = {
          default = ["hyprland" "gtk"];
          "org.freedesktop.impl.portal.FileChooser" = ["kde"];
        };
      };
    };
  };
}
