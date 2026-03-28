{ lib, username, ... }:

{
  hjem.users.${username}.xdg.config.files = {
    ".config/hypr/hyprland.conf".source = ./hyprland.conf;
    ".config/hypr/animations.conf".source = ./animations.conf;
    ".config/hypr/autostart.conf".source = ./autostart.conf;
    ".config/hypr/env.conf".source = ./env.conf;
    ".config/hypr/keybinds.conf".source = ./keybinds.conf;
  }
}