{
    description = "Larry's own personal NixOS System.";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
        home-manager.url = "github:nix-community/home-manager";
        home-manager.inputs.nixpkgs.follows = "nixpkgs";
        nix-cachyos-kernel.url = "github:xddxdd/nix-cachyos-kernel/release";
    };

    outputs = inputs @ { self, nix-cachyos-kernel, nixpkgs, home-manager, ... }: {
        nixosConfigurations = {
            larry-victus = let 
                username = "larry";
                specialArgs = {inherit username;};
            in nixpkgs.lib.nixosSystem {
                inherit specialArgs;
                system = "x86_64-linux";

                modules = [
                    ./hosts/larry-victus
                    ./users/${username}

                    home-manager.nixosModules.home-manager 
                    {
                        home-manager = {
                            useGlobalPkgs = true;
                            useUserPackages = true;
                            users.${username} = import ./users/${username}/home.nix;
                            extraSpecialArgs = inputs // specialArgs;
                            backupFileExtension = "backup";
                        };
                    }

                    (
                        { pkgs, ... } : {
                            nixpkgs.overlays = [ nix-cachyos-kernel.overlays.pinned ];
                            boot.kernelPackages = pkgs.cachyosKernels.linuxPackages-cachyos-lts-lto;
                            nix.settings.substituters = [ "https://attic.xuyh0120.win/lantian" ];
                            nix.settings.trusted-public-keys = [ "lantian:EeAUQ+W+6r7EtwnmYjeVwx5kOGEBpjlBfPlzGlTNvHc=" ];
                        }
                    )
                ];
            };   
        };
    };
}