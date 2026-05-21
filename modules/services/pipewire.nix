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
    # check back this later, on the nixos wiki ofc...
    # also idt a gui pipewire is really needed, ill think abt it :p
    security.rtkit.enable = true;

    services.pipewire = {
      enable = true;
      pulse.enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
    };

    users.users.${username}.extraGroups = ["audio" "pipewire"];
  };
}
