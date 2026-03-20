{
    description = "Larry's own personal NixOS System.";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
        cachyos-kernel.url = "github:xddxdd/nix-cachyos-kernel/release";
        hjem = {
            url = "github:feel-co/hjem";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = inputs @ { self, nixpkgs, ... }: {
        nixosConfigurations = {
            larry-victus = let 
                username = "larry";
                specialArgs = {inherit username;};
            in nixpkgs.lib.nixosSystem {
                inherit specialArgs;
                system = "x86_64-linux";

                modules = [
                    inputs.hjem.nixosModules.default
                    ./hosts/larry-victus
                    ./users/${username}

                    hjem.users.${username} = {
                        directory = /home/${username};
                    };

                    (
                        { pkgs, ... } : {
                            nixpkgs.overlays = [ inputs.cachyos-kernel.overlays.pinned ];
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