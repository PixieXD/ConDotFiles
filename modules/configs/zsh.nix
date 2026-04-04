{ pkgs, config, ... }:

{
  programs.zsh = {
    syntaxHighlighting.enable = true;
    autosuggestions.enable = true;
    enableCompletion = true;

    ohMyZsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [ "git" ];
    };

    shellAliases = {
      rebuild = "sudo nixos-rebuild switch --flake /home/larry/Important/ConDotFiles/#larry-victus";
      rebuild-trace = "sudo nixos-rebuild switch --flake /home/larry/Important/ConDotFiles/#larry-victus --show-trace";
    };
  };
}