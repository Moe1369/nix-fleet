{ ... }: {
  flake.homeModules.base-usr-ssh-all = { ... }: {
    sops.secrets."users/mo/intern/public" = {
      path = "/home/mo/.ssh/intern.pub";
    };
    sops.secrets."users/mo/extern/private" = {
      path = "/home/mo/.ssh/extern";
    };
  };
}
