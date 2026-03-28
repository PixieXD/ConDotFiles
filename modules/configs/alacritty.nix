{ lib, username, pkgs ... }:

{
  hjem.users.${username}.xdg.config.files.".config/alacritty/alacritty.toml" = {
    generator = (pkgs.formats.toml {}).generate "alacritty.toml";

    value = {
      general.import = [ "~/.config/alacritty/colors-mocha.toml" ];
      window.padding = { x = 10; y = 10 };
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
        style.shape = "Beam";
        style.blinking = "Always";
      };

      terminal.osc52 = "CopyPaste";
      mouse.hide_when_typing = true;

      keyboard = {
        bindings = [
          { key = "-"; mods = "Control"; action = "DecreaseFontSize" }
          { key = "="; mods = "Control"; action = "IncreaseFontSize" }
          { key = "V"; mods = "Control"; action = "Paste" }
        ];
      };

    };
  };

  hjem.users.${username}.xdg.config.files.".config/alacritty/colors-mocha.toml" = {
    generator = (pkgs.formats.toml {}).generate "alacritty.toml";

    value = {
      colors.primary = {
        background = "#1e1e2e";
        foreground = "#cdd6f4";
        dim_foreground = "#7f849c";
        bright_foreground = "#cdd6f4";
      };

      colors.cursor = {
        text = "#1e1e2e";
        cursor = "#f5e0dc";
      };

      colors.vi_mode_cursor = {
        text = "#1e1e2e";
        cursor = "#b4befe";
      };

      colors.search.matches = {
        text = "#1e1e2e";
        cursor = "#a6adc8";
      };

      colors.search.focused_match = {
        foreground = "#1e1e2e";
        background = "#a6e3a1";
      };

      colors.footer_bar = {
        foreground = "#1e1e2e";
        background = "#a6adc8";
      };

      colors.hints.start = {
        foreground = "#1e1e2e";
        background = "#f9e2af";
      };

      colors.hints.end = {
        foreground = "#1e1e2e";
        background = "#a6adc8";
      };

      colors.selection = {
        text = "#1e1e2e";
        background = "#f5e0dc";        
      };

      colors.normal = {
        black = "#45475a";
        red = "#f38ba8";
        green = "#a6e3a1";
        yellow = "#f9e2af";
        blue = "#89b4fa";
        magenta = "#f5c2e7";
        cyan = "#94e2d5";
        white = "#bac2de";
      };

      colors.bright = {
        black = "#585b70";
        red = "#f38ba8";
        green = "#a6e3a1";
        yellow = "#f9e2af";
        blue = "#89b4fa";
        magenta = "#f5c2e7";
        cyan = "#94e2d5";
        white = "#a6adc8";
      };

      colors.indexed_colors = [
        { index = 16; color = "#fab387"; }
        { index = 17; color = "#f5e0dc"; }
      ];

    };
  }
}