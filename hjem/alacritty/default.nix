{ username, ... }:

{
    hjem.users.${username}.files.".config/alacritty" = ./config;
}