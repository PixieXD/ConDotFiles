{
  programs.nvf = {
    settings = {
      vim = {
        viAlias = true;
        vimAlias = true;
        presence.neocord.enable = true;
        telescope.enable = true;

        options = {
          tabstop = 2;
          shiftwidth = 2;
        };

        lsp = {
          enable = true;
          formatOnSave = true;
          trouble.enable = true;
          lspSignature.enable = true;
          lightbulb.enable = true;
        };

        visuals = {
          nvim-web-devicons.enable = true;
          nvim-cursorline.enable = true;
          fidget-nvim.enable = true;
          highlight-undo.enable = true;
          indent-blankline.enable = true;
        };

        theme = {
          enable = true;
          transparent = true;
          name = "catppuccin";
          style = "mocha";
        };

        languages = {
          enableFormat = true;
          enableTreesitter = true;
          enableExtraDiagnostics = true;

          nix.enable = true;
          css.enable = true;
          java.enable = true;
          markdown.enable = true;
          bash.enable = true;
          json.enable = true;
          toml.enable = true;
          qml.enable = true;
        };

        ui = {
          noice.enable = true;
          colorizer.enable = true;
          illuminate.enable = true;
          breadcrumbs = {
            enable = true;
            navbuddy.enable = true;
          };
          fastaction.enable = true;
        };
      };
    };
  };
}
