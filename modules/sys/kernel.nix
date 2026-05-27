{
  config,
  lib,
  pkgs,
  ...
}: let
  cf = config.cf.sys.kernel;
  kernel =
    if cf.type == "lts"
    then pkgs.linuxPackages
    else if cf.type == "latest"
    then pkgs.linuxPackages_latest
    else if cf.type == "zen"
    then pkgs.linuxPackages_zen
    else if cf.type == "cachy"
    then pkgs.cachyosKernels.linuxPackages-cachyos-lts-lto
    else pkgs.linuxPackages;
in {
  options.cf.sys.kernel = {
    type = lib.mkOption {
      type = lib.types.str;
      default = "lts";
      description = "Kernel to use (lts/latest/zen/cachy). Defaults to lts when the type is unknown.";
    };
  };

  config = {
    boot.kernelPackages = kernel;
  };
}
