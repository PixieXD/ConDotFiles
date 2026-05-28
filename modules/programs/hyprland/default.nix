{
  lib,
  pkgs,
  config,
  inputs,
  username,
  ...
}: let
  cf = config.cf.programs.hyprland;
  pack =
    if cf.hyprgit
    then inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}
    else pkgs;
in {
  options.cf.programs.hyprland = {
    enable = lib.mkEnableOption "hyprland";
    hyprgit = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Hyprland (flake version:tm:)";
    };
  };

  config = lib.mkIf cf.enable {
    programs.hyprland = {
      enable = true;
      package = pack.hyprland;
      portalPackage = pack.xdg-desktop-portal-hyprland;
      withUWSM = false;
      xwayland.enable = true;
    };

    hjem.users.${username} = {
      packages = []; # none as of now lmao

      xdg.config.files = {
        "hypr/hyprland.lua".source = ./hyprland.lua;
        "hypr/animations.lua".source = ./animations.lua;
        "hypr/autostart.lua".source = ./autostart.lua;
        "hypr/environment.lua".source = ./environment.lua;
        "hypr/keybinds.lua".source = ./keybinds.lua;
      };

      "hypr/.luarc.json" = {
        generator = lib.generators.toJSON {};
        value = {
          "workspace.library" = ["${pack.hyprland}/share/hypr/stubs"];
        };
      };
    };
  };
}
