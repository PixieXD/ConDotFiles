{ pkgs, lib, username, ... }:


{
  hjem.users.${username}.xdg.config.files = {
    ".config/fastfetch/config.json" = {
      generator = lib.generators.toJSON {};
      value = {
        logo = {
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

        display = { seperator = " ~ "; };

        modules = [
          { type = "command"; key = " "; text = "~/.config/fastfetch/quotes.sh"; format = "{result}"; }
          "break"
          { type = "uptime"; key = " "; format = "Up for {formatted}."; }
          { type = "disk"; key = "Storage"; format = "{size-used} / {size-total} ({size-percentage})"; }
          { type = "memory"; key = "Memory"; format = "{used} / {total} ({percentage})"; }
          { type = "wm"; key = "Window Manager"; format = "{pretty-name}™ on {protocol-name}™ ({version})"; }
          { type = "colors"; key = "Colors"; symbol = "circle"; }
        ];
      };
    };

    ".config/fastfetch/quotes.sh".source = ./quotes.sh;
  };
}