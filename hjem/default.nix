{ config, username, ... }:

{
    hjem.users.${username} = {
        directory = /. + "/home/${username}";
    };
}