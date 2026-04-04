{ lib, username, ... }:

{
  hjem.users.${username}.xdg.config.files = {
    "wleave/layout.json" = {
      generator = lib.generators.toJSON {};
      value = {
        no-version-info = true;
        buttons-per-row = "1/1";
        show-keybinds = true;
        margin-top = 360;
        margin-bottom = 360;
        buttons = [
          {
            label = "shutdown";
            action = "systemctl poweroff";
            text = "Shutdown";
            keybind = "q";
            icon = ./icons/shutdown.png;
          }

          {
            label = "restart";
            action = "systemctl reboot";
            text = "Restart";
            keybind = "w";
            icon = ./icons/restart.png;
          }

          {
            label = "logout";
            action = "hyprctl dispatch exit";
            text = "Logout";
            keybind = "e";
            icon = ./icons/logout.png;
          }
        ];
      };
    };

    "wleave/style.css".text = ''
      /**
       * See https://gnome.pages.gitlab.gnome.org/libadwaita/doc/main/css-variables.html for more CSS variables.
       * Or use your own colors. Both work, but using your own colors may break the automatic light/dark theme function.
       */


      window {
          background-color: rgba(12, 12, 12, 0.8);
      }

      button {
          color: #DDAACC;
          background-color: var(--view-bg-color);
          border: none;
          padding: 10px;
      }

      button label.action-name {
          font-size: 24px;
          font-weight: 400;
      }

      button label.keybind {
          font-size: 20px;
          font-family: monospace;
      }

      button:hover label.keybind, button:focus label.keybind {
          opacity: 1;
      }

      button:focus,
      button:hover {
          background-color: color-mix(in srgb, var(--accent-bg-color), var(--view-bg-color));
      }

      button:active {
          color: var(--accent-fg-color);
          background-color: var(--accent-bg-color);
      }

      button#shutdown {
          --view-fg-color: #ff8d8d;
      }

      button#reboot {
          --view-fg-color: #84ffaa;
      }

      button#logout {
          --view-fg-color: #ffcca8;
      }
    '';
  };
}