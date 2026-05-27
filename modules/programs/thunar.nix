{
  config,
  lib,
  pkgs,
  username,
  ...
}: let
  cf = config.cf.programs.thunar;
in {
  options.cf.programs.thunar = {
    enable = lib.mkEnableOption "thunar";
  };

  config = lib.mkIf cf.enable {
    programs.thunar = {
      enable = true;
      plugins = with pkgs; [
        thunar-vcs-plugin
        thunar-archive-plugin
        thunar-media-tags-plugin
      ];
    };

    services = {
      gvfs.enable = true;
      tumbler.enable = true;
    };

    hjem.users.${username}.packages = with pkgs; [file-roller];
  };
}
