{
  pkgs,
  lib,
  config,
  username,
  ...
}: let
  pathImg = ./images/mafuyu.png;
  imgOut = pkgs.runCommand "icon" {} ''
    ${lib.getExe' pkgs.libsixel "img2sixel"} -w 200 -h 200 ${pathImg} > $out
  '';

  cf = config.cf.programs.fastfetch;
in {
  options.cf.programs.fastfetch = {
    enable = lib.mkEnableOption "fastfetch";
    mafuyu = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Have Mafuyu as a logo instead.";
    };
  };

  config = lib.mkIf cf.enable {
    hjem.users.${username} = {
      packages = [pkgs.fastfetchMinimal];

      xdg.config.files = {
        "fastfetch/config.jsonc" = {
          generator = lib.generators.toJSON {};
          value = {
            logo =
              if cf.mafuyu
              then {
                type = "raw";
                source = imgOut;
                padding = {
                  left = 0;
                  right = 10;
                };
                width = 10;
                height = 10;
              }
              else {
                type = "small";
                source = "nixos";
                padding = {
                  left = 2;
                  right = 4;
                  top = 0;
                };
                color = {
                  "1" = "blue";
                  "2" = "light_blue";
                };
              };

            modules = [
              "break"
              {
                type = "command";
                key = " ";
                text = "~/.config/fastfetch/quotes.sh";
                format = "{result}";
              }
              "break"
              {
                type = "uptime";
                key = " ";
                format = "Up for {formatted}.";
              }
              {
                type = "disk";
                key = "Storage";
                format = "{size-used} / {size-total} ({size-percentage}) - Since {days} days.";
              }
              {
                type = "memory";
                key = "Memory";
                format = "{used} / {total} ({percentage})";
              }
              {
                type = "wm";
                key = "Window Manager";
                format = "{pretty-name}™ on {protocol-name}™ ({version})";
              }
              {
                type = "colors";
                key = "Colors";
                symbol = "circle";
              }
            ];
          };
        };

        "fastfetch/quotes.sh".source = ./quotes.sh;
      };
    };
  };
}
