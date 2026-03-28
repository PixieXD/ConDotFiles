{ pkgs, lib, username, ... }:

{
  time.timeZone = "Asia/Kuala_Lumpur";
  i18n.defaultLocale = "en_US.UTF-8";
  networking.networkmanager.enable = true;
  nixpkgs.config.allowUnfree = true;

  nix.settings = {
    trusted-users = [ username ];
    experimental-features = [ "nix-command" "flakes" ];
    auto-optimise-store = true;
  };

  nix.gc = {
    automatic = true;
    dates = "14day";
  };

  boot.loader = {
    limine = {
      enable = true;
      enableEditor = true;
      maxGenerations = 5;
      efiSupport = true;
    };

    efi.canTouchEfiVariables = true;
  };

  fonts = {
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-color-emoji

      nerd-fonts.jetbrains-mono
    ];

    fontconfig.defaultFonts = {
      serif = [ "Noto Serif" "Noto Color Emoji" ];
      sansSerif = [ "Noto Sans" "Noto Color Emoji" ];
      monospace = [ "JetBrainsMono Nerd Font" "Noto Color Emoji" ];
      emoji = [ "Noto Color Emoji" ];
    };

    fontconfig.enable = true;
    enableDefaultPackages = false;
  };

}