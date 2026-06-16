# No mkEnableOption here please.
{pkgs, ...}: {
  config = {
    nix = {
      enable = true; # its funny.
      # package = pkgs.lixPackageSets.latest.lix;
      channel.enable = false;

      settings = {
        # reference : https://nix.dev/manual/nix/2.28/command-ref/conf-file.html
        accept-flake-config = true;
        auto-optimise-store = true;
        allowed-users = ["@wheel"];
        trusted-users = ["@wheel"];
        experimental-features = ["nix-command" "flakes"];
        # substituters = ["https://attic.xuyh0120.win/lantian"];
        # trusted-public-keys = ["lantian:EeAUQ+W+6r7EtwnmYjeVwx5kOGEBpjlBfPlzGlTNvHc="];
        # substituters? check back later~
      };
    };

    nixpkgs = {
      config.allowUnfree = true;
    };
  };
}
