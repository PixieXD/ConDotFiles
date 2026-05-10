{
  lib,
  pkgs,
  inputs,
  username,
  ...
}: {
  hjem.users.${username}.xdg.config.files = {
    "hypr/hyprland.conf".source = ./hyprland.conf;
    "hypr/animations.conf".source = ./animations.conf;
    "hypr/autostart.conf".source = ./autostart.conf;
    "hypr/env.conf".source = ./env.conf;
    "hypr/keybinds.conf".source = ./keybinds.conf;

    "hypr/.luarc.json" = {
      generator = lib.generators.toJSON {};
      value = {
        "workspace.library" = ["${inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland}/share/hypr/stubs"];
        "diagnostics.globals" = ["hl"];
      };
    };
  };
}
