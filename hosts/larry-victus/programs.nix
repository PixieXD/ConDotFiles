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
      thunar
      telegram-desktop
      krita
      libreoffice-fresh
      obsidian

      # system things
      swayosd
      swaynotificationcenter
      egl-wayland
      hyprpolkitagent
      nwg-look
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
