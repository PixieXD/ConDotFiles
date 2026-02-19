# to be fair i have no idea how to seperate this, so i'll hold this idea off for now ;)

{ pkgs, config, lib, username, ... }: 

{
    programs = {
        floorp.enable = true;
        alacritty.enable = true;
        vesktop.enable = true;

        zsh = {
            enable = true;
            syntaxHighlighting.enable = true;
            autosuggestion.enable = true;
            enableCompletion = true;
            oh-my-zsh = {
                enable = true;
                theme = "robbyrussell";
                plugins = [ "git" "urltools" "autojump" "bgnotify" ];
            };

            shellAliases = {
                rebuild = "sudo nixos-rebuild switch --flake /home/larry/Important/ConDotFiles/#larry-victus --show-trace";
            };
        };

    };

    services = {
        copyq.enable = true;
        udiskie.enable = true;

        flameshot = {
            enable = true;
            settings = {
                General = {
                    disabledTrayIcon = true;
                    savePath = "/home/${username}/Images/Screenshots";
                    startupLaunch = false;
                    undoLimit = 100;
                    contrastOpacity = 188;
                    useGrimAdapter = true;
                };
            };
        };
    };

    home.packages = with pkgs; [
        vscodium
        nemo
        bluej
        telegram-desktop
        catppuccin-gtk
        kdePackages.qt6ct
        nwg-look
        grim

        autojump
    ];

}