{
  description = "Larry's own personal NixOS System";

  inputs = {
    parts.url = "github:hercules-ci/flake-parts";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nvf.url = "github:notashelf/nvf";
    cachyos-kernel.url = "github:xddxdd/nix-cachyos-kernel/release";

    hjem = {
      url = "github:feel-co/hjem";
      inputs.nixpkgs.follows = "nixpkgs";
    };


  };

  outputs = inputs@{ parts, ... }:
    parts.lib.mkFlake { inherit inputs; } {
      imports = [ ./hosts ];
    };
}
