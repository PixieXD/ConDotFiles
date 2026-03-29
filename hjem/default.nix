{ config, username, ... }:

{
    hjem.users.${username} = {
        directory = config.users.users.${username}.home;
    };
}