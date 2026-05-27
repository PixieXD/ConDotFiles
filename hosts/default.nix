# currently I only had one host and that is my laptop, this might change later if I somehow had 2 machines
{inputs, ...}: {
  flake.nixosConfigurations = {
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
          ./${hostname}

          (
            {pkgs, ...}: {
              nixpkgs.overlays = [inputs.cachyos-kernel.overlays.pinned];
            }
          )
        ];
      };
  };
}
