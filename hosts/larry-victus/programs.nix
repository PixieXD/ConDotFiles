{
  pkgs,
  inputs,
  username,
  ...
}: {
  hjem.users.${username} = {
    packages = with pkgs; [
      # applications
      foot
      floorp-bin
      flameshot
      equibop
      thunar
      telegram-desktop
      # overskride - i rarely use bluetooth anymore
      krita
      libreoffice-fresh
      obsidian

      # system things
      waybar
      fuzzel
      wleave
      swayosd
      swaynotificationcenter
      waypaper
      egl-wayland
      hyprpolkitagent
      awww
      grim
      udiskie
      catppuccin-gtk
      kdePackages.qt6ct
      nwg-look
      quickshell
      inputs.stash.packages.${pkgs.stdenv.hostPlatform.system}.stash

      # commands
      wget
      ffmpeg
      fastfetchMinimal
      btop
      inotify-tools
      killall
      xbindkeys
      unzip
      win2xcur
      xcur2png
      imagemagick
      xcursorgen
    ];
  };

  systemd.packages = [inputs.stash.packages.${pkgs.stdenv.hostPlatform.system}.stash];

  programs = {
    hyprland = {
      enable = true;
      package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
      portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
      withUWSM = false;
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
    gamescope = {
      enable = true;
      package = pkgs.gamescope.overrideAttrs {NIX_CFLAGS_COMPILE = ["-fno-fast-math"];};
    };
  };
}
