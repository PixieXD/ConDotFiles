{ lib, username, ... }:

{
    hjem.users.${username}.xdg.config.files."flameshot/flameshot.ini" = {
        generator = lib.generators.toINI {};
        value = {
            General = {
                disabledTrayIcon = true;
                startupLaunch = false;
                savePath = "/home/${username}/Images/Screenshots";
                undoLimit = 100;
                contrastOpacity = 188;
                useGrimAdapter = true;            
            };
        };
    };
}