{ ... }: {
  flake.homeModules.base-usr-ssh-all = { config, ... }: {
    sops.secrets."users.mo.intern.public" = {
      path = "/home/mo/.ssh/intern.pub";
    };
    sops.secrets."users.mo.extern.private" = {
      path = "/home/mo/.ssh/extern";
    };

    home.file.".intern.pub".source = config.sops.secrets."users.mo.intern.public".path;
    home.file.".extern".source = config.sops.secrets."users.mo.extern.private".path;
  };
}
