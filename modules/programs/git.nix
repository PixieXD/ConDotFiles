{
  config,
  lib,
  ...
}: let
  cf = config.cf.programs.git;
in {
  options.cf.programs.git = {
    enable = lib.mkEnableOption "git";
    name = lib.mkOption {
      type = lib.types.str;
      default = "";
      description = "Git* name (git.config.user.name)";
    };
    email = lib.mkOption {
      type = lib.types.str;
      default = "";
      description = "Git* email (git.config.user.email)";
    };
  };

  config = lib.mkIf cf.enable {
    programs.git = {
      enable = true;
      config = {
        user = {
          name = cf.name;
          email = cf.email;
        };

        init = {
          defaultBranch = "main";
        };

        url = {
          "https://github.com/" = {
            insteadOf = ["gh:" "github:"];
          };
        };
      };
    };
  };
}
