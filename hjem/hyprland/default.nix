{ username, ... }:

{
    hjem.users.${username}.files.".config/hypr" = ./config;
}