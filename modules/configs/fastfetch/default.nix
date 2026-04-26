{
  pkgs,
  lib,
  username,
  ...
}: let
  pathImg = ./images/mafuyu.png;
  imgOut = pkgs.runCommand "iconConvert" {} ''
    ${lib.getExe' pkgs.libsixel "img2sixel"} -w 200 -h 200 ${pathImg} > $out
  '';
in {
  hjem.users.${username}.xdg.config.files = {
    "fastfetch/config.jsonc" = {
      generator = lib.generators.toJSON {};
      value = {
        logo = {
          type = "raw";
          source = imgOut;
          padding = {
            left = 0;
            right = 10;
          };
          width = 10;
          height = 10;
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
}
