{
  programs.nvf = {
    settings = {
      vim = {
        viAlias = true;
        vimAlias = true;

        theme.enable = true;
        theme.name = "catppuccin";
        theme.style = "darker";

        lsp.enable = true;

        languages.nix.enable = true;
        languages.nix.extraDiagnostics.enable = true;
        languages.nix.format.enable = true;
        languages.nix.lsp.enable = true;
        languages.nix.treesitter.enable = true;


        lazy.enable = true;
      };

    };
  };
}