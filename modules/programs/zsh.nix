{
  lib,
  config,
  ...
}: let
  cf = config.cf.programs.zsh;
in {
  options.cf.programs.zsh = {
    enable = lib.mkEnableOption "zsh";
    ohmyzsh = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Enables Oh My Zsh";
    };
  };

  config = lib.mkIf cf.enable {
    programs.zsh = {
      enable = true;
      syntaxHighlighting.enable = true;
      autosuggestions.enable = true;
      enableCompletion = true;

      ohMyZsh = lib.mkIf cf.ohmyzsh {
        enable = true;
        theme = "robbyrussell";
        plugins = ["git"];
      };
    };
  };
}
