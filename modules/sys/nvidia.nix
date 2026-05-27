# reference to the archlinux wiki https://wiki.archlinux.org/title/NVIDIA/Tips_and_tricks#Kernel_module_parameters
# also i dont have an amd card sooo, amd.nix not needed :p
# todo : do smth abt nvidia prime (i think?)
# todo : kms early loading... do it
{
  config,
  lib,
  ...
}: let
  cf = config.cf.sys.nvidia;
in {
  options.cf.sys.nvidia = {
    enable = lib.mkEnableOption "nvidia";
    prime = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable nvidia PRIME sync.";
    };
    cpuPrime = lib.mkOption {
      type = lib.types.str;
      default = "";
      description = "Prime intel's bus ID.";
    };
    gpuPrime = lib.mkOption {
      type = lib.types.str;
      default = "";
      description = "Prime nvidia's bus ID.";
    };
  };

  config = lib.mkIf cf.enable {
    services.xserver.videoDrivers = ["nvidia"];

    boot.initrd.kernelModules = [
      "i915"
      "nvidia"
      "nvidia_modeset"
      "nvidia_uvm"
      "nvidia_drm"
    ];

    hardware = {
      graphics = {
        enable = true;
        enable32Bit = true;
      };

      nvidia = {
        open = true; # i had no plans to use closed ones anyway
        gsp.enable = true;
        modesetting.enable = true;
        powerManagement.enable = true;
        branch = "latest";
        nvidiaSettings = false;

        # package = config.boot.kernelPackages.nvidiaPackages.stable;

        prime = lib.mkIf cf.prime {
          sync.enable = true;
          intelBusId = cf.cpuPrime;
          nvidiaBusId = cf.gpuPrime;
        };

        moduleParams = {
          nvidia = {
            NVreg_UsePageAttributeTable = 1;
            NVreg_RegistryDwords = "EnableBrightnessControl=1";
          };
        };
      };
    };
  };
}
