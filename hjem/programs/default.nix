# to be fair i have no idea how to seperate this, so i'll hold this idea off for now ;)

{ pkgs, config, username, ... }: 
{
    hjem.users.${username} = {
        packages = with pkgs; [
            alacritty
            floorp
            vesktop
            copyq
            udiskie
            vscodium
            nemo
            bluej
            telegram-desktop
            catppuccin-gtk
            kdePackages.qt6ct
            nwg-look
            grim
            overskride
            networkmanager_dmenu
            unzip
            win2xcur
            xcur2png
            krita
            imagemagick

            autojump
        ]
    };

    programs.zsh = {
        syntaxHighlighting.enable = true;
        autosuggestions.enable = true;
        enableCompletion = true;

        ohMyZsh = {
            enable = true;
            theme = "robbyrussell";
            plugins = [ "git" "urltools" "autojump" ];
        };

        shellAliases = {
            rebuild = "sudo nixos-rebuild switch --flake /home/larry/Important/ConDotFiles/#larry-victus --show-trace";
            waybar-test = "~/Important/ConDotFiles/tools/waybar-reload.sh";
        };
    };
}