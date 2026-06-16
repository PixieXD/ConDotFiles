{
  pkgs,
  username,
  ...
}: {
  imports = [
    ./programs.nix
    ./options.nix
    ./hardware-configuration.nix
  ];

  users.users.${username} = {
    isNormalUser = true;
    extraGroups = ["wheel" "input"];
  };

  time.timeZone = "Asia/Kuala_Lumpur";
  i18n.defaultLocale = "en_US.UTF-8";

  hjem = {
    users.${username} = {
      directory = "/home/larry";
    };
    linker = pkgs.smfh;
  };

  services.libinput.enable = true;
  programs.java.enable = true;
  hardware = {
    enableRedistributableFirmware = true;
    cpu.intel.updateMicrocode = true;
  };

  zramSwap = {
    enable = true;
    memoryPercent = 50;
    memoryMax = 8589934592;
    algorithm = "zstd";
  };

  fileSystems = {
    "/".options = ["compress=zstd:3" "noatime"];
    "/home".options = ["compress=zstd:3" "noatime"];
    "/nix".options = ["compress=zstd:3" "noatime"];
  };

  system.stateVersion = "25.11"; # Did you read the comment? yes :)
}
