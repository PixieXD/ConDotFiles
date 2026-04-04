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
      maxGenerations = 5;

      extraEntries = ''
          /Windows 11
            protocol: efi
            path: uuid(bfd3a7a4-d120-437b-899b-0549f3d725c0):/EFI/Microsoft/Boot/bootmgfw.efi
      '';
    };

    efi.canTouchEfiVariables = true;
  };

  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true; # see 160923 or 330916 on nixpkgs' issue tracker for more info
    extraPortals = with pkgs; [ 
      kdePackages.xdg-desktop-portal-kde
      xdg-desktop-portal-gtk
      ];
    config = {
      common.default = [ "gtk" ];
      gtk.default = [ "gtk" ];

      hyprland = {
        default = [ "hyprland" "gtk" ];
        "org.freedesktop.impl.portal.FileChooser" = [ "kde" ];
      };
    };
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