# ConDotFiles by Larry~

This seems to be a WIP, but if you somehow saw this git repository, welcome~!

Dependencies used :
- Hyprland
- Waybar
- Zsh/Oh-My-Zsh
- Rofi
- SwayNC
- ly
- Kitty
- Copyq
- Superfile
- Waypaper

Thats about it.. what do you expect on this ReadMe file?

alias ua-drop-caches='sudo paccache -rk3; yay -Sc --aur --noconfirm'
alias systemupdate='export TMPFILE="$(mktemp)"; \
    sudo true; \
    rate-mirrors --save=$TMPFILE arch --max-delay=21600 \
      && sudo mv /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist-backup \
      && sudo mv $TMPFILE /etc/pacman.d/mirrorlist \
      && ua-drop-caches \
      && yay -Syyu --noconfirm \'