{ username, ... }:

{
    hjem.users.${username}.files.".config/fastfetch" = ./config;
}