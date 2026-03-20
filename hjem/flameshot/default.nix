{ lib, username, ... }:

{
    hjem.users.${username}.files.".config/flameshot" = {
        generators = lib.generators.toINI {};
        General = {
            disabledTrayIcon = true;
            savePath = "/home/${username}/Images/Screenshots";
            startupLaunch = false;
            undoLimit = 100;
            contrastOpacity = 188;
            useGrimAdapter = true;            
        };
    };
}