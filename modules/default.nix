{lib, ...}: let
  dirs = [./sys ./services ./programs];
  files =
    lib.filter
    (file: lib.hasSuffix ".nix" (toString file))
    (lib.flatten (map lib.filesystem.listFilesRecursive dirs));
in {
  imports = [./nixos.nix] ++ files;
}
