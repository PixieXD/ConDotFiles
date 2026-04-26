{
  pkgs,
  config,
  username,
  ...
}: {
  hjem.users.${username} = {
    packages = with pkgs; [
      # applications
      alacritty-graphics
      floorp-bin
      flameshot
      vesktop
      vscodium
      nemo
      telegram-desktop
      overskride
      networkmanager_dmenu
      krita
      libreoffice-fresh
      obsidian

      # system things
      waybar
      rofi
      copyq
      wleave
      swayosd
      swaynotificationcenter
      hyprcursor
      waypaper
      hyprland-qt-support
      egl-wayland
      hyprpolkitagent
      awww
      grim
      udiskie
      catppuccin-gtk
      kdePackages.qt6ct
      nwg-look
      quickshell

      # commands
      wget
      # ffmpeg
      fastfetchMinimal
      btop
      inotify-tools
      killall
      xbindkeys
      # unzip
      # win2xcur
      # xcur2png
      # imagemagick
      # xcursorgen
    ];
  };

  programs = {
    hyprland = {
      enable = true;
      withUWSM = false;
      xwayland.enable = true;
    };

    git = {
      enable = true;
      config = {
        user = {
          name = "Pixie";
          email = "tikt9440@tutamail.com";
        };

        init = {
          defaultBranch = "main";
        };

        url = {
          "https://github.com/" = {
            insteadOf = ["gh:" "github:"];
          };
        };
      };
    };

    nh = {
      enable = true;
      clean.enable = true;
      clean.extraArgs = "--keep-since 4d --keep 3";
      flake = "/home/${username}/Important/ConDotFiles";
    };

    zsh.enable = true;
    steam.enable = true;
    nvf.enable = true;
    java.enable = true;
  };
}
