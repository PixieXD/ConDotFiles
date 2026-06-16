{
  pkgs,
  username,
  ...
}: {
  hjem.users.${username} = {
    packages = with pkgs; [
      # applications
      floorp-bin
      equibop
      telegram-desktop
      krita
      libreoffice-fresh
      obsidian
      localsend

      # system things
      swayosd
      egl-wayland
      hyprpolkitagent
      nwg-look
      kdePackages.qt6ct
      catppuccin-qt5ct
      catppuccin-gtk
      quickshell

      # commands
      wget
      ffmpeg
      btop
      inotify-tools
      hyprcursor
      killall
      xbindkeys
      unzip
      win2xcur
      xcur2png
      imagemagick
      xcursorgen
    ];
  };
}
