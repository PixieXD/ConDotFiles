{ lib, username, ... }:

{
  hjem.users.${username}.xdg.config.files = {
    ".config/waybar/config.json" = {
      generator = lib.generators.toJSON {};
      value = {
        position = "top";
        modules-left = [
          "custom/wlogout"
          "custom/rofi"
          "hyprland/workspace"
        ];
        modules-center = [
          "custom/flameshot"
          "clock"
          "custom/copyq"
        ];
        modules-right = [
          "battery"
          "network"
          "wireplumber"
          "custom/swaync"
        ];

        reload_style_on_change = true;

        battery = {
          interval = 20;

          states = {
            reminder = 50;
            warning = 30;
            critical = 15;
          };

          format = "{capacity}% {icon}";
          format-time = "{H}h {M}min";
          format-icons = ["" "" "" "" ""];

          tooltip-format = "{time} left. Hmm, seems okay, for now.";
          tooltip-format-reminder = "{time} left. Halfway, remember to charge after this session~";
          tooltip-format-warning = "{time} left. Yeah uhh... Charge, please?";
          tooltip-format-critical = "{time} left. You're pissing me off rn charge please...";
        };

        clock = {
          format = "{:%H:%M, %e %B %Y %A}";
          format-alt = "{:%H:%M}";
          tooltip-format = "<tt><small>{calendar}</small></tt>";
          timezone = "Asia/Kuala_Lumpur";
        };

        network = {
          interface = "wlp3s0";
          format-wifi = "{essid}  ({signalStrength}%)";
          tooltip-format-wifi = "\"Yay, wifi!!\"";
          format-disconnected = "No network, huh?";
          tooltip-format-disconnected = "At least it's better than slow wifi...";
        };

        wireplumber = {
          format = "{volume}%   {icon}";
          format-muted = "mooted";
          format-icons = ["" "" ""];
        };

        "custom/rofi" = {
          on-click = "rofi -show drun";
          format = "";
        };

        "custom/flameshot" = {
          on-click = "flameshot gui --path ~/Images/Screenshots";
          format = "";
        };

        "custom/copyq" = {
          on-click = "copyq toggle";
          format = "";
        };

        "custom/swaync" = {
          tooltip = false;
          format = "";
          return-type = "json";
          exec-if = "which swaync-client";
          exec = "swaync-client -swb";
          on-click = "swaync-client -t -sw";
          on-click-right = "swaync-client -d -sw";
          escape = true;
        };

        "custom/wlogout" = {
          on-click = "wlogout";
          format = "";
        };
      };
    };

    ".config/waybar/style.css".text =
      ''
        * {
          font-family: FontAwesome;
          font-size: 13px;
          color: white;
        }

        /* Variables */
        @define-color bgcolor rgba(0, 0, 0, 0.75);
        @define-color customviolet rgb (95, 50, 163);

        window#waybar {
          background-color: rgba(148, 0, 211, 0);
        }

        #clock{
          background-color: @bgcolor;
          padding: 0px 15px 0px 15px;
          border-bottom: 4px solid @customviolet;
        }

        #custom-copyq {
          background-color: @bgcolor;
          padding: 0px 15px 0px 15px;
          border-bottom: 4px solid @customviolet;
          border-bottom-right-radius: 5px;
        }

        #custom-flameshot {
          background-color: @bgcolor;
          padding: 0px 15px 0px 15px;
          border-bottom: 4px solid @customviolet;
          border-bottom-left-radius: 5px;
        }

        #battery{
          background-color: @bgcolor;
          padding: 0px 15px 0px 15px;
          margin-left: 5px;
          border-bottom: 4px solid @customviolet;
          border-bottom-left-radius: 5px;
        }

        #network{
          background-color: @bgcolor;
          padding: 0px 15px 0px 15px;
          border-bottom: 4px solid @customviolet;
        }

        #custom-wlogout {
          background-color: @bgcolor;
          padding: 0px 15px 0px 15px;
          border-bottom: 4px solid @customviolet;
        }

        #custom-rofi {
          background-color: @bgcolor;
          padding: 0px 15px 0px 15px;
          border-bottom: 4px solid @customviolet;
        }

        #wireplumber  {
          background-color: @bgcolor; 
          padding: 0px 10px 0px 10px;
          border-bottom: 4px solid @customviolet;
        }

        #custom-swaync {
          background-color: @bgcolor; 
          padding: 0px 10px 0px 10px;
          border-bottom: 4px solid @customviolet;
        }

        #workspaces {
          background-color: @bgcolor;
          border-bottom: 4px solid @customviolet;
          border-bottom-right-radius: 5px;
        }

        #workspaces button{
          color: rgb(128, 128, 128);
        }

        #workspaces button.active {
          background-color: rgb(58, 31, 100);
          border-radius: 0px;
        }

        #workspaces button:hover {
          box-shadow: none;
          background: @customviolet;
          border-color: rgb(112, 87, 226);
          transition-duration: 0.3s;
          border-radius: 0px;
        }
      '';
  };
}