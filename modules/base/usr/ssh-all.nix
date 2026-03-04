{ config, ... }: {
  flake.homeModules.base-usr-ssh-all = { config, ... }: {
    sops.secrets."ssh/intern/public" = {
      path = "${config.home.homeDirectory}/.ssh/intern.pub";
    };
    sops.secrets."ssh/intern/private" = {
      path = "${config.home.homeDirectory}/.ssh/intern";
    };
    sops.secrets."ssh/extern/public" = {
      path = "${config.home.homeDirectory}/.ssh/extern.pub";
    };
    sops.secrets."ssh/extern/private" = {
      path = "${config.home.homeDirectory}/.ssh/extern";
    };
    programs.ssh.matchBlocks = {
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
}
