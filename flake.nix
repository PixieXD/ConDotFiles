{
    description = "Larry's own personal NixOS System.";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
        home-manager.url = "github:nix-community/home-manager";
        home-manager.inputs.nixpkgs.follows = "nixpkgs";
        nix-cachyos-kernel.url = "github:xddxdd/nix-cachyos-kernel/release";
    };

    outputs = { self, nix-cachyos-kernel, nixpkgs, home-manager, ... } @ inputs: {
        nixosConfigurations = {
            larry-victus = let 
                username = "larry";
            in nixpkgs.lib.nixosSystem {
                system = "x86_64-linux";
                modules = [
                    ./hosts/larry-victus
                    ./users/${username}/home.nix

                    home-manager.nixosModules.home-manager {
                        home-manager = {
                            useGlobalPkgs = true;
                            useUserPackages = true;
                            users.${username} = import ./users/${username}/home.nix;
                            backupFileExtension = "backup";
                        };
                    }

                    (
                        { pkgs, ... } : {
                            nixpkgs.overlays = [ nix-cachyos-kernel.overlays.pinned ];
                            boot.kernelPackages = pkgs.cachyosKernels.linuxPackages-cachyos-lts-lto;
                        }
                    )
                ];
            };   
        };
    };
}