{
  cf = {
    programs = {
      fastfetch = {
        enable = true;
        mafuyu = true;
      };

      nh = {
        enable = true;
        flake = "/home/larry/Important/ConDotFiles";
      };

      flameshot = {
        enable = true;
        saveDir = "/home/larry/Pictures/Screenshots";
      };

      zsh = {
        enable = true;
        ohmyzsh = true;
      };

      foot = {
        enable = true;
        theme = "dark";
      };

      hyprland = {
        enable = true;
        hyprgit = true;
      };

      steam = {
        enable = true;
        enableProton = true;
        enableGamemode = true;
      };

      git = {
        enable = true;
        name = "PixieXD";
        email = "tikt9440@tutamail.com";
      };

      prismLauncher = {
        enable = true;
        cracked = true;
      };

      fuzzel.enable = true;
      waybar.enable = true;
      xdg.enable = true;
      nvf.enable = true;
      waypaper.enable = true;
      wleave.enable = true;
      thunar.enable = true;
    };

    # Services
    services = {
      openssh.enable = true;
      pipewire.enable = true;
      stash.enable = true;
      usb.enable = true;
      fnott.enable = true;
    };

    # System / Core
    sys = {
      limine = {
        enable = true;
        generations = 5;
        entries = ''
          /Windows 11
            protocol: efi
            path: uuid(bfd3a7a4-d120-437b-899b-0549f3d725c0):/EFI/Microsoft/Boot/bootmgfw.efi
        '';
      };

      nvidia = {
        enable = true;
        prime = true;
        cpuPrime = "PCI:0@0:2:0";
        gpuPrime = "PCI:1@0:0:0";
      };

      kernel.type = "latest";
      bluetooth.enable = false;
      network.enable = true;
      fonts.enable = true;
      ly.enable = true;
    };
  };
}
