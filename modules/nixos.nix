# No mkEnableOption here please.
{
  inputs,
  lib,
  builtins,
  ...
}: {
  config = {
    nix = {
      enable = true; # its funny.
      channel.enable = false;

      # taken from fazzi's nix.nix
      # https://gitlab.com/fazzi/nixohess/-/blob/main/modules/core/nix.nix
      # registry = builtins.mapAttrs (_: flake: {inherit flake;}) inputs;
      # nixPath = lib.mapAttrsToList (n: _: "${n}=flake:${n}") inputs;

      settings = {
        # reference : https://nix.dev/manual/nix/2.28/command-ref/conf-file.html
        accept-flake-config = true;
        auto-optimise-store = true;
        allowed-users = ["@wheel"];
        trusted-users = ["@wheel"];
        experimental-features = ["nix-command" "flakes"];
        # nix-path = lib.mapAttrsToList (n: _: "${n}=flake:${n}") inputs;
        # flake-registry = "";

        # substituters? check back later~
      };
    };

    nixpkgs = {
      config.allowUnfree = true;
    };
  };
}
