{ config, ... }: {
  flake.homeModules.base-usr-ssh-all = { config, ... }: {
    sops.secrets."users/mo/intern/public" = {
      path = "${config.home.homeDirectory}/.ssh/intern.pub";
    };
    sops.secrets."users/mo/extern/private" = {
      path = "${config.home.homeDirectory}/.ssh/extern";
    };
  };
}
