{
  config,
  lib,
  username,
  ...
}: let
  cf = config.cf.services.pipewire;
in {
  options.cf.services.pipewire = {
    enable = lib.mkEnableOption "pipewire";
  };

  config = lib.mkIf cf.enable {
    # also idt a gui pipewire is really needed, ill think abt it :p
    security.rtkit.enable = true;

    services.pipewire = {
      enable = true;
      pulse.enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };

      extraConfig.pipewire."92-low-latency" = {
        # check wiki
        "context.properties" = {
          "default.clock.rate" = 48000;
          "default.clock.quantum" = 32; # todo!! check audio, keep increasing until it no cracking sound / sounds good!!
          "default.clock.min-quantum" = 32;
          "default.clock.max-quantum" = 32;
        };
      };
    };

    users.users.${username}.extraGroups = ["audio" "pipewire"];
  };
}
