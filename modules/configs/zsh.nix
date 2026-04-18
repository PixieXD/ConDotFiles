{
  pkgs,
  config,
  ...
}: {
  programs.zsh = {
    syntaxHighlighting.enable = true;
    autosuggestions.enable = true;
    enableCompletion = true;

    ohMyZsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = ["git"];
    };
  };
}

