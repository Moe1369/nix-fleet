{ config, ... }: {
  flake.homeModules.base-usr-ssh = { config, ... }: {
    sops.secrets."ssh/intern/public" = {
      path = "${config.home.homeDirectory}/.ssh/intern.pub";
    };
    sops.secrets."ssh/intern/private" = {
      path = "${config.home.homeDirectory}/.ssh/intern";
      mode = "0600";
    };
    sops.secrets."ssh/extern/public" = {
      path = "${config.home.homeDirectory}/.ssh/extern.pub";
    };
    sops.secrets."ssh/extern/private" = {
      path = "${config.home.homeDirectory}/.ssh/extern";
      mode = "0600";
    };
    sops.secrets."ssh/nixbuild/public" = {
      path = "${config.home.homeDirectory}/.ssh/nixbuild.pub";
      mode = "0600";
    };
    sops.secrets."ssh/nixbuild/private" = {
      path = "${config.home.homeDirectory}/.ssh/nixbuild";
      mode = "0600";
    };
    programs.ssh = {
      enable = true;
      enableDefaultConfig = false;
      settings = {
        "*" = {
          identityFile = [
            "${config.home.homeDirectory}/.ssh/intern"
            "${config.home.homeDirectory}/.ssh/extern"
            "${config.home.homeDirectory}/.ssh/nixbuild"
          ];
        };
      };
    };
  };
}
