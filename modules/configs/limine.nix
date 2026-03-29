{config, ... }:

{
  boot.loader = {
    limine = {
      extraEntries = ''
          /Windows 11
            protocol: efi
            path: uuid(bfd3a7a4-d120-437b-899b-0549f3d725c0):/EFI/Microsoft/Boot/bootmgfw.efi
      '';

      style = {
        wallpapers = [];
        interface.branding = "Limini!!!!!";
        graphicalTerminal = {
          palette = "1e1e2e;f38ba8;a6e3a1;f9e2af;89b4fa;f5c2e7;94e2d5;cdd6f4";
          brightPalette = "585b70;f38ba8;a6e3a1;f9e2af;89b4fa;f5c2e7;94e2d5;cdd6f4";
          background = "1e1e2e";
          foreground = "cdd6f4";
          brightBackground = "585b70";
          brightForeground = "cdd6f4";
        };
      };
    };
  };
}