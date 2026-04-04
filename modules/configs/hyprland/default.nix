{ lib, username, ... }:

{
  hjem.users.${username}.xdg.config.files = {
    "hypr/hyprland.conf".source = ./hyprland.conf;
    "hypr/animations.conf".source = ./animations.conf;
    "hypr/autostart.conf".source = ./autostart.conf;
    "hypr/env.conf".source = ./env.conf;
    "hypr/keybinds.conf".source = ./keybinds.conf;
  };
}