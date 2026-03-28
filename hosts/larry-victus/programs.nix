{ pkgs, config, username, ... }:

{
  hjem.users.${username} = {
    packages = with pkgs; [
      # applications
      alacritty
      ghostty # temp terminal?
      floorp-bin
      flameshot
      vesktop
      vscodium
      nemo
      bluej
      telegram-desktop
      overskride
      networkmanager_dmenu
      krita
      libreoffice-fresh

      # system things
      waybar
      rofi
      copyq
      wlogout
      swayosd
      swaynotificationcenter
      hyprcursor
      waypaper
      hyprland-qt-support
      egl-wayland
      hyprpolkitagent
      swww
      grim
      udiskie
      catppuccin-gtk
      kdePackages.qt6ct
      nwg-look

      # commands
      neovim
      git
      wget
      fastfetchMinimal
      btop
      inotify-tools
      killall
      xbindkeys
      unzip
      win2xcur
      xcur2png
      imagemagick
    ];
  };

  programs = {
    hyprland = {
      enable = true;
      withUWSM = false;
      xwayland.enable = true;
    };
    zsh.enable = true;
    steam.enable = true;
  };
}