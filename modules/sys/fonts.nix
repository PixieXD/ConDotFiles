{
  config,
  lib,
  pkgs,
  ...
}: let
  cf = config.cf.sys.fonts;
in {
  options.cf.sys.fonts = {
    enable = lib.mkEnableOption "fonts";
  };

  config = lib.mkIf cf.enable {
    fonts = {
      packages = with pkgs; [
        noto-fonts
        noto-fonts-cjk-sans
        nerd-fonts.jetbrains-mono
      ];

      fontconfig.defaultFonts = {
        serif = ["Noto Serif" "Noto Color Emoji"];
        sansSerif = ["Noto Sans" "Noto Color Emoji"];
        monospace = ["JetBrainsMono Nerd Font" "Noto Color Emoji"];
        emoji = ["Noto Color Emoji"];
      };

      # enableDefaultPackages = true; test option. check back later :p
      fontconfig.enable = true;
    };
  };
}
