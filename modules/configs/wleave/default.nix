{ lib, username, ... }:

{
  hjem.users.${username}.xdg.config.files = {
    "wleave/layout.json" = {
      generator = lib.generators.toJSON {};
      value = {
        buttons = [
          {
            label = "shutdown";
            action = "systemctl poweroff";
            text = "Shutdown";
            icon = "./icons/shutdown.png";
          }

          {
            label = "restart";
            action = "systemctl reboot";
            text = "Restart";
            icon = "./icons/restart.png";
          }

          {
            label = "logout";
            action = "hyprctl dispatch exit";
            text = "Logout";
            icon = "./icons/logout.png";
          }

        ];
      };
    };

    "wleave/style.css".text =
      ''
        @import url("./colors_wleave.css");

        window {
        	font-family: monospace;
        	font-size: 20pt;
        	color: #c0caf5;
        	background-color: @background;
        }

        button {
        	border-radius: 10px;
        	background-repeat: no-repeat;
        	background-position: center;
        	background-size: 50%;
        	border: none;
        	background-color: transparent;
        	margin: 5px;
        	transition:
        		box-shadow 0.1s ease-in-out,
        		background-color 0.1s ease-in-out;
        }

        button:hover {
        	background-color: @color0;
        }

        button:focus {
        	background-color: @color1;
        	color: @foreground;
        }
      '';
  };
}