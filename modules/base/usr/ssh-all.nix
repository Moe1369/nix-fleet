{ config, ... }: {
  flake.homeModules.base-usr-ssh-all = { config, ... }: {
    sops.secrets."ssh/intern/public" = {
      path = "${config.home.homeDirectory}/.ssh/intern.pub";
    };
    sops.secrets."ssh/extern/private" = {
      path = "${config.home.homeDirectory}/.ssh/extern";
    };
  };
}
