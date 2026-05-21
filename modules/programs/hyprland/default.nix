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
        "hypr/hyprland.conf".source = ./hyprland.conf;
        "hypr/animations.conf".source = ./animations.conf;
        "hypr/autostart.conf".source = ./autostart.conf;
        "hypr/env.conf".source = ./env.conf;
        "hypr/keybinds.conf".source = ./keybinds.conf;

        # lua, i dont know what to do with lua rn tho...
        #"hypr/.luarc.json" = {
        #  generator = lib.generators.toJSON {};
        #  value = {
        #    "workspace.library" = ["${inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland}/share/hypr/stubs"];
        #    "diagnostics.globals" = ["hl"];
        #  };
        #};
      };
    };
  };
}
