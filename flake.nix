{
  description = "Larry's own personal NixOS System";

  inputs = {
    parts.url = "github:hercules-ci/flake-parts";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    cachyos-kernel.url = "github:xddxdd/nix-cachyos-kernel/release";
    hyprland.url = "github:hyprwm/Hyprland";
    prismlauncher.url = "github:PrismLauncher/PrismLauncher/9.4";

    hjem = {
      url = "github:feel-co/hjem";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # For configuring hyprland in the future, stay tuned :3 || don't forget to put it on the modules
    #hjem-impure = {
    #  url = "github:Rexcrazy804/hjem-impure";
    #  inputs.nixpkgs.follows = "";
    #  inputs.hjem.follows = "";
    #};

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
