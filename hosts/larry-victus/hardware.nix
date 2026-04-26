{config, ...}: {
  hardware = {
    graphics.enable = true;
    nvidia = {
      open = true;
      modesetting.enable = true;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
      nvidiaSettings = true;
      prime = {
        sync.enable = true;
        intelBusId = "PCI:0:2:0";
        nvidiaBusId = "PCI:1:0:0";
      };
    };

    enableRedistributableFirmware = true;
    cpu.intel.updateMicrocode = true;
    bluetooth.enable = true;
  };

  fileSystems = {
    "/".options = ["compress=zstd:3" "noatime"];
    "/home".options = ["compress=zstd:3" "noatime"];
    "/nix".options = ["compress=zstd:3" "noatime"];
  };

  zramSwap = {
    enable = true;
    memoryPercent = 50;
    memoryMax = 8589934592;
    algorithm = "zstd";
  };

  services.xserver.videoDrivers = ["nvidia"];
}
