{
  lib,
  username,
  ...
}: {
  hjem.users.${username}.xdg.config.files."fuzzel/fuzzel.ini" = {
    generator = lib.generators.toINI {};
    value = {
      main = {
        font = "JetBrainsMono Nerd Font Mono";
        use-bold = true;
        dpi-aware = false;
        prompt = "'I\'ll get a(n) '";
        placeholder = "ice cream";
        fields = "filename,name,exec";
        terminal = "alacritty";
        match-counter = true;

        lines = 10;
        horizontal-pad = 20;
        vertical-pad = 10;
        inner-pad = 5;
      };

      border.radius = 0;

      # Stolen straight from catppuccin's fuzzel theme (mauve)
      colors = {
        background = "1e1e2edd";
        text = "cdd6f4ff";
        prompt = "bac2deff";
        placeholder = "7f849cff";
        input = "cdd6f4ff";
        match = "cba6f7ff";
        selection = "585b70ff";
        selection-text = "cdd6f4ff";
        selection-match = "cba6f7ff";
        counter = "7f849cff";
        border = "cba6f7ff";
      };
    };
  };
}
