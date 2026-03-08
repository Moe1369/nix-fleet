{ config, ... }: {
  flake.homeModules.base-usr-ssh-all = { config, ... }: {
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
    programs.ssh = {
      enable = true;
      matchBlocks = {
        "intern" = {
          host = "*";
          identityFile = "${config.home.homeDirectory}/.ssh/intern";
        };
        "extern" = {
          host = "*";
          identityFile = "${config.home.homeDirectory}/.ssh/extern";
        };
      };
    };
  };
}
