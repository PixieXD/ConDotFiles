{ lib, username, pkgs, ... }:

{
  hjem.users.${username}.xdg.config.files = {
    "alacritty/alacritty.toml" = {
      generator = (pkgs.formats.toml {}).generate "alacritty.toml";

      value = {
        general.import = [ "~/.config/alacritty/style.toml" ];
        window.padding = { x = 10; y = 10; };
        font = {
          size = 15;

          bold.family = "JetBrainsMono Nerd Font";
          bold.style = "Bold";

          normal.family = "JetBrainsMono Nerd Font";
          normal.style = "Regular";

          italic.family = "JetBrainsMono Nerd Font";
          italic.style = "Italic";

          bold_italic.family = "JetBrainsMono Nerd Font";
          bold_italic.style = "Bold Italic";
        };

        cursor = {
          unfocused_hollow = false;
          style = { shape = "Beam"; blinking = "Always"; };
        };

        terminal.osc52 = "CopyPaste";
        mouse.hide_when_typing = true;

        keyboard = {
          bindings = [
            { key = "-"; mods = "Control"; action = "DecreaseFontSize"; }
            { key = "="; mods = "Control"; action = "IncreaseFontSize"; }
            { key = "V"; mods = "Control"; action = "Paste"; }
          ];
        };
      };
    };

    "alacritty/style.toml".source = ./style.toml;
  };
}