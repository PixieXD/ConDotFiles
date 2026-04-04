# currently I only had one host and that is my laptop, this might change later if I somehow had 2 machines

{ self, inputs, ... }:

{
  flake.nixosConfigurations = {
    larry-victus = let 
      username = "larry";
      hostname = "larry-victus";
      specialArgs = {inherit username hostname;};
    in inputs.nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      inherit specialArgs;
      modules = [ 
        inputs.hjem.nixosModules.default
        ./${hostname}

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
}