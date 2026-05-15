{
  description = "Larry's own personal NixOS System";

  inputs = {
    parts.url = "github:hercules-ci/flake-parts";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    cachyos-kernel.url = "github:xddxdd/nix-cachyos-kernel/release";
    hyprland.url = "github:hyprwm/Hyprland";

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

  outputs = inputs @ {parts, ...}:
    parts.lib.mkFlake {inherit inputs;} {
      imports = [./hosts];
      systems = ["x86_64-linux"];
    };
}
