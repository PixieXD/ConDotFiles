{
  programs.nvf = {
    settings = {
      vim = {
        viAlias = true;
        vimAlias = true;

        autopairs.nvim-autopairs.enable = true;
        filetree.neo-tree.enable = true;
        tabline.nvimBufferline.enable = true;
        binds.cheatsheet.enable = true;
        telescope.enable = true;
        treesitter.context.enable = true;
        comments.comment-nvim.enable = true;
        autocomplete.nvim-cmp.enable = true;
        spellcheck.enable = true; # TODO : add MY languages

        presence.neocord.enable = true;

        options = {
          tabstop = 2;
          shiftwidth = 2;
        };

        lsp = {
          enable = true;
          formatOnSave = true;
          trouble.enable = true;
          inlayHints.enable = true;
          lightbulb.enable = true;
          lspSignature.enable = true;
          lspkind.enable = true;
        };

        languages = {
          enableFormat = true;
          enableTreesitter = true;
          enableExtraDiagnostics = true;

          nix.enable = true;
          java.enable = true;
          markdown.enable = true;
          css.enable = true;
          toml.enable = true;
          json.enable = true;
          bash.enable = true;
          qml.enable = true;
          # lua.enable = true; <-- this will be enabled when the time is right (hyprland lua config)
        };

        visuals = {
          cinnamon-nvim.enable = true;
          fidget-nvim.enable = true;
          highlight-undo.enable = true;
          hlargs-nvim.enable = true;
          indent-blankline.enable = true; # check back visuals.indent-blankline.setupOpts later
          nvim-scrollbar.enable = true;
          nvim-web-devicons.enable = true;
          syntax-gaslighting.enable = false; # maybe sometime...

          nvim-cursorline = {
            enable = true;
            setupOpts.cursorline.enable = true;
          };
        };

        statusline.lualine = {
          enable = true;
        };

        #autocomplete.blink-cmp = {
        #enable = true;
        #setupOpts = {
        #  fuzzy.implementation = "prefer_rust_with_warning";
        #};
        #};

        git = {
          enable = true;
          neogit.enable = true;
        };

        notify.nvim-notify = {
          enable = true;
          setupOpts = {
            stages = "static";
            timeout = 5000;
          };
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

        theme = {
          enable = true;
          name = "catppuccin";
          style = "mocha";
          transparent = true;
        };
      };
    };
  };
}
