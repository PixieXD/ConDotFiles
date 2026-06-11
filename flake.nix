{
  description = "Larry's own personal NixOS System";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    cachyos-kernel.url = "github:xddxdd/nix-cachyos-kernel/release";
    hyprland.url = "github:hyprwm/Hyprland";
    prismlauncher.url = "github:PrismLauncher/PrismLauncher/9.4";

    hjem = {
      url = "github:feel-co/hjem";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stash = {
      url = "github:notashelf/stash";
    };
  };

  outputs = inputs: {
    # HAWWO, idk what to do with this, but ill check some other configs out and figure how to do things!!!

    nixosConfigurations = {
      larry-victus = let
        username = "larry";
        hostname = "larry-victus";
        specialArgs = {inherit username hostname inputs;};
      in
        inputs.nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          inherit specialArgs;
          modules = [
            inputs.hjem.nixosModules.default
            ./hosts/larry-victus
            ./modules

            (
              {pkgs, ...}: {
                nixpkgs.overlays = [inputs.cachyos-kernel.overlays.pinned];
              }
            )
          ];
        };
    };
  };
}
