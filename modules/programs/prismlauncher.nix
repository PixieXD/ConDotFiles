{
  config,
  lib,
  pkgs,
  username,
  inputs,
  ...
}: let
  cf = config.cf.programs.prismLauncher;
  prismFlake = inputs.prismlauncher;
in {
  options.cf.programs.prismLauncher = {
    enable = lib.mkEnableOption "Prism Launcher (Minecraft)";
    cracked = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable to play minecraft with an offline account (THANKS WABAR <3)";
    };
  };

  config = lib.mkIf cf.enable {
    hjem.users.${username} = {
      packages = [prismFlake.packages.${pkgs.stdenv.hostPlatform.system}.prismlauncher];

      # https://codeberg.org/Fey/prismlauncher-bypass OR https://github.com/vaclavec/PrismLauncher-Offline-Bypass-Updated. Either one works.
      xdg.data.files = lib.mkIf cf.cracked {
        "PrismLauncher/accounts.json".text = ''
          {
              "accounts": [
                  {
                      "entitlement": {
                          "canPlayMinecraft": true,
                          "ownsMinecraft": true
                      },
                      "msa-client-id": "",
                      "type": "MSA"
                  },
                  {
                      "active": true,
                      "profile": {
                          "capes": [
                          ],
                          "id": "0c79d88a112537a0a302f01afa6bc94a",
                          "name": "Larry",
                          "skin": {
                              "id": "",
                              "url": "",
                              "variant": ""
                          }
                      },
                      "type": "Offline",
                      "ygg": {
                          "extra": {
                              "clientToken": "8be89b1112474b5fb8f061699ff41bda",
                              "userName": "Larry"
                          },
                          "iat": 1738858981,
                          "token": "0"
                      }
                  }
              ],
              "formatVersion": 3
          }
        '';
      };
    };
  };
}
