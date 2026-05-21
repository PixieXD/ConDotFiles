{
  config,
  lib,
  ...
}: let
  cf = config.cf.sys.limine;
in {
  options.cf.sys.limine = {
    enable = lib.mkEnableOption "limine";
    entries = lib.mkOption {
      type = lib.types.str;
      default = "";
      description = "Add any entries for the bootloader";
    };
    generations = lib.mkOption {
      type = lib.types.int;
      default = 10;
      description = "Max generations to be added on the bootloader";
    };
  };

  config = lib.mkIf cf.enable {
    boot.loader = {
      efi.canTouchEfiVariables = true;

      limine = {
        enable = true;
        maxGenerations = cf.generations;
        enableEditor = true;
        efiSupport = true;
        extraEntries = cf.entries;

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
  };
}
